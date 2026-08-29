---
type: theorem
status: proved
depends-on: [moduli-classifying-function, aperiodic-regime-classification, aperiodic-classifying-invariant, settling-automorphism-1-truncation, biequivalence-cohomological-collapse, four-regime-dichotomy]
---

# Aperiodic-regime moduli classification

Suppose the base $B$ admits the aperiodic regime, with $|E| \geq \omega_1$ and $\lambda$ extending to $\omega_1$. On the aperiodic stratum of the [coarse settling moduli](../objects/coarse-settling-moduli.md), the function

$$\mathrm{cl}\text{-}\mathrm{inv}_B \,:\, |\mathrm{KP}^{\mathrm{vis}}(B)|_D \;\longrightarrow\; H^1(\mathbf{T}^*(B)_{\leq \omega_1},\, \mathcal{F}_U^{\mathrm{univ}}), \qquad [v] \mapsto \mathrm{cl}\text{-}\mathrm{inv}(v),$$

is well-defined and injective.

## Proof

Well-definedness from [settling-automorphism 1-truncation](settling-automorphism-1-truncation.md): the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is fixed by the [invisible automorphism subgroup](teaching/explanations/invisible-automorphism-subgroup.md), hence well-defined on visible-automorphism-quotient classes; combined with biequivalence-invariance from [biequivalence-cohomological collapse](biequivalence-cohomological-collapse.md), it descends to MLD-classes, i.e., to $|\mathrm{KP}^{\mathrm{vis}}(B)|_D$.

Injectivity is the [aperiodic-regime classification theorem](aperiodic-regime-classification.md): MLD-equivalence of aperiodic settlings is detected by $H^1$-class agreement. $\square$
