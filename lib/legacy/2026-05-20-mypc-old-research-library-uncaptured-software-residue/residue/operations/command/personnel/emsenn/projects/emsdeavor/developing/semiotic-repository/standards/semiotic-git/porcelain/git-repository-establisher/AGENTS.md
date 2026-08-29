---
title: "Agent Notes (repo-establisher)"
date-created: 2026-03-06T00:00:00
---
# Agent Notes (repo-establisher)

This repo is a personal scaffolding tool for @emsenn: `establish.py` + filesystem templates that generate new repositories.

## What This Repo Does

- Reads a YAML config (or CLI flags) and renders `templates/<template>/` into `output_path`.
- Uses Jinja rendering for any `*.j2` file (and supports templated paths).
- Ships a small license library (`licenses/*.j2`) consumed by template `LICENSE.j2`.

## Non-goals

- Do not turn this into a “universal” scaffolder; optimize for emsenn’s conventions.
- Do not make generated repos depend on this repo (no links back here in template output).

## Commands

- List templates: `python3 establish.py list-templates`
- Dry run: `python3 establish.py init --config examples/python-package.yaml --dry-run`
- Smoke test (recommended after template changes): `scripts/smoke_test.sh`
- Syntax check: `python3 -m py_compile establish.py`

## Template/Rendering Rules (important)

- Any file containing Jinja (`{{ ... }}` / `{% ... %}`) MUST be named `*.j2`.
- Output file path is the same as template path, with `.j2` removed (example: `README.md.j2` -> `README.md`).
- Shared includes live in `templates/_shared/` and should be included with `{% include "..." %}`.
- License IDs must exist as `licenses/<id>.j2` (validated by `establish.py`).

## Adding a Template

- Create `templates/<new-template>/` by copying the closest existing template.
- Include baseline files: `README.md.j2`, `LICENSE.j2`, `CODE_OF_CONDUCT.md.j2`, `CONTRIBUTING.md.j2`, `SECURITY.md.j2`, `CHANGELOG.md.j2`, `AGENTS.md.j2`, `.gitignore.j2`, `.editorconfig.j2`, `.gitattributes.j2`.
- Include GitHub health files: `.github/ISSUE_TEMPLATE/*`, `.github/pull_request_template.md.j2`, and (usually) `.github/dependabot.yml` when there are deps.
- Add `.githooks/` scripts; keep `pre-commit` fast and push slower checks to `pre-push`.
- Add/refresh an example config in `examples/`.

## Common Pitfalls

- If you see `{% include ... %}` text literally in generated files, the source file is missing the `.j2` suffix.
- Git hook scripts must be executable in generated repos; `establish.py` tries to `chmod +x` (best-effort).
- Hooks shouldn’t require nonstandard tools; prefer `grep` over `rg` unless guarded.

