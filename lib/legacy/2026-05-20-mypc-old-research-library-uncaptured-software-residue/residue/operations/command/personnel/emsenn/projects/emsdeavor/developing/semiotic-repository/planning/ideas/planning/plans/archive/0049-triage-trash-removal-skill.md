---
title: "Triage trash removal skill"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
  - claude
status: draft
priority: low
depends-on: []
goal: "003"
---

## Summary

Create a deterministic script (stage 4 procedural skill) that removes
build artifacts, editor metadata, and other non-content trash from the
triage directory. Triage contains ingested Obsidian vaults, git
repositories, and code projects whose content is valuable but whose
tooling artifacts are not.

## Motivation

Triage contains hundreds of non-content files that inflate the triage
index, waste enrichment cycles, and create noise when mining for
relevant content. A survey found:

- `.obsidian/` directories (AGRODAO, collapse dynamics, Delta Register,
  Groundhog Autonomous Zone)
- `.trash/` directories (Obsidian's internal trash)
- `.git/` directories (nested git repos in fennel, elisp, hugo, library)
- `__pycache__/` directories and `.pyc` files
- `.venv/` directories (Python virtual environments)
- `node_modules/` directories
- `desktop.ini`, `.DS_Store`, `Thumbs.db`
- `.log` files (build artifacts, not journal entries)

Removing these is fully deterministic — no inference needed.

## Steps

1. **Write a Python script** at
   `skills/clean-triage-trash/clean-triage-trash.py` that:
   - Accepts `--dry-run` flag (default: dry run)
   - Removes directories matching: `.obsidian`, `.trash`, `.git`,
     `__pycache__`, `node_modules`, `.venv`, `.cache`
   - Removes files matching: `*.pyc`, `.DS_Store`, `Thumbs.db`,
     `desktop.ini`
   - Optionally removes `.log` files (with a `--include-logs` flag,
     since some `.log` files may be content)
   - Reports what was removed and how much space was reclaimed

2. **Write the SKILL.md** manifest with:
   - `runtime: script`
   - `kind: operational`
   - triggers: "clean triage", "remove triage trash", "triage cleanup"

3. **Register** the skill in `.claude/skills/registry.md` under
   Maintain.

4. **Run the script** in dry-run mode to verify, then with emsenn's
   approval execute for real.

5. **Rebuild the triage index** after cleanup.

## Done when

- [ ] Script exists and runs without errors in dry-run mode
- [ ] SKILL.md manifest passes `validate-frontmatter`
- [ ] Skill is registered in the registry
- [ ] Dry-run output reviewed and approved by emsenn
- [ ] Trash removed from triage
- [ ] Triage index rebuilt

## Dependencies

- Triage directory must exist (it does)

## Log

**2026-03-08** — Created. Survey of trash patterns completed: found
.obsidian, .trash, .git, __pycache__, .venv, node_modules, desktop.ini
across triage.
