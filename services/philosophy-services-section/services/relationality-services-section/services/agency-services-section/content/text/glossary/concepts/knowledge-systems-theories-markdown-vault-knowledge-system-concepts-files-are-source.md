---
title: "Files are the source"
type: concept
class: commitment
component-of: ../_index.md
depends-on:
  - vault.md
see-also:
  - plain-text-first.md
  - frontmatter-is-structured-data.md
description: "A markdown-vault knowledge system commits to a single locus of truth: the markdown file on disk."
---


A markdown-vault knowledge system commits to a single locus of truth: the markdown file on disk. Whatever else exists — a rendered website, a search index, a graph view, an exported PDF, a database mirror — exists *downstream* of the file.

## What the commitment says

For any note in the vault, the canonical answer to "what does this note say?" is the bytes of its `.md` file. If a renderer disagrees with the file, the renderer is wrong. If an index is stale, the index is wrong. If a derived artifact has drifted, the artifact is wrong.

This is not a statement about preferences or aesthetics. It is a constraint on how the vault is allowed to evolve: there is no operation on a derived artifact that, by itself, changes what a note means. The only way to change a note is to edit the file.

## What the commitment forbids

- **Edit-in-place in derived views.** A web UI that lets a reader correct a note must, under this commitment, write its correction back to the file before the correction counts.
- **Authoritative caches.** A search index or graph database may be queried for speed, but no caller may treat its answer as more correct than what `cat` of the file would yield.
- **Implicit defaults filled in by tooling.** If a note's frontmatter omits a field and a renderer supplies a default, that default does not become part of the note. The note is what is in the file.

## What the commitment enables

- **Recovery from any tool failure.** Lose every renderer, every index, every database — the vault is intact.
- **Diff-based version control.** Because the file is canonical, `git diff` on the file is a complete account of what changed about the note.
- **Tooling pluralism.** Any tool that can read text can participate. The vault doesn't pick winners.
