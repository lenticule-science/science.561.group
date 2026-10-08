---
name: linting-claims-in-a-filestore
description: Lints all claim entities in a filestore's claims/ directory against R9, R7/R10, and R13, reporting per-entity violations and an overall bilattice value.
title: linting-claims-in-a-filestore
---

Batch lint of all `.md` files in `<filestore>/claims/` (excluding `_index.md`).

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

Per failing entity: `<rel-path>: FAIL: <message>`.
Final line: `true` (exits 0) or `false` (exits 1).

## Script

`scripts/lint-claims.mjs`
