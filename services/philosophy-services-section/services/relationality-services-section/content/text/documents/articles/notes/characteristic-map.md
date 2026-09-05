---
title: Characteristic Map
id: characteristic-map
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Constructs the characteristic map of a subobject into the recognition
classifier (Omega) in the relational sheaf topos.

## Definition
- Inputs: a monomorphism/subobject in the relational sheaf topos, expressed via
  the [Subobject Classifier](./subobject-classifier.md).
- Outputs: its characteristic morphism into the
  [Recognition Classifier](./recognition-classifier.md).
- Behaviour: assigns to each element/section the recognition (truth value)
  indicating membership in the subobject; compatible with base change via
  [Base Change Square](./base-change-square.md).

## Invariants
- Classifier property: the subobject is the pullback of `true` along the
  characteristic map.
- Naturality: characteristic maps commute with pullbacks (Base-Change).

## Proof
- Uses: [Subobject Classifier](./subobject-classifier.md) and
  [Recognition Classifier](./recognition-classifier.md) to define
  characteristic maps.
- Shows that: every subobject admits a unique characteristic map satisfying the
  classifier property, stable under base change.
