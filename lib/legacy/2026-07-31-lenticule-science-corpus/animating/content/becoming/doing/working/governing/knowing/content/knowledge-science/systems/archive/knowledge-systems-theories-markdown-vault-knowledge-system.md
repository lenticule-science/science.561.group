---
title: "Markdown-Vault Knowledge System"
component-of: knowledge-systems
description: "Knowledge systems whose primary medium is a directory tree of markdown files with YAML frontmatter, navigable by file system, grep, and frontmatter-relation graph."
depends-on:
  - ../_index.md
see-also:
  - ../../../../../../engineering/theories/design/theories/information-architecture/_index.md
  - ../../../../../linguistics/theories/semiotics/_index.md
  - ../../../../../communication/_index.md
---

# Markdown-Vault Knowledge System

A *markdown-vault knowledge system* is a knowledge system whose primary medium is a directory tree of plain markdown files with YAML frontmatter, navigable by file system tools (`ls`, `find`, `grep`), by frontmatter-declared relations, and by whatever rendering pipeline the vault chooses to layer on top. The Obsidian vault, the Logseq graph, the static-site source tree, the Zettelkasten-as-files — these are all instances of this theory.

This is a general theory. It does not commit to any particular schema for what kinds of notes a vault contains, what relations the frontmatter declares, or how content is arranged within directories. What it does commit to is that the *vault itself* — the file tree — is the source of truth, and any rendered, indexed, or otherwise materialized form is derived.

## What a markdown-vault knowledge system commits to

1. **Files are the source.** A note's canonical form is its markdown file on disk. Renderers, search indexes, graph views, and exports are derived; they may be wrong, and the file decides.
2. **Filenames are active identifiers.** A note's slug (its filename minus extension) is its identity within its directory. Renaming a file is a meaningful editorial act; it should not be done casually.
3. **Frontmatter is structured data.** Anything the vault wants to query, sort, render, or validate goes in YAML frontmatter. Body text is for prose.
4. **Plain-text first.** A vault must be useful with no tooling beyond a text editor and `grep`. Tooling adds *power*; it does not add *access*.
5. **The directory tree carries meaning.** Where a file lives is part of what it says. A vault's directory layout is a knowledge-organization scheme, not a filing convenience.

## What this theory does not say

- Which note types exist (`concept`, `object`, `morphism`, `theorem`, `question`, `narrative`, `example`, `reference`, `term`, `text`, `topic`, ...). That is a choice each vault's specification makes.
- Which frontmatter relations exist (`depends-on`, `realizes`, `see-also`, `instantiates`, ...). Same.
- Whether the vault is single- or multi-author, public or private, versioned or not.
- Whether the vault carries operational artifacts (skills, runbooks, configuration) alongside knowledge content.

These choices are made by *more specific* theories that combine markdown-vault-knowledge-system with other commitments. The sub-theory that drives this corpus's own curation is [the predicated markdown-vault knowledge system](theories/predicated-markdown-vault-knowledge-system/).

## Layout

- [`concepts/`](concepts/_index.md) — the five commitments above, each as a load-bearing concept in its own right, plus the [vault](concepts/vault.md) artifact they collectively describe.
- [`objects/`](objects/_index.md) — the minimal definitions the parent theory carries so that subtheories have a shared starting vocabulary: [vault](objects/vault.md) (the file tree as a structure), [note](objects/note.md) (a single markdown file with frontmatter as a typed entity), and [relation-graph](objects/relation-graph.md) (the directed multigraph induced by frontmatter relation edges across the vault). These are the *medium-level* definitions; subtheories like [predicated-markdown-vault-knowledge-system](theories/predicated-markdown-vault-knowledge-system/) refine them with predication structure.
- `theories/` — sub-theories that combine these commitments with further ones. The sub-theory that drives this corpus's own curation is [the predicated markdown-vault knowledge system](theories/predicated-markdown-vault-knowledge-system/_index.md).

This parent theory is deliberately small. It carries the five commitments as concepts and the three minimal artifacts (vault, note, relation-graph) as objects, no more. Morphisms and theorems are the work of more specific theories — the predicated subtheory carries the discipline-morphisms (graph-update, theory-promotion) and the structural theorems (acyclicity-modulo-see-also, conformance-decidability) that load on these objects.
