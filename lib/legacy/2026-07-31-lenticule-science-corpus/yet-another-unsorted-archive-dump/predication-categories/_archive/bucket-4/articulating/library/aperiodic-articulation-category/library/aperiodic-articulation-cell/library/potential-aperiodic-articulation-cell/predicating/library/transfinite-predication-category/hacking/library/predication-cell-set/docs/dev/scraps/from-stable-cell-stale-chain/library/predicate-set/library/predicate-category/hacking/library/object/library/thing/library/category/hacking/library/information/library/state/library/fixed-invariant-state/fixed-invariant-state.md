---
title: Fixed Invariant State
id: fixed-invariant-state
role: structure
status: plan
derived_from:
- acts/fixed-invariant
proof_refs: []
---


# Fixed Invariant State

The **Fixed Invariant State** carrier is earned from
[`acts/fixed-invariant`](docs/math/acts/fixed-invariant.md). It represents
states that are stabilised by a fixed profile of recognitions.

## Definition
- Elements: states whose recognitions satisfy the fixed-profile invariance
  conditions from `acts/fixed-invariant`.
- Structure: admits earned flow and nucleus operators restricted to the fixed
  profile.

## Invariants
- Membership requires stability under the fixed profile recognitions.
- Flow and nucleus operations on these states remain within the carrier.

## Proof
Directly derived from `acts/fixed-invariant`, which provides the admissibility
conditions and stability requirements. This structure packages those earned
states for use by operators such as
[Compute Fixed Reach](docs/math/operator/compute-fixed-reach.md) and
[Measure Fixed Invariant](docs/math/operator/measure-fixed-invariant.md).
