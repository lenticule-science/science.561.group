---
name: making-a-claim-in-a-filestore
description: Scaffolds a new claim entity in a filestore's claims/ directory — validates inputs, writes the entity file if conformant, and records the making bilattice value.
title: making-a-claim-in-a-filestore
---

Scaffolds a new `.md` file at `<filestore>/claims/<name>.md` with the required `name` and `description` frontmatter.
Validates inputs before writing; does not write if validation fails.

The [making](../../../transformers/making.md) cell $(filestore, \mathtt{making}, \mathtt{making\text{-}a\text{-}claim\text{-}in\text{-}a\text{-}filestore})$ is **true** if the file was written, **false** if validation failed or the file already exists.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--name <slug>` — slug for the new claim entity.
  Required.
- `--description <text>` — description predicate value.
  Required.

## Output

On success: `written: claims/<name>.md` (exits 0).
On failure: one `FAIL: <message>` line per violation, then `false` (exits 1).

## Script

`scripts/make-claim.mjs`
