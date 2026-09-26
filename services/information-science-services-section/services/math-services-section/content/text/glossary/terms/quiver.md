---
term-kind: definition
class: combinatorial-structure
depends-on: [directed-graph, vertex, edge]
realizes: [vertex, edge]
symbol: Q
aliases:
  - Quiver
type: definition
---

# Quiver

A **quiver** is a directed multigraph: a quadruple $Q = (V, E, s, t)$ where $V$ is a vertex set, $E$ is an edge set, and $s, t : E \to V$ are *source* and *target* maps. Multiple edges with the same source and target are permitted, as are loops $s(e) = t(e)$. The pair-of-functions presentation makes the quiver the *most basic categorical structure*: a quiver is exactly a presheaf on the two-object indexing category $\bullet \rightrightarrows \bullet$.

## Structure

- **Vertex set** $V$ (also called *nodes* or *0-cells*).
- **Edge set** $E$ (also called *arrows* or *1-cells*).
- **Source** $s : E \to V$ and **target** $t : E \to V$.

## What this is not

A quiver is *not* a [category](./category.md) — it has no composition and no identities. A category is a quiver *equipped with* an associative composition operation and an identity arrow at every vertex.

## Position

Quivers are the term used in representation theory and category theory for what graph theorists call a *directed multigraph*: same structure, different vocabulary fixed by different downstream uses. The categorical use is that a quiver is the underlying combinatorial datum from which a free category, a path algebra, or a representation of a quiver (a functor $Q \to \mathbf{Vect}$) is built. Whether the corpus should treat quiver and [directed-graph](directed-graph.md) as one note or two — terminological choice vs. structural distinction — is the subject of [questions/quiver-vs-digraph](../../documents/articles/research-articles/questions/quiver-vs-digraph.md). References: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) §1.10, [Bondy–Murty 2008](../../documents/articles/bibliographies/bondy-murty2008.md) §2; the categorical use traces to the Bourbaki/MacLane lineage rather than the classical graph-theory texts.
