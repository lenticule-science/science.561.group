---
title: SnapContent
layer: spec
status: plan
keywords:
  - storage
  - snapshot
depends_on:
  - theorem/internal/relational-storage
  - theorem/internal/persistence-stack
  - theorem/internal/baseline-renewal
  - spec/recognition-carrier
---
# SnapContent

`SnapContent` is the stored payload associated with a `SnapId`. It captures the
minimal data required by [Relational Storage](./relational-storage.md)
to reconstruct a [RelationalState](relational-state.md):

- `observations`: intake-normalised observations present in the state when
  saved, consistent with [Intake Stack](./intake-stack.md).
- `baseline_remainder`: the stabilized tail recognised by
  [Baseline and Renewal Mechanics](../../../triage/relationality/relationality-slop-2025-04/internal/baseline-renewal.md).
- `fixed`: the list of fixed recognitions/invariants eligible for persistence,
  each encoded as a [RecognitionCarrier](./recognition-carrier.md).

`SnapContent` is derived directly from the live `RelationalState`; it is not an
independent store.
