---
title: Relational Storage
aliases:
  - Relational Storage
  - relational storage
tags:
  - storage
  - snapshot
  - trace
depends-on:
  - baseline-limit
  - theorem/internal/persistence-stack
  - theorem/internal/intake-stack
  - theorem/internal/module-wiring
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Relational Storage)

This theorem isolates the requirements for storing and loading relational data
in a general storage system.  It depends on the persistence/intake stacks and
the module-wiring theorem.

1. **Snapshot definition.**  
   A snapshot consists of an intake-processed observation (from the intake
   stack), the baseline limit (capturing the tail), and the set of fixed
   recognitions/invariants (from the persistence stack).  These pieces uniquely
   determine the stored state.

2. **Load semantics.**  
   Loading a snapshot reconstructs the context by invoking `RetraceContext`,
   reattaches the baseline tail, and recreates the fixed recognitions.  Since
   `Reach` guarantees those recognitions are reachable, the restored context
   matches the stored one.

3. **Module compatibility.**  
   By referencing `Module Wiring`, snapshots may be handed between modules (e.g.,
   evaluation, measurement, tower-based modules) without ambiguity.  The wiring
   theorem ensures each module interprets the same snapshot data consistently.

Therefore the relational calculus supports a storage substrate in which every
snapshot is a combination of intake data, baseline limit, and fixed recognitions,
and loading a snapshot is just reapplying the persistence/intake acts.  This
provides the mathematical basis for a “relational database” layer.
