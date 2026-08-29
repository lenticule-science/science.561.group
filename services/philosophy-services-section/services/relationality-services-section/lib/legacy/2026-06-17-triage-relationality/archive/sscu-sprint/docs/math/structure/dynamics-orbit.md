---
title: Dynamics Orbit
role: structure
derived_from:
- acts/orbit-seed
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Structure capturing the stratified orbit of an invariant state along a trace,
seeded by `OrbitSeed` and iterated by `OrbitStep`.

## Components

- Seed `OrbitSeed` from an invariant state (fixed reach + head trace).
- Step `OrbitStep` advancing along the trace (fixed reach + tail trace).
- Layers `Orbit_n` obtained by iterating `OrbitStep` from the seed.

## Proof

Sketch: use `FixedReach` with `HeadTrace`/`TailTrace` to define the orbit seed
and step. Show that iteration yields a stratified sequence of reachable states.
