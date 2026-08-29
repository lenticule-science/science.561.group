---
title: Recognize Event
kind: operator
layer: program
status: someday
derived_from: computer/operator/recognition
uses:
  - program/productivity/structure/calendar-event
  - program/productivity/structure/timezone-profile
  - program/productivity/structure/recurrence-rule
produces:
  - program/productivity/structure/calendar-event
  - computer/structure/computer-failure
---
# Recognize Event

Recognises a calendar event specification into a validated calendar event
carrier.

## Definition
- Inputs: [Calendar Event](../structure/calendar-event.md) spec with time,
  recurrence, timezone, constraints.
- Outputs: validated [Calendar Event](../structure/calendar-event.md) or
  [Computer Failure](../../../computer/structure/computer-failure.md).
- Behaviour: checks time bounds, applies [Timezone Profile](../structure/timezone-profile.md),
  validates [Recurrence Rule](../structure/recurrence-rule.md); emits failure
  if inconsistent.

## Invariants
- Time/recurrence references must resolve; invalid specs emit failure.
- No state mutation on failure.

## Proof
- Derived from: [Computer Recognition](../../../computer/operator/recognition.md).
- Shows that: calendar event specs can be validated as recognitions using
  computer operators, producing event carriers or failures.
