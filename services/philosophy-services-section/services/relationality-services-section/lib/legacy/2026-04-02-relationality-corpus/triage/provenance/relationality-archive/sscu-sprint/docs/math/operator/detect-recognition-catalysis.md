---
name: detect-recognition-catalysis
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Detects recognitions that enable otherwise impossible flow or collapse.

## Definition
- Inputs: candidate catalyst, target process (flow/collapse).
- Output: [Recognition Catalysis](../structure/recognition-catalysis.md) witness
  if catalyst enables the process.
- Behaviour: test process with/without candidate; record enabling effect.

## Invariants
- Soundness: marks only genuine enablers.
- Persistence: catalytic effect consistent across admissible contexts.

## Proof
- Uses: flow/collapse operations to test catalysis.
- Produces: catalyst witness.
- Shows that: enabling recognitions can be detected.
