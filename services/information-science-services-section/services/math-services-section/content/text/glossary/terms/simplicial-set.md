---
name: "Simplicial Set"
aliases:
  - "simplicial set"
  - "simplicial sets"
date-created: 2025-12-31
tags: []
type: term
---

A simplicial set is a [functor](./functor.md) X: Δᵒᵖ → Set, where Δ is the simplex category (objects are the finite ordinals [0], [1], [2], ..., [morphisms](./morphism.md) are order-preserving maps) and Set is the [category](./category.md) of [sets](./set.md). Concretely, a simplicial set consists of a set Xₙ of n-simplices for each n ≥ 0, together with face maps dᵢ: Xₙ → Xₙ₋₁ (removing the i-th vertex) and degeneracy maps sᵢ: Xₙ → Xₙ₊₁ (repeating the i-th vertex), satisfying the simplicial identities.

Simplicial sets encode combinatorial topology: a 0-simplex is a point, a 1-simplex is an edge, a 2-simplex is a triangle, and so on. Every topological space has a singular simplicial set (whose n-simplices are continuous maps from the standard n-simplex into the space), and every simplicial set has a geometric realization as a topological space. This [adjunction](./adjunction.md) connects combinatorial and topological approaches to [homotopy theory](./homotopy.md).

Simplicial sets provide the combinatorial foundation for higher category theory. A [quasi-category](./quasi-category.md) is a simplicial set satisfying a [horn](./horn.md)-filling condition, and this model of [∞-categories](./infinity-category.md) is the basis of Lurie's framework for [(∞,1)-categories](./infinity-1-category.md) and [(∞,1)-topoi](./infinity-1-topos.md). Simplicial sets also serve as the base for simplicial enrichment of categories, replacing hom-sets with hom-simplicial-sets whose simplices witness homotopies between [morphisms](./morphism.md).

## Earlier material

A simplicial set is a [functor](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/representing/content/presheaf/scripts/simplicializing/ordinary-categories/terms/functor.md) X: Δᵒᵖ → Set, where Δ is the simplex category (objects are the finite ordinals [0], [1], [2], ..., [morphisms](morphism.md) are order-preserving maps) and Set is the [category](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/representing/content/presheaf/scripts/simplicializing/ordinary-categories/terms/category.md) of [sets](set.md). Concretely, a simplicial set consists of a set Xₙ of n-simplices for each n ≥ 0, together with face maps dᵢ: Xₙ → Xₙ₋₁ (removing the i-th vertex) and degeneracy maps sᵢ: Xₙ → Xₙ₊₁ (repeating the i-th vertex), satisfying the simplicial identities.

Simplicial sets provide the combinatorial foundation for higher [category theory](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/representing/content/presheaf/scripts/simplicializing/index.md). A [quasi-category](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/representing/content/presheaf/scripts/simplicializing/content/simplicial-set/quasi-category.md) is a simplicial set satisfying a [horn](horn.md)-filling condition, and this model of [∞-categories](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/representing/content/presheaf/scripts/simplicializing/content/simplicial-set/infinity-category.md) is the basis of Lurie's framework for [(∞,1)-categories](infinity-1-category.md) and [(∞,1)-topoi](infinity-1-topos.md). Simplicial sets also serve as the base for simplicial enrichment of categories, replacing hom-sets with hom-simplicial-sets whose simplices witness homotopies between [morphisms](morphism.md).
