---
title: Find Fixed Profile Chain
id: find-fixed-profile-chain
role: operator
status: plan
derived_from:
- acts/ensure-fixed-point
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Find Fixed Profile Chain

The **Find Fixed Profile Chain** operator computes a fixed distribution for the
[Profile Kernel Chain](./profile-kernel-chain.md).

## Definition
- Inputs: [Profile Kernel Chain](./profile-kernel-chain.md).
- Outputs: stabilised [Profile Kernel Chain](./profile-kernel-chain.md) representing the fixed point.
- Behaviour: applies fixed-point machinery from [Ensure Fixed Point](./ensure-fixed-point.md) to the profile kernel chain to compute its fixed distribution.

## Invariants
- Fixed chain is unique up to stabilised equivalence.
- Preserves interaction with fixed geometry at each profile level; respects flow/nucleus compatibility of the underlying kernels.

## Proof
Derived from `acts/ensure-fixed-point`, which guarantees existence/uniqueness
of a fixed distribution for the chain under the earned conditions.
