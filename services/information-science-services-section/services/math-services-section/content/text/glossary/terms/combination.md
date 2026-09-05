---
name: "Combination"
aliases:
  - "combination"
  - "combinations"
date-created: 2026-03-05
tags: []
---

A combination is an unordered selection of elements from a set. The number of ways to choose $k$ elements from a set of $n$ is the [binomial coefficient](./binomial-coefficient.md) $\binom{n}{k}$.

Combinations differ from [permutations](./permutation.md) in that order does not matter: $\{A, B, C\}$ and $\{C, A, B\}$ are the same combination but different permutations. The relationship is $\binom{n}{k} = \frac{n!}{k!(n-k)!}$, which divides the number of $k$-permutations by $k!$ to account for the $k!$ orderings of each selection.
