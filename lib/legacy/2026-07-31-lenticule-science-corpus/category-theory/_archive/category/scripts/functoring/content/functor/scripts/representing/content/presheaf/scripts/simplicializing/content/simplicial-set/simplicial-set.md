---
title: "Simplicial Set"
aliases:
  - "simplicial set"
  - "simplicial sets"
date-created: 2025-12-31
type: term
tags: []
defines:
  - "Simplicial Set"
  - "simplicial sets"
---

A simplicial set is a [functor](../../ordinary-categories/terms/functor.md) X: Δᵒᵖ → Set, where Δ is the simplex category (objects are the finite ordinals [0], [1], [2], ..., [morphisms](../../ordinary-categories/terms/morphism.md) are order-preserving maps) and Set is the [category](../../ordinary-categories/terms/category.md) of [sets](../../../sets/terms/set.md). Concretely, a simplicial set consists of a set Xₙ of n-simplices for each n ≥ 0, together with face maps dᵢ: Xₙ → Xₙ₋₁ (removing the i-th vertex) and degeneracy maps sᵢ: Xₙ → Xₙ₊₁ (repeating the i-th vertex), satisfying the simplicial identities.

Simplicial sets encode combinatorial topology: a 0-simplex is a point, a 1-simplex is an edge, a 2-simplex is a triangle, and so on. Every topological space has a singular simplicial set (whose n-simplices are continuous maps from the standard n-simplex into the space), and every simplicial set has a geometric realization as a topological space. This [adjunction](../../../../disciplines/higher-topos-theory/terms/adjunction.md) connects combinatorial and topological approaches to [homotopy theory](../../../../disciplines/homotopy-theory/terms/homotopy.md).

Simplicial sets provide the combinatorial foundation for higher [category theory](../../index.md). A [quasi-category](./quasi-category.md) is a simplicial set satisfying a [horn](./horn.md)-filling condition, and this model of [∞-categories](./infinity-category.md) is the basis of Lurie's framework for [(∞,1)-categories](../../../../disciplines/higher-topos-theory/terms/infinity-1-category.md) and [(∞,1)-topoi](../../../../disciplines/higher-topos-theory/terms/infinity-1-topos.md). Simplicial sets also serve as the base for simplicial enrichment of categories, replacing hom-sets with hom-simplicial-sets whose simplices witness homotopies between [morphisms](../../ordinary-categories/terms/morphism.md).
