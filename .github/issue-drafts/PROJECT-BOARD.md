# CodePilot Project Board Guide

Use this layout to organize the CodePilot public backlog in GitHub Projects once the issue drafts are published.

## Recommended Columns

| Column | Purpose | Entry Criteria |
|---|---|---|
| **Backlog** | Triaged issues ready for contributors | Published from `.github/issue-drafts/` with area + difficulty labels |
| **Good First Issues** | Quick-win onboarding tasks | Labeled `good-first-issue` and unblocked |
| **Ready / Wave 1** | High-value initial batch (20–30 issues) | Self-contained, low merge-conflict risk |
| **In Progress** | Actively claimed by a contributor | Assignee set or PR linked |
| **In Review** | Pull request open and awaiting checks/review | Linked PR passes CI (`mvn verify -B`, `npm run lint`, `npm run build`) |
| **Done** | Merged into `main` | PR merged and issue closed |

## Suggested Custom Fields

- **Difficulty**: `Good First Issue`, `Intermediate`, `Advanced`, `Epic`
- **Area**: `Backend`, `Frontend`, `CI/CD`, `Docker`, `Docs`, `DX`, `Security`, `Testing`
- **Wave**: `Wave 1 (Launch)`, `Wave 2 (Core)`, `Wave 3 (Epics & Scale)`

## Maintainer Triage Rules

1. Keep at least 10–15 `good-first-issue` items open and unassigned for new contributors.
2. Link child issues to their parent `epic` (`077`–`080`) using GitHub tasklists.
3. Require passing CI before moving an item from **In Progress** to **In Review**.
