---

title: "Binomial Coefficient"
description: "The binomial coefficient $\binom{n}{k}$ (read \"$n$ choose $k$\") counts the number of ways to choose $k$ objects from $n$ without regard to order — the number of [combinations](./combination.md). It is defined as $\binom{n}{k} = \frac{n!}{k!(n-k)!}$ for $0 leq k leq n$. For example, $\binom{5}{2} = \frac{5!}{2! cdot 3!} = \frac{120}{2 cdot 6} = 10$: there are 10 ways to choose 2 objects from 5."
aliases:
  - "binomial coefficient"
  - "binomial coefficients"
date-created: 2026-03-05
tags: []
---

The binomial coefficient $\binom{n}{k}$ (read "$n$ choose $k$") counts the number of ways to choose $k$ objects from $n$ without regard to order — the number of [combinations](./combination.md). It is defined as $\binom{n}{k} = \frac{n!}{k!(n-k)!}$ for $0 \leq k \leq n$. For example, $\binom{5}{2} = \frac{5!}{2! \cdot 3!} = \frac{120}{2 \cdot 6} = 10$: there are 10 ways to choose 2 objects from 5.

The binomial coefficients have a beautiful recursive structure: $\binom{n}{k} = \binom{n-1}{k-1} + \binom{n-1}{k}$. This says that each element either is or is not in the chosen subset — if it is in, you need to choose $k-1$ more from the remaining $n-1$; if it is not, you need to choose all $k$ from the remaining $n-1$. This recurrence generates Pascal's triangle, where each entry is the sum of the two entries above it:

$$\begin{array}{ccccccc}
& & & 1 & & & \\
& & 1 & & 1 & & \\
& 1 & & 2 & & 1 & \\
1 & & 3 & & 3 & & 1 \\
\end{array}$$

The triangle was known to Yang Hui in China (c. 1261), al-Karaji in Persia (c. 1000 CE), and Bhaskara II in India (c. 1150 CE), centuries before Blaise Pascal studied its properties systematically in *Traité du Triangle Arithmétique* (published posthumously, 1665). Pascal's contribution was not the triangle itself but the depth of his analysis: he proved the recurrence, derived combinatorial identities, and connected the triangle to problems in probability.

The binomial coefficients earn their name from the binomial theorem: $(x + y)^n = \sum_{k=0}^{n} \binom{n}{k} x^k y^{n-k}$. Expanding $(x + y)^3$, for instance, gives $x^3 + 3x^2y + 3xy^2 + y^3$, with coefficients 1, 3, 3, 1 — the fourth row of Pascal's triangle. The binomial theorem was known in special cases for centuries (Isaac Newton generalized it to non-integer exponents in 1665), and the binomial coefficients are its structural backbone.

The symmetry $\binom{n}{k} = \binom{n}{n-k}$ has a clean combinatorial meaning: choosing $k$ elements to include is the same as choosing $n-k$ elements to exclude. The identity $\sum_{k=0}^{n} \binom{n}{k} = 2^n$ says that the total number of subsets of an $n$-element set is $2^n$ — each element is independently in or out, giving 2 choices per element.

Binomial coefficients appear throughout mathematics and its applications: in the binomial [distribution](../../probability/objects/distribution.md) of probability theory, in the expansion of [polynomials](../../algebra/objects/polynomial.md), in counting lattice paths, and in the combinatorial identities that underpin discrete mathematics.
