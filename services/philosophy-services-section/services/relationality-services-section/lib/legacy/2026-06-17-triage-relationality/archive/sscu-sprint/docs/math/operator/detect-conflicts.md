---
title: Detect Conflicts
role: operator
derived_from: computer/function/evaluate-step
inputs:
- computer/library/type/calendar-schedule
outputs:
- computer/library/type/conflict-report
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Detects overlaps and constraint violations in a calendar schedule.

## Definition
- Inputs: [Calendar Schedule](../type/calendar-schedule.md).
- Outputs: [Conflict Report](../type/conflict-report.md) or
  [Computer Failure](../../../computer/type/computer-failure.md).
- Behaviour: scans schedule for overlapping events, violated dependencies, or
  policy conflicts; emits conflict report or failure if analysis cannot
  complete.

## Invariants
- No state mutation; conflicts/failures are diagnostic outputs.
- Deterministic analysis for a given schedule.

## Proof
- Derived from: [Computer Evaluate Step](../../../computer/function/evaluate-step.md).
- Shows that: conflict detection can be realised as a computer evaluation step
  producing conflict recognitions/failures without altering state.
