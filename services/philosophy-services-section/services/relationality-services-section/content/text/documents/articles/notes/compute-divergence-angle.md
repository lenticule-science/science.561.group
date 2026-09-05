---
title: Compute Divergence Angle
id: compute-divergence-angle
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Computes the angle-like divergence between two flow directions at a recognition.

## Definition
- Inputs: a recognition, two admissible flow directions, and a
  [Relational Metric](./relational-metric.md).
- Output: [Recognition Divergence Angle](./divergence-angle.md).
- Behaviour: measure directional difference using metric-induced inner product
  or analogous relational measure.

## Invariants
- Zero when flows coincide; respects symmetry in symmetric settings.
- Monotone with increasing directional difference.

## Proof
- Uses: flow directions and metric to compute divergence.
- Produces: divergence angle witness.
- Shows that: flow directional differences are measurable.
