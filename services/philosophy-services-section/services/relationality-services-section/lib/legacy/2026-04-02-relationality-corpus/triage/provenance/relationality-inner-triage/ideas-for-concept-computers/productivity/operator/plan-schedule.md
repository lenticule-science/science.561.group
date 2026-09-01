---

name: plan-schedule
kind: operator
layer: program
derived_from: computer/operator/wiring
uses:
  - program/productivity/structure/calendar-event
  - program/productivity/structure/recurrence-rule
  - program/productivity/structure/timezone-profile
produces:
  - program/productivity/structure/calendar-schedule
  - program/productivity/structure/conflict-report
  - computer/structure/computer-failure
---

Builds/refreshes a calendar wiring plan respecting dependencies, recurrence,
and constraints.

## Definition
- Inputs: [Calendar Event](../structure/calendar-event.md) set,
  [Recurrence Rule](../structure/recurrence-rule.md), and
  [Timezone Profile](../structure/timezone-profile.md).
- Outputs: [Calendar Schedule](../structure/calendar-schedule.md),
  [Conflict Report](../structure/conflict-report.md) when conflicts detected,
  or [Computer Failure](../../../computer/structure/computer-failure.md) on
  wiring errors.
- Behaviour: expands recurrence, normalises times, computes dependencies, and
  assembles an acyclic wiring plan; emits conflicts/failures as appropriate.

## Invariants
- Acyclic, well-typed plan; all dependencies/recurrence expansions resolved.
- Conflicts reported without committing invalid plans.
- No partial plan mutation on failure.

## Proof
- Derived from: [Computer Wiring](../../../computer/operator/wiring.md).
- Shows that: assembling calendar plans via computer wiring yields executable
  schedules; conflicts/failures are surfaced as explicit outputs.
