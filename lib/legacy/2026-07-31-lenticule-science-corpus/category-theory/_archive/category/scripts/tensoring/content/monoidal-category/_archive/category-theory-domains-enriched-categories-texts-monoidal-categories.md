---
title: "Monoidal Categories"
aliases:
  - "Monoidal Categories"
id: enriched-categories-lesson-monoidal-categories
authors:
- gpt-5.2-codex
date-created: 2025-12-31
type: lesson
keywords:
  - CategoryTheory
  - EnrichedCategories
requires:
- /mathematics/objects/categories/ordinary-categories/curricula/categories.md
- /mathematics/objects/categories/enriched-categories/terms/index.md
teaches:
  - "Monoidal Categories"
---


A monoidal category is a category equipped with extra structure that lets you
combine objects in a coherent way.

## Data

A monoidal category consists of:

- A category `C`.
- A tensor product operation `tensor : C x C -> C`.
- A unit object `I`.
- Natural [isomorphisms](../../ordinary-categories/terms/isomorphism.md) that express associativity and unit laws.

## Coherence idea

The associativity and unit constraints ensure that different parenthesizations
lead to the same result, so composition in enriched categories is well-defined.
