---
title: "Flow\u2013Nucleus Distribution"
id: flow-nucleus-distribution
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: acts/distribute-flow
description: The earned acts show that nuclei and flows distribute over finite meets/joins and shuffles.
---



## Statement

The earned acts show that nuclei and flows distribute over finite meets/joins
and shuffles.

## Definition
- Inputs: [Admissible Morphism](./admissible-morphism.md), [Trace Shuffle Class](./trace-shuffle-class.md).
- Outputs: [Admissible Morphism](./admissible-morphism.md) after distributing flow/nucleus over joins/meets/shuffles.
- Behaviour: applies the earned distribution acts ([Absorb Closure](./absorb-closure.md), [Distribute Interior](./distribute-interior.md), [Equalize Nucleus Distribution](./equalize-nucleus-distribution.md), [Distribute Flow](./distribute-flow.md)) to show flow/nucleus commute with lattice operations and trace shuffles on admissible morphisms.

## Invariants
- Distribution holds: applying flow/nucleus before or after joins/meets/shuffles yields equivalent admissible morphisms.
- Stability: resulting morphisms remain admissible and respect flow–nucleus compatibility.

## Proof
- Derived from: [Distribute Flow](./distribute-flow.md) and related distribution acts.
- Shows that: flow/nucleus distribute over earned lattice operations and shuffles on admissible morphisms, fixing the distributive laws up to earned equivalence.
