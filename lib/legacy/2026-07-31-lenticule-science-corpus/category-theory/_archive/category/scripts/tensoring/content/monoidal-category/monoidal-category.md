---
title: "Monoidal Category"
aliases:
  - "monoidal category"
  - "monoidal categories"
date-created: 2025-12-31
type: term
tags: []
defines:
  - "Monoidal Category"
  - "monoidal categories"
---

A monoidal category is a [category](../../ordinary-categories/terms/category.md) C equipped with a [tensor product](./tensor-product.md) ⊗: C × C → C, a [unit object](./unit-object.md) I, and coherence [isomorphisms](../../ordinary-categories/terms/isomorphism.md) for associativity ((A ⊗ B) ⊗ C ≅ A ⊗ (B ⊗ C)) and units (I ⊗ A ≅ A ≅ A ⊗ I). These [isomorphisms](../../ordinary-categories/terms/isomorphism.md) must satisfy the pentagon and triangle coherence conditions, ensuring that all ways of re-associating and inserting units agree.

A monoidal category is the categorical generalization of a [monoid](../../../prealgebra/terms/monoid.md): where a monoid has elements combined by an operation with an identity, a monoidal category has objects combined by a tensor product with a unit object. A monoid in the category of [sets](../../../sets/terms/set.md) is an ordinary monoid; a monoid in a monoidal category is a monoid object — an object M with multiplication M ⊗ M → M and unit I → M satisfying the monoid axioms.

The category Set with Cartesian product is monoidal (unit: the singleton set). The category of vector spaces with tensor product is monoidal (unit: the base field). The category of [topological spaces](../../../../disciplines/topology/terms/topological-space.md) with product is monoidal. A monoidal category is the base required for [enriched categories](./enriched-category.md): the [hom-objects](./hom-object.md) of an enriched category live in a monoidal category, with composition defined through the tensor product.
