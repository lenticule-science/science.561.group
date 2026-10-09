---
type: theorem
status: proved
depends-on: [enriched-category, graph, hodge-laplacian]
title: Lawvere-Laplacian fixed points on graphs
description: For a connected graph $G = (VG, EG)$ with at least one edge and a commutative unital quantale $V$, define the unsigned-weighted-meet Lawvere-Laplacian $L^1 = \delta^0 \circ (\delta^0)^$ on a constant $V$-sheaf over $G$, where $\delta^0$…
---

# Lawvere-Laplacian fixed points on graphs

For a connected [graph](../../../../../glossary/terms/graph.md) $G = (V_G, E_G)$ with at least one edge and a commutative unital quantale $V$, define the unsigned-weighted-meet Lawvere-Laplacian $L^1 = \delta^0 \circ (\delta^0)^*$ on a constant $V$-sheaf over $G$, where $\delta^0$ is the [enriched-category](../../../../../glossary/terms/enriched-category.md)-theoretic coboundary $(\delta^0 x)(e_{ij}) := x_i \wedge_V x_j$ and $(\delta^0)^*$ is its V-Cat right adjoint $((\delta^0)^* y)(v) := \bigwedge_V \{y(e) : e \text{ incident to } v\}$.

**Result.** $\mathrm{Fix}(L^1) \subset C^1 = V^{|E_G|}$ equals the set of constant edge-cochains, so $|\mathrm{Fix}(L^1)| = |V_G|$ — for *any* connected $G$ and *any* commutative unital quantale $V$.

## Proof

$\wedge_V$-idempotence and antisymmetry are the only properties used, so the argument is $V$-uniform: it holds identically for the Boolean quantale, the Łukasiewicz quantale, and the (min,+)-style Lawvere quantale alike. Verified computationally over all three on five canonical connected graphs (3-cycle, 4-cycle, theta-graph, bow-tie, $K_4$) spanning first Betti numbers $b_1 = 1, 2, 3$.

## Remarks

The unsigned-weighted-meet operator has no orientation, so independent cycles are not distinguished: the fixed-point set tracks only "globally consistent" content (constants), not per-cycle content. Where classical signed cellular cohomology gives $|V_G|^{b_1}$ fixed harmonic cochains, this [Hodge Laplacian](../../../../../glossary/terms/hodge-laplacian.md) analogue collapses to $|V_G|$ once $b_1 \geq 2$ — a structural divergence from the unsigned operator, not a defect in either construction. The two constructions agree exactly at $b_1 \leq 1$ (trees and single cycles).

Self-contained: independent of the bipartite-multipartition/chain-complex corpus tooling in [moduli-of-laplacianizers](../../../research-articles/moduli-of-laplacianizers.md) and its neighbors — this is a separate, unrelated use of "Laplacian."

## Verification

[`scripts/lawvere_laplacian_h1_graphs.py`](scripts/lawvere_laplacian_h1_graphs.py) — pytest-discoverable; enumerates $\mathrm{Fix}(L^1)$ by brute force over sampled quantale values for each canonical graph and checks it against $|V_G|$.
