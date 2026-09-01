---
name: recognition-pushforward
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



Pushes forward a recognition/subobject along a morphism in the relational sheaf
topos.

## Definition
- Inputs: a morphism `f: X → Y` and a subobject/recognition on `X` expressed via
  the [Recognition Classifier](../structure/recognition-classifier.md).
- Outputs: the direct image recognition/subobject on `Y`.
- Behaviour: constructs the smallest recognition on `Y` whose pullback along
  `f` contains the given recognition.

## Invariants
- Functorial: pushforward respects composition/identity.
- Commutative with pullback on base-change squares (via [Base Change Square](base-change-square.md)).

## Proof
- Uses: pushforward/direct-image structure in the [Relational Sheaf Topos](../structure/relational-sheaf-topos.md)
  and the recognition classifier.
- Shows that: recognitions/subobjects can be transported forward along
  morphisms while preserving classifier semantics.
