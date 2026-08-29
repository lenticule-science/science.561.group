---
title: Irreversible Flow
id: irreversible-flow
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Irreversible Flow

Flow with entropy monotonicity constraints enforcing time’s direction.

## Definition
- Inputs: earned [Flow Context](./flow-context.md) and the
  [Entropy Functional](./entropy-functional.md).
- Output: constrained flow that forbids entropy decrease along admissible
  evolutions.
- Behaviour: restrict flow steps to those with non-increasing entropy; attach
  witnesses when irreversibility holds.

## Invariants
- Entropy monotonicity: entropy never increases along the flow.
- Causality: flow respects temporal ordering implied by entropy direction.

## Proof
- Uses: [Flow Context](./flow-context.md) and [Entropy Functional](./entropy-functional.md).
- Produces: constrained [Flow Context](./flow-context.md).
- Shows that: irreversibility can be enforced by restricting flow to entropy
  monotone steps.
