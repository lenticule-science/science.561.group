---
title: Structure Scan
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



Scans computer-layer carriers to enumerate/validate structures present in the
current evaluation state.

## Definition
- Inputs: [Evaluation State](../structure/evaluation-state.md),
  [Recognition Carrier](../structure/recognition.md) criteria, ambient
  policy/trace.
- Outputs: recognised structure inventory or [Failure Algebra](../structure/failure-algebra.md).
- Behaviour: inspects evaluation bindings, validates against recognition
  criteria using earned recognition operators, emits recognitions for
  discovered structures; failures on malformed or policy-forbidden bindings.

## Invariants
- Read-only: no mutation of evaluation state.
- Policy/trace compliance enforced during recognition; failures emitted when
  constraints violated.

## Proof
- Uses: [Recognition](recognition-api.md) over bindings in the evaluation state
  with policy/trace constraints.
- Shows that: discovery/validation over evaluation bindings yields either
  recognitions or failure witnesses without mutating the evaluation state.
