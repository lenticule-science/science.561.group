---
title: Channel Consistency Operator
id: channel-consistency-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Ensures messages that haven’t crossed nucleus boundaries are preserved across
snapshots.

## Definition
- Inputs: [Message Channel](./message-channel.md) and
  [Channel State](./channel-state.md).
- Output: recognition indicating whether channel state is consistent with
  snapshots (no lost/duplicated messages).
- Behaviour: compare send/receive records within the channel state; ensure
  unmatched messages are captured appropriately.

## Invariants
- Soundness: flags inconsistencies; passes consistent channels.
- Stability: consistent channel remains consistent under snapshot composition.

## Proof
- Uses: channel/message records to verify integrity.
- Produces: recognition of channel consistency.
- Shows that: channel correctness can be validated recognitionally for snapshot
  assembly.
