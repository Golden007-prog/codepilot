#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=false
START=1
LIMIT=0
IDS_SPEC=""
REPO=""

usage() {
  cat <<'EOF'
Usage: scripts/create-issues.sh [--dry-run] [--start N] [--limit N] [--ids LIST] [owner/repo]

Creates GitHub issues from .github/issue-drafts/NNN-*.md in numeric order.

Options:
  --dry-run    Print planned issue creations without calling GitHub
  --start N    Start from issue draft number N (default: 1)
  --limit N    Maximum number of drafts to process (default: 0 = unlimited)
  --ids LIST   Comma-separated list of draft IDs or ranges (e.g. 001,002,057,065-070)
  -h, --help   Show this help message
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --start)
      START="${2:-}"
      if [[ ! "$START" =~ ^[0-9]+$ ]]; then
        echo "--start requires a non-negative integer" >&2
        exit 1
      fi
      shift 2
      ;;
    --limit)
      LIMIT="${2:-}"
      if [[ ! "$LIMIT" =~ ^[0-9]+$ ]]; then
        echo "--limit requires a non-negative integer" >&2
        exit 1
      fi
      shift 2
      ;;
    --ids)
      IDS_SPEC="${2:-}"
      if [[ -z "$IDS_SPEC" ]]; then
        echo "--ids requires a comma-separated list of IDs or ranges" >&2
        exit 1
      fi
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
    *)
      if [[ -n "$REPO" ]]; then
        echo "Unexpected argument: $1" >&2
        usage >&2
        exit 1
      fi
      REPO="$1"
      shift
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DRAFT_DIR="$ROOT_DIR/.github/issue-drafts"
LOG_FILE="$DRAFT_DIR/created.log"

if [[ ! -d "$DRAFT_DIR" ]]; then
  echo "Draft directory not found: $DRAFT_DIR" >&2
  exit 1
fi

REPO_ARGS=()
if [[ -n "$REPO" ]]; then
  REPO_ARGS=(-R "$REPO")
fi

EXISTING_TITLES=""
if [[ "$DRY_RUN" == false ]]; then
  if ! command -v gh >/dev/null 2>&1; then
    echo "gh CLI is required but not installed." >&2
    exit 1
  fi
  gh auth status >/dev/null
  EXISTING_TITLES="$(gh issue list --state all --limit 500 --json title --jq '.[].title' "${REPO_ARGS[@]}")"
fi

SELECTED_IDS=""
if [[ -n "$IDS_SPEC" ]]; then
  SELECTED_IDS="$(python3 - "$IDS_SPEC" <<'PY'
import re
import sys

spec = sys.argv[1].strip()
ids = set()
for part in spec.split(","):
    token = part.strip()
    if not token:
        print(f"Invalid empty token in --ids: {spec}", file=sys.stderr)
        sys.exit(1)
    if re.fullmatch(r"\d+", token):
        ids.add(int(token))
    elif re.fullmatch(r"\d+-\d+", token):
        start_s, end_s = token.split("-", 1)
        start_i, end_i = int(start_s), int(end_s)
        if end_i < start_i:
            print(f"Invalid range in --ids (end < start): {token}", file=sys.stderr)
            sys.exit(1)
        ids.update(range(start_i, end_i + 1))
    else:
        print(f"Invalid token in --ids: {token}", file=sys.stderr)
        sys.exit(1)

for num in sorted(ids):
    print(num)
PY
)"
fi

PROCESSED=0
CREATED=0
SKIPPED=0

shopt -s nullglob
DRAFTS=("$DRAFT_DIR"/[0-9][0-9][0-9]-*.md)
shopt -u nullglob

for file in "${DRAFTS[@]}"; do
  base="$(basename "$file")"
  num_str="${base%%-*}"
  num=$((10#$num_str))

  if [[ -n "$SELECTED_IDS" ]] && ! printf '%s\n' "$SELECTED_IDS" | grep -Fxq -- "$num"; then
    continue
  fi

  if (( num < START )); then
    continue
  fi

  if (( LIMIT > 0 && PROCESSED >= LIMIT )); then
    break
  fi

  PROCESSED=$((PROCESSED + 1))

  title="$(python3 - "$file" <<'PY'
import sys
with open(sys.argv[1], encoding="utf-8") as fh:
    lines = fh.read().splitlines()
if len(lines) < 3 or lines[0].strip() != "---":
    sys.exit(1)
for line in lines[1:]:
    if line.strip() == "---":
        break
    if line.startswith("title:"):
        val = line.split(":", 1)[1].strip()
        if len(val) >= 2 and ((val[0] == '"' and val[-1] == '"') or (val[0] == "'" and val[-1] == "'")):
            val = val[1:-1]
        print(val)
        sys.exit(0)
sys.exit(1)
PY
)"

  labels_csv="$(python3 - "$file" <<'PY'
import sys
with open(sys.argv[1], encoding="utf-8") as fh:
    lines = fh.read().splitlines()
if len(lines) < 3 or lines[0].strip() != "---":
    sys.exit(1)
for line in lines[1:]:
    if line.strip() == "---":
        break
    if line.startswith("labels:"):
        raw = line.split(":", 1)[1].strip()
        if raw.startswith("[") and raw.endswith("]"):
            raw = raw[1:-1]
        parts = [p.strip().strip("'\"") for p in raw.split(",") if p.strip()]
        print(",".join(parts))
        sys.exit(0)
sys.exit(0)
PY
)"

  if [[ "$DRY_RUN" == false ]] && printf '%s\n' "$EXISTING_TITLES" | grep -Fxq -- "$title"; then
    echo "Skipping existing issue [$base]: $title"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  if [[ "$DRY_RUN" == true ]]; then
    printf '[dry-run] %s | title=%q | labels=%q\n' "$base" "$title" "$labels_csv"
    continue
  fi

  body_file="$(mktemp)"
  python3 - "$file" "$body_file" <<'PY'
import sys
src, dst = sys.argv[1], sys.argv[2]
with open(src, encoding="utf-8") as fh:
    lines = fh.read().splitlines()
end_idx = None
for idx in range(1, len(lines)):
    if lines[idx].strip() == "---":
        end_idx = idx
        break
if end_idx is None:
    sys.exit(1)
body = "\n".join(lines[end_idx + 1:]).lstrip("\n") + "\n"
with open(dst, "w", encoding="utf-8") as out:
    out.write(body)
PY

  LABEL_ARGS=()
  if [[ -n "$labels_csv" ]]; then
    IFS=',' read -r -a LABEL_ARRAY <<< "$labels_csv"
    for lbl in "${LABEL_ARRAY[@]}"; do
      lbl_trimmed="$(printf '%s' "$lbl" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
      [[ -n "$lbl_trimmed" ]] && LABEL_ARGS+=(--label "$lbl_trimmed")
    done
  fi

  issue_url="$(gh issue create --title "$title" --body-file "$body_file" "${LABEL_ARGS[@]}" "${REPO_ARGS[@]}")"
  rm -f "$body_file"

  echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | $base | $issue_url | $title" >> "$LOG_FILE"
  echo "Created [$base]: $issue_url"
  CREATED=$((CREATED + 1))
  sleep 3
done

if [[ "$DRY_RUN" == true ]]; then
  echo "[dry-run] Drafts previewed: $PROCESSED"
else
  echo "Done. Processed: $PROCESSED, Created: $CREATED, Skipped: $SKIPPED"
fi
