---
title: "[frontend] Audit dashboard keyboard navigation"
labels: ["accessibility", "area:frontend", "help wanted"]
difficulty: intermediate
area: frontend
---

## Summary

Add keyboard-focused tests and fixes for navigation, dialogs, and menus. This is a bounded contribution that improves CodePilot without changing unrelated behavior.

## Background / Current behavior

The relevant implementation is frontend/src/components/layout/sidebar.tsx:1-69. The audit found this independently testable or extensible area is not yet covered by a focused contribution.

## Proposed solution / Scope

- Implement the scoped change described above.
- Add or update focused automated coverage and documentation when behavior is visible.
- Out of scope: unrelated refactors, credential changes, and broad product redesign.

## Files likely to change

- frontend/src/components/layout/sidebar.tsx
- New focused test or documentation file where appropriate.

## Acceptance criteria

- [ ] The scoped behavior is implemented and documented in code where needed.
- [ ] Focused automated coverage demonstrates the intended behavior.
- [ ] Existing relevant checks continue to pass.

## How to test

Run cd backend && mvn clean test -B for backend changes. Run cd frontend && npm run lint && npx tsc --noEmit && npx playwright test for frontend changes.

## Hints for newcomers

Review frontend/e2e/responsive-a11y.spec.ts for established project conventions before changing this area.

## Needs secrets?

No. This can be completed with mocks, fixtures, or local static checks.

## Difficulty / Estimated time

Intermediate; half day to 2 days.

## Related issues

None.

Comment below to claim this issue before starting. Read CONTRIBUTING.md first.

