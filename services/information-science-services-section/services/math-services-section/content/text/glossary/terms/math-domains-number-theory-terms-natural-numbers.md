---
name: "Natural Numbers"
type: "definition"
date-created: 2025-12-26
---

Requires

- ./zero.md
- ./successor.md
- ./peano-axioms.md
- ./induction.md

The natural numbers ℕ = {0, 1, 2, 3, &hellip;} are the numbers generated from [zero](zero.md) by repeated application of the [successor](successor.md) operation. They are characterized by the [Peano axioms](peano-axioms.md): zero is a natural number, every natural number has a successor, zero is not a successor, the successor function is injective, and [induction](../../documents/articles/research/2026/07/31/lenticule-import/_archive/induction.md) holds.

The natural numbers support [addition](addition.md) (defined recursively: n + 0 = n, n + S(m) = S(n + m)) and [multiplication](multiplication.md) (defined recursively: n × 0 = 0, n × S(m) = n + (n × m)). Under these operations, ℕ forms a commutative [semiring](semiring.md): addition and multiplication are associative and commutative, multiplication distributes over addition, 0 is the additive identity, and 1 is the multiplicative identity. There are no additive inverses — subtraction is not always possible in ℕ.

In [set](set.md) theory, the natural numbers are constructed as sets: 0 = ∅, 1 = {∅}, 2 = {∅, {∅}}, and each successor is n ∪ {n}. In [category](../../documents/articles/research/2026/07/31/categories/ordinary-categories/terms/category.md) theory, the natural numbers object is characterized by a universal [property](../../documents/articles/humanities/domains/sociology/terms/property.md): an object N with maps 0: 1 → N and S: N → N such that any other such structure factors through N uniquely. This universal [property](../../documents/articles/humanities/domains/sociology/terms/property.md) captures [recursion](../../documents/articles/research/2026/07/31/lenticule-import/_archive/recursion.md) — it says that recursive definitions over ℕ always exist and are unique.
