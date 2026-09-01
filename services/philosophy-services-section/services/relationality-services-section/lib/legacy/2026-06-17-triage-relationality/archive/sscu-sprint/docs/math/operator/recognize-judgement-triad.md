---
title: Recognize Judgement Triad
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


# Recognize Judgement Triad (Calculus)

## Definition
- Inputs: [Recognition Carrier](../structure/recognition.md) context, [Policy Regime](../structure/policy-regime.md), [Trace Carrier](../structure/trace.md).
- Outputs: [Recognition Carrier](../structure/recognition.md) with recognized judgement triad.
- Behaviour: refines [Recognize Judgement Triad](recognize-judgement-triad.md) with explicit policy/trace parameters to make judgement recognition reproducible and traceable.

## Invariants
- Soundness, idempotence, and policy monotonicity inherited from the math operator, respecting calculus parameters.

## Proof
- Uses: [Recognition Carrier](../structure/recognition.md) plus [Policy Regime](../structure/policy-regime.md) and [Trace Carrier](../structure/trace.md) to parameterize judgement recognition.
- Shows that: judgement recognition with explicit policy/trace parameters produces earned recognition carrier elements and preserves soundness, idempotence, and policy monotonicity.
