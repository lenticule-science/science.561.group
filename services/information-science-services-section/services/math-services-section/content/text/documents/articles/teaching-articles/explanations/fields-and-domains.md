---
title: "Fields and Integral Domains"
aliases:
  - "Fields and Integral Domains"
date-created: 2026-03-05
tags: []
teaches:
  - "Fields and Integral Domains"
id: algebra-lesson-2
authors:
- claude-opus-4-6
type: explanation
article-kind: lesson
description: You should know the definition of a ring.
---

## Entry conditions

You should know the definition of a [ring](../../../../glossary/terms/ring.md).

## Definitions

An **[integral domain](../../../../glossary/terms/integral-domain.md)** is a commutative [ring](../../../../glossary/terms/ring.md) with no **zero divisors**: if $a \cdot b = 0$ then $a = 0$ or $b = 0$. This means multiplication behaves as expected — you can cancel nonzero factors.

A **[field](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md)** is a commutative ring in which every nonzero element has a multiplicative inverse. Equivalently, a field is a commutative ring where the nonzero elements form an [abelian group](../../../../glossary/terms/abelian-group.md) under multiplication.

Every field is an integral domain, but not every integral domain is a field. The integers $\mathbb{Z}$ are an integral domain but not a field ($2$ has no multiplicative inverse in $\mathbb{Z}$). The rationals $\mathbb{Q}$ are a field.

## Vocabulary (plain language)

- **Zero divisor**: a nonzero element that can multiply with another nonzero element to give zero.
- **Integral domain**: a ring without zero divisors.
- **Field**: a ring where division by any nonzero element is always possible.

## Intuition

Fields are the algebraic structures where arithmetic works as expected: you can add, subtract, multiply, and divide (except by zero). The rationals $\mathbb{Q}$, the reals $\mathbb{R}$, and the complex numbers $\mathbb{C}$ are all fields. Finite fields $\mathbb{F}_p$ (integers modulo a prime $p$) are crucial in [number theory](../../../../glossary/terms/number-theory.md) and cryptography.

## Worked example

The integers modulo 6, $\mathbb{Z}/6\mathbb{Z}$, are a ring but not an integral domain: $2 \cdot 3 = 0$ even though neither $2$ nor $3$ is zero. The integers modulo 5, $\mathbb{Z}/5\mathbb{Z}$, are a field: every nonzero element has a multiplicative inverse ($2 \cdot 3 = 1$, $4 \cdot 4 = 1$).

## Common mistakes

- Thinking $\mathbb{Z}$ is a field. The integers are "only" an integral domain.
- Confusing $\mathbb{Z}/n\mathbb{Z}$ for different $n$: it is a field when $n$ is prime, only a ring otherwise.
