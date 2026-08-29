---
title: "Natural Transformations"
aliases:
  - "Natural Transformations"
date-created: 2025-12-26
tags: []
teaches:
  - "Natural Transformations"
id: category-theory-lesson-3
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
---

## Entry conditions

Use [natural transformations](../../../../glossary/terms/natural-transformation.md) only when you already have:

- Two [functors](../../../../glossary/terms/functor.md) $F, G:C \to D$ between the same categories.
- A [morphism](../../../../glossary/terms/morphism.md) in $D$ for each object of $C$.
- A requirement that these [morphisms](../../../../glossary/terms/morphism.md) are compatible with all [morphisms](../../../../glossary/terms/morphism.md) in $C$.

## Definitions

- A **[natural transformation](../../../../glossary/terms/natural-transformation.md)** $\eta:F \Rightarrow G$ assigns to each object $A$ in $C$ a [morphism](../../../../glossary/terms/morphism.md) $\eta_A: F(A) \to G(A)$ in $D$, such that for every [morphism](../../../../glossary/terms/morphism.md) $f:A \to B$ in $C$,
$$
G(f) \circ \eta_A = \eta_B \circ F(f).
$$

## Vocabulary (plain language)

- **Component**: the specific [morphism](../../../../glossary/terms/morphism.md) $\eta_A$ for an object $A$.
- **Naturality**: the condition that the square above commutes for every [morphism](../../../../glossary/terms/morphism.md).

## Symbols used

- $\eta:F \Rightarrow G$: a [natural transformation](../../../../glossary/terms/natural-transformation.md).
- $\eta_A$: the component at $A$.

## Intuition

A [natural transformation](../../../../glossary/terms/natural-transformation.md) is a systematic way to transform one [functor](../../../../glossary/terms/functor.md) into another without breaking structure. It says that the transformation is compatible with every [morphism](../../../../glossary/terms/morphism.md) in the source category.

## Worked example

Let $F,G:\mathbf{Set} \to \mathbf{Set}$ both map a set to a product with a fixed set. The projection maps form a [natural transformation](../../../../glossary/terms/natural-transformation.md) because they commute with all functions between sets.

## How to recognize the structure

- You can assign a component [morphism](../../../../glossary/terms/morphism.md) for every object.
- The naturality square commutes for every [morphism](../../../../glossary/terms/morphism.md).

## Common mistakes

- Defining components without checking naturality.
- Using different categories for $F$ and $G$.

## Minimal data

- Two [functors](../../../../glossary/terms/functor.md) $F$ and $G$ with the same source and target.
- A component morphism for each object.
- A proof of the naturality condition.
