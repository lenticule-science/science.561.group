---
title: Conflict Report
kind: structure
layer: program
status: someday
uses: []
produces: []
used_by:
  - program/productivity/operator/detect-conflicts
  - program/productivity/operator/stabilize-schedule
derives-from: computer/structure/computer-recognition
produced-by:
  - program/productivity/operator/detect-conflicts
description: Recognition capturing detected overlaps/policy violations in a calendar schedule.
---

Recognition capturing detected overlaps/policy violations in a calendar
schedule.

## Definition
- Fields: conflicting event ids, time spans, constraint/policy violated,
  suggested resolutions, provenance.
- Carrier: refinement of [Computer Recognition](../computer-recognition.md)
  scoped to conflict diagnostics.

## Invariants
- References only existing events/schedules.
- Diagnostics cite the violated constraint/policy.
- Traceability: includes trace span where conflict arises.

## Proof
- Derived from: [Computer Recognition](../computer-recognition.md).
- Shows that: reporting conflicts as recognitions provides a carrier for
  resolution/stabilization operators.
