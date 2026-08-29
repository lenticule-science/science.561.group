---
title: "Antisymmetric"
description: "A relation R on a set S is antisymmetric if mutual relatedness implies equality: whenever aRb and bRa, then a = b."
aliases:
  - "antisymmetric"
  - "antisymmetry"
date-created: 2025-12-26
introduces: property
tags: []
defines:
  - "Antisymmetric"
  - "antisymmetry"
type: term
---

A relation R on a set S is antisymmetric if mutual relatedness implies equality: whenever aRb and bRa, then a = b.

Antisymmetry is what distinguishes a [partial order](./partial-order.md) from a [preorder](./preorder.md). A preorder allows "ties" where a ≤ b and b ≤ a without a = b (the elements are equivalent but not identical). A [partial order](./partial-order.md) rules this out: the only way for two elements to be mutually related is for them to be the same element.

In a [category](./category.md), antisymmetry corresponds to the poset being "thin" — there is at most one [morphism](./morphism.md) between any two objects. If there are [morphisms](./morphism.md) a → b and b → a, their composites must be identities (by uniqueness of [morphisms](./morphism.md)), so a and b are [isomorphic](./isomorphism.md) — and in a thin category, [isomorphic](./isomorphism.md) objects are equal.

The [Heyting algebra](./heyting-algebra.md) H in the semiotic universe is a [partial order](./partial-order.md): its elements are semantic values with a definite ordering, and two elements that are mutually below each other are the same element. This antisymmetry ensures that the truth values of the semiotic logic are unambiguous — there are no distinct elements that occupy the same position in the [lattice](./lattice.md).
