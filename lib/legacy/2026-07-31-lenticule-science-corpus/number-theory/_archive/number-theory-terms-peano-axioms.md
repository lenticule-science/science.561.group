---
title: "Peano Axioms"
aliases:
  - "peano axioms"
  - "Peano axioms"
date-created: 2025-12-26
type: axiom
tags: []
part-of:
  - "Peano arithmetic"
requires:
  - ./natural-numbers.md
  - ./zero.md
  - ./successor.md
  - ./induction.md
  - ./recursion.md
---

The Peano axioms are five axioms that characterize the [natural numbers](./natural-numbers.md). They state: (1) [zero](./zero.md) is a natural number, (2) every natural number has a [successor](./successor.md), (3) zero is not the successor of any natural number, (4) the successor function is injective (distinct numbers have distinct successors), and (5) if a [property](../../../../sociology/terms/property.md) holds for zero and is preserved by successor, it holds for all natural numbers ([induction](./induction.md)).

The first four axioms establish the basic structure: a starting point and a way to generate new numbers from old. The fifth — the induction axiom — is the most powerful: it guarantees that the natural numbers contain nothing beyond what zero and successor generate. Without induction, models could contain extra elements ("nonstandard" natural numbers) unreachable from zero.

The Peano axioms support [recursion](./recursion.md): any [function](../../sets/terms/function.md) on ℕ can be defined by specifying its value at zero and its behavior on successors, and the induction axiom guarantees this definition covers all natural numbers. In [category](../../categories/ordinary-categories/terms/category.md) theory, the natural numbers object encodes the Peano axioms through a universal [property](../../../../sociology/terms/property.md): any object with a "zero" and a "successor" receives a unique [morphism](../../categories/ordinary-categories/terms/morphism.md) from ℕ.
