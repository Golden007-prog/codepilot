# Issue Drafts Index

Total drafts: **76** (IDs `001`–`080`, with 4 duplicate drafts removed: `028`, `030`, `031`, `032`).

## Counts by Difficulty

| Difficulty | Count | Share |
|---|---:|---:|
| `good-first-issue` | 28 | 36.8% |
| `intermediate` | 30 | 39.5% |
| `advanced` | 14 | 18.4% |
| `epic` | 4 | 5.3% |

## Counts by Area

| Area | Count |
|---|---:|
| `frontend` | 22 |
| `ai` | 13 |
| `backend` | 12 |
| `security` | 9 |
| `devops` | 7 |
| `docs` | 7 |
| `redis-queue` | 4 |
| `database` | 2 |

## All Issue Drafts

| ID | Title | Labels | Difficulty | Area | Dependencies |
|---|---|---|---|---|---|
| [`001`](001-test-repository-service.md) | [backend] Add unit tests for RepositoryService | `testing`, `area:backend`, `good first issue` | `good-first-issue` | `backend` | - |
| [`002`](002-test-pull-request-service.md) | [backend] Add unit tests for PullRequestService | `testing`, `area:backend`, `good first issue` | `good-first-issue` | `backend` | - |
| [`003`](003-test-review-service.md) | [backend] Add unit tests for ReviewService | `testing`, `area:backend`, `good first issue` | `good-first-issue` | `backend` | - |
| [`004`](004-test-webhook-service.md) | [backend] Add unit tests for GitHubWebhookService | `testing`, `area:backend`, `good first issue` | `good-first-issue` | `backend` | - |
| [`005`](005-test-webhook-delivery-state.md) | [backend] Add unit tests for WebhookDeliveryStateService | `testing`, `area:backend`, `good first issue` | `good-first-issue` | `backend` | - |
| [`006`](006-test-rate-limit-filter.md) | [backend] Test RateLimitFilter request windows | `testing`, `area:security`, `good first issue` | `good-first-issue` | `security` | - |
| [`007`](007-test-security-config.md) | [backend] Add focused SecurityConfig tests | `testing`, `area:security`, `good first issue` | `good-first-issue` | `security` | - |
| [`008`](008-test-review-job-facade.md) | [backend] Test ReviewJobRepositoryFacade delegation | `testing`, `area:redis-queue`, `good first issue` | `good-first-issue` | `redis-queue` | - |
| [`009`](009-diffparser-crlf.md) | [ai] Test DiffParser CRLF line mapping | `testing`, `area:ai`, `good first issue` | `good-first-issue` | `ai` | - |
| [`010`](010-diffparser-renames.md) | [ai] Test DiffParser rename headers | `testing`, `area:ai`, `good first issue` | `good-first-issue` | `ai` | - |
| [`011`](011-diffparser-deletions.md) | [ai] Test DiffParser deleted-file handling | `testing`, `area:ai`, `good first issue` | `good-first-issue` | `ai` | - |
| [`012`](012-validator-empty-fields.md) | [ai] Test validator handling of empty finding fields | `testing`, `area:ai`, `good first issue` | `good-first-issue` | `ai` | - |
| [`013`](013-validator-severity.md) | [ai] Test validator severity normalization | `testing`, `area:ai`, `good first issue` | `good-first-issue` | `ai` | - |
| [`014`](014-api-client-errors.md) | [frontend] Add API client error-path tests | `testing`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | `025` |
| [`015`](015-dashboard-stats-test.md) | [frontend] Add tests for dashboard stat cards | `testing`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | `025` |
| [`016`](016-status-badge-test.md) | [frontend] Add tests for StatusBadge variants | `testing`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | `025` |
| [`017`](017-empty-state-test.md) | [frontend] Add tests for EmptyState accessibility | `testing`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | `025` |
| [`018`](018-theme-toggle-test.md) | [frontend] Add tests for ThemeToggle | `testing`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | `025` |
| [`019`](019-health-route-test.md) | [frontend] Add tests for the health route | `testing`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | `025` |
| [`020`](020-dashboard-error-test.md) | [frontend] Test dashboard error recovery UI | `testing`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | `025` |
| [`021`](021-skeleton-aria.md) | [frontend] Mark skeletons as decorative | `accessibility`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | - |
| [`022`](022-favicon-metadata.md) | [frontend] Add complete social metadata | `documentation`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | - |
| [`023`](023-dashboard-loading-a11y.md) | [frontend] Improve dashboard loading announcements | `accessibility`, `area:frontend`, `good first issue` | `good-first-issue` | `frontend` | - |
| [`024`](024-docs-glossary.md) | [docs] Add a CodePilot glossary | `documentation`, `area:docs`, `good first issue` | `good-first-issue` | `docs` | - |
| [`025`](025-frontend-unit-harness.md) | [frontend] Add a component test harness | `testing`, `area:frontend`, `help wanted` | `intermediate` | `frontend` | `014`, `015`, `016`, `017`, `018` |
| [`026`](026-repository-page-extract.md) | [frontend] Extract repository page UI modules | `refactor`, `area:frontend`, `help wanted` | `intermediate` | `frontend` | - |
| [`027`](027-reviews-page-extract.md) | [frontend] Extract review page UI modules | `refactor`, `area:frontend`, `help wanted` | `intermediate` | `frontend` | - |
| [`029`](029-review-finding-search.md) | [frontend] Add finding text search | `enhancement`, `area:frontend`, `help wanted` | `intermediate` | `frontend` | `027` |
| [`033`](033-openapi-examples.md) | [backend] Add OpenAPI examples to review endpoints | `documentation`, `area:backend`, `help wanted` | `intermediate` | `backend` | - |
| [`034`](034-openapi-repository-examples.md) | [backend] Add OpenAPI examples to repository endpoints | `documentation`, `area:backend`, `help wanted` | `intermediate` | `backend` | - |
| [`035`](035-error-payload-contract.md) | [backend] Document and test API error contract | `testing`, `area:backend`, `help wanted` | `intermediate` | `backend` | - |
| [`036`](036-queue-metrics.md) | [backend] Publish review queue metrics | `enhancement`, `area:redis-queue`, `help wanted` | `intermediate` | `redis-queue` | `077` |
| [`037`](037-dlq-inspection.md) | [backend] Add a read-only DLQ inspection endpoint | `enhancement`, `area:redis-queue`, `help wanted` | `intermediate` | `redis-queue` | `077` |
| [`038`](038-queue-config-docs.md) | [docs] Document Redis review queue operations | `documentation`, `area:docs`, `help wanted` | `intermediate` | `docs` | `077` |
| [`039`](039-structured-correlation-logs.md) | [backend] Add correlation IDs to request logs | `enhancement`, `area:backend`, `help wanted` | `intermediate` | `backend` | `077` |
| [`040`](040-github-rate-limit.md) | [backend] Surface GitHub API rate-limit responses | `enhancement`, `area:backend`, `help wanted` | `intermediate` | `backend` | - |
| [`041`](041-retry-tuning-docs.md) | [docs] Explain retry and backoff configuration | `documentation`, `area:docs`, `help wanted` | `intermediate` | `docs` | `077` |
| [`042`](042-db-index-review.md) | [database] Review indexes for review list queries | `performance`, `area:database`, `help wanted` | `intermediate` | `database` | - |
| [`043`](043-flyway-contribution-guide.md) | [database] Document forward-only Flyway contribution rules | `documentation`, `area:database`, `help wanted` | `intermediate` | `database` | - |
| [`044`](044-security-headers.md) | [security] Add baseline browser security headers | `security-hardening`, `area:security`, `help wanted` | `intermediate` | `security` | `078` |
| [`045`](045-session-scale-docs.md) | [docs] Document servlet session scaling limits | `documentation`, `area:security`, `help wanted` | `intermediate` | `security` | `078` |
| [`046`](046-redis-rate-limiter.md) | [security] Move rate-limit state to Redis | `security-hardening`, `area:security`, `difficulty:advanced` | `advanced` | `security` | `078` |
| [`047`](047-spring-session-redis.md) | [backend] Persist sessions with Spring Session Redis | `enhancement`, `area:backend`, `difficulty:advanced` | `advanced` | `backend` | `078` |
| [`048`](048-provider-registry.md) | [ai] Introduce a configurable AI provider registry | `enhancement`, `area:ai`, `difficulty:advanced` | `advanced` | `ai` | `079` |
| [`049`](049-prompt-versioning.md) | [ai] Version and test review prompts | `enhancement`, `area:ai`, `difficulty:advanced` | `advanced` | `ai` | `079` |
| [`050`](050-diff-token-budget.md) | [ai] Add a token budget for large review diffs | `performance`, `area:ai`, `difficulty:advanced` | `advanced` | `ai` | `079` |
| [`051`](051-repo-review-config.md) | [ai] Support repository review configuration | `enhancement`, `area:ai`, `difficulty:advanced` | `advanced` | `ai` | `079` |
| [`052`](052-finding-dedupe.md) | [ai] Deduplicate repeated review findings | `enhancement`, `area:ai`, `difficulty:advanced` | `advanced` | `ai` | `079` |
| [`053`](053-finding-feedback.md) | [frontend] Add useful-not-useful finding feedback | `enhancement`, `area:frontend`, `difficulty:advanced` | `advanced` | `frontend` | `079` |
| [`054`](054-suppress-finding.md) | [backend] Design a finding suppression workflow | `enhancement`, `area:backend`, `difficulty:advanced` | `advanced` | `backend` | `079` |
| [`055`](055-review-realtime.md) | [frontend] Replace review polling with server-sent events | `performance`, `area:frontend`, `difficulty:advanced` | `advanced` | `frontend` | `079` |
| [`056`](056-audit-log-design.md) | [security] Add a privacy-aware audit log design | `security-hardening`, `area:security`, `difficulty:advanced` | `advanced` | `security` | `078` |
| [`057`](057-dependabot.md) | [devops] Add dependency update automation | `ci/cd`, `area:devops`, `help wanted` | `intermediate` | `devops` | - |
| [`058`](058-codeql.md) | [devops] Add CodeQL analysis workflow | `ci/cd`, `area:security`, `help wanted` | `intermediate` | `security` | `078` |
| [`059`](059-secret-scanning.md) | [devops] Add repository secret scanning | `ci/cd`, `area:security`, `help wanted` | `intermediate` | `security` | `078` |
| [`060`](060-formatting.md) | [devops] Add consistent formatter checks | `ci/cd`, `area:devops`, `help wanted` | `intermediate` | `devops` | - |
| [`061`](061-precommit.md) | [dx] Add optional pre-commit checks | `dx`, `area:devops`, `help wanted` | `intermediate` | `devops` | `060` |
| [`062`](062-make-targets.md) | [dx] Add a portable task runner | `dx`, `area:devops`, `help wanted` | `intermediate` | `devops` | - |
| [`063`](063-dev-compose.md) | [devops] Add a hot-reload compose override | `dx`, `area:devops`, `help wanted` | `intermediate` | `devops` | - |
| [`064`](064-devcontainer.md) | [dx] Add a development container configuration | `dx`, `area:devops`, `help wanted` | `intermediate` | `devops` | - |
| [`065`](065-architecture-adrs.md) | [docs] Add architecture decision records | `documentation`, `area:docs`, `help wanted` | `intermediate` | `docs` | - |
| [`066`](066-pipeline-sequence-diagram.md) | [docs] Add a review-pipeline sequence diagram | `documentation`, `area:docs`, `good first issue` | `good-first-issue` | `docs` | - |
| [`067`](067-api-curl-examples.md) | [docs] Add authenticated API curl examples | `documentation`, `area:docs`, `good first issue` | `good-first-issue` | `docs` | - |
| [`068`](068-troubleshooting-faq.md) | [docs] Add a local troubleshooting guide | `documentation`, `area:docs`, `good first issue` | `good-first-issue` | `docs` | - |
| [`069`](069-provider-extension-guide.md) | [docs] Document how to add an AI provider | `documentation`, `area:ai`, `help wanted` | `intermediate` | `ai` | `048` |
| [`070`](070-finding-category-guide.md) | [docs] Document how to add finding categories | `documentation`, `area:ai`, `good first issue` | `good-first-issue` | `ai` | - |
| [`071`](071-storybook-evaluation.md) | [frontend] Evaluate Storybook for UI primitives | `dx`, `area:frontend`, `difficulty:advanced` | `advanced` | `frontend` | - |
| [`072`](072-bundle-budget.md) | [frontend] Establish a frontend bundle budget | `performance`, `area:frontend`, `help wanted` | `intermediate` | `frontend` | - |
| [`073`](073-dark-theme-audit.md) | [frontend] Audit dashboard contrast in both themes | `accessibility`, `area:frontend`, `help wanted` | `intermediate` | `frontend` | - |
| [`074`](074-keyboard-nav-audit.md) | [frontend] Audit dashboard keyboard navigation | `accessibility`, `area:frontend`, `help wanted` | `intermediate` | `frontend` | - |
| [`075`](075-i18n-scaffold.md) | [frontend] Add minimal internationalization scaffolding | `enhancement`, `area:frontend`, `difficulty:advanced` | `advanced` | `frontend` | - |
| [`076`](076-review-history.md) | [frontend] Add a review history timeline | `enhancement`, `area:frontend`, `difficulty:advanced` | `advanced` | `frontend` | `079` |
| [`077`](077-queue-operations-epic.md) | [epic] Improve review queue operations | `epic`, `area:redis-queue`, `difficulty:advanced` | `epic` | `redis-queue` | `036`, `037`, `038`, `039`, `041` |
| [`078`](078-security-hardening-epic.md) | [epic] Track security hardening work | `epic`, `area:security`, `difficulty:advanced` | `epic` | `security` | `044`, `045`, `046`, `047`, `056` |
| [`079`](079-review-platform-epic.md) | [epic] Evolve the AI review platform | `epic`, `area:ai`, `difficulty:advanced` | `epic` | `ai` | `048`, `049`, `050`, `051`, `052` |
| [`080`](080-contributor-experience-epic.md) | [epic] Track contributor experience improvements | `epic`, `area:devops`, `difficulty:advanced` | `epic` | `devops` | `025`, `057`, `060`, `061`, `062` |
