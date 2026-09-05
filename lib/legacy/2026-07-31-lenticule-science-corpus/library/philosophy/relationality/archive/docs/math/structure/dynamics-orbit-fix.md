---
title: Dynamics Orbit Fixpoint
id: dynamics-orbit-fix
role: structure
status: plan
derived_from:
- acts/orbit-fix-layer
proof_refs: []
---



Fixed layer of the orbit under `OrbitStep`, earned by `OrbitFixLayer`.

## Components

- Fixed layer `OrbitFix` such that `OrbitStep(OrbitFix) = OrbitFix`.
- Minimality: least fixed point under the invariant order.

## Proof

Sketch: apply `EnsureFixedPoint` to `OrbitStep` on the orbit layers; by the
fixed-point construction, obtain the least layer stable under `OrbitStep`.
