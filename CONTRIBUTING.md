# Contributing to CodePilot

Thanks for helping improve CodePilot. Please open or claim an issue before starting substantial work; maintainers aim to acknowledge issues and pull requests within five business days.

## Getting started

Fork the repository, create a branch from main, and use a descriptive branch name such as feat/review-filter, fix/webhook-validation, or docs/queue-guide. Keep commits focused and written in the imperative mood.

```bash
cp .env.example .env
docker compose up -d --build
cd backend && mvn clean test -B && mvn verify -B
cd ../frontend && npm ci && npm run lint && npx tsc --noEmit && npm run build && npx playwright test
```

Java 21, Maven 3.9+, Node.js 22+, Docker, and Docker Compose are required for the complete local stack. See README.md and docs/ENVIRONMENT_VARIABLES.md for setup details.

## Claiming work

Comment on an unassigned issue with your intended approach before beginning. A good first issue is a self-contained task expected to take one to three hours; its acceptance criteria and newcomer hints should be enough to complete it without product-specific context.

## Pull request checklist

- [ ] My branch targets main and addresses one issue.
- [ ] I added or updated focused tests where behavior changed.
- [ ] cd backend && mvn clean test -B && mvn verify -B passes when backend changes.
- [ ] cd frontend && npm run lint && npx tsc --noEmit && npm run build && npx playwright test passes when frontend changes.
- [ ] I updated documentation and screenshots where relevant.
- [ ] I did not commit secrets, generated reports, or unrelated formatting.

## Contributing without secrets

Most work does not require a Gemini key or GitHub OAuth application. Backend unit tests mock GitHub and AI clients; the Playwright suite uses mocked API responses in frontend/e2e/fixtures.ts; docs, CI, UI primitives, and static checks are also safe to work on locally. Do not request, paste, or commit credentials.
