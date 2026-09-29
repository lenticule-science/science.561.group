---

title: "Monoidal Category"
aliases:
  - "monoidal category"
  - "monoidal categories"
date-created: 2025-12-31
tags: []
description: "A monoidal category is a category C equipped with a tensor product ⊗: C × C → C, a unit object I, and coherence isomorphisms for associativity ((A ⊗ B) ⊗ C ≅ A ⊗ (B ⊗ C)) and units (I ⊗ A ≅ A ≅ A ⊗ I)."
---

A monoidal category is a [category](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/ordinary-categories/objects/category.md) C equipped with a [tensor product](../../../../../../glossary/terms/tensor-product.md) ⊗: C × C → C, a [unit object](../../../../../../glossary/terms/unit-object.md) I, and coherence [isomorphisms](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/ordinary-categories/morphisms/isomorphism.md) for associativity ((A ⊗ B) ⊗ C ≅ A ⊗ (B ⊗ C)) and units (I ⊗ A ≅ A ≅ A ⊗ I). These [isomorphisms](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/ordinary-categories/morphisms/isomorphism.md) must satisfy the pentagon and triangle coherence conditions, ensuring that all ways of re-associating and inserting units agree.

A monoidal category is the categorical generalization of a [monoid](../../../../../../glossary/terms/monoid.md): where a monoid has elements combined by an operation with an identity, a monoidal category has objects combined by a tensor product with a unit object. A monoid in the category of [sets](../../../../../../glossary/terms/set.md) is an ordinary monoid; a monoid in a monoidal category is a monoid object — an object M with multiplication M ⊗ M → M and unit I → M satisfying the monoid axioms.

The category Set with Cartesian product is monoidal (unit: the singleton set). The category of vector spaces with tensor product is monoidal (unit: the base field). The category of [topological spaces](../../../../../../glossary/terms/topological-space.md) with product is monoidal. A monoidal category is the base required for [enriched categories](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/_archive/enriched-category.md): the [hom-objects](../../../../../../glossary/terms/hom-object.md) of an enriched category live in a monoidal category, with composition defined through the tensor product.
