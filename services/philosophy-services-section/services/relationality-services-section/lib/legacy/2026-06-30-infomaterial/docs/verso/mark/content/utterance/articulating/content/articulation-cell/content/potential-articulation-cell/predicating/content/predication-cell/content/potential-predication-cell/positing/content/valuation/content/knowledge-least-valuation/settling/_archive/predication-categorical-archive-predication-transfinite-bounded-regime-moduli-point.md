---
type: example
depends-on: [coarse-settling-moduli, quantifier-induced-transfinite-settling, transfinite-bounded-regime-h1-generators, transfinite-bounded-regime-moduli-classification, rigid-moduli-point, regime-stratification-non-semicontinuity]
instantiates: [transfinite-bounded-regime-moduli-classification, transfinite-bounded-regime-h1-generators, rigid-moduli-point]
lineage: 4
---

# transfinite-bounded moduli point

The [quantifier-induced transfinite settling](quantifier-induced-transfinite-settling.md) viewed as a moduli point — the smallest concrete [transfinite-bounded-regime](../theorems/four-regime-dichotomy.md) example.

## Base and closure

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega + 1$, [predicate category](../objects/predicate-category.md) one-object on $P$, [settling bound](../objects/settling-bound.md) $\lambda = \omega + 2$. Closure rule: the [non-Scott-continuous firing](teaching/explanations/non-scott-continuous-firing-ordinal.md) $(\forall n \in \mathbb{N}.\, P(n, n) = \mathbf{t}) \Rightarrow P(\omega, \omega) \geq_k \mathbf{t}$, plus the finitary $P(n, n) \Rightarrow P(n + 1, n + 1)$ rule.

## Regime

Transfinite-bounded regime: $\kappa = \omega + 1$, with $L_{\mathrm{ns}}(\kappa) = \{\omega\}$ (one non-Scott-continuous firing ordinal).

## Classifying invariant

By [transfinite-bounded-regime $H^1$-generators](../theorems/transfinite-bounded-regime-h1-generators.md):

$$H^1(\mathbf{T}^*_{\leq \omega + 1},\, \mathcal{F}_U) \;\cong\; \mathbb{Z},$$

with single generator $e_\omega$ corresponding to the firing at $\omega$. The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is $\mathrm{cl}\text{-}\mathrm{inv}(v) = e_\omega$ — a non-trivial transfinite-bounded class.

## MLD-distinction from a Scott-continuous variant

Consider the variant $v_B$ over the same base with the *same finitary rule but no infinitary rule* (matching the setup of [regime stratification non-semicontinuity](../theorems/regime-stratification-non-semicontinuity.md)): same initial state, finitary closure only. $v_B$ has $L_{\mathrm{ns}}(\kappa) = \emptyset$ and $\mathrm{cl}\text{-}\mathrm{inv}(v_B) = 0 \in H^1 = 0$ (Scott-continuous regime).

By [transfinite-bounded-regime moduli classification](../theorems/transfinite-bounded-regime-moduli-classification.md), $[v]$ and $[v_B]$ are distinct MLD-classes — distinguished cohomologically by their $H^1$-classes, which sit in different cohomology groups across the regime boundary.

## Visible automorphisms

Similar to the [Scott-continuous natural-number moduli](scott-continuous-natural-number-moduli.md) point: $\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) = \{1\}$. [Rigid](teaching/explanations/rigid-moduli-point.md) transfinite-bounded point.

## Place in the moduli

This MLD-class sits in the transfinite-bounded stratum $|\mathrm{KP}^{\mathrm{vis}}(B)|_C$, which is non-empty over this base because $\mathcal{C}$ admits the non-Scott-continuous infinitary rule. The Scott-continuous stratum is also non-empty (witnessed by $v_B$ above). The two strata together occupy disjoint regions of the coarse moduli, by [regime decomposition](../theorems/regime-decomposition.md).

## Role

Smallest concrete example of $H^1 \neq 0$ at the moduli level. The non-Scott-continuous firing at $\omega$ is exactly the cohomological obstruction; replacing the rule with a no-op moves the moduli point from the transfinite-bounded regime into the Scott-continuous regime, demonstrating that the regime stratification is *induced by closure-rule choice* — and that the [stratification is set-theoretic, not topological](../theorems/regime-stratification-non-semicontinuity.md).
