---
type: theorem
status: sketch
depends-on: [planar-graph, graph, subgraph, complete-graph, bipartite-graph]
---

# Kuratowski's theorem

A finite [graph](../../../glossary/terms/graph.md) is [planar](../../../glossary/terms/planar-graph.md) if and only if it contains no [subgraph](../../../glossary/terms/subgraph.md) that is a *subdivision* of $K_5$ (the [complete graph](../../../glossary/terms/complete-graph.md) on five vertices) or $K_{3,3}$ (the complete [bipartite](../../../glossary/terms/bipartite-graph.md) graph on $3+3$ vertices).

A *subdivision* of a graph $H$ is the graph obtained by replacing each edge of $H$ with a path (of any length); the original vertices of $H$ remain, and new degree-2 vertices are inserted along the paths.

## Status: sketch (proof deferred to citation)

The original proof is [Kuratowski 1930](../bibliographies/kuratowski1930.md). The theorem is also stated equivalently in terms of *minors* (Wagner's reformulation, 1937): a graph is planar iff it contains no $K_5$ or $K_{3,3}$ as a *minor* (a graph obtained by edge-contraction and subgraph-taking — see [quotient-graph](../../../glossary/terms/quotient-graph.md)). Both forms are standard.

## Sketch of structure

The *necessity* direction is the easy half: $K_5$ and $K_{3,3}$ are not planar. For $K_5$: by Euler's formula a simple planar graph on $V \geq 3$ vertices satisfies $E \leq 3V - 6$; $K_5$ has $V = 5, E = 10$, but $3 \cdot 5 - 6 = 9$, so $K_5$ is not planar. For $K_{3,3}$: a simple bipartite planar graph with $V \geq 3$ satisfies $E \leq 2V - 4$; $K_{3,3}$ has $V = 6, E = 9$, but $2 \cdot 6 - 4 = 8$. Subdivisions inherit non-planarity, and any graph containing a non-planar subgraph is non-planar.

The *sufficiency* direction is the deep half: given a graph with no $K_5$- or $K_{3,3}$-subdivision, construct a planar embedding. Kuratowski's argument uses the structural decomposition of 3-connected graphs; modern proofs (e.g. via [Diestel 2017](../bibliographies/diestel2017.md) §4.4) typically proceed via the Tutte path-decomposition.

## Why this matters

Kuratowski's theorem is the prototype of a *forbidden-substructure characterization*: a graph property is captured by ruling out a finite list of obstructions. The Robertson–Seymour graph-minors theorem (a vast generalization) establishes that *every* minor-closed graph property has such a finite obstruction set — see [Robertson–Sanders–Seymour–Thomas 1997](../bibliographies/robertson-sanders-seymour-thomas1997.md) for the lineage. Kuratowski's theorem is the founding example of this entire research program.
