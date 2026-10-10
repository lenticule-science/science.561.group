---
name: directory index
description: A marker file (`_index.md`) that represents its parent directory as a polity-recognized collection; the directory's record-of-itself in the substrate.
---

## Pure form

A directory in the polity's tree becomes a recognized collection by carrying an `_index.md` at its root.
The index file is the directory's own predication-bearing record: it names the collection, describes what lives there, and enumerates the children it documents.
Without an `_index.md`, a directory is a filesystem artifact only; with one, it is a substrate entity.

The marker is the filename `_index.md` itself.
No `type:` / `kind:` / `class:` frontmatter is written, because the filename and its location already carry that information.

## Characteristic predication-shape

- `represents-directory(index, dirpath)` — the directory the index is the record-of; given by the index's own location.
- `contains(index, child)` — a file or subdirectory inside the directory that this index documents.
  The structured listing is the directory-index's distinguishing predication: it makes the collection's membership readable from frontmatter alone.
- The index inherits its `name:` from the parent directory's name, per the universal YAML frontmatter rule for marker files.

## What this is not

- Not a hierarchy node bearing lifecycle status — directories have no `status:` of their own; their children do.
- Not a duplicate of the directory's children's predications — the index aggregates, it does not restate.
