---
title: Debias Flow
id: debias-flow
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Flow that attempts to cancel bias via normalisation and context flow.
---



Flow that attempts to cancel bias via normalisation and context flow.

## Definition
- Inputs: biased epistemic profile (from [Bias Operator](./bias-operator.md)) and
  [Flow Context](./flow-context.md).
- Output: debiased [Epistemic Profile](./epistemic-profile.md).
- Behaviour: apply inverse/normalising transform to undo bias where possible,
  propagate through context flow, and stabilise.

## Invariants
- Correctness: applying bias then debias approximates identity when invertible.
- Stability: debiasing preserves admissible recognitions; never invents new
  recognitions beyond the unbiased base.

## Proof
- Uses: [Bias Operator](./bias-operator.md) and [Flow Context](./flow-context.md).
- Produces: [Epistemic Profile](./epistemic-profile.md).
- Shows that: biases can be countered within the earned flow framework.
