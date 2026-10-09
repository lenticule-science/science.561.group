---
title: Compressibility Cost
id: compressibility-cost
role: structure
status: plan
proof_refs: []
description: Cost metric derived from compressibility recognition to guide scheduling and storage.
---



Cost metric derived from compressibility recognition to guide scheduling and
storage.

## Definition
- Measure: maps traces/recognitions to a cost based on
  [Compressibility Recognition](./compressibility-recognition.md):
  incompressible items have higher cost.
- Role: informs scheduling/storage decisions.

## Invariants
- Monotonic: higher compressibility → lower cost.
- Stable under shuffle-equivalence.

## Proof
- Uses: compressibility recognition to assign costs.
- Shows that: compressibility can be quantified as a cost metric.
