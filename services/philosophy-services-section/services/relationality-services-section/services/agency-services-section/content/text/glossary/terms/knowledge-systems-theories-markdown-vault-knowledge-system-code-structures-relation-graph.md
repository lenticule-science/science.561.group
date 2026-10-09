---
type: definition
class: formal-model
status: settled
depends-on:
  - vault.md
  - note.md
  - teaching/explanations/_index.md
see-also:
  - theories/predicated-markdown-vault-knowledge-system/objects/predication-graph.md
name: Relation graph
description: The relation graph of a vault is the typed multi-graph whose nodes are the vault's notes and whose edges are the typed relations declared in their frontmatter.
---


The **relation graph** of a [vault](../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/markdown-services-section/content/text/glossary/terms/vault.md) is the typed multi-graph whose nodes are the vault's [notes](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note.md) and whose edges are the typed relations declared in their frontmatter.

## Definition

Given a vault $V = (T, N, R, \rho)$, its **relation graph** is the typed multi-graph $G_V = (N, E, \tau)$ where:

- $N$ is the vault's set of notes (the vertices of $G_V$).
- $E \subseteq N \times R \times (N \cup \mathcal{C})$ is the set of edges: each edge $(n, r, m)$ records that note $n$ declares a relation of type $r$ to note $m$ (or to an external citation $c \in \mathcal{C}$).
- $\tau: E \to R$ is the edge-typing function, $\tau(n, r, m) = r$.

The relation graph is *derived* from the notes' frontmatter; it is not stored. Reading every note's `depends-on:`, `see-also:`, `realizes:`, `instantiates:`, `defines:`, etc. constructs $G_V$ in linear time.

## What the model commits to

1. **Edges are typed.** $G_V$ is a typed multi-graph, not a plain graph. The edge $(n, \mathtt{depends-on}, m)$ commits to something different from $(n, \mathtt{see-also}, m)$; conflating them is a category error.
2. **Edges are stored on the child only.** Each typed-relation edge is declared exactly once, on the source note ("the child"), pointing at its target ("the parent"). The child carries the local editorial knowledge of which other notes its own reader benefits from also reading; that knowledge is the edit-act the discipline records. The target's reader-experience symmetric view is recovered at read-time by inverse-edge traversal of the relation graph.
3. **Multi-edges are admitted but discouraged.** Two notes may be connected by edges of different types ($n$ may both `depend-on` and `see-also` $m$), but this is usually a sign that the discipline can be tightened — `see-also` should subsume `depends-on` when both hold, since a note that depends on another already sees it.
4. **External citations are first-class targets.** An edge whose target is an external citation $c \in \mathcal{C}$ rather than a vault note is admitted; this is how the discipline carries upstream-literature load.

## Discipline-level invariants

The relation graph is required (as a discipline commitment, not as a model-level constraint) to satisfy:

- **Acyclicity modulo `see-also`.** The subgraph induced by `depends-on`, `realizes`, `instantiates`, `defines` is a DAG. Cycles in these edge types are defects. (See [frontmatter-relation-graph-acyclic-modulo-see-also](../concepts/frontmatter-relation-graph-acyclic-modulo-see-also.md).)
- **`see-also` is child-side only.** A `see-also: m` declaration on $n$ records exactly one editorial fact: *the reader of $n$ benefits from also reading $m$*. The reader-of-$m$ side is a separate editorial question, answered by $m$'s own author through $m$'s own outbound edges. The reader of $m$ sees "notes that point at this one" as a renderer-derived view computed by inverse-edge traversal of the relation graph at read-time.
- **Edge resolution.** Every edge whose target is a vault path resolves to an actual file. Broken-link edges are defects.
- **Type-edge well-typedness.** Some edge types are restricted to certain note-type pairs: `realizes` runs from `definition` to `concept`; `instantiates` runs from `example` to one of {`definition`, `morphism`, `theorem`, `concept`}; `defines` runs from `concept` to one or more `definition`s. Cross-type violations are defects.

