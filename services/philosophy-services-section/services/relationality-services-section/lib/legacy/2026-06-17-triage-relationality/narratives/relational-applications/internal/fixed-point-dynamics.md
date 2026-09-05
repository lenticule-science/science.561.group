---
title: Fixed-Point Dynamics
aliases:
  - Fixed-Point Dynamics
  - fixed-point dynamics
tags:
  - fixed-point
  - flow
  - nucleus
depends-on:
  - ensure-fixed-point
  - fix-flow
  - fix-nucleus
  - fix-flow-nucleus
  - transport-flow-fix
  - transport-nucleus-fix
  - quadratic-modality
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Fixed-Point Dynamics)

Flow and nucleus iterations admit canonical fixed points, and those points
transport coherently across morphisms.

1. **Intrinsic fixed points.**  
   `EnsureFixedPoint` applied to `Flow`, `Nucleus`, and their composites produces
   `FixFlow`, `FixNucleus`, and `FixFlowNucleus`.

2. **Transport.**  
   `TransportFlowFix` and `TransportNucleusFix` move fixed points between
   contexts/morphisms without breaking stabilization.

3. **Lax idempotence.**  
   `QuadraticModality` ensures iterating the modality stabilises after one step,
   mirroring the KZ property in modal logic.

This theorem is the reference for any algorithm or simulation that needs to
reason about steady states, invariants, or lazily iterated operators.
