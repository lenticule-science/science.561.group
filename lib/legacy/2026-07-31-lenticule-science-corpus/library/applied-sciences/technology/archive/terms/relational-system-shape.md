---
id: relational-system-shape
description: "A Shape is a predicate constraint that classifies RelationalEntities: what any RelationsSystem must have to satisfy U_G condition 5 (subobject classification)."
defines: RelationalSystemShape
extends: RelationalEntity
related: GenerativeClosure
---

# Relational System Shape

## What it is

A **RelationalSystemShape** is a constraint specification that classifies entities in [R](relations-system.md) by which predicates they carry and what those predicates must satisfy.
It is what it means, in a RelationsSystem, for the object class to be closed under subobject formation — [generative-closure](../math/universe-object-class-generative-closure.md) condition 5.

A shape does not classify by declared type.
It classifies by predicates: any entity that carries a given predicate is a target of that predicate's shape, regardless of what else it is.
What an entity IS is determined by which predicates it has, not by a category it declares membership in.

A shape is itself a [RelationalEntity](relational-entity.md): it has `id` and `description` and is in R.
The system can validate shapes using shapes.
This is the self-referential closure condition 5 requires: the subobject classifier Ω is an object of R.

## One shape per predicate

The constraint for predicate `P` lives in exactly one shape, targeting every entity that carries `P`.
Multiple predicates on a single entity engage multiple shapes independently.
An entity is never globally "valid" or "invalid" — it satisfies some shapes and not others, depending on which predicates it has.
Validity is always relative to the shapes applicable at the current predicate set.
A RelationalSystemShape CANNOT target entities by declared class membership.
It CANNOT duplicate constraints already expressed by another shape — each shape is responsible for exactly one predicate.
It CANNOT depend on predicates that are not themselves specced entities.

## Open questions

- Whether shapes compose: if an entity carries both `id` and `defines`, is there a combined shape more than the sum of the two individual shapes?
  The current per-predicate model does not address composition.
- Whether the shape for a predicate should constrain the predicate value's own required predicates (object constraints), or whether that is expressed by the value's own shape.
