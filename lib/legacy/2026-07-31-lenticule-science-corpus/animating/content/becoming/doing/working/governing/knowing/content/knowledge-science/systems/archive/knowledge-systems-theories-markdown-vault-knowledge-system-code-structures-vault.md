---
type: definition
class: formal-model
status: settled
depends-on:
  - note.md
  - relation-graph.md
  - teaching/explanations/_index.md
realizes:
  - teaching/explanations/_index.md
see-also:
  - note.md
  - relation-graph.md
  - theories/predicated-markdown-vault-knowledge-system/_index.md
---

# Vault

A **vault** is the parent-level formal model of a markdown-vault knowledge system as a single coherent corpus.

## Definition

A vault $V = (T, N, R, \rho)$ consists of:

- $T$ — a finite directory tree (the file-system substrate).
- $N$ — a finite set of [notes](note.md), each note placed at exactly one node of $T$ whose path is the note's identity.
- $R$ — a finite set of *typed relations* (predicate names) the vault commits to: `depends-on`, `see-also`, `realizes`, `instantiates`, `defines`, and the `component-of` discipline edges.
- $\rho: N \times R \to \mathcal{P}(N \cup E)$ — the relation function: for each note $n$ and each relation type $r$, $\rho(n, r)$ is the set of notes (or external citations $E$) that $n$ relates to via $r$. The relation function is *derived* from the notes' frontmatter; it is not stored separately.

The pair $(N, \rho)$ induces a typed multi-graph called the vault's [relation graph](relation-graph.md).

## What the model commits to

1. **The directory tree carries meaning.** A note's location in $T$ is part of its identity. Moving a note changes its commitments. (See `directory-tree-carries-meaning` in the parent's concepts.)
2. **One file = one note.** The note set $N$ is in bijection with markdown files in $T$. A file is a note; a non-markdown asset is not.
3. **The frontmatter is the schema.** Each note's frontmatter declares its type and its relation edges. The vault's relation graph is derivable by reading every note's frontmatter; no separate metadata store is required.
4. **Plain-text first.** A vault is usable with no rendering pipeline beyond a text editor and `grep`. Rendered HTML, FARS-traversed graph, and any other downstream view are derived; the source is the markdown.
5. **Edges are stored on the child only.** Every typed-relation edge — including `see-also` — is declared exactly once, on the source note, pointing at its target. The vault model carries each editorial fact at exactly one storage site: the note whose author originated the edit-act. Symmetric reader-experience views (e.g., "notes that point at this one") are derived at read-time by inverse-edge traversal of the relation graph.

## Operations

A vault admits four basic operations:

- **Add a note.** Insert a new markdown file into $T$; the note set $N$ grows by one and the relation function $\rho$ extends per the new note's frontmatter.
- **Edit a note.** Modify a note's frontmatter or body; if frontmatter changes, $\rho$ updates accordingly.
- **Delete a note.** Remove a markdown file from $T$; $N$ shrinks by one and any incoming or outgoing edges in $\rho$ are removed (and become defects in the notes that pointed to it).
- **Relocate a note.** Move a markdown file within $T$; the note's identity changes; every incoming edge must be updated. (See [relation-graph-update](theories/predicated-markdown-vault-knowledge-system/morphisms/relation-graph-update.md) for the morphism formalising this.)

