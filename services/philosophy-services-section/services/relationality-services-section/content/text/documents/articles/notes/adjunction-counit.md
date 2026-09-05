---
title: Adjunction Counit
id: adjunction-counit
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Counit natural transformation for the flow–nucleus adjunction.

## Definition
- Inputs: a [Context](./context.md).
- Outputs: counit map `epsilon: flow ∘ nucleus → Id` at that context.

## Invariants
- Natural in context.
- Satisfies the other triangle identity with the unit.

## Proof
- Uses: [Flow–Nucleus Adjunction](./flow-nucleus-adjunction.md) to
  supply the counit.
- Shows that: counit maps exist and satisfy the adjunction laws.
