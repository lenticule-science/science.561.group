---
title: Derive Happens-Before
id: derive-happens-before
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Derives the happens-before partial order from traces and channels.

## Definition
- Inputs: a [Trace Shuffle Class](../structure/trace-shuffle-class.md) and
  [Message Channels](../structure/message-channel.md) with send/receive events.
- Output: [Happens-Before Relation](../structure/happens-before.md).
- Behaviour: combine program order within traces and channel order to form the
  transitive closure.

## Invariants
- Partial order properties hold.
- Invariant under shuffle-equivalent interleavings.

## Proof
- Uses: trace ordering and channel ordering to build relation.
- Produces: causality relation.
- Shows that: causality extraction is well-defined and stable under interleavings.
