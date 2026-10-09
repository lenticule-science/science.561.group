---
type: theorem
status: proved
lean:
  - PredicationCategories.Homebrew.Predication.FiberAlgebra.fusion_le_iff_le_twResiduum
  - PredicationCategories.Categorical.PredicationFiberAlgebra.fusion_leT_iff_leT_twResiduum
depends-on: [predication-fiber-algebra, twist-product-fusion, twist-product-right-residual, twist-product-residuation, truth-order]
title: Predication fiber residuation
description: "For each predicate $p$ and settling step $\\tau$, the predication fiber algebra $Ap = \\mathbf{L}^{\\bowtie E \\times E}$ inherits a pointwise residuation adjunction: for $v1, v2, v3 \\in Ap$,"
---

# Predication fiber residuation

For each [predicate](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/predicate.md) $p$ and settling step $\tau$, the [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie E \times E}$ inherits a pointwise residuation adjunction: for $v_1, v_2, v_3 \in A_p$,

$$v_1 \odot v_2 \leq_t v_3 \iff v_1 \leq_t v_2 \Rightarrow v_3,$$

where the [twist-product fusion](../../research/2026/07/31/lenticule-import/morphisms/twist-product-fusion.md) $\odot$, the [twist-product right residual](../../research/2026/07/31/lenticule-import/morphisms/twist-product-right-residual.md) $\Rightarrow$, and the [truth order](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) $\leq_t$ all act cellwise on the entity-pair index $E \times E$.

## Proof

Both directions of the equivalence hold cellwise by the [twist-product residuation theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/references/twist-product-residuation.md) applied at each $(s, o) \in E \times E$. $\square$
