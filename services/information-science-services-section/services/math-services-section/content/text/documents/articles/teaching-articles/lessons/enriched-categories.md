---
title: "Enriched Categories"
aliases:
  - "Enriched Categories"
id: enriched-categories-lesson-enriched-categories
authors:
- gpt-5.2-codex
date-created: 2025-12-31
type: lesson
keywords:
  - category-theory
  - enriched-categories
requires:
- /mathematics/objects/categories/enriched-categories/curricula/monoidal-categories.md
- /mathematics/objects/categories/enriched-categories/terms/index.md
teaches:
  - "Enriched Categories"
description: An enriched category replaces hom-sets with hom-objects from a fixed monoidal category.
depends-on:
  - /mathematics/objects/categories/enriched-categories/curricula/monoidal-categories.md
  - /mathematics/objects/categories/enriched-categories/terms/index.md
introduces:
  - Enriched Categories
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

Enrichment lets [morphisms](../../../../glossary/terms/morphism.md) carry structure such as topology, probability, or
order, instead of being just elements of a set.
