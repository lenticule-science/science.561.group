---
title: Trace Shuffle Flow
id: trace-shuffle-flow
role: operator
status: plan
derived_from: acts/shuffle-flow
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Statement

The act [`shuffle-flow`](../acts/shuffle-flow.md) acts on shuffle classes
`Reorder(T_n)`, and [`commute-shuffle-flow-and-nucleus`](../acts/commute-shuffle-flow-and-nucleus.md)
ensures the action respects nucleus equivalence.

## Proof sketch

`ShuffleFlow` evolves shuffle classes along evaluation contexts; commutation
with the nucleus guarantees orbits are admissible shuffle families within each
`Reorder(T_n)`.

## Uniqueness

Given the earned shuffle classes and commutation act, this flow is fixed up to
earned equivalence.

## Proof
- Derived from: [Shuffle Flow](../acts/shuffle-flow.md).
- Inputs: [Trace Shuffle Class](../structure/trace-shuffle-class.md).
- Shows that: shuffle flow acts on admissible reorderings, with commutation ensuring orbits respect nucleus equivalence.
