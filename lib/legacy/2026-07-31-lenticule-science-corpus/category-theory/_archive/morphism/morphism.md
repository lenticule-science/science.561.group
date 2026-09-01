---
title: "Morphism"
aliases:
  - "morphism"
  - "morphisms"
  - "arrow"
date-created: 2025-12-26
type: term
extends: directed-relation
component-of: category
requires: object
enables: composition
contains: [source, target]
---

A morphism is a directed connection from one [object](./object.md) to another inside a [category](./category.md). It extends a plain [directed relation](../../../../terms/directed-graph.md) with the requirement that morphisms compose: if f goes from A to B and g goes from B to C, then there is a composite g ∘ f going from A to C, and this composition is associative.

Every morphism has a source (where it starts) and a target (where it lands). Every object has an [identity morphism](./identity-morphism.md) — an arrow from itself to itself that does nothing when composed with other arrows.

Morphisms are what make a category a category. Two categories can have the same objects but different morphisms, and they will be completely different categories. The objects tell you what things exist; the morphisms tell you how they relate.

What counts as a morphism depends on the category you are in. In the category of sets, morphisms are functions. In the category of topological spaces, morphisms are continuous maps. In a group seen as a category with one object, morphisms are the group elements themselves, and composition is the group operation. In a [partial order](../../posets/terms/partial-order.md) seen as a category, a morphism from a to b is the fact that a ≤ b — there is at most one, and it either exists or it doesn't.

Some morphisms have special properties. A monomorphism is left-cancellable — if f ∘ g = f ∘ h, then g = h. An epimorphism is right-cancellable. An [isomorphism](./isomorphism.md) has a two-sided inverse — you can go back the way you came. These correspond roughly to injections, surjections, and bijections in the category of sets, but they can behave differently in other categories.
