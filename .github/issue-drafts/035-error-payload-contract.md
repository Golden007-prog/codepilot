---
title: "[backend] Document and test API error contract"
labels: ["testing", "area:backend", "help wanted"]
difficulty: intermediate
area: backend
---

## Summary

Specify a stable error payload and add controller tests for representative errors. This is a bounded contribution that improves CodePilot without changing unrelated behavior.

## Background / Current behavior

The relevant implementation is backend/src/main/java/com/codepilot/exception/ErrorResponse.java:1-18. The audit found this independently testable or extensible area is not yet covered by a focused contribution.

## Proposed solution / Scope

- Implement the scoped change described above.
- Add or update focused automated coverage and documentation when behavior is visible.
- Out of scope: unrelated refactors, credential changes, and broad product redesign.

## Files likely to change

- backend/src/main/java/com/codepilot/exception/ErrorResponse.java
- New focused test or documentation file where appropriate.

## Acceptance criteria

- [ ] The scoped behavior is implemented and documented in code where needed.
- [ ] Focused automated coverage demonstrates the intended behavior.
- [ ] Existing relevant checks continue to pass.

## How to test

Run cd backend && mvn clean test -B for backend changes. Run cd frontend && npm run lint && npx tsc --noEmit && npx playwright test for frontend changes.

## Hints for newcomers

Review backend/src/main/java/com/codepilot/exception/GlobalExceptionHandler.java:14-86 for established project conventions before changing this area.

## Needs secrets?

No. This can be completed with mocks, fixtures, or local static checks.

## Difficulty / Estimated time

Intermediate; half day to 2 days.

## Related issues

None.

Comment below to claim this issue before starting. Read CONTRIBUTING.md first.

