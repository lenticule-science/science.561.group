---
title: StorageLoad
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
enacts: idea
part-of: relational-computer
in-domain: science/relationality
description: "Describes the storage load operation for retrieving recognitions from persistent storage."# StorageLoad

Function signature:

```text
StorageLoad : SnapId ⇀ RelationalState
```

Inputs:

- a [SnapId](snap-id.md) referencing stored [SnapContent](snap-content.md).

Behaviour:

- retrieves the associated `SnapContent`;
- reconstructs the trace/context using
  [Trace Infrastructure](../../math/theorem/internal/trace-infrastructure.md)
  and the saved `baseline_remainder`;
- reattaches fixed recognitions and observations to produce a
  [RelationalState](relational-state.md) nucleus-equivalent to the saved one.

Failure:

- if the `SnapId` is unknown or the content fails validation, returns no value
  and records an audit error.

Effects:

- records load provenance in [Audit](../audit.md) tied to the `SnapId` and the
  calling context.
