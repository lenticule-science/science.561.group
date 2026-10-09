---

title: "Tensor Product"
description: "The tensor product in a [monoidal category](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/multiplying/content/tensor-product/objects/monoidal-category.md) is a bifunctor ⊗: C × C → C that combines two objects into one. It is the categorical analogue of multiplication: just as a [monoid](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/algebra/objects/monoid.md) has a binary operation on elements, a monoidal category has a binary operation on objects."
aliases:
  - "tensor product"
  - "tensor products"
date-created: 2025-12-31
tags: []
---

The tensor product in a [monoidal category](../../../../../../glossary/terms/monoidal-category.md) is a bifunctor ⊗: C × C → C that combines two objects into one. It is the categorical analogue of multiplication: just as a [monoid](../../../../../../glossary/terms/monoid.md) has a binary operation on elements, a monoidal category has a binary operation on objects.

The tensor product must be associative up to coherent [isomorphism](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/multiplying/content/ordinary-categories/morphisms/isomorphism.md): (A ⊗ B) ⊗ C ≅ A ⊗ (B ⊗ C). It must have a [unit object](../../../../../../glossary/terms/unit-object.md) I with I ⊗ A ≅ A ≅ A ⊗ I. The tensor product need not be commutative (A ⊗ B need not be [isomorphic](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/multiplying/content/ordinary-categories/morphisms/isomorphism.md) to B ⊗ A); when it is, the monoidal category is called symmetric.

In the category of [sets](../../../../../../glossary/terms/set.md), the tensor product is the Cartesian product. In the category of vector spaces, it is the classical tensor product of linear algebra. In the category of abelian groups, it is the tensor product over ℤ. In an [enriched category](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/multiplying/content/tensor-product/objects/enriched-category.md), the tensor product of the base monoidal category is used to define composition of [hom-objects](../../../../../../glossary/terms/hom-object.md): the composition map goes from Hom(B, C) ⊗ Hom(A, B) to Hom(A, C).
