---
type: definition
class: combinatorial-structure
depends-on: [graph, tree, acyclicity, connectivity]
realizes: [acyclicity]
---

# Forest

A **forest** is an acyclic [graph](graph.md). Equivalently, a forest is a disjoint union of [trees](tree.md): each connected component of a forest is itself a tree. A forest with $k$ connected components on $n$ vertices has exactly $n - k$ edges.

## Structure

- **Vertex set** $V$.
- **Edge set** $E$ containing no [cycle](teaching/explanations/cycle.md).
- **Components** $T_1, \ldots, T_k$, each a tree.

## Position

Forests are what trees become when connectivity is dropped: the acyclic graphs *en bloc*. Spanning forests of an arbitrary graph are produced by greedy edge-selection algorithms (Kruskal, Prim restricted to components). A forest is the unique kind of graph that is both acyclic and minimal among graphs realizing its component structure. Reference: [Diestel 2017](references/diestel2017.md) §1.5.
