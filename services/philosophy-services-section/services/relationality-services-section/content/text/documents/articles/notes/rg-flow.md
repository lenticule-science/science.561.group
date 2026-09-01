---
title: RG Flow
id: rg-flow
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Iterates renormalisation steps toward fixed points.

## Definition
- Inputs: initial [Scale Window](./scale-window.md) and section.
- Outputs: candidate [RG Fixed Point](./rg-fixed-point.md) or an
  evolving sequence approaching one.
- Behaviour: repeatedly apply [RG Step](./rg-step.md) along coarser embeddings
  until convergence or cycle; collect fixed-point witnesses.

## Invariants
- Monotone coarse-graining: each step reduces scale detail.
- Convergence: if a fixed point exists, iteration stabilises up to nucleus
  equivalence.

## Proof
- Uses: [RG Step](./rg-step.md) iteratively.
- Produces: [RG Fixed Point](./rg-fixed-point.md) when convergence
  occurs.
- Shows that: RG iteration is a well-defined flow toward large-scale phases.
