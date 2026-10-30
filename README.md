# POMIndia Portal

SaaS web portal that lets property owners abroad monitor land in India through on-site agent visits, photos, and reports.

Status: bootstrapping the AI-native SDLC. Intent and requirements will live in `docs/`.

## Stack
- Python 3.13 (uv) + FastAPI, Postgres/PostGIS on Render
- Frontend on Netlify, auth via Auth0 (Google sign-in)
- Google Maps Platform for map views
- CI: GitHub Actions; CD: Harness
