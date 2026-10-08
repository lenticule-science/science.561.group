---
title: Compute Profile Mixing
id: compute-profile-mixing
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from:
  - acts/profile-mixing
description: The Compute Profile Mixing operator applies the profile mixing act to push entropy forward along a profile kernel chain until stationarity.
---



The **Compute Profile Mixing** operator applies the profile mixing act to push
entropy forward along a profile kernel chain until stationarity.

## Definition
- Input: a [Profile Kernel Chain](./profile-kernel-chain.md).
- Output: an updated chain reflecting mixing towards stationarity.
- Behaviour: composes profile dynamics and profile entropy per
  [`acts/profile-mixing`](./profile-mixing.md).

## Invariants
- Entropy increases until a stationary profile is reached.
- Chain remains within the earned carrier.

## Proof
Direct application of `acts/profile-mixing`; inherits mixing properties and
preserves the chain carrier.
