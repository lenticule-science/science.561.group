---
kind: theorem
status: proved
depends-on: [coarse-settling-moduli, mutually-locally-derivable, non-scott-continuous-firing-ordinal, four-regime-dichotomy, aperiodic-regime-cohomology-via-direct-limit, transfinite-bounded-regime-h1-generators, stabilizing-regimes-combinatorial-classification]
---

# Combinatorial classification across regimes

Over a fixed base $B$, two settlings $v, v' \in \mathrm{KP}^{\mathrm{vis}}(B)$ are [MLD-equivalent](../concepts/mutually-locally-derivable.md) iff *both* of the following hold:

1. **Same designated-cell pattern up to settling-shift.** There exists an ordinal shift $\delta$ and an entity-permutation $\sigma \in \mathrm{Sym}(E)$ stabilizing the $\mathcal{C}$-structure such that $\sigma$ sends the eventually-designated cell-set of $v$ to the eventually-designated cell-set of $v'$.

2. **Same non-Scott-continuous firing pattern (the transfinite-bounded and aperiodic regimes only).** The sets $L_{\mathrm{ns}}(\kappa, v)$ and $L_{\mathrm{ns}}(\kappa, v')$ of [non-Scott-continuous firing ordinals](../concepts/non-scott-continuous-firing-ordinal.md) coincide as settling-shift-classes of well-ordered subsets of $\lambda$.

## Proof

The two conditions package the regime-by-regime classification statements:

**the strict and Scott-continuous regimes.** Condition 2 is vacuous (no non-Scott-continuous firings exist in these regimes). MLD-equivalence reduces to condition 1 — the designated-cell-pattern criterion. This is [regimes-A-B combinatorial classification](stabilizing-regimes-combinatorial-classification.md).

**The transfinite-bounded regime.** Condition 1 (designated-cell pattern) plus condition 2 (firing-ordinal-set agreement) are jointly necessary and sufficient. By [transfinite-bounded $H^1$-generators](transfinite-bounded-regime-h1-generators.md), the classifying invariant is determined by the firing-ordinal set, so condition 2 is the cohomologically-detected part; condition 1 is the $H^0$-detected part.

**The aperiodic regime.** Same as the transfinite-bounded regime by [aperiodic cohomology via direct limit](aperiodic-regime-cohomology-via-direct-limit.md), with the firing-ordinal set ranging over countable limit ordinals up to $\omega_1$. Conditions 1 and 2 jointly equivalent to MLD by the Anderson–Putnam-style direct-limit characterization.

In all four regimes, conditions 1 and 2 together reproduce MLD-equivalence. $\square$

## Decidability

The combinatorial form is computable per regime:

- **The strict regime.** Both conditions are finite checks on a finite settling.
- **The Scott-continuous regime.** Both conditions are polynomial in the settling length.
- **The transfinite-bounded regime.** Condition 1 is countable; condition 2 is a finite firing-ordinal set comparison.
- **The aperiodic regime.** Condition 2 is an $\aleph_1$-cardinality comparison of well-ordered subsets up to settling-shift; decidable in principle but not always polynomial.

## What this gives the moduli

The [coarse settling moduli](../objects/coarse-settling-moduli.md) is computable per regime: enumerate settlings, group by conditions 1+2, and the equivalence classes are the moduli points. The [combined cohomology classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) is the $H^0 \oplus H^1$-encoding of these conditions.

The combinatorial form is the *operational* version of classification; the cohomological form is the *structural* version. The two are equivalent regime by regime via [biequivalence-cohomological collapse](biequivalence-cohomological-collapse.md).
