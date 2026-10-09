---
name: linting-a-transformer-in-a-filestore
description: Lints a single transformer entity against R9, R7/R10, R13, the transformers/ kind requirement, and the gerund-naming convention (slug must end in -ing).
title: linting-a-transformer-in-a-filestore
---

Lints one transformer entity file.
The [linting](../../../transformers/linting.md) cell $(e, \mathtt{linting}, r)$ is **true** if all rules pass, **false** otherwise.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--entity <path>` — path to the transformer entity file to lint.
  Required.

## Rules checked

- **R9**: `name` and `description` are present and non-empty.
- **R7/R10**: all frontmatter keys beyond `name`/`description` are transformer slugs in Ob(C).
- **R13**: no H1 heading in the body.
- **Kind**: the entity resides under `transformers/` in the filestore.
- **Naming**: the entity's slug (filename stem) ends in `-ing` — it must be a gerund, since transformers name predicates and predicates are grammatically verb-processes.

## Output

Prints `true` and exits 0 if all rules pass.
Prints `FAIL: <message>` per violation then `false` and exits 1 on any failure.

## Script

`scripts/lint-transformer.mjs`
