---
name: linting-a-concept-in-a-filestore
description: Lints a single concept entity against R9, R7/R10, R13, and the kind requirement that it resides under concepts/.
title: linting-a-concept-in-a-filestore
---

Lints one concept entity file.
The [linting](../../../transformers/linting.md) cell $(e, \mathtt{linting}, r)$ is **true** if all rules pass, **false** otherwise.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--entity <path>` — path to the concept entity file to lint.
  Required.

## Rules checked

- **R9**: `name` and `description` are present and non-empty.
- **R7/R10**: all frontmatter keys beyond `name`/`description` are transformer slugs in Ob(C).
- **R13**: no H1 heading in the body.
- **Kind**: the entity resides under `concepts/` in the filestore.

## Output

Prints `true` and exits 0 if all rules pass.
Prints `FAIL: <message>` per violation then `false` and exits 1 on any failure.

## Script

`scripts/lint-concept.mjs`
