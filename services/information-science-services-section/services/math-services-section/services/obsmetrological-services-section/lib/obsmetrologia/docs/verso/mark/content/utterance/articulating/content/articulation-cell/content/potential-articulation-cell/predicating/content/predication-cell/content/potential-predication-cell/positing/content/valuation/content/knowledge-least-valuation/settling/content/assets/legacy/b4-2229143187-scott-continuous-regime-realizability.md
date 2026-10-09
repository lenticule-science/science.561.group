---
type: theorem
status: proved
depends-on: [stabilizing-regimes-combinatorial-classification, moduli-classifying-function, four-regime-dichotomy, predicate-category-naturality, increment-sequence, closure-rule, scott-continuous-regime-cohomology-vanishing, scott-continuous-closure]
---

# Scott-continuous-regime realizability

For a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with at least one of $\mathbf{L}, E, \mathcal{C}$ infinite and the closure rule [Scott-continuous](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md), the [moduli classifying function](../morphisms/moduli-classifying-function.md) $\mathcal{I}_B$ restricted to the Scott-continuous regime stratum is *surjective onto its codomain*: every $\mathcal{C}$-natural countable eventually-designated-cell configuration $\Sigma$ is realized by some MLD-class of Scott-continuous-regime predication settlings over $B$.

Combined with [stabilizing-regimes combinatorial classification](../../../references/stabilizing-regimes-combinatorial-classification.md)'s injectivity, $\mathcal{I}_B$ is a bijection on the Scott-continuous stratum.

## Proof

The same argument as [strict-regime realizability](../../../references/strict-regime-realizability.md). For each $\mathcal{C}$-natural configuration $\Sigma$ on the (now possibly infinite) base, construct an increment sequence $U^\Sigma$ supplying the cells of $\Sigma$ at stage 0:

$$u_0(p)(s, o) := \begin{cases} \mathbf{t} & (s, o) \in \Sigma_p, \\ \bot & \text{otherwise.} \end{cases}$$

Take the empty closure-rule system; the settling is constant at $u_0$; the eventually-designated-cell configuration is $\Sigma$. By [Scott-continuous-regime cohomology vanishing](../../sheaf/content/settling-cohomology/references/scott-continuous-regime-cohomology-vanishing.md), $H^1 = 0$ on this stratum, so the sheaf-iso class of $\mathcal{F}_U$ is determined by $\Sigma$ alone. $\square$

## Why this regime is in the program at all

Strict and Scott-continuous regimes' realizability is essentially trivial: $H^1 = 0$ means there's no cohomological obstruction class to realize. The realizability program's substantive content is in the [transfinite-bounded](../../../references/transfinite-bounded-regime-realizability.md) and [aperiodic](../../aperiodic-settling/references/aperiodic-regime-realizability.md) regimes, where firing-ordinal structure produces non-trivial $H^1$.

The strict and Scott-continuous theorems are included for completeness: they establish that the moduli classifying function is bijective on the $H^1 = 0$ branch of the regime stratification. With these in place, the realizability program reduces to characterizing the image on the two non-trivial-$H^1$ regimes.
