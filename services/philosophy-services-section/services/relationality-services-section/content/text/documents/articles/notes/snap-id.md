---
title: SnapId
layer: spec
status: plan
keywords:
  - storage
  - snapshot
depends_on:
  - theorem/internal/relational-storage
---
# SnapId

`SnapId` is the stable identifier for a snapshot produced by
[StorageSave](./save.md). It must:

- be globally unique across all snapshots;
- be serialisable for audit and routing purposes;
- support equality comparison for `StorageLoad` lookups.

Any representation (UUID, content hash) that satisfies these properties is
acceptable.
