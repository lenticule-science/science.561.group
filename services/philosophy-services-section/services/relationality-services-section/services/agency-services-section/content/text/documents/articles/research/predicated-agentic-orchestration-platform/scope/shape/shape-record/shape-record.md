---
type: definition
class: substrate-entity
realizes: [shape]
depends-on: [shape, identity-by-relations]
see-also: [skill-record, vocabulary-completeness]
title: Shape record
description: "A shape record is the substrate-entity formal definition of a shape: the predication-graph entity declaring a constraint that classifies which sub-configurations of an entity are admissible at a given predicate."
---

# Shape record

A **shape record** is the substrate-entity formal definition of a [shape](../shape.md): the predication-graph entity declaring a constraint that classifies which sub-configurations of an entity are admissible at a given predicate.
Per [identity by relations](../../teaching/explanations/identity-by-relations.md), shapes target predicates carried by entities, not declared classes.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of the constraint.
- **`targets`** — references to predicate entities the shape applies to.
  Per the *Fregean* pattern, the shape uses `sh:targetSubjectsOf` semantics: every entity carrying a targeted predicate is, by that fact, a target of the shape.
- **`required`** — predicates that an entity carrying any targeted predicate must also carry.
  Missing required predicates are validation failures.
- **`forbidden`** — predicates that an entity carrying any targeted predicate must not carry.
  Present forbidden predicates are validation failures.
- **`value-constraints`** — predications declaring which values the targeted predicate may carry: a value range, an enumerated set, a sub-shape reference, a regex pattern, or a derived constraint.
- **`cardinality`** — bounds on how many predications of the targeted predicate an entity may carry (zero or one, one exactly, one or more, etc.).
- **`severity`** — `error` (violation aborts the operator), `warning` (violation is recorded but not blocking), or `informational` (validation produces a record but does not change behavior).
- **`scope`** — the scopes where the shape is enforceable.

## Invariants

- **Targets are predicate entities.** Every targeted predicate is itself a substrate entity (per [vocabulary completeness](../../teaching/explanations/vocabulary-completeness.md)).
- **One shape per predicate per scope.** Within a scope, no two shape records target the same predicate.
  Multiple scopes may have different shapes for the same predicate; the substrate's nucleus discipline determines which applies in a particular nucleus's view.
- **Self-validating.** A shape entity itself carries predicates; those predicates have their own shape entities; the recursion bottoms out in the substrate's irreducible constraint vocabulary.
  A shape that validates shapes is itself a shape, recursively.

## Operations

- *Validate.* Given an entity carrying a targeted predicate, the substrate's validation operator checks every required, forbidden, value-constraint, and cardinality declaration; produces a validation record (success, with severity-level violations enumerated).
- *Edit.* Modifying a shape record produces a new version.
  Subsequent validations use the new version; past witnesses cite the version active at the time.
- *Audit.* "Which shapes target this predicate?" or "Which entities are violating this shape?" are substrate traversals.

## Position in the substrate

The shape record is the substrate's *constraint-classification mechanism*: validation is not a separate type system but a substrate operation that consults shape records.
Per the [closure conditions](../../teaching/explanations/closure-conditions.md), a complete sub-region of the substrate carries shape records for every predicate it admits — vocabulary-complete validation.
A region with shape gaps for some predicates has unenforced constraints at those predicates.

The pattern is intentionally not class-based.
There is no notion of "this entity *is* a Skill class instance" that triggers a class-level validation; there is only "this entity carries `closure-kind`, so the shape targeting `closure-kind` applies."
The substrate's identity discipline ([identity by relations](../../teaching/explanations/identity-by-relations.md)) is what makes this valid; class-based validation would require an out-of-band type system the substrate does not have.
