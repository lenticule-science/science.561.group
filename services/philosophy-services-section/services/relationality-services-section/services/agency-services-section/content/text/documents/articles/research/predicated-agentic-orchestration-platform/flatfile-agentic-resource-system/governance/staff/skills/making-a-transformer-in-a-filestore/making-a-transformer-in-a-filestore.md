---
name: making-a-transformer-in-a-filestore
description: Scaffolds a new transformer entity in a filestore's transformers/ directory — validates that the slug is a gerund, writes the entity file if conformant, and records the making bilattice value.
title: making-a-transformer-in-a-filestore
---

Scaffolds a new `.md` file at `<filestore>/transformers/<name>.md`.
The name slug must end in `-ing` (gerund requirement, R-gerund).
Validates inputs before writing; does not write if validation fails.

The [making](../../../transformers/making.md) cell $(filestore, \mathtt{making}, \mathtt{making\text{-}a\text{-}transformer\text{-}in\text{-}a\text{-}filestore})$ is **true** if the file was written, **false** if validation failed or the file already exists.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--name <slug>` — slug for the new transformer entity.
  Must end in `-ing`.
  Required.
- `--description <text>` — description predicate value.
  Required.

## Output

On success: `written: transformers/<name>.md` (exits 0).
On failure: one `FAIL: <message>` line per violation, then `false` (exits 1).

## Script

`scripts/make-transformer.mjs`
