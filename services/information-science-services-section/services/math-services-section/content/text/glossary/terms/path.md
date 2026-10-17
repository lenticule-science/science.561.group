---
term-kind: concept
class: graph-substructure
status: settled
depends-on:
  - _index.md
  - vertex.md
  - edge.md
see-also:
  - cycle.md
  - ../objects/graph.md
  - ../objects/tree.md
aliases:
  - Path
type: concept
---

# Path

A *path* is **a sequence of [vertices](vertex.md) $v_0, v_1, \ldots, v_k$ in a [graph](./graph.md) such that consecutive vertices are joined by an [edge](edge.md)**: $\{v_{i-1}, v_i\} \in E$ for each $i$. The number $k$ of edges is the *length* of the path.

A *simple path* is a path with no repeated vertices. A *walk* is the more permissive notion in which vertices and edges may repeat; a *trail* is a walk with no repeated edge but possibly repeated vertices. The textbook conventions vary: [Diestel 2017](../../documents/articles/bibliographies/diestel2017.md) reserves "path" for simple paths.

In a [directed graph](./directed-graph.md), a *directed path* requires every consecutive pair to be joined by an edge oriented forward: $(v_{i-1}, v_i) \in E$. The set of vertices reachable from $v_0$ by a directed path defines [reachability](reachability.md).

A path that returns to its starting vertex with $k \geq 1$ is a [cycle](cycle.md). A graph in which every two vertices are connected by a path is [connected](connectivity.md).

## Vocabulary distinctions

The literature is not fully unified on terminology; the corpus adopts the following:

- A **walk** is a vertex-edge alternating sequence with no constraints on repetition. (Some texts call this a "trail" if edges do not repeat.)
- A **trail** is a walk in which no edge is repeated.
- A **path** is a walk in which no vertex is repeated. (Hence no edge is repeated either; every path is a trail.)
- A **cycle** ([see](cycle.md)) is a walk that begins and ends at the same vertex with at least one edge, with appropriate non-repetition conditions.

For directed graphs, the analogous structures are *directed walks*, *directed trails*, *directed paths*, and *directed cycles*, with the requirement that edges follow the direction of the digraph.

## What paths give us

Paths are the substrate for several derived notions:

- **Connectedness.** A graph is *connected* iff every pair of vertices is joined by a path. For digraphs the analogue is *strong connectedness* (directed paths in both directions).
- **Distance.** The *distance* between two vertices is the length of the shortest path between them; the *diameter* is the maximum distance over all vertex pairs.
- **Reachability.** In a [directed graph](./directed-graph.md), $v$ is *reachable* from $u$ iff there is a directed path from $u$ to $v$. Reachability is a quasi-order on vertices.
- **Path-counting.** The number of walks of length $k$ between two vertices is the $(u, v)$-entry of the $k$-th power of the graph's adjacency matrix.
