---

introduces: algebraic-structure
description: "A semigroup with an identity element — composable operations with a do-nothing option."
defines: monoid
aliases: [monoids]
specialization: semigroup
axioms: associativity, identity
extends-to: group
viewable-as: one-object-category
generalizes-to: monoidal-category
date-created: 2025-12-31
date-modified: 2026-03-29
---

A monoid is a [semigroup](./semigroup.md) with an [identity element](teaching/explanations/identity-element.md): a [set](../../sets/objects/set.md) M with an associative binary operation $\ast$ and an element e such that $e \ast a = a \ast e = a$ for all $a \in M$. A monoid captures the idea of composable operations with a do-nothing option.

The natural numbers under addition form a monoid with identity 0. The natural numbers under multiplication form another with identity 1. The set of all functions from a set to itself forms a monoid under composition, with the identity function as identity element. Strings under concatenation form a monoid with the empty string as identity — this is the free monoid on the alphabet, and it is the structure underlying all sequential computation.

A monoid with inverses — where every element can be "undone" — is a [group](./group.md). The algebraic hierarchy is: [magma](./magma.md) (binary operation) → [semigroup](./semigroup.md) (+ associativity) → monoid (+ identity) → group (+ inverses). Each step adds one axiom. Adding a second operation with distributivity yields a ring.

A monoid is a [category](../../categories/theories/ordinary-categories/objects/category.md) with exactly one object. The elements of the monoid are the morphisms. The monoid operation is composition. The identity element is the identity morphism. This is the bridge between algebra and category theory: a category generalizes a monoid by allowing multiple objects instead of one. The two axioms of a category — associativity and identity — are exactly the two axioms of a monoid. A category is a "monoid with many objects."

A monoidal category generalizes the monoid concept to the categorical setting. Instead of a binary operation on elements, a monoidal category has a tensor product on objects. Instead of an identity element, it has a unit object. The coherence conditions (associator, unitor) ensure the tensor product behaves like a monoid operation up to natural isomorphism.
