---
name: normalize-time
role: operator
derived_from: computer/function/evaluate-step
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Applies timezone/offset rules to calendar events, yielding normalized instants.

## Definition
- Inputs: [Calendar Event](../type/calendar-event.md),
  [Timezone Profile](../type/timezone-profile.md).
- Outputs: normalised [Calendar Event](../type/calendar-event.md) or
  [Computer Failure](../../../computer/type/computer-failure.md).
- Behaviour: rewrites event instants/durations using timezone rules; fails on
  invalid/ambiguous transitions.

## Invariants
- Deterministic normalization for given rules; no ambiguous offsets accepted.
- No state mutation on failure.

## Proof
- Derived from: [Computer Evaluate Step](../../../computer/function/evaluate-step.md).
- Shows that: applying timezone rules via computer evaluation yields normalized
  events or failures without bypassing kernel semantics.
