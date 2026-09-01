---
title: "Categories"
aliases:
  - "Categories"
date-created: 2025-12-26
tags: []
teaches:
  - "Categories"
id: category-theory-lesson-1
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
---

## Entry conditions

Use a category only when you can:

- Identify objects and [morphisms](../../../../glossary/terms/morphism.md) between them.
- Define composition of [morphisms](../../../../glossary/terms/morphism.md) that is associative.
- Provide identity [morphisms](../../../../glossary/terms/morphism.md) for every object.

If composition is undefined or not associative, do not use category theory.

## Definitions

- A **category** has objects, [morphisms](../../../../glossary/terms/morphism.md), identities, and associative composition.

## Vocabulary (plain language)

- **Object**: a thing you care about (a set, state, type, or context).
- **Morphism**: a directed arrow or process from one object to another.
- **Composition**: doing one [morphism](../../../../glossary/terms/morphism.md) after another.
- **Identity [morphism](../../../../glossary/terms/morphism.md)**: the "do nothing" [morphism](../../../../glossary/terms/morphism.md) for an object.
## Symbols used

## Symbols used

- $f:A \to B$: a morphism from object $A$ to object $B$.
- $g \circ f$: compose $f$ then $g$.
- $\mathrm{id}_A$: the identity morphism on $A$.

## Intuition

Categories are about processes between things, not just the things themselves. Objects can be types, states, or contexts. Morphisms are the allowed transformations. Composition means "do this, then that," and associativity means the grouping does not matter.

## What the axioms mean

- **Identity**: every object has a "do nothing" morphism.
- **Associativity**: if $f$, $g$, $h$ can compose, then $(h \circ g) \circ f = h \circ (g \circ f)$.

## Worked examples

### Example 1: A category from sets

Objects are sets. Morphisms are functions between sets. Composition is function composition. Identities are identity functions. This is the category **Set**.

### Example 2: A category from a [partial order](../../../../glossary/terms/partial-order.md)

Given a [partial order](../../../../glossary/terms/partial-order.md) $(S,\leq)$, make a category where there is a morphism $a \to b$ exactly when $a \leq b$. Composition exists because $\leq$ is transitive.

## How to recognize the structure

- Can you compose your transformations? Is it associative?
- Does each object have an identity transformation?

## Common mistakes

- Treating informal "influences" as [morphisms](../../../../glossary/terms/morphism.md) without explicit composition.
## Minimal data

- A list of objects.
- A list of [morphisms](../../../../glossary/terms/morphism.md) with source and target.
- A composition rule and identity for each object.

## Misuse warnings

- Do not treat "influences" as [morphisms](../../../../glossary/terms/morphism.md) unless composition is explicit.
- Do not use [functors](../../../../glossary/terms/functor.md) if mapping does not preserve identities and composition.
