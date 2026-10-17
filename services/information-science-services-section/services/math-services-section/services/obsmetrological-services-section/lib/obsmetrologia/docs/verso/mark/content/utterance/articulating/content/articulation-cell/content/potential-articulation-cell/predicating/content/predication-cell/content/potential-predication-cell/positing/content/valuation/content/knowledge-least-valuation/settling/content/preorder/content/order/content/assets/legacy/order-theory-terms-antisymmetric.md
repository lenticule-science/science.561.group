---
title: "Antisymmetric"
aliases:
  - "antisymmetric"
  - "antisymmetry"
date-created: 2025-12-26
type: term
tags: []
---

A relation R on a set S is antisymmetric if mutual relatedness implies equality: whenever aRb and bRa, then a = b.

Antisymmetry is what distinguishes a [partial order](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/partial-order.md) from a [preorder](./preorder.md). A preorder allows "ties" where a ≤ b and b ≤ a without a = b (the elements are equivalent but not identical). A [partial order](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/partial-order.md) rules this out: the only way for two elements to be mutually related is for them to be the same element.

In a [category](../../categories/ordinary-categories/terms/category.md), antisymmetry corresponds to the poset being "thin" — there is at most one [morphism](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) between any two objects. If there are [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) a → b and b → a, their composites must be identities (by uniqueness of [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md)), so a and b are [isomorphic](../../categories/ordinary-categories/terms/isomorphism.md) — and in a thin category, [isomorphic](../../categories/ordinary-categories/terms/isomorphism.md) objects are equal.

The [Heyting algebra](../../../concepts/heyting-algebra/index.md) H in the [semiotic](../../../../linguistics/topics/semiotics/index.md) universe is a [partial order](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/partial-order.md): its elements are semantic values with a definite ordering, and two elements that are mutually below each other are the same element. This antisymmetry ensures that the truth values of the [semiotic](../../../../linguistics/topics/semiotics/index.md) logic are unambiguous — there are no distinct elements that occupy the same position in the [lattice](./lattice.md).
