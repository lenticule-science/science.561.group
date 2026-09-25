---
title: "Multiplication"
type: "definition"
date-created: 2025-12-26
---

Requires

- ./natural-numbers.md
- ./addition.md
- ./successor.md

Multiplication is the operation that combines two [natural numbers](natural-numbers.md) into their product. It is defined recursively using [addition](addition.md) and the [successor](successor.md) function: n × 0 = 0 and n × S(m) = n + (n × m). Multiplication reduces to repeated addition, just as addition reduces to repeated successor.

Multiplication is commutative (a × b = b × a), associative ((a × b) × c = a × (b × c)), and distributes over addition (a × (b + c) = a × b + a × c). The number 1 is the [identity element](identity-element.md): n × 1 = n. Together with addition, multiplication makes the natural numbers a commutative [semiring](semiring.md).

In a [lattice](../../documents/articles/research/2026/07/31/posets/terms/lattice.md), [meet](../../documents/articles/research/2026/07/31/posets/terms/meet.md) plays a role analogous to multiplication: it is the &ldquo;conjunctive&rdquo; operation that takes two elements and produces their greatest lower bound. The distributive law in a distributive [lattice](../../documents/articles/research/2026/07/31/posets/terms/lattice.md) (a ∧ (b ∨ c) = (a ∧ b) ∨ (a ∧ c)) mirrors how multiplication distributes over addition. In a [Heyting algebra](../../documents/articles/research/2026/07/31/universes/semiotic-universe/terms/complete-heyting-algebra.md), this distributivity is guaranteed by the [lattice](../../documents/articles/research/2026/07/31/posets/terms/lattice.md) structure.
