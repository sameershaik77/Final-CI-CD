# Final CI-CD

Minimal Flask app + Docker + Docker Compose + GitHub Actions workflow for CI/CD.

See the `.github/workflows/ci-cd.yml` for the pipeline steps.

Local dev:
1. Copy `.env.example` to `.env` and update values.
2. Build & run locally:
   docker compose up --build

Deploy steps are implemented in GitHub Actions (build, push, SSH deploy).