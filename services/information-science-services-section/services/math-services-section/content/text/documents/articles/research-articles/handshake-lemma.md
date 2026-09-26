---
type: theorem
class: structural
status: proved
depends-on: [graph, vertex, edge, degree, incidence]
lean:
  module: Mathlib.Combinatorics.SimpleGraph.DegreeSum
  name: SimpleGraph.sum_degrees_eq_twice_card_edges
title: Handshake lemma
description: "In any finite graph $G = (V, E)$, the sum of degrees equals twice the number of edges:"
---

# Handshake lemma

In any finite [graph](../../../glossary/terms/graph.md) $G = (V, E)$, the sum of [degrees](../../../glossary/terms/degree.md) equals twice the number of [edges](../../../glossary/terms/edge.md):

$$\sum_{v \in V} \deg(v) = 2|E|.$$

Equivalently, the number of vertices of *odd* degree is even.

## Statement

For any finite undirected [graph](../../../glossary/terms/graph.md) $G = (V, E)$,

$$\sum_{v \in V} \deg(v) = 2 |E|$$

where $\deg(v)$ is the degree of vertex $v$ — the number of edges incident to $v$, with self-loops counted twice. Consequently, the number of vertices of odd degree in any finite graph is even.

## Proof

Each edge $e = \{u, v\} \in E$ contributes exactly $2$ to the sum $\sum_{v \in V} \deg(v)$: it contributes $1$ to $\deg(u)$ and $1$ to $\deg(v)$. (A self-loop $\{v, v\}$ contributes $2$ to $\deg(v)$, which is the convention that makes the lemma uniform.) Summing over all edges,

$$\sum_{v \in V} \deg(v) = \sum_{e \in E} 2 = 2|E|. \qquad \square$$

The corollary — that the number of odd-degree vertices is even — follows by parity: the left side of the identity is even (it is $2|E|$), so the sum of degrees is even, so the number of odd-degree summands must be even.

## Discussion

The lemma earns its informal name from the social-science thought experiment: at any party, the total number of handshakes counted from each person's perspective is twice the actual number of handshakes (each handshake involves two people). The number of people who have shaken an odd number of hands must therefore be even.

Despite its triviality, the handshake lemma is load-bearing in graph theory:

- It is the elementary tool for showing certain graphs cannot exist (e.g., a graph with three vertices of degree $5$ and four vertices of degree $4$ has odd degree sum, so no such graph exists).
- It is the first step in the proof of Euler's theorem on Eulerian circuits: an Eulerian-circuit-admitting graph has every vertex of even degree, which (with the handshake lemma) constrains how many edges and vertices can have what degrees.
- It is the bookkeeping identity behind several proofs about [trees](../../../glossary/terms/tree.md): a tree with $n$ vertices has $n - 1$ edges, so the sum of degrees is $2(n - 1)$.

## Historical note

The lemma is implicit in Euler's 1736 paper on the Königsberg bridges (he uses it to show every vertex of an Eulerian-circuit-admitting graph has even degree). The explicit "handshake" statement is much later and informal; it appears as exercises in 20th-century graph-theory texts as a paradigm example of double counting.

## Generalisations

For [directed graphs](../../../glossary/terms/directed-graph.md), the analogue is

$$\sum_{v \in V} \mathrm{indeg}(v) = \sum_{v \in V} \mathrm{outdeg}(v) = |E|,$$

since each directed edge contributes $1$ to one in-degree and $1$ to one out-degree. The "odd-degree vertices are even in number" corollary has no direct directed analogue (in-degree and out-degree need not match at any single vertex), but the parallel statement *does* hold for the *underlying* undirected graph of any digraph.

## Remarks

The handshake lemma is the simplest non-trivial fact of graph theory and the prototype of all *double-counting* arguments. Its directed analogue is $\sum_v \deg^+(v) = \sum_v \deg^-(v) = |E|$, since each directed edge contributes $1$ to one out-degree and $1$ to one in-degree. The handshake lemma is what licenses the [Eulerian-circuit criterion](eulerian-circuit-criterion.md): an Eulerian circuit forces every vertex to have even degree.
