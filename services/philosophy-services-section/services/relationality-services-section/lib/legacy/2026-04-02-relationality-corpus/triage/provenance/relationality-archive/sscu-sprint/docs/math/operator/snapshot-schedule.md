---
name: snapshot-schedule
role: operator
derived_from: computer/function/storage
inputs:
- computer/library/type/calendar-schedule
outputs:
- computer/type/computer-snapshot
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Persists or restores a calendar schedule via the computer storage operator.

## Definition
- Inputs: [Calendar Schedule](../type/calendar-schedule.md) and snapshot
  descriptor.
- Outputs: saved [Computer Snapshot](../../../computer/type/computer-snapshot.md)
  or restored schedule, or [Computer Failure](../../../computer/type/computer-failure.md).
- Behaviour: serialize schedule to snapshot; on restore, verify integrity and
  reconstruct schedule.

## Invariants
- Integrity: snapshot hash/metadata must verify.
- Fidelity: save/load round-trips yield equivalent schedules.
- Failure purity: failures do not mutate schedule.

## Proof
- Derived from: [Computer Storage](../../../computer/function/storage.md).
- Shows that: persisting/restoring schedules via computer storage preserves
  kernel semantics and schedule integrity.
