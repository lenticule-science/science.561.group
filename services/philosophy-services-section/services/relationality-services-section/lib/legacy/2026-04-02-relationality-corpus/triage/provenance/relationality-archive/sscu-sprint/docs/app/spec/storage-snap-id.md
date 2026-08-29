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
description: "Defines the stable identifier for snapshots that must be globally unique and serialisable."# SnapId

`SnapId` is the stable identifier for a snapshot produced by
[StorageSave](storage-save.md). It must:

- be globally unique across all snapshots;
- be serialisable for audit and routing purposes;
- support equality comparison for [StorageLoad](storage-load.md) lookups.

Any representation (UUID, content hash) that satisfies these properties is
acceptable.
