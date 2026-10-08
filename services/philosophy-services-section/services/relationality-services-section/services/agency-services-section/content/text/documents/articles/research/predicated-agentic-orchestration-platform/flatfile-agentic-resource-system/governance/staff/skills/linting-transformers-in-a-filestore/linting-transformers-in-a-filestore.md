---
name: linting-transformers-in-a-filestore
description: Lints all transformer entities in a filestore's transformers/ directory against R9, R7/R10, R13, the kind requirement, and the gerund-naming convention.
title: linting-transformers-in-a-filestore
---

Batch application of [linting-a-transformer-in-a-filestore](../linting-a-transformer-in-a-filestore/linting-a-transformer-in-a-filestore.md) across all `.md` files in `<filestore>/transformers/` (excluding `_index.md`).

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.

## Output

For each failing entity: one `<rel-path>: FAIL: <message>` line per violation.
Final line: `true` (exits 0) or `false` (exits 1).

## Script

`scripts/lint-transformers.mjs`
