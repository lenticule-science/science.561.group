---
title: Fixed-Scale Profile
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Profile stable under repeated coarse-graining/rescaling at a given scale level.

## Definition
- Carrier: sections/profiles in the [Scale Tower](scale-tower.md) that return to
  themselves (up to nucleus) after rescaling.
- Condition: `RescaleSection` around a loop in the tower yields equivalent
  section.

## Invariants
- Stability: invariant under tower rescaling at the fixed level.
- Universality: corresponds to universality classes in RG analysis.

## Proof
- Uses: [Scale Tower](scale-tower.md) and [Rescale Section](../operator/rescale-section.md).
- Shows that: fixed-scale behaviour can be captured as a stable carrier.
