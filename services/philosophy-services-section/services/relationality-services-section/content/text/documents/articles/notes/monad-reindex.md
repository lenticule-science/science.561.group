---
title: Monad Reindexing
id: monad-reindex
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
- Inputs: a morphism in the [Index Base](./index-base.md) and a monadic object in the source [Monad Fiber](./monad-fiber.md).
- Outputs: the pullback of that monadic object into the target fibre, with the monad action preserved.
- Behaviour: lifts the math-layer [Reindexing](./reindexing.md) operator so that pulling back along a base morphism commutes with the fibrewise monad structure.

## Invariants
- Functorial: respects identity and composition of base morphisms.
- Monad-compatible: preserves unit and multiplication of the fibrewise monad.

## Proof
- Uses: [Reindexing](./reindexing.md) to transport monadic recognitions along base morphisms while preserving unit/multiplication.
- Shows that: when fibres carry a monad, the reindexing functor lifts to monadic objects without breaking the monad laws, yielding a fibrewise monad in the target fibre.
