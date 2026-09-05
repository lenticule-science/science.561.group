---
title: Causal Ordering Operator
id: causal-ordering-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Extracts a Lamport-like happens-before ordering from flow and observation
recognitions.

## Definition
- Inputs: traces/observations in a [Trace Shuffle Class](../structure/trace-shuffle-class.md).
- Output: recognition encoding causal order (happens-before relation).
- Behaviour: derive partial order from observation dependencies and shuffle
  constraints; encode as recognition.

## Invariants
- Reflexive, antisymmetric, transitive partial order.
- Stable under shuffle equivalence.

## Proof
- Uses: trace/observation dependencies to build order.
- Produces: causal order recognition.
- Shows that: causality can be extracted recognitionally from traces.
