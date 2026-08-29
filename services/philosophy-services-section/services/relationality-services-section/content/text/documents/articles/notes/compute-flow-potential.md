---
title: Compute Flow Potential
id: compute-flow-potential
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Compute Flow Potential

Computes flow potential for recognitions to guide scheduling/optimisation.

## Definition
- Inputs: recognition, flow rules, and [Entropy Functional](./entropy-functional.md).
- Output: [Flow Potential](./flow-potential.md) value.
- Behaviour: estimate entropy production/resistance along likely flow paths;
  assign potential.

## Invariants
- Consistency: higher potentials correspond to higher expected entropy/effort.
- Stability: potential recomputed coherently as flow rules change.

## Proof
- Uses: flow and entropy to estimate potential.
- Produces: potential assignment.
- Shows that: potential is well-defined and useful for planning.
