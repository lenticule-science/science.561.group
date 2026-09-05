---
type: example
status: verified
instantiates: [simple-graph, complete-graph, graph-isomorphism]
depends-on: [simple-graph, graph, vertex, edge, adjacency, complete-graph]
---

# Petersen graph

The Petersen graph is the canonical small non-trivial graph: a 3-regular [simple graph](../objects/simple-graph.md) on 10 vertices, vertex-transitive and edge-transitive, with girth 5 and diameter 2. It serves as a standard counterexample to many plausible-but-false conjectures and as a concrete instantiation of "interesting graph that is not [$K_n$](../objects/complete-graph.md) and not bipartite".

## Step 1: Two equivalent constructions

**Outer-and-inner pentagon.** Vertices: $\{u_0, u_1, u_2, u_3, u_4, v_0, v_1, v_2, v_3, v_4\}$. Outer 5-cycle: $u_0 u_1 u_2 u_3 u_4 u_0$. Inner pentagram: $v_0 v_2 v_4 v_1 v_3 v_0$ (every second vertex). Spokes: $u_i v_i$ for $i \in \{0, 1, 2, 3, 4\}$.

**Kneser construction.** Vertices: the 10 two-element subsets of $\{1, 2, 3, 4, 5\}$. Edges: $\{S, T\}$ when $S \cap T = \emptyset$ (the two subsets are disjoint).

## Step 2: Verify the constructions are isomorphic

Map the Kneser vertex $\{i, j\}$ to the outer vertex $u_{i-1}$ if $j = i + 1 \pmod 5$ (with $i$ taken mod 5 in $\{1, \ldots, 5\}$), or to the inner vertex $v_{i-1}$ otherwise — modulo a suitable bijection. Verify that disjoint pairs in the Kneser version map to adjacent vertices in the pentagram version. The resulting [graph isomorphism](../morphisms/graph-isomorphism.md) is one of many; the Petersen graph has a large automorphism group ($S_5$, of order 120).

## Step 3: Compute structural invariants

| Invariant | Value |
|---|---|
| Vertices | $|V| = 10$ |
| Edges | $|E| = 15$ |
| Regular of degree | 3 |
| Girth (shortest cycle length) | 5 |
| Diameter | 2 |
| Chromatic number | 3 |
| Edge-chromatic number | 4 |
| Automorphism group | $S_5$, order 120 |
| Planar? | No |
| Hamiltonian? | No |

The handshake-lemma check: $10 \cdot 3 = 30 = 2 \cdot 15 = 2|E|$. ✓

## Output / Verification

The Petersen graph is a 3-regular simple graph on 10 vertices realizing the structural invariants above. Reproducible from either construction; the constructions are graph-isomorphic.

## What this exemplifies

The Petersen graph is the *canonical small counterexample* in graph theory. It is the smallest 3-regular graph with girth 5; it is the smallest 3-regular graph that is not Hamiltonian; it is a standard example of a non-planar graph that does not contain $K_5$ as a subgraph (it contains $K_5$ as a *minor* — see the discussion in [kuratowski.md](../theorems/kuratowski.md)). Almost any plausible-looking graph-theory conjecture should be tested against it before being conjectured; many fail there. See [Bondy–Murty 2008](references/bondy-murty2008.md) §1.2 and [Diestel 2017](references/diestel2017.md) §1.6 for further discussion.
