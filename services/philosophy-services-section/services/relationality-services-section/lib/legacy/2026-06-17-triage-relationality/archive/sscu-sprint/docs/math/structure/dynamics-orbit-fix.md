---
title: Dynamics Orbit Fixpoint
role: structure
derived_from:
- acts/orbit-fix-layer
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Fixed layer of the orbit under `OrbitStep`, earned by `OrbitFixLayer`.

## Components

- Fixed layer `OrbitFix` such that `OrbitStep(OrbitFix) = OrbitFix`.
- Minimality: least fixed point under the invariant order.

## Proof

Sketch: apply `EnsureFixedPoint` to `OrbitStep` on the orbit layers; by the
fixed-point construction, obtain the least layer stable under `OrbitStep`.
