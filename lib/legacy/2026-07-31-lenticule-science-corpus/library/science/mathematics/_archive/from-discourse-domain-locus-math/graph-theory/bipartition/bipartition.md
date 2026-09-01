---
type: concept
class: graph-structure
depends-on: [vertex, edge]
---

# Bipartition

A *bipartition* of a [graph](../objects/graph.md) is **a partition of the [vertex](vertex.md) set $V = A \sqcup B$ into two classes such that every [edge](edge.md) goes between the classes** — no edge has both endpoints in $A$ or both in $B$. A graph that admits a bipartition is a [bipartite graph](../objects/bipartite-graph.md); the bipartition itself is the witness of bipartiteness.

A bipartition exists iff the graph contains no odd-length [cycle](cycle.md), by [bipartite-iff-no-odd-cycle](../theorems/bipartite-iff-no-odd-cycle.md). When it exists, a bipartition of a connected bipartite graph is unique up to swapping the two classes.

Bipartitions generalize to $k$-partitions and to graph colourings: a proper *$k$-colouring* of $G$ is a partition $V = V_1 \sqcup \cdots \sqcup V_k$ such that every edge has endpoints in different classes — a bipartition is a proper 2-colouring. The [four-colour theorem](../theorems/four-colour.md) is the canonical $k$-colouring result for [planar graphs](../objects/planar-graph.md).
