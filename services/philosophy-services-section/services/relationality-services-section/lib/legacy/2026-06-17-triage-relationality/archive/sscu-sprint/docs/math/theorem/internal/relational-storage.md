---
title: Relational Storage Structure
tags:
  - storage
  - snapshot
  - trace
depends-on:
  - baseline-limit
  - math/structure/persistent-recognition-carrier
  - math/structure/intake-observation
  - math/structure/baseline-remainder
  - math/structure/storage-snapshot-carrier
  - theorem/internal/trace-infrastructure
claims:
  - type: structure
    judgement: Storage = (Snapshots, save, load) with SnapContent = (obs, baseline, fixed)# Relational Storage Structure

The intake, persistence, and trace infrastructure induce a relational storage
structure: snapshots of relational state that can be saved and loaded without
ambiguity.

Formally, there exists a structure

```text
Storage = (Snapshots, save, load)
```

with:

- a set `Snapshots` of snapshot identifiers,
- a snapshot content structure `SnapContent`,
- and operators

  ```text
  save : State → SnapContent × SnapId
  load : SnapId ⇀ State
  ```

such that:

1. **Snapshot content.**  
   `SnapContent` consists of triples `(obs, baseline, fixed)` where:
   - `obs` is an intake-processed observation (from the intake stack),
   - `baseline` is the baseline limit capturing the tail, and
   - `fixed` is the set of fixed recognitions/invariants (from the
     persistence stack).
   These pieces uniquely determine the stored state.

2. **Save semantics.**  
   The `save` operator:
   - takes a relational state `State` (for example, a sheaf section and its
     active recognitions),
   - extracts `(obs, baseline, fixed)` using the intake and persistence stacks,
   - allocates a fresh `SnapId ∈ Snapshots`,
   - and returns `(content, SnapId)` with `content ∈ SnapContent`.

3. **Load semantics.**  
   The `load` operator:
   - takes a `SnapId`,
  - retrieves the corresponding `(obs, baseline, fixed)`,
  - reconstructs the context by invoking `RetraceContext`,
  - reattaches the baseline tail and recreates the fixed recognitions, and
  - returns a relational state `State` that matches the stored one. Since
    `Reach` guarantees those recognitions are reachable, the restored state is
    extensionally equal to the original.

Therefore the relational calculus supports a storage substrate in which every
snapshot is a combination of intake data, baseline limit, and fixed
recognitions, and loading a snapshot is reapplying the persistence/intake
acts via `load`. This provides the mathematical basis for a relational
storage layer.

## Proof sketch

1. **Baseline and intake.**  
   [`BaselineLimit`](../../acts/baseline-limit.md) isolates the stabilized tail
   of a trace. The intake stack theorem guarantees that observations are
   normalized and validated; the persistence stack theorem earns the selection
   of fixed recognitions. Together they determine `SnapContent = (obs,
   baseline, fixed)` uniquely from a `State`.

2. **Saving.**  
   From the intake/persistence stacks, define `save` by extracting
   `(obs, baseline, fixed)` from a `State`, allocating a fresh `SnapId` in
   `Snapshots`, and returning `(content, SnapId)`. Freshness follows from the
   persistence stack’s discipline on identifiers.

3. **Loading.**  
   Given `SnapId`, retrieve its `(obs, baseline, fixed)`, reconstruct context
   via [`RetraceContext`](../../acts/retrace-context.md) from the trace
   infrastructure, reattach the baseline tail, and reinstall fixed
   recognitions. Because the persistence stack guarantees reachability, the
   resulting `State` is nucleus-equivalent to the saved one.

4. **Uniqueness.**  
   Any storage operator respecting the intake/persistence semantics and the
   trace reconstruction must produce the same `SnapContent` and inverse
   round-trip up to nucleus equivalence. Hence `Storage = (Snapshots, save,
   load)` is unique in the earned sense.
