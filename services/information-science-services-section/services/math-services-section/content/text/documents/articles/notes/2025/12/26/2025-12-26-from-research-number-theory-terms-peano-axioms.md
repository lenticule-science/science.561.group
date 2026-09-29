---
title: "Peano Axioms"
type: "axiom"
date-created: 2025-12-26
description: The Peano axioms are five axioms that characterize the natural numbers.
---

The Peano axioms are five axioms that characterize the [natural numbers](../../../../../../glossary/terms/natural-numbers.md). They state: (1) [zero](../../../../../../glossary/terms/zero.md) is a natural number, (2) every natural number has a [successor](../../../../../../glossary/terms/successor.md), (3) zero is not the successor of any natural number, (4) the successor function is injective (distinct numbers have distinct successors), and (5) if a [property](../../../../research/2026/sociology/terms/property.md) holds for zero and is preserved by successor, it holds for all natural numbers ([induction](../../../../research/2026/07/31/lenticule-import/_archive/induction.md)).

The first four axioms establish the basic structure: a starting point and a way to generate new numbers from old. The fifth — the induction axiom — is the most powerful: it guarantees that the natural numbers contain nothing beyond what zero and successor generate. Without induction, models could contain extra elements (&ldquo;nonstandard&rdquo; natural numbers) unreachable from zero.

The Peano axioms support [recursion](../../../../research/2026/07/31/lenticule-import/_archive/recursion.md): any [function](../../../../research/2026/07/31/sets/terms/function.md) on ℕ can be defined by specifying its value at zero and its behavior on successors, and the induction axiom guarantees this definition covers all natural numbers. In [category](../../../../research/2026/07/31/categories/ordinary-categories/terms/category.md) theory, the natural numbers object encodes the Peano axioms through a universal [property](../../../../research/2026/sociology/terms/property.md): any object with a &ldquo;zero&rdquo; and a &ldquo;successor&rdquo; receives a unique [morphism](../../../../../../glossary/terms/morphism.md) from ℕ.
