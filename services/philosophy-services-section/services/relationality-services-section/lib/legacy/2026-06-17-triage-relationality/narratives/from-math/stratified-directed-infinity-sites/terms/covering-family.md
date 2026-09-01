---
name: "Covering Family"
date-created: 2025-12-26
introduces: term
tags: []
---

A covering family for an object U in a site or [∞-site](./infinity-site.md) is a collection of morphisms {fᵢ: Uᵢ → U} that together "cover" U — they jointly provide enough information about U that any compatible local data on the Uᵢ determines global data on U. Covering families are the covers specified by the Grothendieck topology.

A covering family must satisfy the axioms of the Grothendieck topology: the identity covers every object, covers are stable under pullback, and covers compose transitively. These axioms ensure that the notion of "local data" is well behaved and that the sheaf condition is meaningful. Different choices of covering families on the same category yield different topologies and different categories of sheaves.

In a [stratified directed ∞-site](./working-definition.md), covering families must respect the [stratification](./stratification.md) and [directed](./directed.md) structure: the morphisms in a covering family must be compatible with the layering of objects into [strata](./stratum.md) and with the preferred direction of [refinement](./refinement.md). This ensures that the sheaves on the stratified site respect the layered, directed geometry.
