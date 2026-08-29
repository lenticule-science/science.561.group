---
title: SnapId
layer: spec
status: plan
tags:
  - storage
  - snapshot
depends-on:
  - theorem/internal/relational-storage
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Describes the stable identifier for snapshots produced by storage save operations."# SnapId

`SnapId` is the stable identifier for a snapshot produced by
[StorageSave](save.md). It must:

- be globally unique across all snapshots;
- be serialisable for audit and routing purposes;
- support equality comparison for `StorageLoad` lookups.

Any representation (UUID, content hash) that satisfies these properties is
acceptable.
