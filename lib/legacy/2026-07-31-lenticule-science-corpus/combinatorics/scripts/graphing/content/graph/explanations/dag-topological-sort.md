---
type: theorem
status: proved
depends-on: [dag, directed-graph, acyclicity, cycle, topological-sort, reachability]
lean:
  module: Mathlib.Combinatorics.Quiver.Path
  name: "(corpus-side, deferred)"
  note: "Mathlib has Quiver.Path machinery and finite-DAG vertex enumeration but does not carry the topological-sort existence theorem as a single named result. A corpus-side Lean module would assemble it from Quiver.Path acyclicity and Finset induction; this is part of the open lean-binding work."
---

# DAG topological sort existence

A finite [directed graph](../objects/directed-graph.md) $D = (V, E)$ admits a [topological sort](../morphisms/topological-sort.md) if and only if it is a [DAG](../objects/dag.md) (contains no directed [cycle](teaching/explanations/cycle.md)).

## Proof

(*Necessity.*) Suppose $D$ admits a topological sort $v_1 < v_2 < \cdots < v_n$. If $D$ contained a directed cycle $w_0 \to w_1 \to \cdots \to w_k = w_0$, then by the topological-sort condition each edge would force the source's index strictly below the target's, giving $\mathrm{idx}(w_0) < \mathrm{idx}(w_1) < \cdots < \mathrm{idx}(w_k) = \mathrm{idx}(w_0)$, contradiction.

(*Sufficiency.*) Suppose $D$ is a DAG. We show $D$ has a vertex of in-degree zero: take any vertex $v_0$ and walk backward along incoming edges, $v_0 \leftarrow v_{-1} \leftarrow v_{-2} \leftarrow \cdots$. The walk cannot repeat a vertex (else we would have a directed cycle in $D$, contradicting DAG-ness) and the vertex set is finite, so the walk terminates at a vertex $v_{-k}$ with no incoming edges. Place $v_{-k}$ first in the output, remove it (and its outgoing edges) from $D$. The remaining digraph is still a DAG (removing edges preserves acyclicity). Repeat. The process terminates after $n$ steps with a topological sort. $\square$

## Corollary

The construction in the sufficiency proof is *Kahn's algorithm*. Its output is a valid topological sort, and it runs in $O(|V| + |E|)$ time. The corollary also gives a *witness* of non-acyclicity when the algorithm fails: if the algorithm halts with vertices remaining and no source available, the remaining subgraph contains a directed cycle, which can be located by following any outgoing edge until a vertex repeats.

## Remarks

This theorem is the load-bearing fact behind every dependency-resolution system that uses a `depends-on:` relation. The corpus's `depends-on:` graph is required to be a DAG so that the renderer can topologically sort the corpus into a sound reading order; the [dependency-soundness-iff-dag](dependency-soundness-iff-dag.md) theorem makes this requirement explicit at the corpus level. Reference: [Bondy–Murty 2008](references/bondy-murty2008.md) §2.1.
