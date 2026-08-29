---
title: Reachability Radius
id: reachability-radius
role: structure
status: plan
proof_refs: []
---


# Reachability Radius

Cost metric: minimal flow distance to reach a target recognition from a source.

## Definition
- Radius: minimal distance (from [Relational Metric](relational-metric.md)) over
  admissible flow paths connecting source to target recognitions.
- Role: guides scheduling/planning.

## Invariants
- Non-negative; zero when source=target up to nucleus.
- Triangle inequality inherited from the metric.

## Proof
- Uses: flow context and relational metric to measure path lengths.
- Shows that: reachability cost is well-defined for admissible flows.
