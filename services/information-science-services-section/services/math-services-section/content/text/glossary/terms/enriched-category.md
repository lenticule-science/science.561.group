---
name: "Enriched Category"
aliases:
  - "enriched category"
  - "enriched categories"
date-created: 2025-12-31
tags: []
type: term
---

An enriched category over a [monoidal category](./monoidal-category.md) V is a category-like structure whose [hom-objects](./hom-object.md) are objects of V rather than [sets](./set.md). An ordinary [category](./category.md) is enriched over Set (with Cartesian product); replacing Set with a richer base V allows the [morphisms](./morphism.md) between two objects to carry additional structure — topological, algebraic, or homotopical.

An enriched category C consists of: a collection of objects, for each pair (A, B) a hom-object Hom(A, B) in V, composition maps Hom(B, C) ⊗ Hom(A, B) → Hom(A, C) using the [tensor product](./tensor-product.md) of V, and identity maps I → Hom(A, A) from the [unit object](./unit-object.md). These must satisfy associativity and unit laws expressed as [commutative diagrams](./commutative-diagram.md) in V.

A category enriched over the category of abelian groups has hom-groups (an additive category). A category enriched over the category of [topological spaces](./topological-space.md) has hom-spaces (a topological category). A category enriched over [simplicial sets](./simplicial-set.md) provides one model for [∞-categories](./infinity-category.md). Enrichment is the mechanism by which "the [morphisms](./morphism.md) themselves have structure" — a principle central to higher category theory and to the semiotic universe, where the Heyting algebra H enriches the relationships between semantic values.
