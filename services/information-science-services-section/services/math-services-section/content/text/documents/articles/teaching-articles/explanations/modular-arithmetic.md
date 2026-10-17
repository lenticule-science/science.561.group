---
title: "Modular Arithmetic"
aliases:
  - "Modular Arithmetic"
date-created: 2026-03-05
tags: []
teaches:
  - "Modular Arithmetic"
id: number-theory-lesson-2
authors:
- claude-opus-4-6
type: explanation
article-kind: lesson
description: You should know divisibility and be comfortable with groups and rings.
---

## Entry conditions

You should know [divisibility](../../../../glossary/terms/divisibility.md) and be comfortable with [groups](../../../../glossary/terms/group.md) and [rings](../../../../glossary/terms/ring.md).

## Definitions

Two integers $a$ and $b$ are **[congruent](../../../../glossary/terms/congruence.md)** modulo $n$ (written $a \equiv b \pmod{n}$) if $n$ divides $a - b$.

Congruence modulo $n$ is an equivalence relation that partitions $\mathbb{Z}$ into $n$ residue classes. These classes form the [quotient group](../../../../glossary/terms/quotient-group.md) $\mathbb{Z}/n\mathbb{Z}$ under addition, and a [ring](../../../../glossary/terms/ring.md) under addition and multiplication.

$\mathbb{Z}/n\mathbb{Z}$ is a [field](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) if and only if $n$ is [prime](../../../../glossary/terms/prime.md). When $n$ is prime, every nonzero residue class has a multiplicative inverse.

## Vocabulary (plain language)

- **Congruent modulo $n$**: two numbers that leave the same remainder when divided by $n$.
- **Residue class**: the set of all integers congruent to a given number modulo $n$.

## Symbols used

- $a \equiv b \pmod{n}$: $a$ is congruent to $b$ modulo $n$.
- $\mathbb{Z}/n\mathbb{Z}$: the integers modulo $n$.

## Intuition

Modular arithmetic is "clock arithmetic." On a 12-hour clock, $8 + 7 = 3$ because $15 \equiv 3 \pmod{12}$. The residue classes are the positions on the clock face, and arithmetic wraps around.

The algebraic significance is that $\mathbb{Z}/n\mathbb{Z}$ is the simplest example of a [quotient group](../../../../glossary/terms/quotient-group.md) — and when $n$ is prime, the simplest example of a finite [field](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md).

## Worked example

In $\mathbb{Z}/7\mathbb{Z}$: $3 + 5 = 1$ (since $8 \equiv 1 \pmod{7}$), and $3 \cdot 5 = 1$ (since $15 \equiv 1 \pmod{7}$). So $3$ and $5$ are multiplicative inverses modulo $7$.

## Common mistakes

- Confusing $\mathbb{Z}/n\mathbb{Z}$ as a ring with $\mathbb{Z}/n\mathbb{Z}$ as a field. It is always a ring; it is a field only when $n$ is prime.
- Forgetting that congruence is an equivalence relation, not just a computational shortcut.
