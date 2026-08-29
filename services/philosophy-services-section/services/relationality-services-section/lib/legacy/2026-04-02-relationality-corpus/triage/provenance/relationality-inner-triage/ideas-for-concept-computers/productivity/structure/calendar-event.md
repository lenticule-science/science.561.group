---

name: calendar-event
kind: structure
layer: program
derived_from: computer/structure/computer-recognition
uses: []
produces: []
used_by:
  - program/productivity/operator/recognize-event
  - program/productivity/operator/normalize-time
  - program/productivity/operator/plan-schedule
produced_by:
  - program/productivity/operator/recognize-event
---

Recognition of a calendar commitment/task with time, recurrence, and policy
metadata.

## Definition
- Fields: title/description, start/end (instant/duration), recurrence
  reference, timezone reference, constraints (dependencies, location),
  provenance/policy.
- Carrier: refinement of [Computer Recognition](../../../computer/structure/computer-recognition.md)
  scoped to calendar semantics.

## Invariants
- Well-formed instants/durations; references to timezone/recurrence must exist.
- Policy bindings match the event’s context and participants.
- Traceability: retains provenance and trace span.

## Proof
- Derived from: [Computer Recognition](../../../computer/structure/computer-recognition.md).
- Shows that: specialising recognitions to calendar events yields an event
  carrier suitable for scheduling operators.
