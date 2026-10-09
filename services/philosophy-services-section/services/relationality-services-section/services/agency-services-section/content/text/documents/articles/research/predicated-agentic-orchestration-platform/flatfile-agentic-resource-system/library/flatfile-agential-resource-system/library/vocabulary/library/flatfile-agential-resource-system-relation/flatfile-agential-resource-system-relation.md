---
id: flatfile-agential-resource-system-relation
description: "A named relation that an entity in a FARS stands in. Every relation used in the system must itself be an entity in the system — an edge whose label is a node."
extends: flatfile-agential-resource-system-entity
component-of: flatfile-agential-resource-system
fiber-of: relational-universe
base: relational-history-site
element-of: related
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  subject: relational-universe
  predicate: relational-universe
  object: relational-universe
output: relational-universe-morphism
ast:
  fregean-predicate-as-key:
    - subject
    - predicate:
        - nucleus-fixed-point
    - object
title: Flatfile Agential Resource System Relation
---

# Flatfile Agential Resource System Relation

## What this is

A **FlatfileAgentialResourceSystemRelation** is a named relation that an entity in a FARS stands in.
When an entity carries a relation, it stands in that relation — the relation says something true about the entity.
This is the Fregean pattern: the relation name IS the relation, not a label for a relation.
The entity is the subject; the relation is the predicate; the value is the object.

This derives from [generative-closure](../math/universe-object-class-generative-closure.md) condition 4: exponential closure.
For relations to be first-class objects in R — for the system to be able to reason about its own relations — each relation must itself be an entity in R.
A relation that is not itself an entity is an edge whose label has no node: the graph cannot navigate to it, cannot constrain it, cannot reason about it.

## Relations as nucleus fixed points

Every specific relation is a nucleus fixed point: the result of the saturation nucleus $\sigma_t$ acting on the raw relation proposal [related(A, B)](../flatfile-agential-resource-system-related/flatfile-agential-resource-system-related.md).

`related:` is the pre-nucleus form.
`grounding:`, `uses:`, `extends:`, and all other specific predicates are what `related:` normalizes to under nucleus evaluation.
This means every specific relation can be arrived at by: 1.
Stating `related(A, B)` — proposing that A and B stand in some relation 2.
Submitting the proposal to the nucleus 3.
Reading the settled result

The [propose-grounding](skills/propose-grounding.md) skill is the instance of this procedure for the `grounding:` predicate.
The same normalization structure applies to every specific predicate.

## How to introduce a relation

To introduce a relation P into a locale's vocabulary:

1. Create a specced entity for P — an entity with `id: P` and `description:` stating what the relation means.
2. That entity is itself a [RelationalEntity](relational-entity.md): it is now in R, it is a node the graph can reason about.

Once the entity exists, P may be used as a named relation without creating vocabulary debt.
Until then, using P creates a debt: an edge whose label has no node.
A FlatfileAgentialResourceSystemRelation MUST have `id` and `description`.
It MUST be declared before it is used anywhere in the system.
Its `description` MUST state what the relation means — what is true of an entity that stands in this relation.
A FlatfileAgentialResourceSystemRelation CANNOT come into existence merely by being used — it must be declared as an entity first.

Where the relation entity lives is a matter of scope.
A relation used only within one locale lives in that locale's vocabulary directory.
A relation used across locales lives wherever cross-locale vocabulary is maintained.

## Open questions

- The precise categorical definition of a relation in $R = \mathrm{Sh}(T, J)$: is it a morphism into $\Omega$ (the subobject classifier), a natural transformation between functors, or something else?
  The spec-level description (a relation an entity stands in) is correct but the math grounding is not yet derived.
- Relation scoping and cross-locale reference: the math is clear — [local-global-dyad](../../../../../../../library/relational-hyperverse-repository/math/local-global-dyad.md) establishes that a relation used within one locale is a local section of the propositional presheaf $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$; a relation shared across locales must be a global section satisfying the sheaf condition so that restriction maps carry it consistently to each locale's fiber.
  The spec-level implication — how restriction maps on shared relation entities are concretely represented in any FARS — has not yet been derived from this math.
