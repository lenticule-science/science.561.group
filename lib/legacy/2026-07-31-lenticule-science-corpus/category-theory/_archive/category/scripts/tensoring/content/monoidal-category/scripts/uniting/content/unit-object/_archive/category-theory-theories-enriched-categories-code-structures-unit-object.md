---

title: "Unit Object"
aliases:
  - "unit object"
  - "unit objects"
  - "tensor unit"
date-created: 2025-12-31
tags: []
defines:
  - "Unit Object"
  - "unit objects"
  - "tensor unit"
---

The unit object I in a [monoidal category](./monoidal-category.md) is the object that acts as an identity for the [tensor product](../morphisms/tensor-product.md): I ⊗ A ≅ A ≅ A ⊗ I for every object A, via coherent [isomorphisms](../../ordinary-categories/morphisms/isomorphism.md). It is the categorical analogue of the [identity element](../../../../algebra/concepts/identity-element.md) in a [monoid](../../../../algebra/objects/monoid.md).

In the category of [sets](../../../../sets/objects/set.md) with Cartesian product, the unit object is any singleton set {∗}. In the category of vector spaces with tensor product, the unit is the base field. In the category of abelian groups with tensor product over ℤ, the unit is ℤ itself.

In an [enriched category](./enriched-category.md), the identity [morphism](../../ordinary-categories/morphisms/morphism.md) at each object is a map from the unit object I to the [hom-object](./hom-object.md) Hom(A, A). This mirrors how the identity element of a monoid is picked out by a map from the one-element set. The unit object thus provides the "do nothing" [morphism](../../ordinary-categories/morphisms/morphism.md) in the enriched setting.
