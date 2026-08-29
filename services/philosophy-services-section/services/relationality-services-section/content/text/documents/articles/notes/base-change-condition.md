---
title: Base-Change Condition
id: base-change-condition
role: structure
status: plan
derived_from: math/acts/sheaf-condition
proof_refs: []
---


# Base-Change Condition

Structure stating that pullback and pushforward along a pullback square commute,
giving substitution stability for recognitions/subobjects in the sheaf setting.

## Definition
- Context: pullback squares in a sheaf or presheaf topos built on a
  [Coverage Site](./coverage-site.md).
- Condition: for any subobject classified by
  [Recognition Classifier](./recognition-classifier.md), the pullback of a
  pushforward equals the pushforward of a pullback.
- Expression: characteristic maps into [Subobject Classifier](./subobject-classifier.md)
  are natural with respect to base change, making logical predicates stable.

## Invariants
- Stability: characteristic maps commute with pullback/pushforward for every
  admissible square.
- Naturality: substitution along base change preserves logical structure and
  recognitions.
- Compatibility: holds for recognitions/subobjects across the sheaf topos and is
  preserved by refinements of the coverage.

## Proof
- Derived from: [SheafCondition](./sheaf-condition.md) which demands
  stability of restriction/gluing under reindexing; base change is the precise
  formulation of that stability.
- Shows that: the topos satisfies Base-Change, ensuring substitution stability
  for recognitions/logical predicates and making adjoints/pushforwards behave
  predictably.
