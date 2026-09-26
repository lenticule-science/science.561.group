---
name: "Stratum"
date-created: 2025-12-26
introduces: term
tags: []
aliases:
  - strata
  - stratum
type: term
---

A stratum is one layer in a [stratification](./stratification.md) — a single piece of the decomposition. In a stratified topological space, each stratum is typically a manifold (a smooth, uniform piece), and the full space is assembled by gluing strata of different dimensions together along their boundaries.

Strata are ordered by [refinement](./refinement.md): a lower stratum is coarser or more fundamental, a higher stratum is finer or more detailed. A refinement map from one stratum to another goes from coarser to finer, extracting more detailed information. The ordering of strata by refinement makes the collection of strata a partially ordered set (or, in the ∞-categorical setting, a poset-like structure with higher coherence).

In a [stratified directed ∞-site](./working-definition.md), each object belongs to a stratum, and the [directed](./directed.md) structure constrains which morphisms are allowed between objects in different strata. This prevents arbitrary mixing of layers and ensures that the site's [covering families](./covering-family.md) respect the stratification.
