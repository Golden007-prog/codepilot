# Start Here — Maintainer Rollout Guide

This directory contains the local, verified backlog of **76 GitHub issue drafts** for CodePilot (`001`–`080`, excluding 4 dropped duplicates: `028`, `030`, `031`, `032`).

> **Note:** Nothing has been published to GitHub yet. Review the drafts and run the scripts below when you are ready.

## 1. Pre-Publish Checklist

- [ ] Review [SECURITY-PRIVATE.md](SECURITY-PRIVATE.md) (kept local, never published as a public issue).
- [ ] Verify `LICENSE` (MIT, 2026 Kunj Maheshwari), `CODE_OF_CONDUCT.md`, and `SECURITY.md` (add a maintainer contact email if desired, or keep GitHub Private Vulnerability Reporting).
- [ ] Authenticate GitHub CLI locally: `gh auth login` and confirm with `gh auth status`.
- [ ] Preview labels and issues with `--dry-run` before publishing.

## 2. Publishing Commands

```bash
# 1. Preview and then sync labels from .github/labels.yml
bash scripts/create-labels.sh --dry-run
bash scripts/create-labels.sh

# 2. Preview Wave 1 (first 25 issues)
bash scripts/create-issues.sh --dry-run --limit 25

# 3. Publish Wave 1 (issues 001..025)
bash scripts/create-issues.sh --start 1 --limit 25

# 4. Publish remaining waves when ready
bash scripts/create-issues.sh --start 26 --limit 25
bash scripts/create-issues.sh --start 51
```

## 3. Wave 1 (28 Starter Issues)

Start with self-contained `good-first-issue` tasks and contributor-onboarding DX/CI setup so early contributors can land PRs without stepping on each other:

- **Backend, AI & Frontend Tests (`001`–`020`)**: Service-layer Mockito tests, `DiffParser` & finding validator tests, and frontend component/API client tests.
- **Onboarding & Repo Hygiene (`057`, `061`, `062`)**: Dependabot automation, optional pre-commit checks, and portable `Makefile` task runner.
- **Docs & Contributor Guides (`024`, `066`–`068`, `070`)**: Glossary, review-pipeline sequence diagram, authenticated API curl examples, local troubleshooting guide, and finding categories guide.

Preview and publish Wave 1 using `--ids`:

```bash
# Preview Wave 1 (28 issues)
bash scripts/create-issues.sh --dry-run --ids 001-020,024,057,061,062,066-068,070

# Publish Wave 1
bash scripts/create-issues.sh --ids 001-020,024,057,061,062,066-068,070
```

See [INDEX.md](INDEX.md) for the complete 76-issue catalog and [PROJECT-BOARD.md](PROJECT-BOARD.md) for board setup.
