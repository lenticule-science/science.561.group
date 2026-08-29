---
name: temporal-recognizer
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



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
