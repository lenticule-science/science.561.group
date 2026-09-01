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
---
## Entry conditions

Use [natural transformations](../morphisms/natural-transformation.md) only when you already have:

- Two [functors](../morphisms/functor.md) $F, G:C \to D$ between the same categories.
- A [morphism](../morphisms/morphism.md) in $D$ for each object of $C$.
- A requirement that these [morphisms](../morphisms/morphism.md) are compatible with all [morphisms](../morphisms/morphism.md) in $C$.

## Definitions

- A **[natural transformation](../morphisms/natural-transformation.md)** $\eta:F \Rightarrow G$ assigns to each object $A$ in $C$ a [morphism](../morphisms/morphism.md) $\eta_A: F(A) \to G(A)$ in $D$, such that for every [morphism](../morphisms/morphism.md) $f:A \to B$ in $C$,
$$
G(f) \circ \eta_A = \eta_B \circ F(f).
$$

## Vocabulary (plain language)

- **Component**: the specific [morphism](../morphisms/morphism.md) $\eta_A$ for an object $A$.
- **Naturality**: the condition that the square above commutes for every [morphism](../morphisms/morphism.md).

## Symbols used

- $\eta:F \Rightarrow G$: a [natural transformation](../morphisms/natural-transformation.md).
- $\eta_A$: the component at $A$.

## Intuition

A [natural transformation](../morphisms/natural-transformation.md) is a systematic way to transform one [functor](../morphisms/functor.md) into another without breaking structure. It says that the transformation is compatible with every [morphism](../morphisms/morphism.md) in the source category.

## Worked example

Let $F,G:\mathbf{Set} \to \mathbf{Set}$ both map a set to a product with a fixed set. The projection maps form a [natural transformation](../morphisms/natural-transformation.md) because they commute with all functions between sets.

## How to recognize the structure

- You can assign a component [morphism](../morphisms/morphism.md) for every object.
- The naturality square commutes for every [morphism](../morphisms/morphism.md).

## Common mistakes

- Defining components without checking naturality.
- Using different categories for $F$ and $G$.

## Minimal data

- Two [functors](../morphisms/functor.md) $F$ and $G$ with the same source and target.
- A component morphism for each object.
- A proof of the naturality condition.
