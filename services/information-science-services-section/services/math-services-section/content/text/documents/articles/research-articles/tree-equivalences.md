---
type: theorem
status: proved
depends-on: [tree, graph, connectivity, acyclicity, cycle, path, vertex, edge]
lean:
  module: Mathlib.Combinatorics.SimpleGraph.Acyclic
  name: SimpleGraph.IsTree.existsUnique_path
title: Tree equivalences
description: "For a finite graph $G = (V, E)$ with $n = |V| \\geq 1$, the following four statements are equivalent:"
---

# Tree equivalences

For a finite [graph](../../../glossary/terms/graph.md) $G = (V, E)$ with $n = |V| \geq 1$, the following four statements are equivalent:

1. $G$ is connected and acyclic (the definition of a [tree](../../../glossary/terms/tree.md)).
2. $G$ is connected and $|E| = n - 1$.
3. $G$ is acyclic and $|E| = n - 1$.
4. Any two vertices of $G$ are joined by a *unique* [path](../../../glossary/terms/path.md).

## Proof

We show (1) $\Rightarrow$ (2) $\Rightarrow$ (3) $\Rightarrow$ (4) $\Rightarrow$ (1).

*(1) $\Rightarrow$ (2).* By induction on $n$. The base $n = 1$ has $|E| = 0$. For $n \geq 2$, a connected acyclic graph has a leaf (degree-1 vertex): pick any longest path $v_0 v_1 \ldots v_k$; its endpoints have no other neighbour off the path (else we extend the path or create a cycle), so $v_0$ has degree 1. Remove the leaf and its incident edge; the remainder is connected (the leaf is not a cut vertex) and acyclic, so by induction has $n - 2$ edges. Adding back the removed edge gives $|E| = n - 1$.

*(2) $\Rightarrow$ (3).* If $G$ contains a cycle $C$ on $k$ vertices, then $C$ uses $k$ edges and the remaining $n - k$ vertices need at least $n - k$ further edges to remain connected (each must attach), giving $|E| \geq n$, contradiction. So $G$ is acyclic.

*(3) $\Rightarrow$ (4).* If $G$ is acyclic and $|E| = n - 1$, then $G$ is connected (a forest with $c$ components on $n$ vertices has $n - c$ edges, so $n - c = n - 1$ forces $c = 1$). Connectivity gives at least one path between any two vertices; if two distinct paths $P_1, P_2$ existed between $u, v$, their symmetric difference would contain a cycle, contradicting acyclicity.

*(4) $\Rightarrow$ (1).* Unique paths trivially imply connectivity. If $G$ contained a cycle $v_0 v_1 \ldots v_k = v_0$, then between $v_0$ and $v_1$ both the direct edge and the long way around the cycle are paths, contradicting uniqueness. $\square$

## Corollary

A connected graph on $n$ vertices is a tree iff removing any edge disconnects it (every edge is a *bridge*). Equivalently: a tree on $n \geq 2$ vertices has at least two leaves.

## Remarks

The equivalence of these characterizations is what makes "tree" robust as a definition: every textbook picks a different starting axiom and recovers the rest. References: [Diestel 2017](../bibliographies/diestel2017.md) §1.5, [Bondy–Murty 2008](../bibliographies/bondy-murty2008.md) §4.1.

## Earlier material

For a finite [graph](../../../glossary/terms/graph.md) $G = (V, E)$ with $n = |V| \geq 1$, the following four statements are equivalent:

1. $G$ is connected and acyclic (the definition of a [tree](../../../glossary/terms/tree.md)).
2. $G$ is connected and $|E| = n - 1$.
3. $G$ is acyclic and $|E| = n - 1$.
4. Any two vertices of $G$ are joined by a *unique* [path](../../../glossary/terms/path.md).

The equivalence of these characterizations is what makes "tree" robust as a definition: every textbook picks a different starting axiom and recovers the rest. References: [Diestel 2017](../bibliographies/diestel2017.md) §1.5, [Bondy–Murty 2008](../bibliographies/bondy-murty2008.md) §4.1.
