---
name: linting-rules-in-a-filestore
description: Lints all specification/rule entities in a filestore's governance/rules/specifications/ directory against R9, R7/R10, and R13, reporting per-entity violations and an overall bilattice value.
title: linting-rules-in-a-filestore
---

Batch lint of all `.md` files in `<filestore>/governance/rules/specifications/` (excluding `_index.md`).

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

Per failing entity: `<rel-path>: FAIL: <message>`.
Final line: `true` (exits 0) or `false` (exits 1).

## Script

`scripts/lint-rules.mjs`
