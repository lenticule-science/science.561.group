---
title: Hypertensor Window Structure
keywords:
  - hypertensor
  - window
layer: internal-theorem
status: plan
depends_on:
  - acts/decompose-trace
  - acts/shuffle-trace
  - acts/collapse-shuffle
  - acts/ensure-fixed-point
  - theorem/external/quasicrystalline-relational-hypertensors
---

There exists a single lattice window carrier `Window` earned by:

- [Decompose Trace](./decompose-trace.md),
- [Shuffle Trace](./shuffle-trace.md),
- [Collapse Shuffle](./collapse-shuffle.md),
- the fixed point of the substitution flow via
  [Ensure Fixed Point](./ensure-fixed-point.md),
- subject to the substitution constraints of
  [Quasicrystalline Relational Hypertensors](../../../triage/relationality/relationality-slop-2025-04/external/quasicrystalline-relational-hypertensors.md).

`Window` values consist of:

- a finite integer-lattice index set with an explicit dimension marker;
- site metadata (strata, chart identifiers);
- substitution parameters determined by the earned substitution act.
