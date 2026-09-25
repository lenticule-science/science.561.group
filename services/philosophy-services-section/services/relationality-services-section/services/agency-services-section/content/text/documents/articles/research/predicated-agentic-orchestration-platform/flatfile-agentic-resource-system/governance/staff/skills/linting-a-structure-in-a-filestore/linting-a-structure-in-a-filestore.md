---
name: linting-a-structure-in-a-filestore
description: Lints a single structure entity against the FARS universal rules (R9, R7/R10, R13) and the kind-specific requirement that the file resides under structures/, returning true or false.
title: linting-a-structure-in-a-filestore
---

Lints one structure entity file.
The [linting](../../../transformers/linting.md) cell $(e, \mathtt{linting}, r)$ is **true** if the entity passes, **false** if it fails.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--entity <path>` — path to the structure entity file to lint.
  Required.

## Rules checked

- **R9**: `name` and `description` are present and non-empty.
- **R7/R10**: all frontmatter keys beyond `name`/`description` are transformer slugs in Ob(C).
- **R13**: no H1 heading in the body.
- **Kind**: the entity resides under `structures/` in the filestore.

## Output

Prints `true` and exits 0 if all rules pass.
Prints `FAIL: <message>` per violation then `false` and exits 1 on any failure.

## Script

`scripts/lint-structure.mjs`
