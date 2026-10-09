---

name: "standard library"
description: "The Agda standard library (`agda-stdlib`) provides formalized definitions and proofs for common mathematical and computational structures."
aliases:
  - "standard library"
  - "agda-stdlib"
date-created: 2026-03-01
keywords:
  - agda
---

The Agda standard library (`agda-stdlib`) provides formalized definitions and proofs for common mathematical and computational structures. It covers:

- **Data types**: natural numbers, integers, lists, vectors, finite sets, strings.
- **Relations**: binary relations, equivalence relations, [partial orders](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/partial-order.md), total orders, decidability.
- **Algebra**: monoids, groups, rings, [lattices](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/lattice.md), with an algebraic hierarchy using record types.
- **Logic**: propositional logic, predicate logic, decidability, classical axioms (importable but not default).
- **Category theory**: basic definitions of categories, [functors](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/functor.md), [natural transformations](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/natural-transformation.md).

The standard library is smaller and more manually curated than Lean's [Mathlib](../../../../services/software-services-section/services/lean-services-section/content/text/glossary/terms/mathlib.md). Where Mathlib aims for broad coverage with automation, agda-stdlib emphasizes explicit, readable definitions that stay close to the underlying type theory.

For formalizing [Heyting algebras](../../../../../../../../../../humanities/theories/math/theories/order/texts/heyting-algebras.md) and [closure operators](../../../../../../../../../../humanities/theories/math/theories/order/texts/closure-operators.md), the standard library provides the algebraic hierarchy and order-theoretic foundations to build on.
