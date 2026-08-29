---
title: Channel State
id: channel-state
role: structure
status: plan
proof_refs: []
---


# Channel State

Snapshot of in-flight messages on a channel as trace prefixes/suffixes.

## Definition
- Components: partial traced steps from [Traced Step Observation](../acts/traced-step-observation.md)
  along a [Message Channel](message-channel.md); markers for snapshot
  boundaries.
- Structure: records sent/received observations around a cut.

## Invariants
- Consistency: partial receives always correspond to sent observations in the
  snapshot window.
- Ordering: respects channel order; markers bracket the captured segment.

## Proof
- Uses: [Message Channel](message-channel.md) and
  [Traced Step Observation](../acts/traced-step-observation.md) to record
  in-flight messages.
- Shows that: channel state can be captured consistently for distributed
  snapshots.
