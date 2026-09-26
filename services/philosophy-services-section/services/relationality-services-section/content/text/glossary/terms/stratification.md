---
name: "Stratification"
date-created: 2025-12-26
introduces: term
tags: []
aliases:
  - stratification
  - stratifications
type: term
---

A stratification is a decomposition of a space or category into layers called [strata](./stratum.md), ordered by [refinement](./refinement.md) or dimension. Formally, a stratification of an object X assigns to each point or sub-object a stratum label from a partially ordered set, such that the strata are compatible with the object's structure.

In topology, a stratified space is a topological space decomposed into manifold pieces of different dimensions (strata), glued together in a controlled way. The cone on a stratified space and the product of stratified spaces are again stratified. In the categorical setting, a stratification of a category C is a functor from C to a poset, partitioning objects into layers.

In a [stratified directed ∞-site](./working-definition.md), the stratification organizes the objects of the [∞-site](./infinity-site.md) into layers, and morphisms respect this layering — they either stay within a stratum or move between strata in a controlled direction. This ensures that the [covering families](./covering-family.md) and sheaf conditions respect the layered structure.
