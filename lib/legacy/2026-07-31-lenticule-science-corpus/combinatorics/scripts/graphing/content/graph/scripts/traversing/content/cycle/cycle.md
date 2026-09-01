---
type: concept
class: graph-substructure
status: settled
depends-on:
  - _index.md
  - vertex.md
  - edge.md
  - path.md
see-also:
  - path.md
  - ../objects/dag.md
  - ../objects/tree.md
---

# Cycle

A **cycle** in a [graph](../objects/graph.md) is a closed walk: a sequence of [vertices](vertex.md) $v_0, v_1, \ldots, v_k = v_0$ in which consecutive vertices are connected by [edges](edge.md), the start and end vertex coincide, and (for a *simple cycle*) no other vertex is repeated and no edge is repeated. The cycle's *length* is $k$. The shortest cycle in a graph is its *girth*; a graph with no cycles is *acyclic*.

A *cycle* is **a [path](path.md) that returns to its starting [vertex](vertex.md)** — a sequence $v_0, v_1, \ldots, v_k = v_0$ with $k \geq 1$ in which consecutive vertices are joined by an [edge](edge.md). A *simple cycle* visits each intermediate vertex at most once; the textbook convention generally means "simple cycle" by "cycle".

In a [directed graph](../objects/directed-graph.md), a *directed cycle* requires every consecutive edge to be oriented forward. A digraph with no directed cycle is a [DAG](../objects/dag.md); the property of having no directed cycle is [acyclicity](acyclicity.md).

The shortest cycle length in a graph is the *girth*; a graph with no cycle at all has *infinite girth* and is a [forest](../objects/forest.md). [Bipartite graphs](../objects/bipartite-graph.md) are exactly the graphs with no odd-length cycle (see [bipartite-iff-no-odd-cycle](../theorems/bipartite-iff-no-odd-cycle.md)). Eulerian circuits — cycles that traverse every edge exactly once — are characterized by [eulerian-circuit-criterion](../theorems/eulerian-circuit-criterion.md).

## Cycles vs closed walks vs Eulerian / Hamiltonian circuits

- A **closed walk** is any walk that begins and ends at the same vertex.
- A **circuit** is a closed walk in which no edge is repeated. (Some authors use *circuit* and *cycle* interchangeably; the corpus follows the convention that *cycle* additionally forbids vertex repetition except at the endpoints.)
- A **simple cycle** (the corpus's default sense of "cycle") is a circuit in which no vertex is repeated except the start/end.
- An **Eulerian circuit** is a circuit traversing every edge of the graph exactly once. Its existence is characterised by Euler's theorem: an undirected connected graph admits an Eulerian circuit iff every vertex has even degree.
- A **Hamiltonian cycle** is a simple cycle visiting every vertex exactly once. Its existence is in general NP-hard to decide.

For [directed graphs](../objects/directed-graph.md), the analogues are *directed cycles*, *directed Eulerian circuits*, and *directed Hamiltonian cycles*, with the requirement that edges follow the digraph's direction.

## Acyclic graphs

A graph with no cycles is *acyclic*. Acyclic structures are central to several graph kinds:

- A [tree](../objects/tree.md) is a connected acyclic undirected graph.
- A [DAG](../objects/dag.md) (directed acyclic graph) is a directed graph with no directed cycles. DAGs admit a *topological order* on their vertices, in which every edge runs from an earlier vertex to a later one.
- A *forest* is an acyclic undirected graph (a disjoint union of trees).
