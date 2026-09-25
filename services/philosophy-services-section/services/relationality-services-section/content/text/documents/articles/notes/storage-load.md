---
title: Storage Load Operator
keywords:
  - storage
  - snapshot
layer: internal-theorem
status: plan
claims:
  - type: operator
    judgement: "load_snapshot : SnapId ⇀ Section"
depends-on:
  - math/structure/quasicrystalline-hypertensor-sheaf-section
  - math/structure/storage-snapshot-carrier
  - math/acts/retrace-context
  - math/acts/renew-context
description: that retrieves SnapContent for a given SnapId and reconstructs a sheaf Section nucleus-equivalent to the stored one.
---
# Storage Load Operator

## Statement

There exists an operator

```text
load_snapshot : SnapId ⇀ Section
```

that retrieves `SnapContent` for a given `SnapId` and reconstructs a sheaf
`Section` nucleus-equivalent to the stored one.

## Definition by acts

- Given `SnapId`, retrieve its `SnapContent` (observations, baseline remainder,
  fixed recognitions).
- Use [`retrace-context`](./retrace-context.md) to replay the stored
  context and [`renew-context`](./renew-context.md) to reintroduce the
  baseline remainder and fixed recognitions.
- Produce a `Section` nucleus-equivalent to the one that was saved.

## Uniqueness

Because `SnapContent` is fixed by the earned carriers and retrace/renew acts
determine reconstruction, any operator respecting these produces the same
`Section` up to nucleus equivalence; `load_snapshot` is unique in the earned
sense.

## Earlier material

- Given `SnapId`, retrieve its `SnapContent` (observations, baseline remainder,
  fixed recognitions).
- Use [`retrace-context`](retrace-context.md) to replay the stored
  context and [`renew-context`](renew-context.md) to reintroduce the
  baseline remainder and fixed recognitions.
- Produce a `Section` nucleus-equivalent to the one that was saved.
