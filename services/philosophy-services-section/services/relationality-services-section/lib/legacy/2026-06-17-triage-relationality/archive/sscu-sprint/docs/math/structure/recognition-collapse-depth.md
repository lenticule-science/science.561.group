---
title: Recognition Collapse Depth
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Counts nucleus/simplification steps needed to reach recognition normal form.

## Definition
- Metric: number of collapse/simplification iterations from a recognition to its
  [Recognition Normal Form](recognition-normal-form.md).
- Role: complexity measure for logical simplification.

## Invariants
- Non-negative integer; zero iff already in normal form.
- Finite for well-formed recognitions.

## Proof
- Uses: normalisation process to count steps.
- Shows that: collapse depth is well-defined and finite on admissible inputs.
