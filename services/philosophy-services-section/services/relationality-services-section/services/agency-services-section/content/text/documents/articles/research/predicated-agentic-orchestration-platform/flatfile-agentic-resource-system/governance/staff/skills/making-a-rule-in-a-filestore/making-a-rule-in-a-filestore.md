---
name: making-a-rule-in-a-filestore
description: Scaffolds a new specification/rule entity in a filestore's governance/rules/specifications/ directory — validates inputs, writes the entity file if conformant, and records the making bilattice value.
title: making-a-rule-in-a-filestore
---

Scaffolds a new `.md` file at `<filestore>/governance/rules/specifications/<name>.md` with the required `name` and `description` frontmatter.
Validates inputs before writing; does not write if validation fails.

The [making](../../../transformers/making.md) cell $(filestore, \mathtt{making}, \mathtt{making\text{-}a\text{-}rule\text{-}in\text{-}a\text{-}filestore})$ is **true** if the file was written, **false** if validation failed or the file already exists.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--name <slug>` — slug for the new rule entity.
  Required.
- `--description <text>` — description predicate value.
  Required.

## Output

On success: `written: governance/rules/specifications/<name>.md` (exits 0).
On failure: one `FAIL: <message>` line per violation, then `false` (exits 1).

## Script

`scripts/make-rule.mjs`
