---

title: "Multiplication"
aliases:
  - "multiplication"
  - "product"
date-created: 2025-12-26
introduces: definition
tags: []
requires:
  - ./natural-numbers.md
  - ./addition.md
  - ./successor.md
description: "Multiplication is the operation of repeated addition — $3 \\times 4$ means adding 3 to itself 4 times: $3 + 3 + 3 + 3 = 12$."
---

Multiplication is the operation of repeated [addition](../../../../../../glossary/terms/addition.md) — $3 \times 4$ means adding 3 to itself 4 times: $3 + 3 + 3 + 3 = 12$. But this description, while correct for natural numbers, sells the concept short. Multiplication is the second fundamental operation of arithmetic, and its behavior — especially its interaction with addition through the distributive law — gives arithmetic its rich structure.

In the formal development of the [natural numbers](../../../../../../glossary/terms/natural-numbers.md), multiplication is defined recursively using addition and the [successor](../../../../../../glossary/terms/successor.md) function: $n \times 0 = 0$ (multiplying by zero gives zero), and $n \times S(m) = n + (n \times m)$ (multiplying by the successor of $m$ means adding one more copy of $n$). Just as addition reduces to repeated application of the successor, multiplication reduces to repeated addition. Exponentiation, in turn, reduces to repeated multiplication — each layer of arithmetic is built from the one below.

Multiplication is commutative ($a \times b = b \times a$), associative ($(a \times b) \times c = a \times (b \times c)$), and distributes over addition ($a \times (b + c) = a \times b + a \times c$). The number 1 is the [identity element](../../../../../../glossary/terms/identity-element.md): $n \times 1 = n$. The number [zero](../../../../../../glossary/terms/zero.md) is the annihilator: $n \times 0 = 0$.

Together with addition, multiplication makes the natural numbers a commutative [semiring](../../../../../../glossary/terms/semiring.md) — a structure with two operations where multiplication distributes over addition. The semiring structure is where the real power lies, because the distributive law is what connects the two operations and makes factoring, expanding, and simplifying expressions possible.

The interaction between addition and multiplication is the source of number theory's deepest questions. The [primes](../../../../../../glossary/terms/prime.md) are the multiplicative atoms — the numbers that cannot be broken into smaller factors. The fundamental theorem of arithmetic says every integer greater than 1 factors uniquely into primes. But additive questions about primes remain open: Goldbach's conjecture (every even integer greater than 2 is a sum of two primes, stated by Christian Goldbach in a 1742 letter to Leonhard Euler) and the twin prime conjecture (there are infinitely many pairs of primes differing by 2) have resisted proof for centuries. The difficulty is that addition and multiplication, while linked by the distributive law, are in deep tension — knowing the multiplicative structure of a number tells you almost nothing about its additive properties.

In abstract algebra, the pattern of two interacting operations generalizes. A ring has both addition (forming a group) and multiplication (distributing over addition). A [field](../../../../research/2026/07/31/algebra/objects/field.md) has both operations with full invertibility. In a [lattice](../../../../research/2026/07/31/order/objects/lattice.md), [meet](../../../../research/2026/07/31/order/morphisms/meet.md) ($\wedge$) plays the role of multiplication — the conjunctive operation that produces the greatest lower bound — and the distributive law $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$ mirrors exactly how multiplication distributes over addition.
