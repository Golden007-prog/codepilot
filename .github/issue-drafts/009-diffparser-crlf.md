---
title: "[ai] Test DiffParser CRLF line mapping"
labels: ["testing", "area:ai", "good first issue"]
difficulty: good-first-issue
area: ai
---

## Summary

Add CRLF fixture coverage for parsed paths, hunks, and changed-line numbers. This is a bounded contribution that improves CodePilot without changing unrelated behavior.

## Background / Current behavior

The relevant implementation is backend/src/main/java/com/codepilot/ai/DiffParser.java:18-191. The audit found this independently testable or extensible area is not yet covered by a focused contribution.

## Proposed solution / Scope

- Implement the scoped change described above.
- Add or update focused automated coverage and documentation when behavior is visible.
- Out of scope: unrelated refactors, credential changes, and broad product redesign.

## Files likely to change

- backend/src/main/java/com/codepilot/ai/DiffParser.java
- New focused test or documentation file where appropriate.

## Acceptance criteria

- [ ] The scoped behavior is implemented and documented in code where needed.
- [ ] Focused automated coverage demonstrates the intended behavior.
- [ ] Existing relevant checks continue to pass.

## How to test

Run cd backend && mvn clean test -B for backend changes. Run cd frontend && npm run lint && npx tsc --noEmit && npx playwright test for frontend changes.

## Hints for newcomers

Follow the local patterns in backend/src/test/java/com/codepilot/ai/DiffParserTest.java. Keep the pull request small and cite the acceptance criteria in its description.

## Needs secrets?

No. This can be completed with mocks, fixtures, or local static checks.

## Difficulty / Estimated time

Good first issue; 1-3 hours.

## Related issues

None.

Comment below to claim this issue before starting. Read CONTRIBUTING.md first.

