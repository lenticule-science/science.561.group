---
title: Storage Snapshot
id: storage-snapshot
role: structure
status: plan
derived_from:
- acts/baseline-limit
proof_refs: []
---



The **Storage Snapshot** is the system-layer carrier for storing relational
state. It packages the minimal data needed to save and restore a state:
intake-normalised observations, a baseline remainder, and persistent
recognitions.

## Definition
- Elements: triples `(obs, baseline, fixed)` where
  - `obs` ∈ [Intake Observation](docs/math/structure/intake-observation.md),
  - `baseline` ∈ [Baseline Remainder](docs/math/structure/baseline-remainder.md),
  - `fixed` ∈ [Persistent Recognition Carrier](docs/math/structure/persistent-recognition.md).
- `acts/baseline-limit` earns the baseline component; intake/persistence acts
  earn the observation and fixed recognitions. This structure lifts those math
  carriers into the system context.

## Invariants
- Each triple uniquely determines the stored state up to earned equivalence.
- Components remain in their earned carriers (intake-normalised, baseline tail,
  persistent recognitions).

## Proof
Derived from [`acts/baseline-limit`](docs/math/acts/baseline-limit.md) and the
intake/persistence acts that earn the observation and fixed-recognition
carriers. This system structure lifts the math carriers into a storage payload
usable by system/machine storage operators.
