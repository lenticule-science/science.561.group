---
type: theorem
status: proved
depends-on: [bipartite-graph, graph, bipartition, cycle, connectivity, path]
lean:
  module: Mathlib.Combinatorics.SimpleGraph.Bipartite
  name: SimpleGraph.isBipartite_iff_noOddCycle
  note: "Mathlib has the equivalence under SimpleGraph.Coloring 2 ↔ no odd cycle; the exact lemma name varies across mathlib revisions."
title: Bipartite iff no odd cycle
description: A graph $G = (V, E)$ is bipartite if and only if it contains no cycle of odd length.
---

# Bipartite iff no odd cycle

A [graph](../../../glossary/terms/graph.md) $G = (V, E)$ is [bipartite](../../../glossary/terms/bipartite-graph.md) if and only if it contains no [cycle](../../../glossary/terms/cycle.md) of odd length.

## Proof

(*Necessity.*) Suppose $G$ is bipartite with [bipartition](../../../glossary/terms/bipartition.md) $V = A \sqcup B$. Any cycle $v_0 v_1 \ldots v_k = v_0$ alternates classes at each step (each edge goes between $A$ and $B$). Since the cycle returns to $v_0$, the number of class-switches $k$ must be even.

(*Sufficiency.*) Suppose $G$ has no odd cycle. We construct a bipartition. WLOG $G$ is connected (else bipartition each component). Pick a vertex $v_0$ and define $A = \{v : d(v_0, v) \text{ is even}\}$, $B = \{v : d(v_0, v) \text{ is odd}\}$, where $d$ is the [path](../../../glossary/terms/path.md) distance. Then $V = A \sqcup B$.

Suppose for contradiction that some edge $\{u, v\}$ has both endpoints in the same class — say both in $A$. Let $P_u$ be a shortest path from $v_0$ to $u$ (length $d(v_0, u)$, even), $P_v$ a shortest path from $v_0$ to $v$ (length $d(v_0, v)$, even), and consider the closed walk $P_u \cdot \{u, v\} \cdot P_v^{\text{rev}}$. Its length is $d(v_0, u) + 1 + d(v_0, v) = $ even $+ 1 + $ even $=$ odd. This closed walk decomposes into edge-disjoint cycles (the standard cycle-decomposition of a closed walk), at least one of which must have odd length (their lengths sum to the odd walk length). This contradicts the no-odd-cycle hypothesis. The case both in $B$ is identical. So every edge crosses the partition, and $(A, B)$ is a bipartition. $\square$

## Corollary

A graph is 2-colourable iff it is bipartite iff it has no odd cycle. So "2-colourability", "bipartiteness", and "no odd cycle" are three names for the same property — and 2-colourability of a graph can be checked in linear time by attempting the BFS-based bipartition construction in the proof.

## Remarks

This is the canonical example of a graph property characterized by a *forbidden substructure* — the entire research program of forbidden-subgraph and forbidden-minor characterizations (Kuratowski, Robertson–Seymour) traces its lineage to this kind of statement. References: [Diestel 2017](../bibliographies/diestel2017.md) §1.6, [Bondy–Murty 2008](../bibliographies/bondy-murty2008.md) §4.2.
