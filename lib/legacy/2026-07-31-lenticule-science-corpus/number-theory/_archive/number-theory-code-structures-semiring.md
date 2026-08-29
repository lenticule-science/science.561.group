---

title: "Semiring"
aliases:
  - "semiring"
  - "semirings"
date-created: 2025-12-26
introduces: definition
tags: []
requires:
  - ./addition.md
  - ./multiplication.md
  - ../../prealgebra/terms/monoid.md
specialization: monoid
defines:
  - "Semiring"
  - "semirings"
---

A semiring is an algebraic structure with two operations — [addition](../morphisms/addition.md) and [multiplication](../morphisms/multiplication.md) — that behave much like they do for ordinary numbers, except that subtraction is not required to be possible. The [natural numbers](teaching/explanations/natural-numbers.md) $\{0, 1, 2, 3, \ldots\}$ are the prototypical semiring: you can add and multiply them freely, but you cannot always subtract (there is no natural number $n$ such that $3 + n = 0$).

Formally, a semiring is a [set](../../sets/objects/set.md) $S$ equipped with two binary operations such that: $(S, +, 0)$ is a commutative [monoid](../../algebra/objects/monoid.md) (addition is associative, commutative, and has an identity element 0); $(S, \times, 1)$ is a monoid (multiplication is associative and has an identity element 1); multiplication distributes over addition from both sides ($a \times (b + c) = a \times b + a \times c$ and $(b + c) \times a = b \times a + c \times a$); and $0 \times a = a \times 0 = 0$ (zero annihilates under multiplication).

The natural numbers are just one example. The nonnegative real numbers form a semiring. The Boolean semiring $\{0, 1\}$ with OR as addition and AND as multiplication models the logic of true/false values. The tropical semiring $\mathbb{R} \cup \{\infty\}$ with minimum as "addition" and ordinary addition as "multiplication" arises in optimization, where you want to minimize costs along paths in a network — shortest-path algorithms are essentially linear algebra over the tropical semiring. Each of these semirings captures a setting where combining (addition) and scaling (multiplication) make sense, but undoing (subtraction) does not.

A [ring](../../algebra/objects/ring.md) is a semiring where the additive monoid is upgraded to a group — every element has an additive inverse, so subtraction is always possible. The integers $\mathbb{Z}$ are the simplest ring: they are the natural numbers with negatives adjoined. A [field](../../algebra/objects/field.md) goes further, requiring multiplicative inverses for all nonzero elements — so division (except by zero) is also always possible. The rationals $\mathbb{Q}$, the reals $\mathbb{R}$, and the complex numbers $\mathbb{C}$ are fields.

This gives the algebraic hierarchy: semiring $\to$ ring $\to$ field. Each step adds an increasingly strong inverse operation. The semiring is the most general — it asks only that the two operations exist and interact properly through the distributive law. This generality is why semirings appear in settings (combinatorics, formal language theory, optimization) where negative quantities or fractions would be meaningless.
