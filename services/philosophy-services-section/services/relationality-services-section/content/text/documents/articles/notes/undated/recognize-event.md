---
title: Recognize Event
kind: operator
layer: program
status: someday
uses:
  - program/productivity/structure/calendar-event
  - program/productivity/structure/timezone-profile
  - program/productivity/structure/recurrence-rule
produces:
  - program/productivity/structure/calendar-event
  - computer/structure/computer-failure
derives-from: computer/operator/recognition
description: Recognises a calendar event specification into a validated calendar event carrier.
---

Recognises a calendar event specification into a validated calendar event
carrier.

## Definition
- Inputs: [Calendar Event](calendar-event.md) spec with time,
  recurrence, timezone, constraints.
- Outputs: validated [Calendar Event](calendar-event.md) or
  [Computer Failure](../computer-failure.md).
- Behaviour: checks time bounds, applies [Timezone Profile](timezone-profile.md),
  validates [Recurrence Rule](recurrence-rule.md); emits failure
  if inconsistent.

## Invariants
- Time/recurrence references must resolve; invalid specs emit failure.
- No state mutation on failure.

## Proof
- Derived from: [Computer Recognition](../../../../glossary/concepts/phenomena-recognition.md).
- Shows that: calendar event specs can be validated as recognitions using
  computer operators, producing event carriers or failures.
