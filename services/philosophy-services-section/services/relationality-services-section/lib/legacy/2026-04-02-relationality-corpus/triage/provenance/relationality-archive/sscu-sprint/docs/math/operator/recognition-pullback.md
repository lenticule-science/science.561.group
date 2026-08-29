---
name: recognition-pullback
role: operator
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



Pulls back a recognition/subobject along a morphism in the relational sheaf
topos.

## Definition
- Inputs: a morphism `f: X → Y` and a subobject/recognition on `Y` expressed via
  the [Recognition Classifier](../structure/recognition-classifier.md).
- Outputs: the pullback recognition/subobject on `X`.
- Behaviour: composes the characteristic map with `f` to obtain the pulled-back
  recognition.

## Invariants
- Functorial: pullback respects composition/identity.
- Commutative with pushforward on base-change squares (via [Base Change Square](base-change-square.md)).

## Proof
- Uses: pullback structure in the [Relational Sheaf Topos](../structure/relational-sheaf-topos.md)
  and the recognition classifier.
- Shows that: recognitions/subobjects can be transported along morphisms while
  preserving classifier semantics.
