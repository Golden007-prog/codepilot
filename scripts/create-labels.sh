#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=false
REPO=""

usage() {
  cat <<'EOF'
Usage: scripts/create-labels.sh [--dry-run] [owner/repo]

Creates or updates GitHub labels defined in .github/labels.yml.

Options:
  --dry-run   Print the gh label create commands without executing them
  -h, --help  Show this help message
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      shift
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
LABELS_FILE="$ROOT_DIR/.github/labels.yml"

if [[ ! -f "$LABELS_FILE" ]]; then
  echo "Labels file not found: $LABELS_FILE" >&2
  exit 1
fi

if [[ "$DRY_RUN" == false ]]; then
  if ! command -v gh >/dev/null 2>&1; then
    echo "gh CLI is required but not installed." >&2
    exit 1
  fi
  gh auth status >/dev/null
fi

REPO_ARGS=()
if [[ -n "$REPO" ]]; then
  REPO_ARGS=(-R "$REPO")
fi

COUNT=0
while IFS=$'\t' read -r name color description; do
  [[ -z "$name" ]] && continue
  COUNT=$((COUNT + 1))
  if [[ "$DRY_RUN" == true ]]; then
    printf '[dry-run] gh label create %q --color %q --description %q --force' "$name" "$color" "$description"
    if [[ ${#REPO_ARGS[@]} -gt 0 ]]; then
      printf ' -R %q' "$REPO"
    fi
    printf '\n'
  else
    gh label create "$name" --color "$color" --description "$description" --force "${REPO_ARGS[@]}"
    echo "Synced label: $name"
  fi
done < <(
  python3 - "$LABELS_FILE" <<'PY'
import sys

path = sys.argv[1]
entries = []
current = {}

def unquote(val: str) -> str:
    val = val.strip()
    if len(val) >= 2 and ((val[0] == '"' and val[-1] == '"') or (val[0] == "'" and val[-1] == "'")):
        return val[1:-1]
    return val

with open(path, encoding="utf-8") as fh:
    for raw in fh:
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("- name:"):
            if current:
                entries.append(current)
            current = {"name": unquote(line.split(":", 1)[1]), "color": "", "description": ""}
        elif line.startswith("color:") and current:
            current["color"] = unquote(line.split(":", 1)[1]).lstrip("#")
        elif line.startswith("description:") and current:
            current["description"] = unquote(line.split(":", 1)[1])

if current:
    entries.append(current)

for item in entries:
    print(f"{item['name']}\t{item['color']}\t{item['description']}")
PY
)

if [[ "$DRY_RUN" == true ]]; then
  echo "[dry-run] Total labels parsed: $COUNT"
else
  echo "Total labels synced: $COUNT"
fi
