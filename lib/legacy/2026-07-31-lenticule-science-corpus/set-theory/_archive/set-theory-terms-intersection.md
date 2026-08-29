---
title: "Intersection"
aliases:
  - "intersection"
  - "intersections"
date-created: 2025-12-26
type: term
tags: []
defines:
  - "Intersection"
  - "intersections"
---

The intersection of two [sets](./set.md) A and B, written A ∩ B, is the set of [elements](./element.md) belonging to both A and B: A ∩ B = {x : x ∈ A and x ∈ B}. More generally, the intersection of a family {Aᵢ}ᵢ∈I is ⋂ᵢ Aᵢ = {x : x ∈ Aᵢ for all i ∈ I}.

Intersection is commutative, associative, and idempotent. It distributes over [union](./union.md): A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C). Together with union and complement, intersection gives the power set of any set the structure of a [Boolean algebra](../../../concepts/boolean-algebra/index.md).

In a [lattice](../../posets/terms/lattice.md), intersection corresponds to [meet](../../posets/terms/meet.md) (greatest lower bound). In the [open sets](../../../disciplines/topology/terms/open-set.md) of a [topological space](../../../disciplines/topology/terms/topological-space.md), only finite intersections are guaranteed to be open — this asymmetry between union and intersection is what makes the open-set [lattice](../../posets/terms/lattice.md) a frame rather than a [Boolean algebra](../../../concepts/boolean-algebra/index.md). In the [Heyting algebra](../../../concepts/heyting-algebra/index.md) H, meet (a ∧ b) is the semantic analogue of intersection: the strongest value entailed by both a and b. The [Heyting implication](../../../disciplines/logic/terms/heyting-implication.md) is defined through meet by the residuation law: c ≤ (a → b) if and only if c ∧ a ≤ b.
