---
title: "Stratum"
aliases:
  - "stratum"
  - "strata"
date-created: 2025-12-26
type: term
tags: []
defines:
  - "Stratum"
  - "strata"
---

A stratum is one layer in a [stratification](./stratification.md) — a single piece of the decomposition. In a stratified topological space, each stratum is typically a manifold (a smooth, uniform piece), and the full space is assembled by gluing strata of different dimensions together along their boundaries.

Strata are ordered by [refinement](./refinement.md): a lower stratum is coarser or more fundamental, a higher stratum is finer or more detailed. A refinement map from one stratum to another goes from coarser to finer, extracting more detailed information. The ordering of strata by refinement makes the collection of strata a [partially ordered set](../../posets/terms/partial-order.md) (or, in the ∞-categorical setting, a poset-like structure with higher coherence).

In a [stratified directed ∞-site](./working-definition.md), each object belongs to a stratum, and the [directed](./directed.md) structure constrains which [morphisms](../../categories/ordinary-categories/terms/morphism.md) are allowed between objects in different strata. This prevents arbitrary mixing of layers and ensures that the site's [covering families](./covering-family.md) respect the stratification.
