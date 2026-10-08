---
name: making-a-filestore
description: Initializes a new FARS filestore at a given root path — scaffolds the four mandatory top-level directories and the _index.md entity, validates the result, and records the making bilattice value.
title: making-a-filestore
---

Bootstraps a new FARS filestore.
Creates the four mandatory top-level directories derived from the FOUR bilattice (see `concepts/four-directory-structure.md`):

1. `prose/` — ⊥ position, unresolved narratives
2. `code/` — t position, executable resolutions
3. `governance/` — f position, normative constraints
4. `theories/` — ⊤ position, derived syntheses

Also creates `structures/`, `transformers/`, `concepts/`, `claims/`, `questions/`, and `work/` as working directories, and writes a root `_index.md` entity with the required `name` and `description` predications.

Validates the scaffolded `_index.md` in-memory before writing.
Does not write if validation fails or the target already contains a `_index.md`.

The [making](../../../transformers/making.md) cell $(filestore, \mathtt{making}, \mathtt{making\text{-}a\text{-}filestore})$ is **true** if the filestore was initialized, **false** if validation failed or `_index.md` already exists at the target root.

## Inputs

- `--root <path>` — path where the filestore should be initialized.
  Required.
- `--name <slug>` — name predicate for the root `_index.md`.
  Required.
- `--description <text>` — description predicate for the root `_index.md`.
  Required.

## Output

One `created: <dir>` line per directory created, then `written: _index.md`, then `true` (exits 0).
On failure: one `FAIL: <message>` line per violation, then `false` (exits 1).

## Script

`scripts/make-filestore.mjs`
