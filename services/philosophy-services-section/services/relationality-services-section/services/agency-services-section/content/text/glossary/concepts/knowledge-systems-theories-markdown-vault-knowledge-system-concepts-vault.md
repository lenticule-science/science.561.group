---
title: "Vault"
type: concept
class: artifact
component-of: ../_index.md
see-also:
  - files-are-source.md
  - directory-tree-carries-meaning.md
description: "A vault is the artifact described by the markdown-vault knowledge system: a directory tree of markdown files with YAML frontmatter, taken as the source of truth for whatever knowledge it carries."
---


A *vault* is the artifact described by the markdown-vault knowledge system: a directory tree of markdown files with YAML frontmatter, taken as the source of truth for whatever knowledge it carries.

## What a vault is

Concretely, a vault is a directory on disk — typically version-controlled — whose contents are markdown files (`.md`), supporting assets (images, data files, BibTeX), and possibly nested vaults. Its boundary is the boundary of the directory; what is outside the directory is not part of this vault.

A vault is identified by its root. The root carries an `_index.md` that names it, says what it is, and points into its layout. Every note in the vault has a path from this root, and that path is a statement about the note (see [the directory tree carries meaning](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/directory-tree-carries-meaning.md)).

## What a vault is not

- **Not a database.** A vault is queryable, but its primary mode of use is reading-by-path, not querying-by-index. Indexes are derived; the directory tree is canonical.
- **Not a website.** A vault may be rendered as a website, but the website is downstream. Every claim true of the vault must be true of the files; not every claim true of the website is true of the vault.
- **Not a knowledge graph.** The frontmatter relations form a graph, and a graph view is a useful way to see the vault, but the graph is downstream of the files. The files are not "in" the graph; the graph is read off them.
- **Not a wiki.** A wiki centralizes editing through a runtime; a vault localizes editing in files. The two share a surface — interlinked text — but differ on where authority lives.

## What a vault contains

A vault contains *notes*. The parent markdown-vault theory does not commit to which kinds of notes are admissible; that is a choice each more-specific vault theory makes. The [predicated markdown-vault knowledge system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/theories/predicated-markdown-vault-knowledge-system) commits to a fixed set of typed kinds: concept, object, morphism, theorem, question, narrative, example, reference, text.
