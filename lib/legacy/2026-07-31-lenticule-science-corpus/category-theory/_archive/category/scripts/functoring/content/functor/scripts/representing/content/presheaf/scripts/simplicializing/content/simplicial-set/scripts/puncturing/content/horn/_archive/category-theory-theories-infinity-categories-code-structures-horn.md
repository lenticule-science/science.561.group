---

title: "Horn"
description: "A horn Λⁿₖ is the [simplicial set](./simplicial-set.md) obtained from the boundary of the standard n-simplex Δⁿ by removing its k-th face. A horn is \"almost\" a simplex — it has all but one face, and the question of whether the missing face can be filled in determines the higher-categorical structure."
aliases:
  - "horn"
  - "horns"
date-created: 2025-12-31
tags: []
---

A horn Λⁿₖ is the [simplicial set](./simplicial-set.md) obtained from the boundary of the standard n-simplex Δⁿ by removing its k-th face. A horn is "almost" a simplex — it has all but one face, and the question of whether the missing face can be filled in determines the higher-categorical structure.

An inner horn is one where 0 < k < n: the missing face is not the first or last. An outer horn has k = 0 or k = n. The inner horn-filling condition — every inner horn has a filler — is the defining [property](../../../../../../../humanities/theories/philosophy/terms/property.md) of a [quasi-category](./quasi-category.md): it expresses that composites of [morphisms](../../ordinary-categories/morphisms/morphism.md) exist, though they need not be unique. If all horns (inner and outer) have unique fillers, the simplicial set is a Kan complex — the simplicial model of an ∞-groupoid, where all [morphisms](../../ordinary-categories/morphisms/morphism.md) are invertible.

Horn-filling conditions are the combinatorial replacement for composition laws. In an ordinary [category](../../ordinary-categories/objects/category.md), composition is a function; in an [∞-category](./infinity-category.md), composition is determined up to a contractible space of choices, and this indeterminacy is expressed by the existence (but not uniqueness) of horn fillers. The distinction between inner and outer horns captures the difference between categories (where only inner composition is guaranteed) and groupoids (where all [morphisms](../../ordinary-categories/morphisms/morphism.md) are invertible).
