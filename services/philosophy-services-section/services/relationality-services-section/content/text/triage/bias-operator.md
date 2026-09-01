---
title: Bias Operator
id: bias-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Systematically distorts epistemic recognitions according to historical or
baseline patterns.

## Definition
- Inputs: an [Epistemic Profile](../structure/epistemic-profile.md) and an
  implicit/earned bias pattern (e.g., baseline remainder).
- Output: biased [Epistemic Profile](../structure/epistemic-profile.md).
- Behaviour: apply transformation to recognitions to reflect bias (e.g.,
  skewing probabilities, suppressing certain observations).

## Invariants
- Determinism: given the bias pattern, output is fixed.
- Monotonicity: repeated application compounds bias.

## Proof
- Uses: [Epistemic Profile](../structure/epistemic-profile.md) and bias pattern.
- Produces: biased [Epistemic Profile](../structure/epistemic-profile.md).
- Shows that: bias can be encoded as a transformation on epistemic states.
