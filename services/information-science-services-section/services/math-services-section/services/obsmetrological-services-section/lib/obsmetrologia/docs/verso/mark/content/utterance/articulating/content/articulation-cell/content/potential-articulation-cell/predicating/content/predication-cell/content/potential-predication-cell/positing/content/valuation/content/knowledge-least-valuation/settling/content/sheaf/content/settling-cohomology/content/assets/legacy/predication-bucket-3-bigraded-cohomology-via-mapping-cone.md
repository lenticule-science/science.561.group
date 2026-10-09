---
kind: theorem
status: proved
closes: bigraded-settling-cohomology
depends-on: [bigraded-settling-cohomology, truth-knowledge-cohomology-long-exact-sequence]
---

# Bigraded cohomology as a mapping cone

The total complex of the [bigraded cochain complex](../../bigraded-settling-cohomology/bigraded-settling-cohomology.md) $C^{\bullet, \bullet}_{k, t}(\mathbf{T}^*, \mathcal{F}_U)$ is quasi-isomorphic to the mapping cone of the connecting morphism

$$\iota^\bullet \;:\; C^\bullet(\mathcal{F}_U^{(t)}) \,\to\, C^\bullet\bigl(\mathcal{F}_U^{(t)} \hookrightarrow \mathcal{F}_U^{(k)} \twoheadrightarrow \mathcal{F}_U^{(\top)}\bigr).$$

Its cohomology is

$$H^N_{k, t, \mathrm{total}}(\mathbf{T}^*, \mathcal{F}_U) \;\cong\; \mathrm{Cone}(\iota)^N,$$

fitting into the [truth-knowledge cohomology long exact sequence](../../../references/truth-knowledge-cohomology-long-exact-sequence.md) via the standard mapping-cone identification.

## Proof

Standard homological algebra on a two-row bicomplex ([@weibel1994] §1.2; [@kashiwara-schapira2006] §1.3): the total complex of a two-row bicomplex with vertical differential $d_v$ is naturally isomorphic to the cone of $d_v$ regarded as a chain map between the two rows. The long exact sequence of the cone is the long exact sequence of the underlying short exact sequence of sheaves, recovering [truth-knowledge cohomology long exact sequence](../../../references/truth-knowledge-cohomology-long-exact-sequence.md). $\square$

## Reading

The proposition is what makes the bigraded cohomology computationally tractable: rather than computing a full bicomplex spectral sequence, one identifies the total cohomology with the cone of a single chain map. In the two-row case the cone construction is elementary, and the long exact sequence captures all the cohomological content.
