---
title: "Enriched Categories"
description: "An enriched category replaces hom-sets with hom-objects from a fixed monoidal category."
aliases:
  - "Enriched Categories"
date-created: 2025-12-31
keywords:
  - category-theory
  - enriched-categories
requires:
- /mathematics/objects/categories/enriched-categories/curricula/monoidal-categories.md
- /mathematics/objects/categories/enriched-categories/terms/index.md
teaches:
  - "Enriched Categories"
type: term

---

An enriched category replaces hom-sets with hom-objects from a fixed monoidal
category.

## Data

An enriched category over a monoidal category `V` has:

- A class of objects.
- For each pair of objects `(x, y)`, a hom-object `V(x, y)` in `V`.
- Composition maps `V(y, z) tensor V(x, y) -> V(x, z)`.
- Unit maps `I -> V(x, x)`.

## Why this matters

Enrichment lets [morphisms](../terms/morphism.md) carry structure such as topology, probability, or
order, instead of being just elements of a set.

## Additional material from the Google Drive library

Enriched Categories is a domain within Categories.
