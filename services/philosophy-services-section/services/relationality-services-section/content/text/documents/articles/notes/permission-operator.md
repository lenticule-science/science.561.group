---
title: Permission Operator
id: permission-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Permission Operator

Recognises the actions/recognitions allowed under a norm regime.

## Definition
- Inputs: [Norm Regime](./norm-regime.md) and a recognition.
- Output: recognition collecting admissible refinements compatible with the
  regime’s discipline/filter.
- Behaviour: project the input onto the admissible region of the norm regime.

## Invariants
- Soundness: outputs are always compliant.
- Maximality: yields the largest admissible recognition below or compatible
  with the input.
- Monotonicity: stronger regimes yield smaller permissions.

## Proof
- Uses: [Norm Regime](./norm-regime.md) and
  [Recognition Carrier](./recognition.md).
- Produces: [Recognition Carrier](./recognition.md) element
  denoting permission.
- Shows that: permissions are expressible as projections in the recognition
  lattice under the norm regime.
