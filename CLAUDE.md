# POMIndia Portal

SaaS portal for property owners abroad (US) to monitor land in India. Field agents in India visit sites, capture photos and notes, and owners view reports. Intent and requirements live in `docs/`; read `docs/intent.md` before starting any feature.

## Stack
- Python 3.13, managed with `uv`. FastAPI backend on Render, Postgres + PostGIS.
- Frontend on Netlify. Auth0 (Google sign-in) issues tokens; the API validates JWTs.
- Google Maps Platform for map views. CI on GitHub Actions, deploys through Harness.

## Commands
- `just check` - lint, type check and tests. Run it before every PR; CI runs the same gates.
- `just fmt` - auto-fix and format.
- `just secrets` - Gitleaks scan.

## Workflow rules
- No spec, no code: every feature traces to a spec in `docs/`.
- Work on a branch and open a PR. `main` is protected; never push to it.
- Keep PRs small and tied to one issue. Add or update tests with the code.
- Do not edit `.github/`, `CLAUDE.md`, `pyproject.toml` tool config, or migrations without calling it out in the PR description.

## Security and PII (public repo - treat everything committed as permanent)
- Never commit secrets, `.env` files, API keys, real customer data, parcel records or real photos. Use synthetic data in tests, dev and staging.
- Never log or send PII (names, addresses, emails, phones, ownership details, photo GPS) to logs, error reports or LLM prompts.
- Strip EXIF location from any image shown or shared; store coordinates separately.
- Treat photo EXIF GPS as an unverified claim, supporting evidence only.
- Do not write your own auth or crypto. Validate Auth0 tokens with a vetted library.
- Agents have no production credentials or production data access.

## Human-only review areas
Auth, database migrations, anything touching PII or permissions, payments, CI/CD and infrastructure. Do not self-approve changes here; flag them for the owner.

## Code style
Ruff and strict mypy are enforced. Type every function. Prefer small, tested modules.
