---

title: "Enriched Category"
aliases:
  - "enriched category"
  - "enriched categories"
date-created: 2025-12-31
tags: []
description: An enriched category over a monoidal category V is a category-like structure whose hom-objects are objects of V rather than sets.
---

An enriched category over a [monoidal category](../../../../../../glossary/terms/monoidal-category.md) V is a category-like structure whose [hom-objects](../../../../../../glossary/terms/hom-object.md) are objects of V rather than [sets](../../../../../../glossary/terms/set.md). An ordinary [category](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/ordinary-categories/objects/category.md) is enriched over Set (with Cartesian product); replacing Set with a richer base V allows the [morphisms](../../../../../../glossary/terms/morphism.md) between two objects to carry additional structure — topological, algebraic, or homotopical.

An enriched category C consists of: a collection of objects, for each pair (A, B) a hom-object Hom(A, B) in V, composition maps Hom(B, C) ⊗ Hom(A, B) → Hom(A, C) using the [tensor product](../../../../../../glossary/terms/tensor-product.md) of V, and identity maps I → Hom(A, A) from the [unit object](../../../../../../glossary/terms/unit-object.md). These must satisfy associativity and unit laws expressed as [commutative diagrams](../../../../../../glossary/terms/commutative-diagram.md) in V.

A category enriched over the category of abelian groups has hom-groups (an additive category). A category enriched over the category of [topological spaces](../../../../../../glossary/terms/topological-space.md) has hom-spaces (a topological category). A category enriched over [simplicial sets](../../../../../../glossary/terms/simplicial-set.md) provides one model for [∞-categories](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/content/infinity-categories/objects/infinity-category.md). Enrichment is the mechanism by which "the [morphisms](../../../../../../glossary/terms/morphism.md) themselves have structure" — a principle central to higher [category theory](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/_index.md) and to the [semiotic](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/linguistics/topics/semiotics/index.md) universe, where the [Heyting algebra](../../../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/monoidal-category/scripts/enriching/universes/semiotic-universe/terms/complete-heyting-algebra.md) H enriches the relationships between semantic values.
