---

title: "Successor"
aliases:
  - "successor"
  - "successor function"
date-created: 2025-12-26
introduces: definition
tags: []
part-of:
  - "Peano arithmetic"
requires:
  - ./natural-numbers.md
  - ./peano-axioms.md
  - ./zero.md
  - ./recursion.md
---

The successor operation S takes a [natural number](teaching/explanations/natural-numbers.md) n and produces the next natural number S(n). In the [Peano axioms](claims/peano-axioms.md), successor is the generating operation: starting from [zero](teaching/explanations/zero.md) and applying S repeatedly produces all natural numbers. Two of Peano's axioms constrain S: it is injective (S(n) = S(m) implies n = m) and zero is not in its range (there is no n with S(n) = 0).

Successor is the foundation for defining arithmetic by [recursion](teaching/explanations/recursion.md). [Addition](./addition.md) is defined as: n + 0 = n, n + S(m) = S(n + m). [Multiplication](./multiplication.md) is defined as: n × 0 = 0, n × S(m) = n + (n × m). Each operation is built from successor and the previous operations, making successor the single primitive from which all of arithmetic grows.

In [set](../../sets/objects/set.md) theory, the successor of n is S(n) = n ∪ {n}: the set n together with itself as a new [element](../../sets/concepts/element.md). In [category](../../categories/theories/ordinary-categories/objects/category.md) theory, successor is a [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md) S: N → N that, together with the zero map 0: 1 → N, characterizes the natural numbers object by its universal [property](../../../../../humanities/theories/philosophy/terms/property.md).
