---
title: Snapshot Protocol
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



Relational analogue of Chandy–Lamport: assembles a consistent global snapshot
from markers and channel states.

## Definition
- Inputs: marker-capable [Message Channels](../structure/message-channel.md),
  [Snapshot Markers](../structure/snapshot-marker.md), and local
  [Persistent Context Carriers](../structure/persistent-context-carrier.md).
- Output: a [Memory Carrier](../structure/memory-carrier.md) capturing local
  contexts and in-flight channel states.
- Behaviour: inject markers, record local contexts when marker first seen,
  record [Channel State](../structure/channel-state.md) between sends/receives,
  assemble into a consistent snapshot.

## Invariants
- Consistency: no partial receive without corresponding send in recorded state.
- Termination: snapshot collection completes under finite channels.

## Proof
- Uses: markers, channel states, and persistent contexts to collect a global
  snapshot.
- Produces: [Memory Carrier](../structure/memory-carrier.md).
- Shows that: distributed snapshot can be captured recognitionally without
  violating causality.
