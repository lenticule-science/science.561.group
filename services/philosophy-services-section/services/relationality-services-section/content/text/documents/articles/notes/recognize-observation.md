---
title: Recognize Observation
id: recognize-observation
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Recognize Observation (Calculus)

## Definition
- Inputs: [Recognition Carrier](./recognition.md) context, [Policy Regime](./policy-regime.md), [Trace Carrier](undated/trace.md).
- Outputs: [Recognition Carrier](./recognition.md) with recognized observation.
- Behaviour: refines [Recognize Observation](./recognize-observation.md) with explicit policy/trace parameters so observation recognition is reproducible and traceable.

## Invariants
- Soundness, idempotence, and policy monotonicity inherited from the math operator, respecting calculus parameters.

## Proof
- Uses: [Recognition Carrier](./recognition.md), [Policy Regime](./policy-regime.md), and [Trace Carrier](undated/trace.md).
- Shows that: observation recognition with explicit policy/trace parameters produces earned recognition carrier elements while preserving soundness, idempotence, and policy monotonicity.
