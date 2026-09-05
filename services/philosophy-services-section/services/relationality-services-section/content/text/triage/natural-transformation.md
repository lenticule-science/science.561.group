---
title: Natural Transformation
id: natural-transformation
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
- Inputs: two fibrewise functors built from the [Effect Monad](../structure/effect-monad.md) and [Coeffect Comonad](../structure/coeffect-comonad.md) acting over the indexed base.
- Outputs: a family of morphisms, one per context, commuting with both effect and coeffect reindexing actions.
- Behaviour: assigns to each context a morphism between the corresponding fibres such that pulling back along any base morphism preserves the transformation (naturality square commutes).

## Invariants
- Reindexing-natural: for any base morphism, reindexing then transforming equals transforming then reindexing.
- Compatible with monad/comonad structure: respects unit/multiplication and counit/comultiplication where applicable.

## Proof
- Uses: the indexed monad/comonad structures ([Effect Monad](../structure/effect-monad.md), [Coeffect Comonad](../structure/coeffect-comonad.md)) to define source and target functors.
- Produces: [Module](../structure/module.md) witnesses built from families of fibrewise arrows that commute with reindexing.
- Shows that: specifying fibrewise arrows that commute with reindexing yields a natural transformation across the indexed base, refining the context-level notion at calculus.
