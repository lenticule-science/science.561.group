---
type: definition
class: substrate-realization
status: settled
depends-on:
  - typed-note-as-predication-cell.md
  - teaching/explanations/frontmatter-relation.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md
realizes:
  - teaching/explanations/frontmatter-relation.md
see-also:
  - ../theorems/relation-graph-topo-sortable-under-depends-on.md
  - ../theorems/typed-kinds-mutually-exclusive.md
title: Relation graph
description: The relation graph of a vault is the directed labeled multigraph whose vertices are typed notes and whose edges are frontmatter-relations.
---

# Relation graph

The **relation graph** of a vault is the directed labeled multigraph whose vertices are typed [notes](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/note.md) and whose edges are [frontmatter-relations](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/frontmatter-relation.md). It is the substrate's [predication-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) at the markdown-vault layer, restricted to the established frontmatter-relation predicate vocabulary.

## Definition

Let $V$ be the set of typed notes (see [typed-note-as-predication-cell](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/typed-note-as-predication-cell.md)). The relation graph is

$$G = (V, E)$$

where $E \subseteq V \times P \times V$ and $P$ is the established predicate vocabulary $\{\mathit{depends\text{-}on}, \mathit{realizes}, \mathit{instantiates}, \mathit{see\text{-}also}, \mathit{introduces}, \mathit{recaps}, \mathit{discusses}, \mathit{explores}, \mathit{closes}, \mathit{chapters}\}$. Each edge $(n, p, n') \in E$ corresponds to a frontmatter-key $p$ on $n$ with target slug resolving to $n'$.

The graph is *labeled* by predicate, *directed* (every edge — including `see-also:` — is stored exactly once on the source note, with symmetric reader-experience views derived by inverse-edge traversal at read-time), and *typed* (the typing rules on edge endpoints, see [frontmatter-relation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/frontmatter-relation.md), are graph-level constraints).

## Substrate-level structural facts

Three load-bearing structural facts hold of the relation graph and underwrite the discipline:

1. **The `depends-on` subgraph is acyclic.** See [relation-graph-topo-sortable-under-depends-on](../concepts/relation-graph-topo-sortable-under-depends-on.md). The renderer's reading-order is the topological sort.
2. **Edge-typing partitions the predicate vocabulary.** Each predicate in $P$ has a fixed source-type-set and target-type-set; the partition is the discipline's typing rule. A `realizes:` edge $(n, \mathit{realizes}, n')$ is well-formed iff $\tau(n) \in \{\mathrm{object}, \mathrm{morphism}\}$ and $\tau(n') = \mathrm{concept}$.
3. **Slugs identify, paths address.** Two notes with the same slug in different directories are different vertices; the substrate's lookup tools distinguish them by path. Cross-directory same-slug pairs the discipline wishes to identify must be merged or `aliases:`-linked.

## Operations on the graph

The corpus's tooling performs five fundamental operations on the relation graph:

- **Resolve.** Given an edge `(n, p, "<slug>")`, find the target vertex $n'$ by slug lookup (within-directory first, then by `<corpus root>/...` prefix, then by global slug index). Failures are dangling edges.
- **Walk.** Given a starting vertex $n$ and a predicate set $P' \subseteq P$, enumerate the vertices reachable along $P'$-edges (the `fars context` operation).
- **Topological-sort.** Given the `depends-on` subgraph, produce a linear order respecting it. Cycles are validation defects.
- **Validate.** For each edge, check that the source and target types satisfy the predicate's typing rule; report defects.
- **Derive inverse views.** For each vertex $n'$ and predicate $p$, compute $\{n : (n, p, n') \in E\}$ — the set of notes that point at $n'$ via $p$ — by inverse-edge traversal. The renderer uses this to present $n'$'s reader with "notes that point at this one" beneath a `see-also:` heading (or the analogous derived view for any other predicate). Each edge lives at exactly one storage site (the source note); the inverse view is recomputed on demand.

