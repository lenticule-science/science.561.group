---
title: "Binomial Coefficient"
aliases:
  - "binomial coefficient"
  - "binomial coefficients"
date-created: 2026-03-05
type: term
tags: []
defines:
  - "Binomial Coefficient"
  - "binomial coefficient"
---

The binomial coefficient $\binom{n}{k}$ (read "$n$ choose $k$") counts the number of [combinations](./combination.md) of $k$ elements from a set of $n$. It is defined as $\binom{n}{k} = \frac{n!}{k!(n-k)!}$ for $0 \leq k \leq n$.

Binomial coefficients satisfy the recurrence $\binom{n}{k} = \binom{n-1}{k-1} + \binom{n-1}{k}$, which generates Pascal's triangle. They appear as coefficients in the binomial theorem: $(x + y)^n = \sum_{k=0}^{n} \binom{n}{k} x^k y^{n-k}$.

The symmetry $\binom{n}{k} = \binom{n}{n-k}$ reflects the fact that choosing $k$ elements to include is the same as choosing $n - k$ elements to exclude.
