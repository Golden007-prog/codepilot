# Contribution-readiness audit notes

Audit date: 2026-11-16. The audit read application code, tests, migrations, frontend routes/components, Playwright tests, documentation, containers, and workflows.

## Verified findings

- Backend has broad integration coverage, but no focused tests exist for RepositoryService, PullRequestService, ReviewService, GitHubWebhookService, WebhookDeliveryStateService, RateLimitFilter, or SecurityConfig.
- DiffParser and ReviewResponseValidator have test coverage, with further edge boundaries in backend/src/main/java/com/codepilot/ai/DiffParser.java:18-191 and backend/src/main/java/com/codepilot/ai/ReviewResponseValidator.java:21-160.
- The frontend has only Playwright coverage under frontend/e2e; there is no unit/component test runner in frontend/package.json:5-10. Large route files include frontend/src/app/dashboard/repositories/page.tsx:1-437 and frontend/src/app/dashboard/reviews/page.tsx:1-675.
- The API client centralizes browser requests in frontend/src/lib/api.ts:1-264; list endpoints are exposed by RepositoryController.java:41-104, PullRequestController.java:24-30, and ReviewController.java:26-42.
- Queue tuning is configurable at backend/src/main/resources/application.yml:72-84, but no operational controller exposes queue administration or metrics.
- RateLimitFilter.java:18-101 keeps request windows in process memory and SecurityConfig.java:44-190 uses servlet sessions; both warrant scale-oriented follow-up.
- Docker already runs non-root users (backend/Dockerfile:13-21 and frontend/Dockerfile:26-39), Compose has health checks, and CI caches/builds/scans images. Drafts do not duplicate this existing work.
- Documentation covers installation and deployment, but lacks contribution governance, ADRs, queue operations, API curl examples, a glossary, and extension guides.
