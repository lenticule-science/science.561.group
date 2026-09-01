---
title: Stabilize Schedule
id: stabilize-schedule
role: operator
status: someday
derived_from: computer/function/evaluate-step
inputs:
- computer/library/type/calendar-schedule
- computer/library/type/conflict-report
outputs:
- computer/library/type/calendar-schedule
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
---



Adjusts a calendar schedule to resolve conflicts and maintain invariants.

## Definition
- Inputs: [Calendar Schedule](../type/calendar-schedule.md),
  [Conflict Report](../type/conflict-report.md).
- Outputs: updated [Calendar Schedule](../type/calendar-schedule.md) or
  [Computer Failure](../../../computer/type/computer-failure.md).
- Behaviour: applies conflict resolutions (reorder, defer, cancel) consistent
  with policy/trace constraints; emits failure if stabilization cannot satisfy
  invariants.

## Invariants
- Valid schedules only: resulting plan remains acyclic/well-typed.
- Failure purity: on failure, original schedule remains unchanged.

## Proof
- Derived from: [Computer Evaluate Step](../../../computer/function/evaluate-step.md).
- Shows that: resolving conflicts via evaluation yields a stabilized schedule
  or explicit failure, preserving kernel semantics.
