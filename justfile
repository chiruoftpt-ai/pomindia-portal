# Single entry point shared by developers, agents and CI.
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

default:
    @just --list

# Run every gate CI runs. Agents must pass this before opening a PR.
check: lint typecheck test

lint:
    uv run ruff check .
    uv run ruff format --check .

fmt:
    uv run ruff check --fix .
    uv run ruff format .

typecheck:
    uv run mypy

test:
    uv run pytest

# Scan the working tree and history for secrets.
secrets:
    gitleaks detect --source . --redact
