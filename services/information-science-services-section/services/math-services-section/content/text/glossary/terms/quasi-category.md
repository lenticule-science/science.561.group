---
name: "Quasi-Category"
description: "A quasi-category is a [simplicial set](./simplicial-set.md) in which every inner [horn](./horn.md) has a filler: for every map Λⁿₖ → X with 0 < k < n, there exists an extension Δⁿ → X. This condition ensures that composites of [morphisms](./morphism.md) exist but are not required to be unique — they are unique only up to a contractible space of choices."
aliases:
  - "quasi-category"
  - "quasi-categories"
  - "quasicategory"
date-created: 2025-12-31
tags: []
type: term
---

A quasi-category is a [simplicial set](./simplicial-set.md) in which every inner [horn](./horn.md) has a filler: for every map Λⁿₖ → X with 0 < k < n, there exists an extension Δⁿ → X. This condition ensures that composites of [morphisms](./morphism.md) exist but are not required to be unique — they are unique only up to a contractible space of choices.

Quasi-categories are the most widely used combinatorial model of [∞-categories](./infinity-category.md). Every ordinary [category](./category.md) embeds into quasi-categories via its nerve (the simplicial set whose n-simplices are chains of n composable [morphisms](./morphism.md)), and the inner horn condition generalizes the fact that composites exist in a category. A quasi-category where all horns (not just inner ones) have fillers is a Kan complex — the model of an ∞-groupoid, where every [morphism](./morphism.md) is invertible up to [homotopy](./homotopy.md).

The theory of quasi-categories, developed extensively by André Joyal and Jacob Lurie, provides the combinatorial foundation for [(∞,1)-categories](./infinity-1-category.md) and [(∞,1)-topoi](./infinity-1-topos.md). Within this framework, the classical concepts of category theory — [functors](./functor.md), [natural transformations](./natural-transformation.md), [adjunctions](./adjunction.md), limits — all have well-defined ∞-categorical analogues.
