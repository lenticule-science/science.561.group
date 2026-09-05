---
title: Detect Recognition Catalysis
id: detect-recognition-catalysis
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Detects recognitions that enable otherwise impossible flow or collapse.

## Definition
- Inputs: candidate catalyst, target process (flow/collapse).
- Output: [Recognition Catalysis](./recognition-catalysis.md) witness
  if catalyst enables the process.
- Behaviour: test process with/without candidate; record enabling effect.

## Invariants
- Soundness: marks only genuine enablers.
- Persistence: catalytic effect consistent across admissible contexts.

## Proof
- Uses: flow/collapse operations to test catalysis.
- Produces: catalyst witness.
- Shows that: enabling recognitions can be detected.
