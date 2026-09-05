---
title: "Filenames are active identifiers"
type: concept
class: commitment
component-of: ../_index.md
depends-on:
  - vault.md
  - files-are-source.md
see-also:
  - directory-tree-carries-meaning.md
---


A note's *slug* — its filename minus extension — is its identity within its directory. The slug is what other notes refer to, what links resolve against, and what humans grep for. Renaming a file is therefore not a cosmetic act; it is an editorial decision about what the note is.

## What the commitment says

Two notes with the same slug in the same directory are *the same note* — the vault forbids this collision. Two notes in different directories may share a slug; their full paths distinguish them, and references must disambiguate accordingly.

The slug is expected to be stable across the lifetime of the note's content. A note may be revised, expanded, retitled in its `title:` frontmatter, even moved between sections — but if its slug changes, every link to it must be updated in the same edit, or the link breaks. Slug changes are therefore tracked, deliberate, and rare.

## What the commitment forbids

- **Random or generated identifiers as the canonical reference.** UUIDs and hashes can be added as supplementary metadata, but the slug — human-readable, kebab-case, semantically meaningful — is the identity callers use.
- **Silent renames.** Renaming a file without a corresponding sweep of its inbound references is a defect, not a refactor.
- **Multiple notes per file.** One file, one note. A file is not a collection.

## What the commitment enables

- **Grep-as-query.** Looking for "everything that references X" is `rg -l "X.md"` or `rg -l "/X)"`. The slug is a literal string in the file system.
- **Stable URLs.** Any rendered form of the vault can derive a stable URL from the slug, because the slug is stable.
- **Predictable cross-references.** Authors writing new notes can cite an existing note by slug without consulting an index.

## Form of slugs

Slugs are lower-kebab-case (`predication-cell.md`, not `PredicationCell.md` or `predication_cell.md`). This is a corpus convention layered on top of the parent theory's commitment; the parent theory only requires *some* stable identifier scheme, and this corpus has chosen this one.
