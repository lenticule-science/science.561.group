---
title: Snapshot Protocol
id: snapshot-protocol
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: "Relational analogue of Chandy–Lamport: assembles a consistent global snapshot from markers and channel states."
---



Relational analogue of Chandy–Lamport: assembles a consistent global snapshot
from markers and channel states.

## Definition
- Inputs: marker-capable [Message Channels](./message-channel.md),
  [Snapshot Markers](./snapshot-marker.md), and local
  [Persistent Context Carriers](./persistent-context-carrier.md).
- Output: a [Memory Carrier](./memory-carrier.md) capturing local
  contexts and in-flight channel states.
- Behaviour: inject markers, record local contexts when marker first seen,
  record [Channel State](./channel-state.md) between sends/receives,
  assemble into a consistent snapshot.

## Invariants
- Consistency: no partial receive without corresponding send in recorded state.
- Termination: snapshot collection completes under finite channels.

## Proof
- Uses: markers, channel states, and persistent contexts to collect a global
  snapshot.
- Produces: [Memory Carrier](./memory-carrier.md).
- Shows that: distributed snapshot can be captured recognitionally without
  violating causality.
