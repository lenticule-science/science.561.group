---
title: Backflow Operator
id: backflow-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Partial reverse flow that reconstructs plausible ancestors of a recognition.

## Definition
- Inputs: a recognition and admissible reverse/adjoint flow rules.
- Output: set of plausible ancestor recognitions.
- Behaviour: apply adjoint/approximate inverse of flow consistent with nucleus
  and discipline.

## Invariants
- Soundness: ancestors produce the target under forward flow (up to nucleus).
- Non-deterministic: may yield multiple ancestors.

## Proof
- Uses: flow adjunction to reverse steps.
- Produces: ancestor recognitions.
- Shows that: backward traces can be generated consistently.
