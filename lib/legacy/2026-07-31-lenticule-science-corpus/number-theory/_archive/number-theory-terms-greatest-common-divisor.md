---
title: "Greatest Common Divisor"
aliases:
  - "greatest common divisor"
  - "GCD"
  - "gcd"
date-created: 2026-03-05
type: term
tags: []
defines:
  - "Greatest Common Divisor"
  - "GCD"
---

The greatest common divisor of two integers $a$ and $b$, written $\gcd(a, b)$, is the largest positive integer that [divides](./divisibility.md) both $a$ and $b$.

The Euclidean algorithm computes the GCD efficiently: $\gcd(a, b) = \gcd(b, a \bmod b)$, terminating when the remainder reaches zero. This algorithm also yields a representation $\gcd(a, b) = sa + tb$ for some integers $s$ and $t$ (Bézout's identity).

In the divisibility [lattice](../../../objects/posets/terms/lattice.md) on positive integers, $\gcd(a, b)$ is the [meet](../../../objects/posets/terms/meet.md) of $a$ and $b$.
