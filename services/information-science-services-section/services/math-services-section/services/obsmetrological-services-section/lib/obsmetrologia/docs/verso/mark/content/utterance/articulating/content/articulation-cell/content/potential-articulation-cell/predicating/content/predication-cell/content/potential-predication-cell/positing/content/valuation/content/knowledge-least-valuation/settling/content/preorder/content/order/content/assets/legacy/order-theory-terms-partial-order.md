---
title: "Partial Order"
aliases:
  - "partial order"
  - "partial orders"
  - "poset"
  - "partially ordered set"
date-created: 2025-12-26
type: term
defines:
  - "Partial Order"
  - "partial orders"
  - "poset"
  - "partially ordered set"
requires: [reflexive, transitive, antisymmetric]
instance-of: category
extends: preorder
enables: [lattice, meet, join]
contrasts-with: total-order
---

A partial order on a set is a relation ≤ that satisfies three rules. It is [reflexive](./reflexive.md): everything is ≤ itself. It is [transitive](./transitive.md): if a ≤ b and b ≤ c, then a ≤ c. It is [antisymmetric](./antisymmetric.md): if a ≤ b and b ≤ a, then a and b are the same thing. A set with a partial order on it is called a partially ordered set, or poset.

"Partial" means not everything has to be comparable. Two elements can just have no relation to each other — neither one is ≤ the other. This is what separates a partial order from a total order, where every pair must be comparable. Numbers with ≤ are a total order. Sets with ⊆ are a partial order — {1,2} and {2,3} are not comparable because neither contains the other.

A poset is also the simplest kind of [category](../../categories/ordinary-categories/terms/category.md). The elements are the objects. Between any two elements there is either one [morphism](../../categories/ordinary-categories/terms/morphism.md) (when a ≤ b) or none. [Composition](../../categories/ordinary-categories/terms/composition.md) is transitivity. Identity morphisms are reflexivity. This is called a thin category because there is at most one arrow between any two objects.

When every pair of elements in a poset has a greatest lower bound and a least upper bound, the poset is a [lattice](./lattice.md). The greatest lower bound is the [meet](./meet.md), the least upper bound is the [join](./join.md). A complete lattice has meets and joins for every subset, not just pairs.
