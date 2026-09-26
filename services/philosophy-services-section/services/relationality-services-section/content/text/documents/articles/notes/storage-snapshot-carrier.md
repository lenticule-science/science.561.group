---
title: Storage Snapshot Carriers
keywords:
  - storage
  - snapshot
layer: internal-theorem
status: plan
claims:
  - type: structure
    judgement: SnapId and SnapContent are the earned snapshot carriers for storing sheaf sections
depends-on:
  - acts/baseline-limit
  - acts/fixed-invariant
  - acts/reach
  - math/structure/persistent-context-carrier
  - math/structure/persistent-recognition-carrier
description: that capture the minimal data needed to store and reload a sheaf section.
---

## Statement

The listed acts and carriers earn

```text
SnapId
SnapContent = (Observations, BaselineRemainder, PersistentRecognitionCarrier)
```

that capture the minimal data needed to store and reload a sheaf section.

## Construction by acts

- [`baseline-limit`](./baseline-limit.md) yields the earned
  `BaselineRemainder` for a trace.
- Fixed recognitions eligible for storage come from
  [`fixed-invariant`](./fixed-invariant.md) and reachability via
  [`reach`](./reach.md); these form `PersistentRecognitionCarrier`.
- Intake-normalised observations populate `Observations` (from the intake
  stack, implied here).
- `SnapContent` packages `(Observations, BaselineRemainder,
  PersistentRecognitionCarrier)`.
- `SnapId` is an earned identifier for pairing with `SnapContent` (freshness
  comes from the persistence discipline; see persistence carriers).

## Uniqueness

Any carriers that capture exactly these earned pieces and support fresh
identifiers are nucleus-equivalent; `SnapId` and `SnapContent` are unique up to
earned equivalence.
