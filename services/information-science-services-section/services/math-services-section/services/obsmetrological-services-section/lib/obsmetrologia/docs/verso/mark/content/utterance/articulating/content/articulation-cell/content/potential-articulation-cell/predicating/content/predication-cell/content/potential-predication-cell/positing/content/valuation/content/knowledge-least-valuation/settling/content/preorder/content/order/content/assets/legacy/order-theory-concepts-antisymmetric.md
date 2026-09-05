---

title: "Antisymmetric"
description: "A relation R on a set S is antisymmetric if mutual relatedness implies equality: whenever aRb and bRa, then a = b."
aliases:
  - "antisymmetric"
  - "antisymmetry"
date-created: 2025-12-26
introduces: property
tags: []
---

A relation R on a set S is antisymmetric if mutual relatedness implies equality: whenever aRb and bRa, then a = b.

Antisymmetry is what distinguishes a [partial order](../objects/partial-order.md) from a [preorder](../objects/preorder.md). A preorder allows "ties" where a ≤ b and b ≤ a without a = b (the elements are equivalent but not identical). A [partial order](../objects/partial-order.md) rules this out: the only way for two elements to be mutually related is for them to be the same element.

In a [category](../../categories/theories/ordinary-categories/objects/category.md), antisymmetry corresponds to the poset being "thin" — there is at most one [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md) between any two objects. If there are [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md) a → b and b → a, their composites must be identities (by uniqueness of [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md)), so a and b are [isomorphic](../../categories/theories/ordinary-categories/morphisms/isomorphism.md) — and in a thin category, [isomorphic](../../categories/theories/ordinary-categories/morphisms/isomorphism.md) objects are equal.

The [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md) H in the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe is a [partial order](../objects/partial-order.md): its elements are semantic values with a definite ordering, and two elements that are mutually below each other are the same element. This antisymmetry ensures that the truth values of the [semiotic](../../../../linguistics/topics/semiotics/index.md) logic are unambiguous — there are no distinct elements that occupy the same position in the [lattice](../objects/lattice.md).
