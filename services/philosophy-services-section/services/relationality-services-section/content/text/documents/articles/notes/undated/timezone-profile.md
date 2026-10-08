---
title: Timezone Profile
kind: structure
layer: program
status: someday
uses: []
produces: []
used_by:
  - program/productivity/operator/normalize-time
  - program/productivity/operator/plan-schedule
derives-from: computer/structure/computer-recognition
produced-by: []
description: Recognition of timezone rules (offsets, DST transitions) as parameters for normalizing calendar events.
---

Recognition of timezone rules (offsets, DST transitions) as parameters for
normalizing calendar events.

## Definition
- Fields: zone id, base offset, DST rules/transitions, validity ranges,
  provenance.
- Carrier: refinement of [Computer Recognition](../computer-recognition.md)
  scoped to timezone semantics.

## Invariants
- Transitions are ordered and non-overlapping.
- Offsets apply deterministically for a given instant.
- Traceability: retains provenance of rules.

## Proof
- Derived from: [Computer Recognition](../computer-recognition.md).
- Shows that: representing timezone rules as recognitions enables time
  normalization operators without extending kernel semantics.
