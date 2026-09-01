---
name: recognize-observation
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

## Definition
- Inputs: [Recognition Carrier](../structure/recognition.md) context, [Policy Regime](../structure/policy-regime.md), [Trace Carrier](../structure/trace.md).
- Outputs: [Recognition Carrier](../structure/recognition.md) with recognized observation.
- Behaviour: refines [Recognize Observation](recognize-observation.md) with explicit policy/trace parameters so observation recognition is reproducible and traceable.

## Invariants
- Soundness, idempotence, and policy monotonicity inherited from the math operator, respecting calculus parameters.

## Proof
- Uses: [Recognition Carrier](../structure/recognition.md), [Policy Regime](../structure/policy-regime.md), and [Trace Carrier](../structure/trace.md).
- Shows that: observation recognition with explicit policy/trace parameters produces earned recognition carrier elements while preserving soundness, idempotence, and policy monotonicity.
