---
name: quasi-identity-operator
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



Applies an almost-identity flow to a recognition, collapsing deviations via
nucleus.

## Definition
- Inputs: a recognition and a [Quasi-Identity Flow](../structure/quasi-identity-flow.md).
- Output: recognition nucleus-equivalent to the input.
- Behaviour: execute the flow, then collapse deviations with nucleus to recover
  an equivalent recognition.

## Invariants
- Idempotent up to nucleus: repeated application yields same result.
- Stability: deviations never push outside admissible nucleus class.

## Proof
- Uses: quasi-identity flows and nucleus closure.
- Produces: recognition equivalent to input.
- Shows that: near-identity flows can be treated as identity modulo nucleus.
