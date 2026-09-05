---
term-kind: concept
class: graph-property
depends-on: [cycle]
---

# Acyclicity

*Acyclicity* is **the property of a [graph](./graph.md) that contains no [cycle](cycle.md)**. An acyclic [directed graph](./directed-graph.md) is a [DAG](./dag.md); an acyclic undirected graph is a [forest](./forest.md), and a connected acyclic graph is a [tree](./tree.md).

Acyclicity is what makes a directed graph admit a *topological sort* (see [dag-topological-sort](../../documents/articles/research-articles/dag-topological-sort.md)) and a `depends-on:` graph admit a sound topological reading order (see [dependency-soundness-iff-dag](../../documents/articles/research-articles/dependency-soundness-iff-dag.md)). It is the structural condition that lets the [reachability](reachability.md) relation be a strict [partial order](./partial-order.md) rather than a mere preorder: cycles introduce reachability-equivalences that collapse antisymmetry.

In an undirected graph, acyclicity together with [connectivity](connectivity.md) forces the edge-count $|E| = |V| - 1$ (for finite graphs) and yields the unique-path property — these equivalences are the content of [tree-equivalences](../../documents/articles/research-articles/tree-equivalences.md).
