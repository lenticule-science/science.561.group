---
title: "Integers and Rationals"
aliases:
  - "Integers and Rationals"
date-created: 2025-12-26
tags: []
teaches:
  - "Integers and Rationals"
id: arithmetic-lesson-3
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
description: Extend $\mathbb{N}$ only when you can construct larger number systems from explicit equivalence relations or pairs.
---

## Entry conditions

Extend $\mathbb{N}$ only when you can construct larger number systems from explicit equivalence relations or pairs.

## Definitions

- **Integers** $\mathbb{Z}$ can be constructed as equivalence classes of pairs $(a,b)$ of natural numbers, with $(a,b) \sim (c,d)$ if $a+d=b+c$.
- **Rationals** $\mathbb{Q}$ can be constructed as equivalence classes of pairs $(a,b)$ with $b \neq 0$, with $(a,b) \sim (c,d)$ if $ad=bc$.

## Vocabulary (plain language)

- **Equivalence relation**: a relation that is reflexive, symmetric, and transitive.
- **Equivalence class**: a set of elements considered the same under the relation.

## Symbols used

- $\mathbb{Z}$: integers.
- $\mathbb{Q}$: rationals.

## Intuition

Integers arise by allowing subtraction to be always possible — making $(\mathbb{Z}, +)$ an [abelian group](../../../../glossary/terms/abelian-group.md) rather than merely a [monoid](../../../../glossary/terms/monoid.md). Rationals arise by allowing division by nonzero numbers, making $\mathbb{Q}$ a [field](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md). Both are built explicitly from natural numbers, not assumed.

## Worked example

The integer $-1$ can be represented as the equivalence class of $(0,1)$, since it behaves like "subtract 1." The rational $1/2$ can be represented by the class of $(1,2)$.

## How to recognize the structure

- You can define the equivalence relation clearly.
- You can show arithmetic operations are well-defined on classes.

## Common mistakes

- Treating negative numbers as primitive without a construction.
- Using fractions without specifying a nonzero denominator.
