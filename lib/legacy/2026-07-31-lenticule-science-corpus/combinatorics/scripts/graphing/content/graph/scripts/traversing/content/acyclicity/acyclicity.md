---
type: concept
class: graph-property
depends-on: [cycle]
---

# Acyclicity

*Acyclicity* is **the property of a [graph](../objects/graph.md) that contains no [cycle](cycle.md)**. An acyclic [directed graph](../objects/directed-graph.md) is a [DAG](../objects/dag.md); an acyclic undirected graph is a [forest](../objects/forest.md), and a connected acyclic graph is a [tree](../objects/tree.md).

Acyclicity is what makes a directed graph admit a *topological sort* (see [dag-topological-sort](../theorems/dag-topological-sort.md)) and a `depends-on:` graph admit a sound topological reading order (see [dependency-soundness-iff-dag](../theorems/dependency-soundness-iff-dag.md)). It is the structural condition that lets the [reachability](reachability.md) relation be a strict [partial order](../../order/objects/partial-order.md) rather than a mere preorder: cycles introduce reachability-equivalences that collapse antisymmetry.

In an undirected graph, acyclicity together with [connectivity](connectivity.md) forces the edge-count $|E| = |V| - 1$ (for finite graphs) and yields the unique-path property — these equivalences are the content of [tree-equivalences](../theorems/tree-equivalences.md).
