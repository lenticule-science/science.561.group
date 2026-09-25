---
title: SnapContent
layer: spec
status: plan
keywords:
  - storage
  - snapshot
depends-on:
  - theorem/internal/relational-storage
  - math/structure/persistent-recognition-carrier
  - math/structure/baseline-remainder
  - math/structure/intake-observation
  - spec/recognition-carrier
description: SnapContent is the stored payload associated with a SnapId.
---

`SnapContent` is the stored payload associated with a
[SnapId](./storage-snap-id.md). It captures the minimal data required by
[Relational Storage](./relational-storage.md)
to reconstruct a [RelationalState](./storage-relational-state.md):

- `observations`: intake-normalised observations present in the state when
  saved, consistent with the intake observation carrier.
- `baseline_remainder`: the stabilized tail recognised by the baseline acts.
- `fixed`: the list of fixed recognitions/invariants eligible for persistence,
  each encoded as a [RecognitionCarrier](./recognition-carrier.md).

`SnapContent` is derived directly from the live `RelationalState`; it is not an
independent store.

## Earlier material

`SnapContent` is the stored payload associated with a
[SnapId](storage-snap-id.md). It captures the minimal data required by
[Relational Storage](relational-storage.md)
to reconstruct a [RelationalState](storage-relational-state.md):
