---
title: "Presheaves"
aliases:
  - "Presheaves"
date-created: 2025-12-26
tags: []
introduces:
  - "Presheaves"
type: overview
status: current
---
## Entry conditions

Use [presheaves](../objects/presheaf.md) only when you can:

- Start from a site $(C,J)$ or at least a category $C$ of contexts.
- Assign data to each object in $C$.
- Define restriction maps along [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md).

## Definitions

- A **[presheaf](../objects/presheaf.md)** on a category $C$ assigns to each object $U$ a set $F(U)$, and to each [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md) $f:V \to U$ a restriction map $F(f):F(U) \to F(V)$, satisfying identity and composition laws.

## Vocabulary (plain language)

- **Section**: an element of $F(U)$, i.e., data on $U$.
- **Restriction**: a way to move data from a larger context to a smaller one.

## Symbols used

- $F$: a [presheaf](../objects/presheaf.md).
- $F(U)$: the data assigned to object $U$.
- $F(f)$: the restriction map along $f$.

## Intuition

A [presheaf](../objects/presheaf.md) is a bookkeeping system for data on each context, together with rules for how to restrict data when you move to a smaller context.

## Worked example

Let $C$ be the category of open sets of a space. A [presheaf](../objects/presheaf.md) can assign to each open set $U$ the set of real-valued functions on $U$, and restriction maps are literal restriction of functions to smaller open sets.

## How to recognize the structure

- You can assign data to every object.
- You can restrict data along every [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md).
- Restrictions compose correctly.

## Common mistakes

- Defining restrictions that do not compose.
- Forgetting to define restrictions for some [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md).

## Minimal data

- A category $C$.
- A set assignment $U \mapsto F(U)$.
- Restriction maps for every [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md).
