---
name: "Induction"
type: "definition"
date-created: 2025-12-26
---

Requires

- ./natural-numbers.md
- ./zero.md
- ./successor.md
- ./peano-axioms.md

Mathematical induction is a proof principle for [natural numbers](natural-numbers.md): if a [property](../../documents/articles/research/2026/sociology/terms/property.md) P holds for [zero](zero.md) (the base case) and holding for n implies holding for the [successor](successor.md) S(n) (the inductive step), then P holds for all natural numbers. Induction is the fifth of the [Peano axioms](peano-axioms.md) and is what ensures that the natural numbers contain nothing beyond what zero and successor generate.

Strong induction is a variant where the inductive step assumes P holds for all numbers less than n, not just for the predecessor. Strong induction and ordinary induction are equivalent over the natural numbers — either can prove whatever the other can. Structural induction generalizes the principle to any inductively defined structure (lists, trees, formulas): prove the [property](../../documents/articles/research/2026/sociology/terms/property.md) for base cases and show it is preserved by each constructor.

Induction is dual to [recursion](../../documents/articles/research/2026/07/31/lenticule-import/_archive/recursion.md): induction proves that a [property](../../documents/articles/research/2026/sociology/terms/property.md) holds for all elements, while recursion defines a [function](../../documents/articles/research/2026/07/31/sets/terms/function.md) on all elements. Both work by specifying behavior at the base case and at the successor step, and both depend on the well-foundedness of the natural numbers — the fact that every descending chain reaches zero in finitely many steps.
