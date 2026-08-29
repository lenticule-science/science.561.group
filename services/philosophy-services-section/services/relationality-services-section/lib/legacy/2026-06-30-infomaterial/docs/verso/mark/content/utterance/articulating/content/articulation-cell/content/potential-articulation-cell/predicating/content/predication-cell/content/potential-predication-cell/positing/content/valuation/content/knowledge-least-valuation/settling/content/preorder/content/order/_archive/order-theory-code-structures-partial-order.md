---

title: "Partial Order"
description: "A partial order on a set is a relation ≤ that satisfies three rules. It is [reflexive](teaching/explanations/reflexive.md): everything is ≤ itself. It is [transitive](teaching/explanations/transitive.md): if a ≤ b and b ≤ c, then a ≤ c. It is [antisymmetric](teaching/explanations/antisymmetric.md): if a ≤ b and b ≤ a, then a and b are the same thing. A set with a partial order on it is called a partially ordered set, or poset."
aliases:
  - "partial order"
  - "partial orders"
  - "poset"
  - "partially ordered set"
date-created: 2025-12-26
introduces: relation
defines:
  - "Partial Order"
  - "partial orders"
  - "poset"
  - "partially ordered set"
requires: [reflexive, transitive, antisymmetric]
specialization: [category, preorder]
enables: [lattice, meet, join]
contrasts-with: total-order
depends-on: [directed-graph]
---

A partial order on a set is a relation ≤ that satisfies three rules. It is [reflexive](teaching/explanations/reflexive.md): everything is ≤ itself. It is [transitive](teaching/explanations/transitive.md): if a ≤ b and b ≤ c, then a ≤ c. It is [antisymmetric](teaching/explanations/antisymmetric.md): if a ≤ b and b ≤ a, then a and b are the same thing. A set with a partial order on it is called a partially ordered set, or poset.

"Partial" means not everything has to be comparable. Two elements can just have no relation to each other — neither one is ≤ the other. This is what separates a partial order from a total order, where every pair must be comparable. Numbers with ≤ are a total order. Sets with ⊆ are a partial order — {1,2} and {2,3} are not comparable because neither contains the other.

A poset is also the simplest kind of [category](../../categories/theories/ordinary-categories/objects/category.md). The elements are the objects. Between any two elements there is either one [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md) (when a ≤ b) or none. [Composition](../../categories/theories/ordinary-categories/morphisms/composition.md) is transitivity. Identity morphisms are reflexivity. This is called a thin category because there is at most one arrow between any two objects.

When every pair of elements in a poset has a greatest lower bound and a least upper bound, the poset is a [lattice](./lattice.md). The greatest lower bound is the [meet](../morphisms/meet.md), the least upper bound is the [join](../morphisms/join.md). A complete lattice has meets and joins for every subset, not just pairs.

Underneath the order-theoretic surface, a strict partial order is a [directed graph](../../graph-theory/objects/directed-graph.md) — specifically a transitive antisymmetric [DAG](../../graph-theory/objects/dag.md). The Hasse diagram is the edge-minimal directed graph whose [transitive closure](../../graph-theory/morphisms/transitive-closure.md) recovers the order; the [partial-order-as-transitive-acyclic-digraph](../../graph-theory/examples/partial-order-as-transitive-acyclic-digraph.md) example walks the correspondence through end-to-end. The `depends-on:` edge to `directed-graph` makes typographically explicit a structural dependency the corpus has carried silently until now.
