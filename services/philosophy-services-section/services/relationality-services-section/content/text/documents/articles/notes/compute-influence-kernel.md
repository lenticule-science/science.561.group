---
title: Compute Influence Kernel
id: compute-influence-kernel
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Computes how recognitions transform others under flow.

## Definition
- Inputs: source recognitions and [Flow Context](./flow-context.md).
- Output: [Influence Kernel](./influence-kernel.md) mapping sources to
  induced changes in targets.
- Behaviour: perturb source, propagate via flow, measure effect on targets, and
  record in kernel.

## Invariants
- Consistency with flow composition.
- Monotonicity: larger perturbations yield larger influences.

## Proof
- Uses: flow dynamics to measure influence.
- Produces: influence kernel.
- Shows that: differential effects can be captured recognitionally.
