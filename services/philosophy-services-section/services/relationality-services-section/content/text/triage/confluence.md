---
title: Confluence
id: confluence
role: operator
status: plan
derived_from: acts/ensure-confluence
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



## Definition
- Inputs: divergent reduction traces witnessed by [Complete Trace](../acts/complete-trace.md) and [Step Observation](../acts/step-observation.md).
- Outputs: evidence that the traces rejoin, recorded by [Ensure Confluence](../acts/ensure-confluence.md).
- Behaviour: asserts that any pair of reductions from a common source has a common successor (Church–Rosser).

## Invariants
- Common successor exists for any divergent one-step reductions.
- Reduction relation remains deterministic up to confluence; observation traces agree after join.

## Proof
- Derived from: [Ensure Confluence](../acts/ensure-confluence.md).
- Shows that: with complete traces and step observations, divergent reductions rejoin, establishing confluence of the earned reduction relation.
