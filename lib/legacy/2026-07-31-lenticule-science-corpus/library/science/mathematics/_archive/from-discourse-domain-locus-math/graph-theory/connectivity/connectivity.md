---
type: concept
class: graph-property
depends-on: [vertex, path]
---

# Connectivity

*Connectivity* is **the property that any two [vertices](vertex.md) of a [graph](../objects/graph.md) are joined by a [path](path.md)**. A graph is *connected* if every pair of vertices admits a path between them; otherwise it is *disconnected*, and decomposes uniquely into maximal connected *components*.

Refinements:

- A graph is *$k$-vertex-connected* if removing any fewer than $k$ vertices leaves it connected.
- A graph is *$k$-edge-connected* if removing any fewer than $k$ edges leaves it connected.
- In a [directed graph](../objects/directed-graph.md), *strong connectivity* requires a directed path in *both* directions between every pair; *weak connectivity* asks only that the underlying undirected graph be connected.

Connectivity is one of the three defining properties of a [tree](../objects/tree.md) (the other two being [acyclicity](acyclicity.md) and the edge-count $|E| = |V| - 1$ — see [tree-equivalences](../theorems/tree-equivalences.md)). It is the substrate of [reachability](reachability.md) in directed graphs and of network-robustness in applied settings.
