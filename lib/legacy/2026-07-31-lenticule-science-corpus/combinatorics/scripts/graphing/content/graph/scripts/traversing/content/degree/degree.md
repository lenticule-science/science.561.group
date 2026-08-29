---
type: concept
class: graph-invariant
depends-on: [vertex, edge, incidence]
symbol: \deg(v)
---

# Degree

The *degree* of a [vertex](vertex.md) is **the number of [edges](edge.md) [incident](incidence.md) to it**. In an undirected [graph](../objects/graph.md), $\deg(v) = |\{e \in E : v \in e\}|$ — with self-loops counted twice, by convention, so that the [handshake identity](../theorems/handshake-lemma.md) $\sum_v \deg(v) = 2|E|$ holds without exceptions.

In a [directed graph](../objects/directed-graph.md), each vertex has an *in-degree* $\deg^-(v) = |\{e : t(e) = v\}|$ and an *out-degree* $\deg^+(v) = |\{e : s(e) = v\}|$, with $\deg^-(v) + \deg^+(v) = \deg(v)$ in the underlying graph (loops counted twice). The sum of in-degrees equals the sum of out-degrees equals $|E|$.

Vertices are classified by degree:

- *Isolated* — degree zero.
- *Leaf* — degree one (especially in a [tree](../objects/tree.md)).
- *Source* (in a digraph) — in-degree zero.
- *Sink* (in a digraph) — out-degree zero.

The [handshake lemma](../theorems/handshake-lemma.md) is the fundamental identity governing degrees; the [Eulerian-circuit criterion](../theorems/eulerian-circuit-criterion.md) characterizes Eulerian circuits in terms of every degree being even.
