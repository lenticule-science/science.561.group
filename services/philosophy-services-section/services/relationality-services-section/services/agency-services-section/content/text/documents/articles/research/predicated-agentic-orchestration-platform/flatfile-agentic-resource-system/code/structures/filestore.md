---
name: filestore
description: A directory that encodes a predication fibration as a flat collection of frontmatter-markdown files, organized by kind into canonical subdirectories, with an _index.md declaring the filestore's identity and structural relations.
title: filestore
---

## What a filestore is

A filestore is the FARS substrate's realization of a predication fibration $(\mathbf{FOUR}, \mathcal{C}, E)$ as a filesystem directory.
Every `.md` file in the directory is a member of $E$ (R1).
The structural kind of each entity is determined by its subdirectory path (R2).
The objects of $\mathcal{C}$ are the `.md` files under any `transformers/` subdirectory (R3).

The filestore is the thing the linting, auditing, and making skills operate on.
It is their primary argument: `--filestore <root>` identifies a filestore by its root directory path.

## Structure

A filestore has a root directory containing:

- `_index.md` — declares the filestore's identity (`name:`, `description:`), structural relations to other filestores (`derives-methods-from-theory:`, `models-theory:`, etc.), and kind-specific frontmatter as specified by [theory.md](../governance/rules/specifications/theory.md).
- Four mandatory top-level directories, derived from the $\mathbf{FOUR}$ bilattice: `prose/`, `code/`, `governance/`, and `theories/`.
  See [four-directory-structure](../../flatfile/four-directory-structure/four-directory-structure.md) for the derivation.
- Optionally: `README.md` and other non-entity files (not members of $E$, not subject to R1–R13).

The current working layout approximates the four-directory structure with nine kind-subdivided directories (`structures/`, `transformers/`, `claims/`, `theories/`, `concepts/`, `questions/`, `prose/`, `governance/`, `work/`).
These subdivide `prose/` and `code/` into finer kinds.
The boundary between `code/` and `prose/` is not yet formally pinned — in particular, whether `transformers/` belongs under `code/` or `prose/` is an open question.
The four-directory structure is the destination; the nine-directory layout is the current working state.

A filestore may contain sub-filestores in its `theories/` subdirectory.
Each sub-filestore is itself a fully valid filestore with its own `_index.md` and canonical subdirectories.

## Filestore identity

A filestore is identified by its root path.
The `_index.md` at the root is the filestore's identity entity — the entity whose `name:` is the filestore's slug and whose `description:` states what predication fibration this filestore encodes.

## What a filestore is not

A filestore is not a database, a graph store, or a document store.
It is not a collection of records with a schema.
It is a syntactic encoding of a predication fibration: the files are entities, the directories are kind-classifiers, the frontmatter is the predication fiber algebra, and the markdown body is human-readable prose that may redundantly express the same data encoded in frontmatter cells.

A directory that lacks `_index.md` is not a filestore — it is an unidentified directory.
A directory whose `.md` files lack frontmatter is not a valid filestore — it violates R9.

## Self-application

The FARS theory is itself a filestore.
This entity — `structures/filestore.md` — is a member of $E$ in the filestore it describes.
The making, linting, and auditing skills were developed inside this filestore to operate on this filestore.
The filestore structure is the snake's tail: the theory is both the object of study and the substrate in which the study is recorded.
