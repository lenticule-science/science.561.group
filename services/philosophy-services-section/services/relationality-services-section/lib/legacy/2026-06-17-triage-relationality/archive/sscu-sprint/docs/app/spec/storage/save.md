---
title: StorageSave
layer: spec
status: plan
tags:
  - storage
  - function
depends-on:
  - theorem/internal/relational-storage
  - theorem/internal/persistence-stack
  - theorem/internal/baseline-renewal
  - theorem/internal/trace-infrastructure
  - theorem/internal/recognition-carrier-structure
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Describes the storage save operation for persisting recognitions with snapshots."# StorageSave

Function signature:

```text
StorageSave : RelationalState → (SnapContent, SnapId)
```

Inputs:

- a [RelationalState](relational-state.md) representing the current section.

Behaviour:

- validates and normalises observations via the intake/persistence stacks;
- extracts `baseline_remainder` using
  [Baseline and Renewal Mechanics](../../math/theorem/internal/baseline-renewal.md);
- collects fixed recognitions via the persistence structure;
- allocates a fresh [SnapId](snap-id.md);
- emits [SnapContent](snap-content.md) paired with the new `SnapId`.

Effects:

- records an audit entry as described in [Audit](../audit.md) linking the
  `SnapId`, input state hash/identifier, and caller context.
