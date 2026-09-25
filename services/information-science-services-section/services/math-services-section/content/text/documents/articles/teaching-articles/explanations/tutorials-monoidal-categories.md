---
title: "Monoidal Categories"
description: "A monoidal category is a category equipped with extra structure that lets you combine objects in a coherent way."
aliases:
  - "Monoidal Categories"
date-created: 2025-12-31
keywords:
  - category-theory
  - enriched-categories
depends-on:
- /mathematics/objects/categories/ordinary-categories/curricula/categories.md
- /mathematics/objects/categories/enriched-categories/terms/index.md
introduces:
  - "Monoidal Categories"
type: overview
status: current
---
A monoidal category is a category equipped with extra structure that lets you
combine objects in a coherent way.

## Data

A monoidal category consists of:

- A category `C`.
- A tensor product operation `tensor : C x C -> C`.
- A unit object `I`.
- Natural [isomorphisms](../../research/2026/07/31/lenticule-import/_archive/category/scripts/tensoring/content/ordinary-categories/morphisms/isomorphism.md) that express associativity and unit laws.

## Coherence idea

The associativity and unit constraints ensure that different parenthesizations
lead to the same result, so composition in enriched categories is well-defined.
