---

title: "Enriched Category"
aliases:
  - "enriched category"
  - "enriched categories"
date-created: 2025-12-31
tags: []
defines:
  - "Enriched Category"
  - "enriched categories"
---

An enriched category over a [monoidal category](./monoidal-category.md) V is a category-like structure whose [hom-objects](./hom-object.md) are objects of V rather than [sets](../../../../sets/objects/set.md). An ordinary [category](../../ordinary-categories/objects/category.md) is enriched over Set (with Cartesian product); replacing Set with a richer base V allows the [morphisms](../../ordinary-categories/morphisms/morphism.md) between two objects to carry additional structure — topological, algebraic, or homotopical.

An enriched category C consists of: a collection of objects, for each pair (A, B) a hom-object Hom(A, B) in V, composition maps Hom(B, C) ⊗ Hom(A, B) → Hom(A, C) using the [tensor product](../morphisms/tensor-product.md) of V, and identity maps I → Hom(A, A) from the [unit object](./unit-object.md). These must satisfy associativity and unit laws expressed as [commutative diagrams](../../ordinary-categories/concepts/commutative-diagram.md) in V.

A category enriched over the category of abelian groups has hom-groups (an additive category). A category enriched over the category of [topological spaces](../../../../topology/objects/topological-space.md) has hom-spaces (a topological category). A category enriched over [simplicial sets](../../infinity-categories/objects/simplicial-set.md) provides one model for [∞-categories](../../infinity-categories/objects/infinity-category.md). Enrichment is the mechanism by which "the [morphisms](../../ordinary-categories/morphisms/morphism.md) themselves have structure" — a principle central to higher [category theory](../../../_index.md) and to the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe, where the [Heyting algebra](../../../universes/semiotic-universe/terms/complete-heyting-algebra.md) H enriches the relationships between semantic values.
