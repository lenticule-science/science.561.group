---
type: term
term-kind: definition
class: combinatorial-structure
depends-on: [graph, vertex, edge]
realizes: [vertex, edge]
---

# Subgraph

A **subgraph** of a [graph](graph.md) $G = (V, E)$ is a graph $H = (V', E')$ with $V' \subseteq V$ and $E' \subseteq E$ such that every edge in $E'$ has both endpoints in $V'$. We write $H \subseteq G$.

## Structure

Refinements of the subgraph relation:

- **Spanning subgraph** — $V' = V$; the subgraph uses all vertices.
- **Induced subgraph** — $E' = \{e \in E : \text{both endpoints of } e \text{ are in } V'\}$; the subgraph uses *every* edge that lies entirely within $V'$.
- **Edge-induced subgraph** of $E'' \subseteq E$ — $V' = \bigcup_{e \in E''} \text{endpoints}(e)$, $E' = E''$.

The inclusion $H \subseteq G$ is itself a [graph homomorphism](./graph-homomorphism.md), namely the [subgraph inclusion morphism](./subgraph-inclusion.md).

## Position

Subgraphs are how graph theory talks about *parts* of a graph. Spanning subgraphs are the substrate of spanning-tree problems; induced subgraphs are central to extremal graph theory and to the Kuratowski/planarity characterizations (a graph is planar iff it has no [Kuratowski subgraph](../../documents/articles/research-articles/kuratowski.md) — meaning no subgraph that is a subdivision of $K_5$ or $K_{3,3}$). Reference: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) §1.1.
