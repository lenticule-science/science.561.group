---
kind: theorem
status: proved
depends-on: [moduli-classifying-function, aperiodic-regime-classification, aperiodic-classifying-invariant, settling-automorphism-1-truncation, biequivalence-cohomological-collapse, four-regime-dichotomy]
---

# Aperiodic-regime moduli classification

Suppose the base $B$ admits the aperiodic regime, with $|E| \geq \omega_1$ and $\lambda$ extending to $\omega_1$.
On the aperiodic stratum of the [coarse settling moduli](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/coarse-settling-moduli.md), the function

$$\mathrm{cl}\text{-}\mathrm{inv}_B \,:\, |\mathrm{KP}^{\mathrm{vis}}(B)|_D \;\longrightarrow\; H^1(\mathbf{T}^*(B)_{\leq \omega_1},\, \mathcal{F}_U^{\mathrm{univ}}), \qquad [v] \mapsto \mathrm{cl}\text{-}\mathrm{inv}(v),$$

is well-defined and injective.

## Proof

Well-definedness from [settling-automorphism 1-truncation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md): the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is fixed by the [invisible automorphism subgroup](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md), hence well-defined on visible-automorphism-quotient classes; combined with biequivalence-invariance from [biequivalence-cohomological collapse](../../sheaf/content/settling-cohomology/references/biequivalence-cohomological-collapse.md), it descends to MLD-classes, i.e., to $|\mathrm{KP}^{\mathrm{vis}}(B)|_D$.

Injectivity is the [aperiodic-regime classification theorem](aperiodic-regime-classification.md): MLD-equivalence of aperiodic settlings is detected by $H^1$-class agreement. $\square$

## Reading

The theorem packages the cohomology layer's [aperiodic-regime classification](aperiodic-regime-classification.md) as a moduli-level statement: $\mathrm{cl}\text{-}\mathrm{inv}$ is an injective function from the aperiodic stratum into a specific cohomology group.
Two aperiodic moduli points are equal iff their classifying invariants are equal in $H^1$.

The [moduli classifying function](../morphisms/moduli-classifying-function.md) $\mathcal{I}_B$ — sending an MLD-class to its sheaf-iso class — is on the aperiodic stratum equivalent to $\mathrm{cl}\text{-}\mathrm{inv}_B$, since on the aperiodic regime the sheaf-iso class is fully recovered from the $H^1$-class (the settling-associated sheaf decomposes as a sum of skyscraper-like contributions at non-Scott-continuous firings, and the iso-class is encoded in the firing-ordinal set up to settling-shift).
