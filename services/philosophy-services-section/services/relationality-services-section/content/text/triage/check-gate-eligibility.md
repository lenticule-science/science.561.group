---
title: Check Gate Eligibility
id: check-gate-eligibility
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Check Gate Eligibility

Checks whether a recognition qualifies for entry into a gated subprofile/modal
layer.

## Definition
- Inputs: a recognition and gate criteria encoded in
  [Gate Recognition](../structure/gate-recognition.md).
- Output: gate recognition if eligible; otherwise failure/neutral.
- Behaviour: evaluate recognition against gating constraints; confirm or deny
  access.

## Invariants
- Soundness: admits only recognitions satisfying gate predicates.
- Stability: eligibility decisions are preserved under allowed flow/nucleus
  within the gated layer.

## Proof
- Uses: gate predicates over the recognition carrier.
- Produces: gate recognition witness.
- Shows that: gating can be enforced via recognitional checks.
