---
title: "Semiring"
aliases:
  - "semiring"
  - "semirings"
date-created: 2025-12-26
type: definition
tags: []
requires:
  - ./addition.md
  - ./multiplication.md
  - ../../prealgebra/terms/monoid.md
extends:
  - ../../prealgebra/terms/monoid.md
defines:
  - "Semiring"
  - "semirings"
---

A semiring is a [set](../../sets/terms/set.md) equipped with two operations, [addition](./addition.md) (+) and [multiplication](./multiplication.md) (×), such that: (S, +, 0) is a commutative [monoid](../../prealgebra/terms/monoid.md), (S, ×, 1) is a monoid, multiplication distributes over addition from both sides, and 0 × a = a × 0 = 0. A semiring is like a ring but without requiring additive inverses — subtraction need not be possible.

The [natural numbers](./natural-numbers.md) are the prototypical semiring: they have addition and multiplication with the expected properties, but no negatives. Other examples include the nonnegative reals, the Boolean semiring ({0, 1} with OR and AND), and the tropical semiring (ℝ ∪ {∞} with min and +). Each captures a setting where "combining" and "scaling" make sense but "undoing" does not.

A [ring](../../../disciplines/algebra/terms/ring.md) is a semiring where (S, +, 0) is a [group](../../groups/terms/group.md) (additive inverses exist). A [field](../../../disciplines/algebra/terms/field.md) is a ring where (S \ {0}, ×, 1) is also a group (multiplicative inverses exist for nonzero elements). The algebraic hierarchy — semiring → [ring](../../../disciplines/algebra/terms/ring.md) → [field](../../../disciplines/algebra/terms/field.md) — adds increasingly strong inverse operations at each step.
