---
kind: theorem
status: proved
depends-on: [moduli-classifying-function, transfinite-bounded-regime-h1-generators, non-scott-continuous-firing-ordinal, settling-cohomology, four-regime-dichotomy, mutually-locally-derivable]
---

# Transfinite-bounded-regime moduli classification

On the transfinite-bounded stratum of the [coarse settling moduli](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/coarse-settling-moduli.md), the function

$$\mathrm{cl}\text{-}\mathrm{inv}_B \,:\, |\mathrm{KP}^{\mathrm{vis}}(B)|_C \;\longrightarrow\; H^1(\mathbf{T}^*(B)_{\leq \kappa},\, \mathcal{F}_U^{\mathrm{univ}}) \;\cong\; \bigoplus_{L_{\mathrm{ns}}(\kappa)} \mathbb{Z}, \qquad [v] \mapsto \mathrm{cl}\text{-}\mathrm{inv}(v),$$

is well-defined and injective.
The classifying class records the [non-Scott-continuous firing-ordinal set](../content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) up to settling-shift.

## Proof

By [transfinite-bounded-regime $H^1$-generators](transfinite-bounded-regime-h1-generators.md), $H^1$ is freely generated over $\mathbb{Z}$ by the non-Scott-continuous firing ordinals below $\kappa$, with the classifying class

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\kappa)} e_\mu$$

equal to the sum of all firing contributions.
MLD-equivalence of transfinite-bounded settlings is equivalent to the agreement of their $L_{\mathrm{ns}}$ sets up to settling-shift, which is exactly $H^1$-class agreement under the natural identification.

Lifting to the moduli proceeds as for [aperiodic-regime moduli classification](../content/aperiodic-settling/references/aperiodic-regime-moduli-classification.md): well-definedness from $N$-invariance of the classifying class, injectivity from the underlying classification theorem. $\square$

## Reading

transfinite-bounded settlings are detected combinatorially by their non-Scott-continuous firing-ordinal sets, and these sets translate to $H^1$-classes via the [non-Scott-continuous firing ordinal](../content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) decomposition.
The [moduli classifying function](../morphisms/moduli-classifying-function.md) on the transfinite-bounded regime is therefore the combinatorial-data-to-$H^1$-class map.

Unlike the aperiodic regime, where the cohomology group has cardinality $2^{\aleph_1}$, transfinite-bounded cohomology has cardinality at most $2^{\aleph_0}$ (for countably-many firing ordinals); for typical transfinite-bounded settlings $H^1$ is finite or countable, making the moduli classification straightforwardly enumerable on this stratum.
