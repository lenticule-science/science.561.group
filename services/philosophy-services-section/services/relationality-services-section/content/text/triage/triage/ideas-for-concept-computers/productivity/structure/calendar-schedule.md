---
title: Calendar Schedule
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-wiring-plan
uses: []
produces: []
used_by:
  - program/productivity/operator/plan-schedule
  - program/productivity/operator/detect-conflicts
  - program/productivity/operator/stabilize-schedule
  - program/productivity/operator/snapshot-schedule
produced_by:
  - program/productivity/operator/plan-schedule
  - program/productivity/operator/stabilize-schedule
---

Executable wiring plan of events/recurrences/constraints over the computer
kernel carriers.

## Definition
- Carrier: [Computer Wiring Plan](../../../../../documents/articles/notes/computer-wiring-plan.md)
  specialised to calendar operators and event instances.
- Fields: expanded event instances, dependency edges, recurrence expansions,
  timezone-normalised instants, policy bindings.

## Invariants
- Acyclic, well-typed plan; respects event dependencies/recurrence expansions.
- Timezone-normalised instants; no ambiguous offsets.
- Failure propagation: conflicts/failures flow via computer failure carriers.

## Proof
- Derived from: [Computer Wiring Plan](../../../../../documents/articles/notes/computer-wiring-plan.md).
- Shows that: specialising a wiring plan to calendar semantics yields an
  executable schedule over computer operators/carriers.
