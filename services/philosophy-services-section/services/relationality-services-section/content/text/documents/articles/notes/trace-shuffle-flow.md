---
title: Trace Shuffle Flow
id: trace-shuffle-flow
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: acts/shuffle-flow
description: The act shuffle-flow acts on shuffle classes Reorder(Tn), and commute-shuffle-flow-and-nucleus ensures the action respects nucleus equivalence.
---



## Statement

The act [`shuffle-flow`](./shuffle-flow.md) acts on shuffle classes
`Reorder(T_n)`, and [`commute-shuffle-flow-and-nucleus`](./commute-shuffle-flow-and-nucleus.md)
ensures the action respects nucleus equivalence.

## Proof sketch

`ShuffleFlow` evolves shuffle classes along evaluation contexts; commutation
with the nucleus guarantees orbits are admissible shuffle families within each
`Reorder(T_n)`.

## Uniqueness

Given the earned shuffle classes and commutation act, this flow is fixed up to
earned equivalence.

## Proof
- Derived from: [Shuffle Flow](./shuffle-flow.md).
- Inputs: [Trace Shuffle Class](./trace-shuffle-class.md).
- Shows that: shuffle flow acts on admissible reorderings, with commutation ensuring orbits respect nucleus equivalence.

## Earlier material

The act [`shuffle-flow`](shuffle-flow.md) acts on shuffle classes
`Reorder(T_n)`, and [`commute-shuffle-flow-and-nucleus`](commute-shuffle-flow-and-nucleus.md)
ensures the action respects nucleus equivalence.

## Proof
- Derived from: [Shuffle Flow](shuffle-flow.md).
- Inputs: [Trace Shuffle Class](trace-shuffle-class.md).
- Shows that: shuffle flow acts on admissible reorderings, with commutation ensuring orbits respect nucleus equivalence.
