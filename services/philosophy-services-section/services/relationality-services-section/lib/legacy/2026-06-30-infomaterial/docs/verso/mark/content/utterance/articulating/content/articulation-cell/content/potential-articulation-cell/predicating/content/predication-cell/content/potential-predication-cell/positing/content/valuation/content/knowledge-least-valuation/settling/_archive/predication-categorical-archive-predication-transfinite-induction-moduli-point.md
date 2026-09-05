---
type: example
depends-on: [coarse-settling-moduli, transfinite-induction-settling, transfinite-induction-classifying-invariant, transfinite-induction-rigidity, aperiodic-regime-moduli-classification, rigid-moduli-point, four-regime-dichotomy]
instantiates: [aperiodic-regime-moduli-classification, transfinite-induction-rigidity, rigid-moduli-point]
lineage: 4
---

# Transfinite-induction moduli point

The [transfinite-induction settling](transfinite-induction-settling.md) viewed as a [coarse settling moduli](../objects/coarse-settling-moduli.md) point — the canonical [aperiodic-regime](../theorems/four-regime-dichotomy.md) example.

## Base and settling

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega_1$, [predicate category](../objects/predicate-category.md) one-object on $P$, [settling bound](../objects/settling-bound.md) $\lambda = \omega_1 + 1$, with the transfinite-induction closure rule: $(\forall \alpha < \beta.\, v(P)(\alpha, \alpha) = \mathbf{t}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{t}$.

## Regime

Aperiodic regime: closure ordinal $\kappa = \omega_1$, [non-Scott-continuous firing-ordinal set](teaching/explanations/non-scott-continuous-firing-ordinal.md) $L_{\mathrm{ns}}(\kappa) = \{$ countable limit ordinals $\}$.

## Classifying invariant

By [transfinite-induction classifying invariant](../theorems/transfinite-induction-classifying-invariant.md):

$$H^1(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_U) \;\cong\; \bigoplus_{\mu < \omega_1, \,\mu \text{ countable limit}} \mathbb{Z},$$

a free abelian group of rank $\aleph_1$. The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is the all-ones element

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu < \omega_1, \,\mu \text{ countable limit}} 1_\mu,$$

with a $+1$ on every basis coordinate.

## Visible automorphisms

By [transfinite-induction rigidity](../theorems/transfinite-induction-rigidity.md), $\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) = \{1\}$. [Rigid](teaching/explanations/rigid-moduli-point.md) aperiodic point.

The natural invisible-automorphism subgroup is large — every bijection of off-diagonal $\omega_1 \times \omega_1$ cells, of cardinality $2^{\aleph_1}$ — but all of it sits in $N(v)$.

## MLD-distinguishability of variants

By [aperiodic-regime moduli classification](../theorems/aperiodic-regime-moduli-classification.md), two aperiodic moduli points are equal iff their classifying invariants agree.

- **Settling-shift variants.** A shifted settling starting from $v_0(P)(\alpha_0, \alpha_0) = \mathbf{t}$ for some countable $\alpha_0 > 0$ has the same firing-ordinal structure up to settling-shift; same all-ones classifying invariant; *equal* moduli point.

- **Restricted-firing variants.** A modified settling firing only at "even-indexed" countable limit ordinals (under any fixed bijection) has $\mathrm{cl}\text{-}\mathrm{inv}$ supported on only half the basis coordinates — a *different* classifying invariant; *distinct* moduli point.

So the aperiodic stratum $|\mathrm{KP}^{\mathrm{vis}}(B)|_D$ contains at least these two distinct MLD-classes, distinguishable purely by their cohomological invariants.

## Role

Central example of the moduli layer. Exhibits a concrete aperiodic moduli point on which the [aperiodic-regime classification](../theorems/aperiodic-regime-classification.md) produces a computable, discriminating invariant. The cohomological content — $H^1 \cong \bigoplus_{\aleph_1} \mathbb{Z}$, classifying invariant as all-ones — is the most distinctive cohomology computation in the moduli, impossible to obtain via primal fixed-point theorems (which see only the quiescent state at $\omega_1$, not the transfinite structure of how it was reached).

The image of $\mathrm{cl}\text{-}\mathrm{inv}_B$ within the rank-$\aleph_1$ $H^1$ is some subset parametrized by admissible closure-rule systems; characterizing it is the [realizability question](questions/realizability-of-cohomology-classes.md).
