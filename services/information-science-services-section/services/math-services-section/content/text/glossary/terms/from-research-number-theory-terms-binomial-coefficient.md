---
name: "Binomial Coefficient"
date-created: 2026-03-05
---

The binomial coefficient (nk)\binom{n}{k} (read &ldquo;nn choose kk&rdquo;) counts the number of [combinations](combination.md) of $k$ elements from a set of $n$. It is defined as (nk)=n!k!(n−k)!\binom{n}{k} = \frac{n!}{k!(n-k)!} for $0 \leq k \leq n$.

Binomial coefficients satisfy the recurrence (nk)=(n−1k−1)+(n−1k)\binom{n}{k} = \binom{n-1}{k-1} + \binom{n-1}{k}, which generates Pascal&rsquo;s triangle. They appear as coefficients in the binomial theorem: (x+y)n=∑k=0n(nk)xkyn−k(x + y)^n = \sum_{k=0}^{n} \binom{n}{k} x^k y^{n-k}.

The symmetry (nk)=(nn−k)\binom{n}{k} = \binom{n}{n-k} reflects the fact that choosing $k$ elements to include is the same as choosing n−kn - k elements to exclude.
