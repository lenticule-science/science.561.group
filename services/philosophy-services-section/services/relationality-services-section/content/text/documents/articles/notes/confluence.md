---
title: Confluence
id: confluence
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: acts/ensure-confluence
---



## Definition
- Inputs: divergent reduction traces witnessed by [Complete Trace](./complete-trace.md) and [Step Observation](./step-observation.md).
- Outputs: evidence that the traces rejoin, recorded by [Ensure Confluence](./ensure-confluence.md).
- Behaviour: asserts that any pair of reductions from a common source has a common successor (Church–Rosser).

## Invariants
- Common successor exists for any divergent one-step reductions.
- Reduction relation remains deterministic up to confluence; observation traces agree after join.

## Proof
- Derived from: [Ensure Confluence](./ensure-confluence.md).
- Shows that: with complete traces and step observations, divergent reductions rejoin, establishing confluence of the earned reduction relation.

## Earlier material

## Definition
- Inputs: divergent reduction traces witnessed by [Complete Trace](complete-trace.md) and [Step Observation](step-observation.md).
- Outputs: evidence that the traces rejoin, recorded by [Ensure Confluence](ensure-confluence.md).
- Behaviour: asserts that any pair of reductions from a common source has a common successor (Church–Rosser).

## Proof
- Derived from: [Ensure Confluence](ensure-confluence.md).
- Shows that: with complete traces and step observations, divergent reductions rejoin, establishing confluence of the earned reduction relation.
