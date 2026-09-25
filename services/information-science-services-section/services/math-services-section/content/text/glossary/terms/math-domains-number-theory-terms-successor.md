---
title: "Successor"
type: "definition"
date-created: 2025-12-26
---

Requires

- ./natural-numbers.md
- ./peano-axioms.md
- ./zero.md
- ./recursion.md

The successor operation S takes a [natural number](natural-numbers.md) n and produces the next natural number S(n). In the [Peano axioms](peano-axioms.md), successor is the generating operation: starting from [zero](zero.md) and applying S repeatedly produces all natural numbers. Two of Peano&rsquo;s axioms constrain S: it is injective (S(n) = S(m) implies n = m) and zero is not in its range (there is no n with S(n) = 0).

Successor is the foundation for defining arithmetic by [recursion](../../documents/articles/research/2026/07/31/lenticule-import/_archive/recursion.md). [Addition](addition.md) is defined as: n + 0 = n, n + S(m) = S(n + m). [Multiplication](multiplication.md) is defined as: n × 0 = 0, n × S(m) = n + (n × m). Each operation is built from successor and the previous operations, making successor the single primitive from which all of arithmetic grows.

In [set](set.md) theory, the successor of n is S(n) = n ∪ {n}: the set n together with itself as a new [element](element.md). In [category](../../documents/articles/research/2026/07/31/categories/ordinary-categories/terms/category.md) theory, successor is a [morphism](morphism.md) S: N → N that, together with the zero map 0: 1 → N, characterizes the natural numbers object by its universal [property](../../documents/articles/humanities/domains/sociology/terms/property.md).
