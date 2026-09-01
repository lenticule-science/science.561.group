---
title: Recognition Divergence Angle
id: divergence-angle
role: structure
status: plan
proof_refs: []
---



Angle-like measure between two directions of flow at a recognition.

## Definition
- Components: two flow vectors/directions at a recognition; metric from
  [Relational Metric](relational-metric.md) to measure divergence.
- Output: angular measure of how flows differ.

## Invariants
- Zero when flows align; maximal when opposed.
- Symmetry: angle(a,b) = angle(b,a) in symmetric metrics.

## Proof
- Uses: flow directions and relational metric to compute divergence.
- Shows that: directional differences can be quantified angularly.
