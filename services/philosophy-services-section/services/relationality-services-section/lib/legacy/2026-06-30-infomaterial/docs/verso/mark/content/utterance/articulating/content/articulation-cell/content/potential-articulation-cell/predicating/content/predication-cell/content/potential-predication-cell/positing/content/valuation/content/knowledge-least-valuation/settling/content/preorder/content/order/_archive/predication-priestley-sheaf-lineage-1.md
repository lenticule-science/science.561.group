---
kind: narrative
discusses: [bitopological-settling-site, paired-priestley-space, pairwise-stone-space, bitopological-stone-duality, jung-rivieccio-duality, bigraded-settling-cohomology]
---

# The Priestley-sheaf lineage

The Priestley-sheaf content of the cohomology layer builds on two convergent traditions: Gehrke–van Gool's sheaves-on-Priestley-duals theorem and Bezhanishvili et al.'s bitopological framing.

## [@gehrke-vangool2019]

[@gehrke-vangool2019] (*Sheaves and duality*) establishes that soft sheaf representations of a distributive lattice correspond bijectively to continuous decompositions of its Priestley dual satisfying an interpolation property (Theorem 5.7). The methodological template is "sheaves on the Priestley dual of a lattice are the right object; decompositions of the dual space are the source of sheaf data."

The cohomology layer here inherits the template and extends it:

- **From single-lattice to 2-categorical assembly.** Gehrke–van Gool treat sheaves on the Priestley dual of one distributive lattice. The [bitopological settling site](../objects/bitopological-settling-site.md) assembles [paired Priestley duals](../objects/paired-priestley-space.md) of all [predication fiber algebras](../objects/predication-fiber-algebra.md) across the predicate category and settling ordinal, with dualized predicate-generators and dualized closure-operator advancements as site morphisms.

- **From distributive lattices to distributive bilattices.** The fibers of an predication hyperdoctrine carry two orders ($\leq_k$ and $\leq_t$) simultaneously. Gehrke–van Gool's framework applies to each order separately; the [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) unifies both via the [truth-knowledge cohomology long exact sequence](../theorems/truth-knowledge-cohomology-long-exact-sequence.md).

## [@bezhanishvili-et-al2010]

The bitopological framing comes from [@bezhanishvili-et-al2010]'s [bitopological Stone duality](../theorems/bitopological-stone-duality.md):

$$\mathbf{PStone} \;\cong\; \mathbf{Spec} \;\cong\; \mathbf{Pries}.$$

The three natural categories of duals are equivalent, with the [pairwise Stone](../objects/pairwise-stone-space.md) framing treating the two topologies symmetrically. The present development adopts the $\mathbf{PStone}$ framing because the twist-product structure of the predication fiber algebras carries naturally onto pairwise Stone spaces — the $+$- and $-$-component topologies correspond to the two coordinates of the [twist product](../objects/twist-product.md) without privileging either.

## d-frames

The [@jung-moshier2006] / [@jakl2018] d-frame framework extends the bitopological duality to an algebraic axiomatization. d-frames are flagged as a candidate value category for sheaves — an alternative to $\mathbf{Ab}$ that would track bilattice structure more directly — but the homological algebra in $\mathbf{Ab}$ is what makes Godement resolutions, Čech computation, and spectral sequences available off-the-shelf. A bilattice-native or d-frame-valued cohomology would require developing those tools from scratch in the new target. Reserved as future work; see [bilattice-valued sheaves](../questions/bilattice-valued-sheaves.md).
