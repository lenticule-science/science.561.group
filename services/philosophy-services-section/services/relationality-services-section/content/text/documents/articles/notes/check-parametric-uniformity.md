---
title: Check Parametric Uniformity
id: check-parametric-uniformity
role: operator
status: plan
derived_from: acts/context-adjunction-witness
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



The **Check Parametric Uniformity** operator asserts the parametricity
property: terms related in one indexed context remain related under all
reindexings of the context geometry.

## Definition
- Inputs: an [Indexed Category](./indexed-category.md) over the
  [Index Base](./index-base.md) and its corresponding
  [Parametric Semantics](./parametric-semantics.md) carrier.
- Behaviour: checks, using the [Context Adjunction Witness](./context-adjunction-witness.md),
  that reindexing along any base morphism preserves the parametric semantic
  relations.
- Outputs: the same [Parametric Semantics](./parametric-semantics.md)
  equipped with a uniformity witness.

## Invariants
- Reindexing respects the flow–nucleus adjunction.
- Related arguments remain related under all reindexings in the index base.

## Proof
- Derived from: [Context Adjunction Witness](./context-adjunction-witness.md),
  which supplies the unit/counit equations for reindexing.
- Uses: [Indexed Category](./indexed-category.md) to transport
  contexts and [Parametric Semantics](./parametric-semantics.md) as
  the relations being preserved.
- Shows that: when reindexing is governed by the adjunction witness, the
  parametric semantics remain invariant across base morphisms, yielding the
  uniformity certificate.
