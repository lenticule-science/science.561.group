---
title: Recognize Judgement Triad
id: recognize-judgement-triad
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Recognize Judgement Triad (Calculus)

## Definition
- Inputs: [Recognition Carrier](./recognition.md) context, [Policy Regime](./policy-regime.md), [Trace Carrier](undated/trace.md).
- Outputs: [Recognition Carrier](./recognition.md) with recognized judgement triad.
- Behaviour: refines [Recognize Judgement Triad](./recognize-judgement-triad.md) with explicit policy/trace parameters to make judgement recognition reproducible and traceable.

## Invariants
- Soundness, idempotence, and policy monotonicity inherited from the math operator, respecting calculus parameters.

## Proof
- Uses: [Recognition Carrier](./recognition.md) plus [Policy Regime](./policy-regime.md) and [Trace Carrier](undated/trace.md) to parameterize judgement recognition.
- Shows that: judgement recognition with explicit policy/trace parameters produces earned recognition carrier elements and preserves soundness, idempotence, and policy monotonicity.
