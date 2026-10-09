---
title: "Natural Transformations"
aliases:
  - "Natural Transformations"
date-created: 2025-12-26
tags: []
introduces:
  - "Natural Transformations"
type: overview
status: current
description: "Use natural transformations only when you already have:"
---
## Entry conditions

Use [natural transformations](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/natural-transformation.md) only when you already have:

- Two [functors](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/functor.md) $F, G:C \to D$ between the same categories.
- A [morphism](../../../../glossary/terms/morphism.md) in $D$ for each object of $C$.
- A requirement that these [morphisms](../../../../glossary/terms/morphism.md) are compatible with all [morphisms](../../../../glossary/terms/morphism.md) in $C$.

## Definitions

- A **[natural transformation](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/natural-transformation.md)** $\eta:F \Rightarrow G$ assigns to each object $A$ in $C$ a [morphism](../../../../glossary/terms/morphism.md) $\eta_A: F(A) \to G(A)$ in $D$, such that for every [morphism](../../../../glossary/terms/morphism.md) $f:A \to B$ in $C$,
$$
G(f) \circ \eta_A = \eta_B \circ F(f).
$$

## Vocabulary (plain language)

- **Component**: the specific [morphism](../../../../glossary/terms/morphism.md) $\eta_A$ for an object $A$.
- **Naturality**: the condition that the square above commutes for every [morphism](../../../../glossary/terms/morphism.md).

## Symbols used

- $\eta:F \Rightarrow G$: a [natural transformation](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/natural-transformation.md).
- $\eta_A$: the component at $A$.

## Intuition

A [natural transformation](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/natural-transformation.md) is a systematic way to transform one [functor](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/functor.md) into another without breaking structure. It says that the transformation is compatible with every [morphism](../../../../glossary/terms/morphism.md) in the source category.

## Worked example

Let $F,G:\mathbf{Set} \to \mathbf{Set}$ both map a set to a product with a fixed set. The projection maps form a [natural transformation](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/natural-transformation.md) because they commute with all functions between sets.

## How to recognize the structure

- You can assign a component [morphism](../../../../glossary/terms/morphism.md) for every object.
- The naturality square commutes for every [morphism](../../../../glossary/terms/morphism.md).

## Common mistakes

- Defining components without checking naturality.
- Using different categories for $F$ and $G$.

## Minimal data

- Two [functors](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/transforming/content/natural-transformation/morphisms/functor.md) $F$ and $G$ with the same source and target.
- A component morphism for each object.
- A proof of the naturality condition.
