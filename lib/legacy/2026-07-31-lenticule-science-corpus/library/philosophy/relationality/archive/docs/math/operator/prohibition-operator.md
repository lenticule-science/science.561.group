---
title: Prohibition Operator
id: prohibition-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Prohibition Operator

Recognises recognitions that violate norms.

## Definition
- Inputs: [Norm Regime](../structure/norm-regime.md) and a recognition.
- Output: violation recognition (e.g., bottom/contradiction) when input is
  outside the admissible region; neutral/top when compliant.
- Behaviour: apply the regime’s predicate to classify prohibition.

## Invariants
- Soundness: prohibited recognitions always yield violation.
- Completeness: any violation is detected; compliant recognitions are neutral.
- Monotonicity: strengthening the regime can only increase prohibitions.

## Proof
- Uses: [Norm Regime](../structure/norm-regime.md) and
  [Recognition Carrier](../structure/recognition.md).
- Produces: [Recognition Carrier](../structure/recognition.md) marking
  prohibition.
- Shows that: prohibitions are recognisable as operators within the earned
  logic algebra.
