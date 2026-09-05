---

title: "Integral Domain"
aliases:
  - "integral domain"
  - "integral domains"
date-created: 2026-03-05
tags: []
---

An integral domain is a commutative [ring](./ring.md) where multiplication behaves the way you expect it to: if the product of two things is zero, then at least one of them must be zero. This property — the absence of zero divisors — is so natural that it takes effort to imagine a ring without it. But such rings exist. In $\mathbb{Z}/6\mathbb{Z}$ (the integers modulo 6), $2 \times 3 = 6 \equiv 0 \pmod{6}$, even though neither 2 nor 3 is zero modulo 6. That makes $\mathbb{Z}/6\mathbb{Z}$ not an integral domain. The integers $\mathbb{Z}$, by contrast, are the prototypical integral domain: if $ab = 0$ in $\mathbb{Z}$, then $a = 0$ or $b = 0$, period.

Formally, an integral domain is a commutative ring with $1 \neq 0$ and the property that for all $a, b$ in the ring, $a \cdot b = 0$ implies $a = 0$ or $b = 0$. The condition $1 \neq 0$ excludes the trivial zero ring (which has only one element and is a degenerate case).

The absence of zero divisors is equivalent to the cancellation law: if $a \cdot b = a \cdot c$ and $a \neq 0$, then $b = c$. You can "cancel" a common nonzero factor from both sides of an equation. In a ring with zero divisors, cancellation fails: in $\mathbb{Z}/6\mathbb{Z}$, $2 \times 1 = 2 \times 4$ (both are $2 \bmod 6$), but $1 \neq 4$. The ability to cancel is what makes algebraic manipulation in integral domains feel like working with ordinary numbers.

Every [field](./field.md) is an integral domain — if $ab = 0$ and $a \neq 0$, multiply both sides by $a^{-1}$ to get $b = 0$. But not every integral domain is a field: the integers are an integral domain, but $2$ has no multiplicative inverse in $\mathbb{Z}$ (there is no integer $n$ with $2n = 1$). [Polynomial](./polynomial.md) rings $F[x]$ over a field $F$ are integral domains for the same reason: the degree of a product is the sum of the degrees, so a nonzero polynomial times a nonzero polynomial cannot be zero.

Every integral domain can be embedded into a field — its field of fractions — by the same construction that builds the rationals from the integers. You form formal fractions $a/b$ (with $b \neq 0$), declare $a/b = c/d$ when $ad = bc$, and define addition and multiplication in the usual way. The field of fractions of $\mathbb{Z}$ is $\mathbb{Q}$. The field of fractions of $F[x]$ is the field of rational functions $F(x)$. This construction guarantees that every integral domain has a natural home inside a field, extending the original ring with just enough new elements to make division (by nonzero elements) always possible.
