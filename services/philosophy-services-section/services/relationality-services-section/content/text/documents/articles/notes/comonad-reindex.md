---
title: Comonad Reindexing
id: comonad-reindex
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Definition
- Inputs: a morphism in the [Index Base](./index-base.md) and a comonadic object in the source [Comonad Fiber](./comonad-fiber.md).
- Outputs: the pullback of that comonadic object into the target fibre, preserving the comonad structure.
- Behaviour: lifts the math-layer [Reindexing](./reindexing.md) operator so that pulling back along a base morphism commutes with the fibrewise comonad action.

## Invariants
- Functorial: respects identity and composition of base morphisms.
- Comonad-compatible: preserves counit and comultiplication of the fibrewise comonad.

## Proof
- Uses: [Reindexing](./reindexing.md) to transport comonadic recognitions along base morphisms while preserving comonad laws.
- Shows that: when fibres carry a comonad, the reindexing functor lifts to comonadic objects while maintaining counit/comultiplication, producing the fibrewise comonad in the target fibre.
