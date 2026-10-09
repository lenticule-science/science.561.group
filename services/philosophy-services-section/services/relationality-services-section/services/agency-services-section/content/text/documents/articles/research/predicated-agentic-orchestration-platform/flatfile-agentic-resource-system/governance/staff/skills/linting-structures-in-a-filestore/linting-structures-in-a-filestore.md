---
name: linting-structures-in-a-filestore
description: Lints all structure entities in a filestore's structures/ directory against R9, R7/R10, R13, and the kind requirement, reporting per-entity violations and an overall bilattice value.
title: linting-structures-in-a-filestore
---

Batch application of [linting-a-structure-in-a-filestore](../linting-a-structure-in-a-filestore/linting-a-structure-in-a-filestore.md) across all `.md` files in `<filestore>/structures/` (excluding `_index.md`).
Reports per-entity violations and a single overall bilattice value.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

For each failing entity: one `<rel-path>: FAIL: <message>` line per violation.

Final line: `true` (no violations across all entities, exits 0) or `false` (any violation found, exits 1).

If `structures/` does not exist, prints `true` and exits 0.

## Script

`scripts/lint-structures.mjs`
