---
name: classify-subobject
role: operator
derived_from: math/structure/subobject-classifier
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Constructs characteristic maps for subobjects using the recognition algebra
and the subobject classifier.

## Definition
- Inputs: a mono `m: A → B` in the earned topos; the
  [Relational Logic Algebra](../structure/relational-logic-algebra.md) and
  [Subobject Classifier](../structure/subobject-classifier.md).
- Outputs: characteristic map `chi_m: B → Omega` exhibiting `A` as the
  pullback of `true`.
- Behaviour: map elements/sections of `B` to recognitions indicating membership
  in the subobject; encode as `chi_m` into `Omega`.

## Invariants
- Correctness: `chi_m` satisfies the classifier property (pullback square with
  `true` recovers `A`).
- Naturality: characteristic maps are stable under pullback.
- Logical alignment: `chi_m` respects the logical operations of the recognition
  algebra.

## Proof
- Uses: [Relational Logic Algebra](../structure/relational-logic-algebra.md)
  to interpret membership as recognition; [Subobject Classifier](../structure/subobject-classifier.md)
  to target characteristic maps.
- Shows that: characteristic maps constructed from recognitions satisfy the
  subobject classifier axioms, enabling classification of subobjects by
  earned recognitions.
