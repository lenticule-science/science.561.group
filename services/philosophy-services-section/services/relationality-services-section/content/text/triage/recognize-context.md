---
title: Recognize Context
id: recognize-context
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Recognize Context (Calculus)

## Definition
- Inputs: [Recognition Carrier](../structure/recognition.md) context, [Policy Regime](../structure/policy-regime.md), [Trace Carrier](../structure/trace.md).
- Outputs: [Recognition Carrier](../structure/recognition.md) with recognized context/state/policy/trace.
- Behaviour: refines [Recognize Context](recognize-context.md) with explicit policy and trace parameters so context recognition is reproducible and traceable.

## Invariants
- Recognition results respect the calculus policy/trace parameters.
- Stable under reapplication with the same parameters (extend trace/refine policy, payload/state fixed).

## Proof
- Uses: [Recognition Carrier](../structure/recognition.md), [Policy Regime](../structure/policy-regime.md), and [Trace Carrier](../structure/trace.md) to parameterize the recognition.
- Shows that: recognition of contexts with explicit policy/trace inputs yields earned recognition carrier elements stable under reapplication with the same parameters.
