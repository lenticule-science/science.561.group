---
name: linting-a-question-in-a-filestore
description: Lints a single question entity against R9, R7/R10, R13, and the kind requirement that it resides under questions/.
title: linting-a-question-in-a-filestore
---

Lints one question entity file.
The [linting](../../../transformers/linting.md) cell $(e, \mathtt{linting}, r)$ is **true** if all rules pass, **false** otherwise.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--entity <path>` — path to the question entity file to lint.
  Required.

## Rules checked

- **R9**: `name` and `description` are present and non-empty.
- **R7/R10**: all frontmatter keys beyond `name`/`description` are transformer slugs in Ob(C).
- **R13**: no H1 heading in the body.
- **Kind**: the entity resides under `questions/` in the filestore.

## Output

Prints `true` and exits 0 if all rules pass.
Prints `FAIL: <message>` per violation then `false` and exits 1 on any failure.

## Script

`scripts/lint-question.mjs`
