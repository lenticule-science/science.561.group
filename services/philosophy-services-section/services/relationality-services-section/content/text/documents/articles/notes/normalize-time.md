---
title: Normalize Time
id: normalize-time
role: operator
status: someday
inputs:
- computer/library/type/calendar-event
- computer/library/type/timezone-profile
outputs:
- computer/library/type/calendar-event
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
derives-from: computer/function/evaluate-step
description: Applies timezone/offset rules to calendar events, yielding normalized instants.
---



Applies timezone/offset rules to calendar events, yielding normalized instants.

## Definition
- Inputs: [Calendar Event](undated/calendar-event.md),
  [Timezone Profile](undated/timezone-profile.md).
- Outputs: normalised [Calendar Event](undated/calendar-event.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: rewrites event instants/durations using timezone rules; fails on
  invalid/ambiguous transitions.

## Invariants
- Deterministic normalization for given rules; no ambiguous offsets accepted.
- No state mutation on failure.

## Proof
- Derived from: [Computer Evaluate Step](./evaluate-step.md).
- Shows that: applying timezone rules via computer evaluation yields normalized
  events or failures without bypassing kernel semantics.

## Earlier material

## Definition
- Inputs: [Calendar Event](undated/calendar-event.md),
  [Timezone Profile](undated/timezone-profile.md).
- Outputs: normalised [Calendar Event](undated/calendar-event.md) or
  [Computer Failure](computer-failure.md).
- Behaviour: rewrites event instants/durations using timezone rules; fails on
  invalid/ambiguous transitions.

## Proof
- Derived from: [Computer Evaluate Step](evaluate-step.md).
- Shows that: applying timezone rules via computer evaluation yields normalized
  events or failures without bypassing kernel semantics.
