---
title: Measure Recognition Collapse Depth
id: measure-recognition-collapse-depth
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Measure Recognition Collapse Depth

Measures how many nucleus/simplification steps a recognition needs to reach
normal form.

## Definition
- Inputs: a recognition.
- Output: [Recognition Collapse Depth](./recognition-collapse-depth.md).
- Behaviour: run normalisation, count steps, return the count.

## Invariants
- Zero for normal forms.
- Deterministic given the recognition and normalisation strategy.

## Proof
- Uses: normal form computation.
- Produces: collapse depth metric.
- Shows that: collapse depth aligns with the chosen normalisation procedure.
