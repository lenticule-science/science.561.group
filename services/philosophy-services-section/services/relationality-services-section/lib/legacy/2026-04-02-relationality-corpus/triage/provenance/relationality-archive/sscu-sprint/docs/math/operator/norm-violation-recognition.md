---
name: norm-violation-recognition
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



Detects when a recognition violates a norm regime and emits a violation witness
or neutral element if compliant.

## Definition
- Inputs: a [Norm Regime](../structure/norm-regime.md) and a recognition in the
  [Recognition Carrier](../structure/recognition.md).
- Outputs: recognition of violation (or neutral if compliant).
- Behaviour: evaluate the recognition against the regime’s admissibility
  predicate; if outside, return a violation recognition (e.g., bottom or tagged
  violation); otherwise return neutral/top.

## Invariants
- Soundness: compliant recognitions do not yield violation; violators always
  yield violation.
- Monotonicity: tightening the regime cannot turn a violation into compliance.
- Compatibility: interacts with flow/nucleus so violations remain violations
  under evolution.

## Proof
- Uses: [Norm Regime](../structure/norm-regime.md) as policy, and
  [Recognition Carrier](../structure/recognition.md) as domain/codomain.
- Produces: [Recognition Carrier](../structure/recognition.md) marking
  violation.
- Shows that: normative predicates can be expressed as recognition operations
  consistent with earned lattice/logic structure.
