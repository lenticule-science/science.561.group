---
title: Detect Conflicts
id: detect-conflicts
role: operator
status: someday
inputs:
- computer/library/type/calendar-schedule
outputs:
- computer/library/type/conflict-report
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
derives-from: computer/function/evaluate-step
description: Detects overlaps and constraint violations in a calendar schedule.
---



Detects overlaps and constraint violations in a calendar schedule.

## Definition
- Inputs: [Calendar Schedule](undated/calendar-schedule.md).
- Outputs: [Conflict Report](undated/conflict-report.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: scans schedule for overlapping events, violated dependencies, or
  policy conflicts; emits conflict report or failure if analysis cannot
  complete.

## Invariants
- No state mutation; conflicts/failures are diagnostic outputs.
- Deterministic analysis for a given schedule.

## Proof
- Derived from: [Computer Evaluate Step](./evaluate-step.md).
- Shows that: conflict detection can be realised as a computer evaluation step
  producing conflict recognitions/failures without altering state.
