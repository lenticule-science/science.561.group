---
title: Computer Recognition
id: recognition-api
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Computer Recognition

## Definition
- Inputs: recognition request (criteria/policy) as a
  [Recognition Carrier](./recognition.md) plus ambient
  [Policy Regime](./policy-regime.md) and [Trace Carrier](./trace.md).
- Outputs: accepted recognition carrier or [Failure Algebra](./failure-algebra.md) element.
- Behaviour:
  1. Validate criteria and policy scopes against admissible recognitions.
  2. Invoke earned recognition operators ([Recognize Observation](./recognize-observation.md),
     [Recognize Context](./recognize-context.md), etc.) on the supplied carrier.
  3. If criteria and policy hold, return the recognised carrier tagged with
     provenance; otherwise emit a failure witness with diagnostics and trace span.

## Invariants
- Preservation: successful recognitions coincide with earned recognition
  semantics; policy/trace witnesses are recorded.
- Safety: failures leave carriers unchanged; no state mutation on failure.

## Proof
- Uses: recognition operators plus policy/trace carriers to check admissibility.
- Shows that: applying earned recognition with explicit policy/trace context
  yields either a recognised carrier or a failure witness without mutating
  state.
