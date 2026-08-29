---
title: Snapshot Marker
id: snapshot-marker
role: structure
status: plan
proof_refs: []
---


# Snapshot Marker

Special observation that tags the start/end of a snapshot on a channel.

## Definition
- Components: marker observations from [Seed Observation](./seed-observation.md)
  inserted into [Message Channels](./message-channel.md).
- Role: delineate snapshot windows without altering channel semantics.

## Invariants
- Transparency: markers do not change channel behaviour aside from tagging.
- Propagation: markers flow with causality and can be detected to cut snapshots.

## Proof
- Uses: [Message Channel](./message-channel.md) and marker act
  [Seed Observation](./seed-observation.md).
- Shows that: snapshot boundaries can be marked recognitionally without
  perturbing message semantics.
