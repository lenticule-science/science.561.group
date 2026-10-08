---
title: Propagate Flow and Reach on Tower
id: propagate-flow-reach-tower
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from:
  - acts/reach
  - acts/flow-profile
description: The Propagate Flow and Reach on Tower operator applies the earned flow and reach along the levels of a Modality Tower.
---



The **Propagate Flow and Reach on Tower** operator applies the earned flow and
reach along the levels of a [Modality Tower](./modality-tower.md).

## Definition
- Input: a modality tower.
- Output: an updated modality tower with flow/reach propagated.
- Behaviour: applies the flow profile and reach acts levelwise, ensuring
  compatibility with tower composition.

## Invariants
- Flow and reach respect tower faces/degeneracies.
- Propagation stays within the earned tower structure.

## Proof
Built from [`acts/flow-profile`](./flow-profile.md) and
[`acts/reach`](./reach.md), applied levelwise to the modality
tower. The acts ensure compatibility with tower laws.
