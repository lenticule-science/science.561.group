---
title: Conflict Report
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-recognition
uses: []
produces: []
used_by:
  - program/productivity/operator/detect-conflicts
  - program/productivity/operator/stabilize-schedule
produced_by:
  - program/productivity/operator/detect-conflicts
---

Recognition capturing detected overlaps/policy violations in a calendar
schedule.

## Definition
- Fields: conflicting event ids, time spans, constraint/policy violated,
  suggested resolutions, provenance.
- Carrier: refinement of [Computer Recognition](../../../computer/structure/computer-recognition.md)
  scoped to conflict diagnostics.

## Invariants
- References only existing events/schedules.
- Diagnostics cite the violated constraint/policy.
- Traceability: includes trace span where conflict arises.

## Proof
- Derived from: [Computer Recognition](../../../computer/structure/computer-recognition.md).
- Shows that: reporting conflicts as recognitions provides a carrier for
  resolution/stabilization operators.
