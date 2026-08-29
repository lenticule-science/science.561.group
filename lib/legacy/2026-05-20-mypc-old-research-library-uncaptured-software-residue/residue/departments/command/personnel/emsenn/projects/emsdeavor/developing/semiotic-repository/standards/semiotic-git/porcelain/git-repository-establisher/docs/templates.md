---
title: "Templates"
date-created: 2026-03-06T00:00:00
---
# Templates

This is a personal tool for @emsenn; templates reflect emsenn’s preferred conventions (even though the config is parameterized).

Templates live under `templates/<template-name>/`.

Rendering rules:

- Files ending with `.j2` are rendered with Jinja and written without the `.j2` suffix.
- File paths can contain Jinja too (example: `src/{{ project.python_package }}/__init__.py.j2`).
- Shared snippets live under `templates/_shared/` and can be included via `{% include "..." %}`.

## Bundles (reducing boilerplate)

Templates can optionally include a `template.yaml` listing `bundles`. Bundles are directories under `templates/_bundles/` containing common files (hooks, GitHub health files, changelog/TODO, etc.). Bundles are applied first, then template files override.

## Available templates

- `basic`: generic repo scaffold
- `math-paper`: Pandoc Markdown math paper scaffold (HTML/PDF export)
- `python-package`: `src/` layout, `direnv` + `.venv`, CI, ruff/pytest
- `rust-crate`: cargo crate with CI
- `research-notes`: research notes scaffold with metadata file
- `markdown-vault`: Obsidian-style vault scaffold
- `mkdocs-site`: MkDocs + Material site scaffold with CI
- `specs`: Markdown specification plus JSON Schema scaffold

## Git hooks

All templates include versioned hooks under `.githooks/`, and `establish.py` enables them by default via:

`git config core.hooksPath .githooks`

Hooks are intended to be:

- Fast on `pre-commit`
- A bit more thorough on `pre-push`
- Strict on `commit-msg` (Conventional Commits)
