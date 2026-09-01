---
title: Temporal Kernel Evolve
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



Applies a temporal kernel to evolve recognitions over time.

## Definition
- Inputs: a [Temporal Kernel](../structure/temporal-kernel.md) and initial
  recognitions.
- Output: evolved recognitions after a time step/interval.
- Behaviour: apply the kernel’s time evolution operator; compose semigroup
  style for multiple steps.

## Invariants
- Semigroup: evolution over `t1+t2` equals composition over `t1` then `t2`.
- Flow-respecting: evolution adheres to admissible flow.

## Proof
- Uses: temporal kernel operations.
- Produces: evolved recognitions.
- Shows that: deterministic time evolution can be executed via the kernel.
