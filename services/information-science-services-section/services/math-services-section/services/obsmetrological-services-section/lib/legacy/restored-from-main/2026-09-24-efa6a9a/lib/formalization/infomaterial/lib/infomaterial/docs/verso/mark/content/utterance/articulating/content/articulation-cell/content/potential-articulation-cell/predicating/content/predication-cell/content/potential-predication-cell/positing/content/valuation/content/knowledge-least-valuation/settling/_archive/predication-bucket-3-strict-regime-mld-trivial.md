---
kind: theorem
status: proved
depends-on: [strict-regime-cohomology-vanishing, mutually-locally-derivable, aperiodic-classifying-invariant]
---

# MLD-equivalence is trivial in the strict regime

For two settlings $v, v'$ in the [strict regime](strict-regime-cohomology-vanishing.md) over a common base, [MLD-equivalence](../concepts/mutually-locally-derivable.md) $v \sim_{\mathrm{MLD}} v'$ is decidable in polynomial time and reduces to $H^0$-matching.

## Proof

By [strict-regime cohomology vanishing](strict-regime-cohomology-vanishing.md), $H^1 = 0$ in the strict regime, so the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) (the $H^1$-class detecting MLD-equivalence in transfinite regimes) is identically zero for every strict settling.

The MLD-classification reduces to its $H^0$-component: two strict settlings are MLD-equivalent iff their designated-cell sets at quiescence agree up to settling-shift and entity-relabeling — an equality of finite sets of cells, computable in polynomial time by [finite-settling $H^0$](finite-settling-h0-polynomial-time.md). $\square$

## Note

This theorem says the strict regime is *cohomologically uninteresting* and *combinatorially trivial*: every strict settling is MLD-equivalent to every other settling with the same $H^0$, with no further refinement available. The richness of the MLD-classification only emerges in the transfinite-bounded and aperiodic regimes — see [combinatorial classification across regimes](combinatorial-classification-across-regimes.md).
