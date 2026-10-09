---
title: "Functors"
aliases:
  - "Functors"
id: category-theory-lesson-2
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Functors"
description: "Use functors only when you already have:"
---

## Entry conditions

Use [functors](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/terms/functor.md) only when you already have:

- Two categories with explicit objects and [morphisms](../../../../glossary/terms/morphism.md).
- A way to map objects to objects and [morphisms](../../../../glossary/terms/morphism.md) to [morphisms](../../../../glossary/terms/morphism.md).
- Proof that identities and composition are preserved.

## Definitions

- A **[functor](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/terms/functor.md)** $F:C \to D$ maps objects of $C$ to objects of $D$ and [morphisms](../../../../glossary/terms/morphism.md) of $C$ to [morphisms](../../../../glossary/terms/morphism.md) of $D$, preserving identities and composition.

## Vocabulary (plain language)

- **Preserve identity**: $F(\mathrm{id}_A) = \mathrm{id}_{F(A)}$.
- **Preserve composition**: $F(g \circ f) = F(g) \circ F(f)$.

## Symbols used

- $F:C \to D$: a [functor](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/terms/functor.md) from category $C$ to category $D$.
- $F(f)$: the image of a [morphism](../../../../glossary/terms/morphism.md) $f$ under $F$.

## Intuition

A [functor](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/terms/functor.md) is a translation that respects structure. It moves both things and processes between things, without changing how composition works.

## Worked example

Let $U:\mathbf{Grp} \to \mathbf{Set}$ send each group to its underlying set and each group homomorphism to the same function. This preserves identities and composition, so $U$ is a [functor](../../research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/terms/functor.md).

## How to recognize the structure

- You have explicit object and [morphism](../../../../glossary/terms/morphism.md) mappings.
- Identities are preserved.
- Composition is preserved.

## Common mistakes

- Mapping objects but not [morphisms](../../../../glossary/terms/morphism.md).
- Failing to check preservation of composition.

## Minimal data

- Two categories.
- A mapping of objects and [morphisms](../../../../glossary/terms/morphism.md).
- Proofs of identity and composition preservation.
