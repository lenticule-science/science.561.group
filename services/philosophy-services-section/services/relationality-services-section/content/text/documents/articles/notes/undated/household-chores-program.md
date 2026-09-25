---
title: Household Chores and Maintenance Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program models household chores and maintenance tasks as recognitions so they can be scheduled, measured, and audited.
---

This program models household chores and maintenance tasks as recognitions so
they can be scheduled, measured, and audited.

## Behaviour

- Represent tasks, locations, assets, and schedules as recognitions with
  provenance.
- Track measurement channels such as time, effort, cost, and condition of
  maintained assets.
- Link chores to occupants and policies (safety, cleanliness, accessibility).

## Intended operators

- Schedule and assign chores; log completion with measurements.
- Review maintenance histories and forecast upcoming work.
- Balance workload across occupants using measurement slices.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
