---
title: Temporal Recognizer
id: temporal-recognizer
role: structure
status: plan
proof_refs: []
---


# Temporal Recognizer

Binds recognitions to timestamps and stabilises them under time flow.

## Definition
- Components: recognition plus temporal metadata referencing a [Time Slice](time-slice.md).
- Behaviour: propagates with time flow, maintaining consistency with saved
  memory/state.

## Invariants
- Temporal stability: recognitions carry valid timestamps; remain valid under
  time evolution.
- Restoration: can be aligned with time slices for rollback or replay.

## Proof
- Uses: [Recognition Carrier](recognition.md) and [Time Slice](time-slice.md).
- Shows that: recognitions can be temporally anchored for persistence/rollback.
