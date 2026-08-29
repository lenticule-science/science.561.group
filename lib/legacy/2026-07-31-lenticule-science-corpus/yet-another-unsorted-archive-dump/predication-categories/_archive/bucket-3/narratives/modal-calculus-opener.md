---
kind: narrative
introduces: [modal-necessity-operator]
---

# Modal calculus on bilattice fibers

The bilattice fiber algebra $A_q = \mathbf{L}^{\bowtie\, E \times E}$ supports a natural four-valued modal calculus: necessity and possibility operators acting on world-indexed valuations, with the bilattice's two orders giving two axes of monotonicity.

The construction is straightforward — a [necessity operator](../morphisms/modal-necessity-operator.md) $\Box_R$ aggregates valuations across worlds related by a [bilattice accessibility relation](../objects/bilattice-accessibility-relation.md), with the [twist-product right residual](../morphisms/twist-product-right-residual.md) playing the role of implication in the aggregation. Possibility is dual.

The structural feature distinguishing this modal calculus from classical Kripke logic is the failure of normality: $\Box(\phi \to \psi) \to (\Box\phi \to \Box\psi)$ does not hold in general. This is a consequence of the four-valued setting — the implication on $\mathbf{L}^\bowtie$ is non-Boolean, and standard normality arguments break.

A [twist translation](../objects/twist-modal-translation.md) embeds the four-valued modal calculus into a classical bimodal logic via the standard pair-of-Boolean-bilattice decomposition. Through this translation, decidability questions transfer from the bilattice setting to classical modal logic where the toolset is mature.

The chapter develops:

- The necessity and [possibility](../morphisms/modal-possibility-operator.md) operators on bilattice fibers, with their [basic algebraic properties](../theorems/modal-necessity-basic-properties.md) (preservation of $\mathbf{t}$, truth-meets, and constant-implication).
- The [non-normality](../theorems/modal-non-normality.md) of $\Box$.
- The [twist-translation consequence preservation](../theorems/twist-translation-consequence.md) — the bridge to classical bimodal logic.
- The [finite model property](../theorems/modal-finite-model-property.md) — decidability of the calculus.
- [Complexity bounds](../theorems/modal-complexity-bounds.md): PSPACE-completeness of local consequence, EXPTIME-completeness of global consequence.
- [Open problems](../questions/bilattice-complexity-refinement.md) on tighter complexity.

The modal calculus is a side application of the bilattice fiber structure — useful for representing knowledge under modal qualifications (necessity, possibility, agent beliefs) but not load-bearing for the cohomology or moduli developments of the Derivation.
