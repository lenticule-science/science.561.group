---
title: Storage Save Operator
keywords:
  - storage
  - snapshot
layer: internal-theorem
status: plan
depends_on:
  - math/structure/quasicrystalline-hypertensor-sheaf-section
  - math/structure/storage-snapshot-carrier
  - acts/baseline-limit
claims:
  - type: operator
    judgement: save_snapshot : Section → (SnapContent, SnapId)
---
# Storage Save Operator

## Statement

There exists an operator

```text
save_snapshot : Section → (SnapContent, SnapId)
```

that takes a sheaf `Section` and produces snapshot content paired with a fresh
`SnapId`.

## Definition by acts

- From a `Section`, extract observations, the baseline remainder via
  [`baseline-limit`](../acts/baseline-limit.md), and fixed recognitions eligible
  for storage (`PersistentRecognitionCarrier`).
- Package these into `SnapContent` (see
  [`storage-snapshot-carrier`](../structure/storage-snapshot-carrier.md)).
- Allocate a fresh `SnapId` and return `(SnapContent, SnapId)`.

## Uniqueness

Because `SnapContent` and `SnapId` are fixed by the earned carriers and the
freshness discipline, any operator respecting these yields the same result up
to nucleus equivalence; `save_snapshot` is unique in the earned sense.
