---
title: Directed Homotopy Simulation
keywords:
  - simulation
  - homotopy
  - directed
depends_on:
  - theorem/external/relational-directed-homotopy
---
# Directed Homotopy Simulation

This specification realises **Theorem (Relational Directed Homotopy)**.  We
simulate oriented paths and higher cells using flow/nucleus operations and
profile towers.

## State representation

- **Directed space `X`.**
  A slice of the global relational state: a finite or symbolic collection of
  stabilised recognitions (for example, fixed invariant states or sections of
  the hypertensor sheaf) equipped with the partial order or transition relation
  induced by the earned flow–nucleus geometry.  No new store is introduced;
  `X` is an index over existing recognitions.

- **Flow operator.**
  The global `Flow` act, restricted to the recognitions chosen for `X`.  In a
  simulation this may be approximated by a step function on a finite subset of
  `X`, but conceptually it is just the earned flow applied to that slice.

- **Nucleus operator.**
  The global `Nucleate` act, restricted to `X`, collapsing recognitions along
  the nucleus equivalence while commuting with the flow.

- **Profile tower.**
  The hierarchy of profile/tower levels built from the same recognitions using
  `BuildProfileTower` and related tower‑interaction acts.  Each level inherits
  its directed relation from the restricted `FlowProfile`.

## Inputs

1. A choice of slice `X` of stabilised recognitions (or sections) together with
   the induced order/transition relation from the global flow–nucleus geometry.
2. Flow/nucleus metadata (for example, numerical parameters) used to approximate
   the earned `Flow`/`Nucleate` on this slice.
3. Tower description (sequence of filters/disciplines) used to build higher
   cells via the existing profile/tower acts.

## Update procedure

1. **Flow step.**
   For each state, apply the flow operator to generate successors; store new
   states in the directed space.

2. **Nucleus collapse.**
   Apply the nucleus to each state to enforce stabilization.  Discard states
   equivalent under nucleus equivalence.

3. **Tower update.**
   For each profile level, recompute the induced flow relation and ensure
   compatibility with lower levels (mirroring `BuildProfileTower`).

4. **Observables and reach.**
   Propagate observables along flows and compute reachable components using
   `Reach` analogues.  This captures directed homotopy classes.

## Invariants

- Flow and nucleus must commute numerically or symbolically.
- Tower coherence: higher levels must project to lower ones without introducing
  contradictions.
- Reachability partitions should remain stable under additional flow iterations.

## Outputs

- Directed homotopy classes (reachable components).
- Tower summaries showing higher-cell structure.
- Diagnostics for flow/nucleus commutation and tower coherence.
