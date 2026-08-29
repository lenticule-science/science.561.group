---
title: "Tensor Product"
aliases:
  - "tensor product"
  - "tensor products"
date-created: 2025-12-31
type: term
tags: []
defines:
  - "Tensor Product"
  - "tensor products"
---

The tensor product in a [monoidal category](./monoidal-category.md) is a bifunctor ⊗: C × C → C that combines two objects into one. It is the categorical analogue of multiplication: just as a [monoid](../../../prealgebra/terms/monoid.md) has a binary operation on elements, a monoidal category has a binary operation on objects.

The tensor product must be associative up to coherent [isomorphism](../../ordinary-categories/terms/isomorphism.md): (A ⊗ B) ⊗ C ≅ A ⊗ (B ⊗ C). It must have a [unit object](./unit-object.md) I with I ⊗ A ≅ A ≅ A ⊗ I. The tensor product need not be commutative (A ⊗ B need not be [isomorphic](../../ordinary-categories/terms/isomorphism.md) to B ⊗ A); when it is, the monoidal category is called symmetric.

In the category of [sets](../../../sets/terms/set.md), the tensor product is the Cartesian product. In the category of vector spaces, it is the classical tensor product of linear algebra. In the category of abelian groups, it is the tensor product over ℤ. In an [enriched category](./enriched-category.md), the tensor product of the base monoidal category is used to define composition of [hom-objects](./hom-object.md): the composition map goes from Hom(B, C) ⊗ Hom(A, B) to Hom(A, C).
