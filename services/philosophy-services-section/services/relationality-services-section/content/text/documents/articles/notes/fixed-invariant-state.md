---
title: Fixed Invariant State
id: fixed-invariant-state
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/fixed-invariant
description: The Fixed Invariant State carrier is earned from acts/fixed-invariant.
---



The **Fixed Invariant State** carrier is earned from
[`acts/fixed-invariant`](./fixed-invariant.md). It represents
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
[Compute Fixed Reach](./compute-fixed-reach.md) and
[Measure Fixed Invariant](./measure-fixed-invariant.md).

## Earlier material

The **Fixed Invariant State** carrier is earned from
[`acts/fixed-invariant`](fixed-invariant.md). It represents
states that are stabilised by a fixed profile of recognitions.

## Proof
Directly derived from `acts/fixed-invariant`, which provides the admissibility
conditions and stability requirements. This structure packages those earned
states for use by operators such as
[Compute Fixed Reach](compute-fixed-reach.md) and
[Measure Fixed Invariant](measure-fixed-invariant.md).
