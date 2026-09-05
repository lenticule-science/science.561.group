---
kind: theorem
status: proved
depends-on: [coarse-settling-moduli, regime-mld-invariance, four-regime-dichotomy]
---

# Regime decomposition of the coarse moduli

For each base $B$, the [coarse settling moduli](../objects/coarse-settling-moduli.md) decomposes as a disjoint union indexed by [regime](four-regime-dichotomy.md):

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;=\; \bigsqcup_{X \in \{A, B, C, D\}} \, |\mathrm{KP}^{\mathrm{vis}}(B)|_X,$$

where $|\mathrm{KP}^{\mathrm{vis}}(B)|_X := \{[v] : \mathrm{reg}(v) = X\}$ is the stratum of MLD-classes with regime $X$.

## Proof

Every settling has a unique regime ([four-regime dichotomy](four-regime-dichotomy.md)).
By [regime MLD-invariance](regime-mld-invariance.md) the regime label lifts to MLD-classes.
The decomposition is the partition by regime label. $\square$

## Set-theoretic, not topological

By [regime stratification non-semicontinuity](regime-stratification-non-semicontinuity.md), the strata are *not* locally closed under any $\leq_k$-derived topology on the moduli.
The decomposition is set-theoretic and combinatorial — well-defined as a partition but not as a topological stratification.

## Refinement

Within each regime stratum, the [rigid moduli point](../concepts/rigid-moduli-point.md) / [orbifold moduli point](../concepts/orbifold-moduli-point.md) substratification by visible-automorphism symmetry produces a finer partition.
The [moduli classifying function](../morphisms/moduli-classifying-function.md) further refines the orbifold loci of the transfinite-bounded and aperiodic regimes by classifying-invariant.
