---
title: Directed Homotopy Simulation
tags:
  - simulation
  - homotopy
  - directed
depends_on:
  - theorem/external/relational-directed-homotopy
---
# Specification (Directed Homotopy Simulation)

This specification realises **Theorem (Relational Directed Homotopy)**.  We
simulate oriented paths and higher cells using flow/nucleus operations and
profile towers.

## State representation

- **Directed space `X`.**  
  Modeled as a set of states with a partial order or transition relation capturing
  admissible flows.  Each state stores the stabilized recognition it represents.

- **Flow operator.**  
  Procedure that advances states along the directed relation (mirroring `Flow`).

- **Nucleus operator.**  
  Collapse operation enforcing closure (mirroring `Nucleate`) while commuting
  with flow.

- **Profile tower.**  
  Hierarchical structure of subspaces (disciplines/filters) used to track higher
  cells.  Each level carries its own directed relation inherited from `ProfileFlow`.

## Inputs

1. Base directed graph or partial order representing the space to be simulated.
2. Flow/nucleus definitions satisfying the commutation laws.
3. Tower description (sequence of filters/disciplines) to build higher cells.

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
