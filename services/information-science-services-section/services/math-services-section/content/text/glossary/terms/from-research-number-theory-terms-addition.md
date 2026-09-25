---
title: "Addition"
type: "definition"
date-created: 2025-12-26
---

Requires

- ./natural-numbers.md
- ./successor.md
- ./zero.md
- ./induction.md

Addition is the operation that combines two [natural numbers](natural-numbers.md) into their sum. It is defined recursively using the [successor](successor.md) function: n + 0 = n (adding zero does nothing) and n + S(m) = S(n + m) (adding a successor is the successor of adding). These two clauses, together with the [induction](../../documents/articles/research/2026/07/31/lenticule-import/_archive/induction.md) principle, determine addition for all natural numbers.

Addition is commutative (a + b = b + a), associative ((a + b) + c = a + (b + c)), and has [zero](zero.md) as its [identity element](identity-element.md). The natural numbers under addition form a commutative [monoid](monoid.md). Extending to the integers (by including additive inverses) gives a commutative [group](abelian-group.md).

Addition extends to larger number systems — integers, rationals, reals, complex numbers — always preserving commutativity and associativity. In a [lattice](../../documents/articles/research/2026/07/31/posets/terms/lattice.md), [join](../../documents/articles/research/2026/07/31/posets/terms/join.md) plays a role analogous to addition: the join of two elements is their least upper bound, combining their information. In the [Heyting algebra](../../documents/articles/research/2026/07/concepts/heyting-algebra/index.md) H, the join a ∨ b is the semantic analogue of combining two values.
