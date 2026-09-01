---
title: Detect Equivalence Shock
id: detect-equivalence-shock
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Detects sudden nucleus-equivalence of distinct recognitions after perturbation.

## Definition
- Inputs: recognitions and a flow/perturbation path.
- Output: [Equivalence Shock](../structure/equivalence-shock.md) witness when
  two recognitions collapse unexpectedly.
- Behaviour: track equivalence classes along flow; flag abrupt mergers.

## Invariants
- Soundness: flags only when equivalence arises abruptly.
- Persistence: post-shock equivalence holds under further flow.

## Proof
- Uses: flow evolution and nucleus checks.
- Produces: equivalence shock record.
- Shows that: sudden equivalence events are detectable.
