---
title: "Addition"
aliases:
  - "addition"
  - "sum"
date-created: 2025-12-26
type: definition
tags: []
requires:
  - ./natural-numbers.md
  - ./successor.md
  - ./zero.md
  - ./induction.md
---

Addition is the operation that combines two [natural numbers](./natural-numbers.md) into their sum. It is defined recursively using the [successor](./successor.md) function: n + 0 = n (adding zero does nothing) and n + S(m) = S(n + m) (adding a successor is the successor of adding). These two clauses, together with the [induction](./induction.md) principle, determine addition for all natural numbers.

Addition is commutative (a + b = b + a), associative ((a + b) + c = a + (b + c)), and has [zero](./zero.md) as its [identity element](../../prealgebra/terms/identity-element.md). The natural numbers under addition form a commutative [monoid](../../prealgebra/terms/monoid.md). Extending to the integers (by including additive inverses) gives a commutative [group](../../groups/terms/abelian-group.md).

Addition extends to larger number systems — integers, rationals, reals, complex numbers — always preserving commutativity and associativity. In a [lattice](../../posets/terms/lattice.md), [join](../../posets/terms/join.md) plays a role analogous to addition: the join of two elements is their least upper bound, combining their information. In the [Heyting algebra](../../../concepts/heyting-algebra/index.md) H, the join a ∨ b is the semantic analogue of combining two values.
