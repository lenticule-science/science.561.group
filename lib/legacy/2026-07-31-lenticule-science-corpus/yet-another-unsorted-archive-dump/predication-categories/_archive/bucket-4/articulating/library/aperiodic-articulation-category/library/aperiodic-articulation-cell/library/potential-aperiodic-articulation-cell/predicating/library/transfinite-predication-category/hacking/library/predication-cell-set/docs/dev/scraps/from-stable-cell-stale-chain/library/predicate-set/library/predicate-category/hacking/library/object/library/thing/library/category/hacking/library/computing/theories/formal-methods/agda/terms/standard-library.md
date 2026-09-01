---

name: "standard library"
description: "The Agda standard library (`agda-stdlib`) provides formalized definitions and proofs for common mathematical and computational structures."
aliases:
  - "standard library"
  - "agda-stdlib"
date-created: 2026-03-01T00:00:00
keywords:
  - agda
---

The Agda standard library (`agda-stdlib`) provides formalized definitions and proofs for common mathematical and computational structures. It covers:

- **Data types**: natural numbers, integers, lists, vectors, finite sets, strings.
- **Relations**: binary relations, equivalence relations, [partial orders](../../../../../../../../../../humanities/domains/math/domains/order/terms/partial-order.md), total orders, decidability.
- **Algebra**: monoids, groups, rings, [lattices](../../../../../../../../../../humanities/domains/math/domains/order/terms/lattice.md), with an algebraic hierarchy using record types.
- **Logic**: propositional logic, predicate logic, decidability, classical axioms (importable but not default).
- **Category theory**: basic definitions of categories, [functors](../../../../../../../../../../humanities/domains/math/domains/categories/domains/ordinary-categories/terms/functor.md), [natural transformations](../../../../../../../../../../humanities/domains/math/domains/categories/domains/ordinary-categories/terms/natural-transformation.md).

The standard library is smaller and more manually curated than Lean's [Mathlib](../../lean/terms/Mathlib.md). Where Mathlib aims for broad coverage with automation, agda-stdlib emphasizes explicit, readable definitions that stay close to the underlying type theory.

For formalizing [Heyting algebras](../../../../../../../../../../humanities/domains/math/domains/order/texts/heyting-algebras.md) and [closure operators](../../../../../../../../../../humanities/domains/math/domains/order/texts/closure-operators.md), the standard library provides the algebraic hierarchy and order-theoretic foundations to build on.
