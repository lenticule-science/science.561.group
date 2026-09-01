---
title: Base-Change Square
id: base-change-square
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Verifies the Base-Change condition on a given pullback square: pullback and
pushforward commute on subobjects/recognitions.

## Definition
- Inputs: a pullback square in the [Relational Sheaf Topos](../structure/relational-sheaf-topos.md),
  and subobjects expressed via [Subobject Classifier](../structure/subobject-classifier.md).
- Outputs: a [Base-Change Condition](../structure/base-change-condition.md)
  witness for that square.
- Behaviour: constructs characteristic maps, applies the pushforward/pullback
  adjunctions available in the sheaf topos, and checks that the two routes
  coincide.

## Invariants
- Commutation: pullback ∘ pushforward = pushforward ∘ pullback for the square.
- Logical stability: characteristic maps are natural under base change.
- Coverage respect: refinements of the square induce compatible base-change
  witnesses.

## Proof
- Uses: pullbacks/pushforwards and classifiers in the relational sheaf topos to
  express subobjects.
- Produces: [Base-Change Condition](../structure/base-change-condition.md) when
  the commutation holds.
- Shows that: the given square satisfies Base-Change, yielding the condition
  witness used for substitution and logical relations.
