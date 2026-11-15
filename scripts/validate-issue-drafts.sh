#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
import glob, os, re, sys
from collections import Counter

# 1. Load labels from .github/labels.yml
valid_labels = set()
with open(".github/labels.yml", encoding="utf-8") as f:
    for line in f:
        m = re.match(r"^- name:\s*(.+?)\s*$", line)
        if m:
            valid_labels.add(m.group(1).strip().strip('"').strip("'"))

drafts = sorted(glob.glob(".github/issue-drafts/[0-9][0-9][0-9]-*.md"))
print(f"Found {len(drafts)} drafts.")

required_sections = [
    "## Summary",
    "## Background / Current behavior",
    "## Proposed solution / Scope",
    "## Files likely to change",
    "## Acceptance criteria",
    "## How to test",
    "## Needs secrets?",
    "## Difficulty / Estimated time",
    "## Related issues",
]

errors = []
titles = {}
difficulties = Counter()
areas = Counter()

path_re = re.compile(
    r"(?<![A-Za-z0-9_./-])((?:backend|frontend|docs|\.github|scripts)/[A-Za-z0-9_./*{}()-]+)"
)

for path in drafts:
    with open(path, encoding="utf-8") as f:
        text = f.read()

    # Check truncation / clean ending
    if not text.strip():
        errors.append(f"{path}: empty file")
        continue

    # Parse front matter
    fm_match = re.match(r"^---\n(.*?)\n---\n(.*)$", text, re.S)
    if not fm_match:
        errors.append(f"{path}: invalid or missing front matter")
        continue

    fm_raw, body = fm_match.group(1), fm_match.group(2)
    title_m = re.search(r'^title:\s*"(.*)"\s*$', fm_raw, re.M)
    labels_m = re.search(r"^labels:\s*\[(.*)\]\s*$", fm_raw, re.M)
    diff_m = re.search(r"^difficulty:\s*(.+?)\s*$", fm_raw, re.M)
    area_m = re.search(r"^area:\s*(.+?)\s*$", fm_raw, re.M)

    if not (title_m and labels_m and diff_m and area_m):
        errors.append(f"{path}: incomplete front matter fields")
        continue

    title = title_m.group(1)
    labels = [x.strip().strip('"').strip("'") for x in labels_m.group(1).split(",") if x.strip()]
    diff = diff_m.group(1).strip().strip('"')
    area = area_m.group(1).strip().strip('"')

    difficulties[diff] += 1
    areas[area] += 1

    # Title checks
    if len(title) >= 80:
        errors.append(f"{path}: title >= 80 chars ({len(title)}): {title}")
    if not re.match(r"^\[[a-z0-9-]+\]\s+[A-Z]", title):
        errors.append(f"{path}: title missing [area] prefix or imperative capital: {title}")
    if title in titles:
        errors.append(f"{path}: duplicate title with {titles[title]}: {title}")
    titles[title] = path

    # Label checks
    if not (2 <= len(labels) <= 4):
        errors.append(f"{path}: expected 2-4 labels, got {len(labels)}: {labels}")
    for lbl in labels:
        if lbl not in valid_labels:
            errors.append(f"{path}: unknown label '{lbl}'")

    # Required body sections
    for sec in required_sections:
        if sec not in body:
            errors.append(f"{path}: missing section '{sec}'")
    if "Out of scope" not in body and "out of scope" not in body:
        errors.append(f"{path}: missing out-of-scope list")
    if "- [ ]" not in body:
        errors.append(f"{path}: missing acceptance criteria checkboxes")
    if diff == "good-first-issue" and "## Hints for newcomers" not in body:
        errors.append(f"{path}: good-first-issue missing '## Hints for newcomers'")
    if "Comment below to claim this issue before starting." not in body:
        errors.append(f"{path}: missing claim-before-starting footer")

    # Cited file path checks (skip lines explicitly mentioning new/created/add file)
    for lineno, line in enumerate(body.splitlines(), 1):
        lower = line.lower()
        if any(kw in lower for kw in ("new ", "create ", "add ", "proposed", "would add", "target:")):
            continue
        for m in path_re.finditer(line):
            ref = m.group(1).rstrip(".,:;)`'\"")
            if "*" in ref or "{" in ref or "<" in ref:
                continue
            if not os.path.exists(ref):
                errors.append(f"{path}:{lineno}: broken path reference '{ref}'")

print("Difficulties:", dict(difficulties))
print("Areas:", dict(areas))
print(f"Total errors: {len(errors)}")
for e in errors[:60]:
    print("  ERR:", e)
if len(errors) > 60:
    print(f"  ... and {len(errors) - 60} more")
sys.exit(1 if errors else 0)
PY