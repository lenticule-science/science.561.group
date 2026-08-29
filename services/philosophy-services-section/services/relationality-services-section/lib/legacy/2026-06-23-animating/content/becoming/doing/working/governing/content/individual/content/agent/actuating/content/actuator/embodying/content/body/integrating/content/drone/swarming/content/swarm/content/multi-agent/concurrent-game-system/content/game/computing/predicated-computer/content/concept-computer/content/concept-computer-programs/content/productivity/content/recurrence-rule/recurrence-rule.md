---
title: Recurrence Rule
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-recognition
uses: []
produces: []
used_by:
  - program/productivity/operator/plan-schedule
produced_by: []
---
# Recurrence Rule

Recognition of recurrence specifications for calendar events.

## Definition
- Fields: frequency (daily/weekly/etc.), interval, byday/bymonth/bysetpos
  selectors, start/end dates, exceptions, provenance.
- Carrier: refinement of [Computer Recognition](../../../computer/structure/computer-recognition.md)
  scoped to recurrence semantics.

## Invariants
- Rules are finite/terminating or explicitly marked as infinite with bounds.
- Deterministic expansion given a start instant/timezone.
- Traceability: retains provenance and constraints.

## Proof
- Derived from: [Computer Recognition](../../../computer/structure/computer-recognition.md).
- Shows that: encoding recurrence as recognitions yields deterministic
  expansions usable by scheduling operators.
