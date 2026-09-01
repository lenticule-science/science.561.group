---
type: theorem
status: proved
lean:
  - PredicationCategories.Categorical.PredicationFiberAlgebra.fusion
  - PredicationCategories.Categorical.PredicationFiberAlgebra.twResiduum
  - PredicationCategories.Categorical.PredicateMap.cellPullback_fusion
  - PredicationCategories.Categorical.PredicateMap.cellPullback_twResiduum
depends-on: [predicate-category, predication-fiber-algebra, twist-product-fusion, twist-product-right-residual, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection]
---

# Predicate-morphism residuation naturality

For every morphism $f : q \to p$ in the [predicate category](../objects/predicate-category.md) $\mathcal{C}$, the induced fiber-algebra map $f^* : A_p \to A_q$ is a residuated-lattice homomorphism:

$$f^*(v_1 \odot v_2) = f^*(v_1) \odot f^*(v_2), \qquad f^*(v_1 \Rightarrow v_2) = f^*(v_1) \Rightarrow f^*(v_2)$$

for the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ and the [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$ on each [predication fiber algebra](../objects/predication-fiber-algebra.md).

## Proof

It suffices to check the four generator classes: [predicate specialization](../morphisms/predicate-specialization.md), [predicate converse](../morphisms/predicate-converse.md), [predicate subject-projection](../morphisms/predicate-subject-projection.md), and [predicate object-projection](../morphisms/predicate-object-projection.md). Each induces a cellwise index reindexing — restriction along a sub-support inclusion, the swap $(s, o) \mapsto (o, s)$, or a diagonal collapse. Since $\odot$ and $\Rightarrow$ are pointwise operations on $\mathbf{L}^\bowtie$, any cellwise reindexing commutes with them. $\square$
