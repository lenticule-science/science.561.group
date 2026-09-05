---
title: Dynamics Orbits
tags:
  - flow
  - reach
  - invariant
  - orbits
depends_on:
  - fixed-reach
  - orbit-seed
  - orbit-step
  - orbit-fix-layer
---
# Theorem (Dynamics Orbits)

With acts

- `FixedReach = (FixedFlowProfile FixedInvariant)`,
- `OrbitSeed = (FixedReach HeadTrace)`,
- `OrbitStep = (FixedReach TailTrace)`,
- `OrbitFixLayer = (EnsureFixedPoint OrbitStep)`,

we have:

1. **Orbit stratification.**  
   For each invariant state, iterating `OrbitStep` starting from
   `OrbitSeed` yields a stratified sequence of reachable states
   along the trace.  Each layer is obtained by one more application of
   `OrbitStep` to the previous layer.

2. **Fixed layer.**  
   `OrbitFixLayer` is a fixed point of `OrbitStep`: once the orbit
   reaches this layer, further applications of `OrbitStep` do not produce
   new states.

3. **Minimality.**  
   Among all layers stable under `OrbitStep`, `OrbitFixLayer` is
   minimal with respect to `FixedInvariantOrder`: any other stable layer lies
   above it in the invariant lattice.

## Proof sketch

1. `OrbitSeed` records the initial layer of the orbit from each invariant
   state.  `OrbitStep` composes `FixedReach` with `TailTrace`, so repeated
   application yields a sequence of reachable layers along the trace remainder.

2. `OrbitFixLayer = (EnsureFixedPoint OrbitStep)` applies the fixed-point
   construction to the orbit step; by `IterativePersistence`, the resulting
   recognition is unchanged by further orbit steps, hence fixed.

3. The fixed-point construction chooses the least fixed point compatible with
   the persistent iteration specification.  Since `FixedInvariantOrder`
   restricts the global order to invariant states, the fixed layer is minimal
   among stable layers in that order.
