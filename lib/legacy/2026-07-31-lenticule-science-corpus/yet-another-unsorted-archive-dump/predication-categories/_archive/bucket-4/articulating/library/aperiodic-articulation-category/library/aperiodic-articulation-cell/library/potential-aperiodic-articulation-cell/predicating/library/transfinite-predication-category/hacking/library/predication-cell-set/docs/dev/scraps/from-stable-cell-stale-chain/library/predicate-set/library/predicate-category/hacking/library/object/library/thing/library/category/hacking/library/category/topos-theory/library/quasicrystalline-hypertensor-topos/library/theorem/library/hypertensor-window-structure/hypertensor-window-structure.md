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

- [Decompose Trace](../../acts/decompose-trace.md),
- [Shuffle Trace](../../acts/shuffle-trace.md),
- [Collapse Shuffle](../../acts/collapse-shuffle.md),
- the fixed point of the substitution flow via
  [Ensure Fixed Point](../../acts/ensure-fixed-point.md),
- subject to the substitution constraints of
  [Quasicrystalline Relational Hypertensors](../../theorem/external/quasicrystalline-relational-hypertensors.md).

`Window` values consist of:

- a finite integer-lattice index set with an explicit dimension marker;
- site metadata (strata, chart identifiers);
- substitution parameters determined by the earned substitution act.
