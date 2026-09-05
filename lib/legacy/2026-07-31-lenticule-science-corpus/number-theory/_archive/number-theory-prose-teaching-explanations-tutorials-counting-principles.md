---
title: "Counting Principles"
aliases:
  - "Counting Principles"
date-created: 2026-03-05
tags: []
introduces:
  - "Counting Principles"
type: overview
status: current
---
## Entry conditions

You should be comfortable with [natural numbers](../teaching/explanations/natural-numbers.md) and [multiplication](../morphisms/multiplication.md).

## Definitions

The **product rule**: if task A can be done in $m$ ways and task B in $n$ ways (independently), then doing both can be done in $m \times n$ ways.

The **sum rule**: if task A can be done in $m$ ways and task B in $n$ ways, and the two tasks are mutually exclusive, then doing one or the other can be done in $m + n$ ways.

A **[permutation](../teaching/explanations/permutation.md)** of $n$ objects is an arrangement of all $n$ objects in order. There are $n! = n \times (n-1) \times \cdots \times 1$ permutations.

A **[combination](../teaching/explanations/combination.md)** selects $k$ objects from $n$ without regard to order. The number of combinations is the **[binomial coefficient](../teaching/explanations/binomial-coefficient.md)** $\binom{n}{k} = \frac{n!}{k!(n-k)!}$.

The **binomial theorem**: $(x + y)^n = \sum_{k=0}^{n} \binom{n}{k} x^k y^{n-k}$.

## Vocabulary (plain language)

- **Permutation**: an ordered arrangement.
- **Combination**: an unordered selection.
- **Binomial coefficient**: the number of ways to choose $k$ items from $n$.

## Intuition

Counting is the art of organizing choices. The product rule says independent choices multiply; the sum rule says exclusive alternatives add. Permutations count when order matters; combinations count when it does not.

## Worked example

How many 3-letter strings can be formed from {A, B, C, D, E} without repetition? This is a permutation: $5 \times 4 \times 3 = 60$. How many 3-element subsets? This is a combination: $\binom{5}{3} = 10$.

## Common mistakes

- Confusing permutations (order matters) with combinations (order does not).
- Applying the product rule when choices are not independent.
