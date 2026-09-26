---
term-kind: definition
class: combinatorial-structure
depends-on: [simple-graph, graph, edge]
realizes: [edge, adjacency]
symbol: K_n
aliases:
  - Complete graph
type: definition
---

# Complete graph

The **complete graph** on $n$ vertices, denoted $K_n$, is the [simple graph](simple-graph.md) in which every pair of distinct vertices is adjacent. It has $|V| = n$ and $|E| = \binom{n}{2}$.

## Structure

- $V = \{1, 2, \ldots, n\}$ (or any $n$-element set).
- $E = \binom{V}{2}$ — every two-element subset is an edge.
- Every vertex has [degree](./degree.md) $n - 1$.
- $K_n$ is vertex-transitive and edge-transitive.

## Position

$K_n$ is the *maximum* simple graph on $n$ vertices: any simple graph on $n$ vertices is a [subgraph](subgraph.md) of $K_n$. The first non-planar complete graph is $K_5$; this is one half of [Kuratowski's planarity theorem](../../documents/articles/research-articles/kuratowski.md). The complete bipartite graph $K_{3,3}$ is the other half. The [Petersen graph](../../documents/articles/teaching-articles/examples/petersen-graph.md) is *not* $K_n$ for any $n$ — it is a famous non-trivial graph distinct from the complete family. Reference: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) §1.1, [Bondy–Murty 2008](../../documents/articles/bibliographies/bondy-murty2008.md) §1.1.
