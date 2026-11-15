---
title: "[security] Move rate-limit state to Redis"
labels: ["security-hardening", "area:security", "difficulty:advanced"]
difficulty: advanced
area: security
---

## Summary

Replace process-local windows with an atomic Redis-backed policy and integration tests; preserve configured limits. This is a bounded contribution that improves CodePilot without changing unrelated behavior.

## Background / Current behavior

The relevant implementation is backend/src/main/java/com/codepilot/config/RateLimitFilter.java:18-101. The audit found this independently testable or extensible area is not yet covered by a focused contribution.

## Proposed solution / Scope

- Implement the scoped change described above.
- Add or update focused automated coverage and documentation when behavior is visible.
- Out of scope: unrelated refactors, credential changes, and broad product redesign.

## Files likely to change

- backend/src/main/java/com/codepilot/config/RateLimitFilter.java
- New focused test or documentation file where appropriate.

## Acceptance criteria

- [ ] The scoped behavior is implemented and documented in code where needed.
- [ ] Focused automated coverage demonstrates the intended behavior.
- [ ] Existing relevant checks continue to pass.

## How to test

Run cd backend && mvn clean test -B for backend changes. Run cd frontend && npm run lint && npx tsc --noEmit && npx playwright test for frontend changes.

## Hints for newcomers

Review backend/src/main/java/com/codepilot/config/RedisConfig.java for established project conventions before changing this area.

## Needs secrets?

No. This can be completed with mocks, fixtures, or local static checks.

## Difficulty / Estimated time

Advanced; propose the design briefly before implementation; 1-3 days.

## Related issues

#078.

Comment below to claim this issue before starting. Read CONTRIBUTING.md first.

