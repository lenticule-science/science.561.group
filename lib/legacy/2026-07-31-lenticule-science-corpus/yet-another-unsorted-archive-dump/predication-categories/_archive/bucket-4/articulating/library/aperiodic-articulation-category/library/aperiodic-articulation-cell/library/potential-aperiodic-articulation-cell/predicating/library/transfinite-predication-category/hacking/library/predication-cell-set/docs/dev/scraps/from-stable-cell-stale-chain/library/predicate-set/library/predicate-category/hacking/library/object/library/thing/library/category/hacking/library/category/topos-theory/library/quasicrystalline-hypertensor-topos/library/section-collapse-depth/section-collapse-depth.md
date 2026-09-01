---
title: Section Collapse Depth
id: section-collapse-depth
role: structure
status: plan
proof_refs: []
---



Number of nucleus applications required to reach normal form.

## Definition
- Metric: counts collapse steps from a section to its
  [Section Normal Form](section-normal-form.md).
- Role: measures simplification complexity.

## Invariants
- Non-negative integer; zero iff already in normal form.
- Bounded for finite sections.

## Proof
- Uses: normalization process to count steps.
- Shows that: collapse depth is well-defined and finite for admissible sections.
