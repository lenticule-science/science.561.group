---
name: linting-a-filestore
description: Lints the filestore itself — checks that _index.md exists and conforms, and that the top-level directories are a subset of the canonical directory set.
title: linting-a-filestore
---

Lints the [filestore](../../../../code/structures/filestore.md) structure at the given root.
The [linting](../../../transformers/linting.md) cell $(filestore, \mathtt{linting}, r)$ is **true** if all checks pass, **false** otherwise.

## Inputs

- `--filestore <root>` — path to the filestore root to lint.
  Required.

## Rules checked

- **Identity**: `_index.md` exists at the filestore root.
- **R9 on index**: `_index.md` has `name` and `description` frontmatter, non-empty.
- **R13 on index**: `_index.md` has no H1 heading in its body.
- **R7/R10 on index**: any extra frontmatter keys in `_index.md` are transformer slugs.
- **Directory shape**: all top-level directories are within the canonical set (`prose`, `code`, `governance`, `theories`, `structures`, `transformers`, `claims`, `concepts`, `questions`, `work`).
  Unknown top-level directories are flagged as violations.

## Output

Prints `true` and exits 0 if all rules pass.
Prints `FAIL: <message>` per violation then `false` and exits 1 on any failure.

## Script

`scripts/lint-filestore.mjs`
