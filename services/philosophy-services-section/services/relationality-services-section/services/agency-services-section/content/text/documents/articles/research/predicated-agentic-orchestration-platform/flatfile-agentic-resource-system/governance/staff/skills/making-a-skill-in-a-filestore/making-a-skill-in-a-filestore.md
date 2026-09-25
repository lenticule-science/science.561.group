---
name: making-a-skill-in-a-filestore
description: Scaffolds a new skill entity in a filestore's governance/staff/skills/ directory — validates inputs, writes the directory-form skill file if conformant, and records the making bilattice value.
title: making-a-skill-in-a-filestore
---

Scaffolds a directory-form skill at `<filestore>/governance/staff/skills/<name>/<name>.md` with the required `name` and `description` frontmatter.
Also creates the `scripts/` subdirectory alongside the skill file.
Validates inputs before writing; does not write if validation fails.

The [making](../../../transformers/making.md) cell $(filestore, \mathtt{making}, \mathtt{making\text{-}a\text{-}skill\text{-}in\text{-}a\text{-}filestore})$ is **true** if the file was written, **false** if validation failed or the file already exists.

## Inputs

- `--filestore <root>` — path to the filestore root.
  Required.
- `--name <slug>` — slug for the new skill entity.
  Required.
- `--description <text>` — description predicate value.
  Required.

## Output

On success: `written: governance/staff/skills/<name>/<name>.md` (exits 0).
On failure: one `FAIL: <message>` line per violation, then `false` (exits 1).

## Script

`scripts/make-skill.mjs`
