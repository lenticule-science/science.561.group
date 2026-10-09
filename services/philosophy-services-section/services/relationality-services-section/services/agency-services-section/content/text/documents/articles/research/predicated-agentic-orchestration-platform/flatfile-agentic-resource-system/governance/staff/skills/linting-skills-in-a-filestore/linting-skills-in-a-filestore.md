---
name: linting-skills-in-a-filestore
description: Lints all skill entities in a filestore's governance/staff/skills/ directory against R9, R7/R10, and R13, reporting per-entity violations and an overall bilattice value.
title: linting-skills-in-a-filestore
---

Batch lint of skill entity files under `<filestore>/governance/staff/skills/`.
Both flat skills (`<skill>.md` directly in skills/) and directory-structured skills (`<skill>/<skill>.md`) are found and linted.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

Per failing entity: `<rel-path>: FAIL: <message>`.
Final line: `true` (exits 0) or `false` (exits 1).

## Script

`scripts/lint-skills.mjs`
