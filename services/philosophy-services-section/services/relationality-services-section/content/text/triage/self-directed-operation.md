---
title: Self-Directed Operation
id: self-directed-operation
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Executes an evaluation step initiated internally (e.g., maintenance tasks) under
explicit policy/trace guardrails.

## Definition
- Inputs: [Evaluation State](../structure/evaluation-state.md),
  [Wiring Plan](../structure/wiring-plan.md) marking eligible self-directed
  steps, ambient [Policy Regime](../structure/policy-regime.md), and
  [Trace Carrier](../structure/trace.md).
- Outputs: updated evaluation state or [Failure Algebra](../structure/failure-algebra.md).
- Behaviour: selects permitted internal steps (maintenance, scans), executes
  them via evaluate-step semantics, and records failures when guardrails are
  violated.

## Invariants
- Only whitelisted internal steps may execute; respects policy/trace.
- Failure purity: failures leave state unchanged.
- Auditable: actions recorded in evaluation state/plan bindings.

## Proof
- Uses: [Evaluate Computer Step](evaluate-computer-step.md) semantics restricted
  to whitelisted internal tasks and guardrails from the policy/trace.
- Shows that: executing only permitted internal steps preserves evaluation
  invariants; violations are captured in the failure algebra without mutating
  state.
