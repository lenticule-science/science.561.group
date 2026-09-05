---
title: "Rings"
aliases:
  - "Rings"
date-created: 2026-03-05
tags: []
teaches:
  - "Rings"
id: algebra-lesson-1
authors:
- claude-opus-4-6
type: explanation
article-kind: lesson
---

## Entry conditions

You should be comfortable with [groups](../../../../glossary/terms/group.md) and [monoids](../../../../glossary/terms/monoid.md).

## Definitions

A **[ring](../../../../glossary/terms/ring.md)** $(R, +, \cdot, 0, 1)$ is a set $R$ with two binary operations satisfying:

1. $(R, +, 0)$ is an [abelian group](../../../../glossary/terms/abelian-group.md).
2. $(R, \cdot, 1)$ is a [monoid](../../../../glossary/terms/monoid.md).
3. Multiplication distributes over addition: $a \cdot (b + c) = a \cdot b + a \cdot c$ and $(b + c) \cdot a = b \cdot a + c \cdot a$.

If $\cdot$ is also commutative, the ring is **commutative**.

## Vocabulary (plain language)

- **Ring**: a set with addition and multiplication where addition forms a group and multiplication distributes over addition.
- **Commutative ring**: a ring where $a \cdot b = b \cdot a$.
- **Unit**: an element with a multiplicative inverse.

## Symbols used

- $(R, +, \cdot)$: a ring with addition and multiplication.
- $0$: the additive identity.
- $1$: the multiplicative identity.

## Intuition

A ring is what you get when you take integers as a model and ask: what properties do addition and multiplication really need? The integers $\mathbb{Z}$ satisfy all the ring axioms. So do [polynomials](../../../../glossary/terms/polynomial.md), matrices, and many other objects.

The key idea is that addition is fully reversible (it forms a group) while multiplication need not be — you cannot always divide in a ring. Structures where you can always divide (by nonzero elements) are [fields](../../../../glossary/terms/field.md).

## Worked example

The integers $(\mathbb{Z}, +, \cdot, 0, 1)$ form a commutative ring. Addition gives an [abelian group](../../../../glossary/terms/abelian-group.md). Multiplication is associative with identity $1$ and distributes over addition. But most integers have no multiplicative inverse in $\mathbb{Z}$ — for instance, there is no integer $n$ with $2n = 1$.

## Common mistakes

- Forgetting that ring multiplication need not be commutative. Matrix rings are non-commutative.
- Assuming every nonzero element has a multiplicative inverse. That is a [field](../../../../glossary/terms/field.md), not just a ring.
