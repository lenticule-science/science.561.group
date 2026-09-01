---
title: Hypertensor Fiber
role: structure
emerges_from: profile-recognitions
proof_refs:
- profile-recognitions
fields:
- name: context
  type: trace
  description: traced context serving as the base.
- name: recognitions
  type: recognition
  description: stabilised recognitions/measurements over the context.
- name: flow_nucleus
  type: flow-nucleus-adjunction
  description: compatibility data for flow and nucleus on the fibre.
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: traced contexts with stabilised recognitions/measurements.
- Source: earned from [Profile Recognitions](../acts/profile-recognitions.md) applied to traced contexts.

## Invariants
- Flow–nucleus compatibility: recognitions respect [`flow`](../acts/flow.md) and [`nucleate`](../acts/nucleate.md) and their commutation.
- Composite-profile stability: fibres remain active under [`flow-composite-profile`](../acts/flow-composite-profile.md).

## Proof
- Derived from: [Profile Recognitions](../acts/profile-recognitions.md), using trace infrastructure and flow/nucleus compatibility acts.
- Shows that: applying profile recognitions to traced contexts yields fibres carrying stabilised recognitions/measurements, satisfying hypertensor fibre requirements.
