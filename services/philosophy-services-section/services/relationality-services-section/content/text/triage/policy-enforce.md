---
title: Policy Enforcement
id: policy-enforce
role: Check and enforce a policy regime over traces/ports/tasks.
status: plan
inputs:
- id: policy-regime
  name: policy
- id: trace
  name: trace
outputs:
- id: policy-regime
  name: policy'
- id: failure-carrier
  name: failure
transformation:
- return
- value
proof_refs: []
---



Checks and enforces policy regimes over traces/ports/tasks.

## Behaviour
- Detect violations of the policy against the trace.
- If none, return the policy (possibly annotated); otherwise emit a failure.

## Proof
- Uses: violation detection and failure emission operators.
- Shows that: enforcement reports violations via failure carriers without
  mutating state when violations occur.
