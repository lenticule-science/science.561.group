---
title: Interleaving Flow
id: interleaving-flow
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Merges independent flows using shuffle equivalence to model concurrency.
---



Merges independent flows using shuffle equivalence to model concurrency.

## Definition
- Inputs: multiple flows/trace segments with independent contexts.
- Output: [Trace Shuffle Class](./trace-shuffle-class.md) representing
  all interleavings.
- Behaviour: compute shuffle equivalence of interleavings; collapse under
  nucleus where applicable.

## Invariants
- Commutativity: independent steps commute up to shuffle.
- Coverage: all valid interleavings are represented.

## Proof
- Uses: flow context and shuffle structure to merge traces.
- Produces: shuffle class of interleavings.
- Shows that: concurrency can be expressed as shuffle-based flow composition.
