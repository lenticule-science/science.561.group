---
title: Dynamics Orbit
id: dynamics-orbit
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/orbit-seed
description: Structure capturing the stratified orbit of an invariant state along a trace, seeded by OrbitSeed and iterated by OrbitStep.
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
