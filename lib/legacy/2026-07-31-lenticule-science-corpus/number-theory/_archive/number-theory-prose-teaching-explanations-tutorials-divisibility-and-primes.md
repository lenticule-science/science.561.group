---
title: "Divisibility and Primes"
aliases:
  - "Divisibility and Primes"
date-created: 2026-03-05
tags: []
introduces:
  - "Divisibility and Primes"
type: overview
status: current
---
## Entry conditions

You should be familiar with [natural numbers](../teaching/explanations/natural-numbers.md), [addition](../morphisms/addition.md), and [multiplication](../morphisms/multiplication.md).

## Definitions

An integer $a$ **[divides](../teaching/explanations/divisibility.md)** an integer $b$ (written $a \mid b$) if there exists an integer $k$ such that $b = ak$.

A **[prime](../teaching/explanations/prime.md)** is an integer $p > 1$ whose only positive divisors are $1$ and $p$ itself. An integer greater than $1$ that is not prime is **composite**.

The **[greatest common divisor](../teaching/explanations/greatest-common-divisor.md)** $\gcd(a, b)$ is the largest positive integer dividing both $a$ and $b$. The **least common multiple** $\operatorname{lcm}(a, b)$ is the smallest positive integer divisible by both.

**Fundamental theorem of arithmetic**: every integer greater than $1$ factors uniquely (up to order) as a product of primes. This makes the primes the "atoms" of multiplicative arithmetic.

## Vocabulary (plain language)

- **Divides**: $a$ goes into $b$ evenly.
- **Prime**: a number with no nontrivial factors.
- **GCD**: the largest shared factor.

## Symbols used

- $a \mid b$: $a$ divides $b$.
- $\gcd(a, b)$: greatest common divisor.
- $\operatorname{lcm}(a, b)$: least common multiple.

## Intuition

Divisibility imposes a [partial order](../../order/objects/partial-order.md) on the positive integers. In this order, primes are the atoms — they sit just above $1$ and cannot be broken down further. The fundamental theorem says every number is built from primes in exactly one way.

The Euclidean algorithm computes $\gcd(a, b)$ efficiently by repeated division: $\gcd(a, b) = \gcd(b, a \bmod b)$, terminating when the remainder is zero.

## Worked example

To find $\gcd(48, 18)$: $48 = 2 \cdot 18 + 12$, then $18 = 1 \cdot 12 + 6$, then $12 = 2 \cdot 6 + 0$. So $\gcd(48, 18) = 6$.

The prime factorizations are $48 = 2^4 \cdot 3$ and $18 = 2 \cdot 3^2$. The GCD takes the minimum exponent of each prime: $2^1 \cdot 3^1 = 6$.

## Common mistakes

- Calling $1$ a prime. By convention, $1$ is neither prime nor composite.
- Forgetting that the fundamental theorem requires uniqueness *up to order* of factors.
