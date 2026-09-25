---
type: theorem
status: proved
lean:
  - PredicationCategories.Categorical.PredicationFiberAlgebra.fusion
  - PredicationCategories.Categorical.PredicationFiberAlgebra.twResiduum
  - PredicationCategories.Categorical.PredicateMap.cellPullback_fusion
  - PredicationCategories.Categorical.PredicateMap.cellPullback_twResiduum
depends-on: [predicate-category, predication-fiber-algebra, twist-product-fusion, twist-product-right-residual, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection]
title: Predicate-morphism residuation naturality
description: "For every morphism $f : q \\to p$ in the predicate category $\\mathcal{C}$, the induced fiber-algebra map $f^ : Ap \\to Aq$ is a residuated-lattice homomorphism:"
---

# Predicate-morphism residuation naturality

For every morphism $f : q \to p$ in the [predicate category](../../research/2026/07/31/lenticule-import/objects/predicate-category.md) $\mathcal{C}$, the induced fiber-algebra map $f^* : A_p \to A_q$ is a residuated-lattice homomorphism:

$$f^*(v_1 \odot v_2) = f^*(v_1) \odot f^*(v_2), \qquad f^*(v_1 \Rightarrow v_2) = f^*(v_1) \Rightarrow f^*(v_2)$$

for the [twist-product fusion](../../research/2026/07/31/lenticule-import/morphisms/twist-product-fusion.md) $\odot$ and the [twist-product right residual](../../research/2026/07/31/lenticule-import/morphisms/twist-product-right-residual.md) $\Rightarrow$ on each [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md).

## Proof

It suffices to check the four generator classes: [predicate specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md), [predicate converse](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-converse.md), [predicate subject-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-subject-projection.md), and [predicate object-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-object-projection.md). Each induces a cellwise index reindexing — restriction along a sub-support inclusion, the swap $(s, o) \mapsto (o, s)$, or a diagonal collapse. Since $\odot$ and $\Rightarrow$ are pointwise operations on $\mathbf{L}^\bowtie$, any cellwise reindexing commutes with them. $\square$
