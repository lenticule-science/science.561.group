---
type: theorem
status: proved
depends-on: [graph, connectivity, degree, cycle, traversal, handshake-lemma]
lean:
  module: Mathlib.Combinatorics.SimpleGraph.Trails
  name: SimpleGraph.IsEulerian.even_degree
  note: "Necessity direction is in mathlib as IsEulerian.even_degree; the sufficiency direction (the Hierholzer-style construction) is partially developed in mathlib but the full iff is not yet a single named theorem."
---

# Eulerian-circuit criterion

A finite connected [graph](../../../glossary/terms/graph.md) $G = (V, E)$ admits an *Eulerian circuit* — a closed walk that uses every edge exactly once — if and only if every vertex has even [degree](../../../glossary/terms/degree.md).

## Proof

(*Necessity.*) Suppose $G$ has an Eulerian circuit $C$. For each vertex $v$, every visit by $C$ enters along one edge and leaves along another, so the visits to $v$ pair up its incident edges. Since every edge is used exactly once, the pairing is total, so $\deg(v)$ is even.

(*Sufficiency.*) Suppose every vertex has even degree. We build an Eulerian circuit by induction on $|E|$. Starting from any vertex $v_0$, walk along edges arbitrarily, never repeating an edge. At any intermediate vertex $v \neq v_0$, the walk has so far entered $v$ one more time than it has left, so an odd number of incident edges have been used; since $\deg(v)$ is even, an unused incident edge remains and the walk can continue. The walk therefore terminates only when it returns to $v_0$ with no unused edges incident there — yielding a closed trail $T$.

If $T$ uses every edge, we are done. Otherwise some vertex $w$ on $T$ is incident to an unused edge. The subgraph of unused edges still has every vertex of even degree (by the same parity argument applied to $G$ minus $T$'s edges) and $w$ lies in a connected component of it. By induction (or by repeating the construction starting at $w$), there is a closed trail $T'$ in the unused-edge subgraph through $w$. Splice $T'$ into $T$ at $w$. Repeat until all edges are used. $\square$

## Corollary

A finite connected graph has an *Eulerian trail* (open walk using every edge exactly once) iff exactly two vertices have odd degree. The trail starts at one of them and ends at the other.

## Remarks

Euler's 1736 analysis of the [seven bridges of Königsberg](../teaching-articles/examples/seven-bridges-of-konigsberg.md) is exactly the necessity direction of this theorem applied to the Königsberg multigraph: all four landmasses had odd degree, so no Eulerian circuit exists. This is the founding result of graph theory; see [Euler 1736](../bibliographies/euler1736.md).
