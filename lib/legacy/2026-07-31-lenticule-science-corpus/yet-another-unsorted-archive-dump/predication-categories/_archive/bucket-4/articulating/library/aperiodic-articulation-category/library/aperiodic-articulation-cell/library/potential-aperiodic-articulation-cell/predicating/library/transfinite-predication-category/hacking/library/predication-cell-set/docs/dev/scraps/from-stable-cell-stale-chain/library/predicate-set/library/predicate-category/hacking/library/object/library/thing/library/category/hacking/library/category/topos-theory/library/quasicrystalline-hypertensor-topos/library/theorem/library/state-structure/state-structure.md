---
title: State Structure
keywords:
  - state
  - section
layer: internal-theorem
status: plan
depends_on:
  - theorem/internal/universal-state-hypertensor
claims:
  - type: structure
    judgement: State := Section in the earned hypertensor sheaf
---
# State Structure

`State` is the unique relational state carrier earned by
`theorem/internal/universal-state-hypertensor`.

## Statement

From **Relational Quasicrystalline Hypertensor Sheaf**
(`docs/math/theorem/internal/universal-state-hypertensor.md`) we earn a
structure

```text
HypertensorSheaf = (Window, Fiber, Tower, Section, restrict, glue)
State := Section
```

`State` is exactly the `Section` carrier in that structure and carries the
full finite window, its fibres, and attached profile towers.

## Components and operators

- `Window`, `Fiber`, `Tower` are as earned in
  `theorem/internal/universal-state-hypertensor` via the acts
  `decompose-trace`, `shuffle-trace`, `collapse-shuffle`, `ensure-fixed-point`,
  `profile-recognitions`, `build-profile-tower`, and
  `build-composite-profile-tower`.
- `restrict` and `glue` are the sheaf maps earned there from
  `presheaf`, `sheaf-condition`, and `sheafification`, respecting the coverage
  induced by `discipline`, `filter`, and `compose-filter`.

## Dynamics

Applying the earned flow/nucleus acts (`flow`, `nucleate`,
`commute-flow-and-nucleus`, `flow-composite-profile`) to a `State` keeps it in
the same nucleus-equivalence class. `State` is therefore stable under the
flow–nucleus dynamics of the hypertensor sheaf.

## Singularity of state

All specifications treat `State` as the sole mutable system state. No other
notion of “state” is permitted.

## Proof sketch

1. By **Relational Quasicrystalline Hypertensor Sheaf**
   (`universal-state-hypertensor.md`), the acts
   [`decompose-trace`](../../acts/decompose-trace.md),
   [`shuffle-trace`](../../acts/shuffle-trace.md),
   [`collapse-shuffle`](../../acts/collapse-shuffle.md),
   [`ensure-fixed-point`](../../acts/ensure-fixed-point.md),
   [`profile-recognitions`](../../acts/profile-recognitions.md),
   [`build-profile-tower`](../../acts/build-profile-tower.md),
   [`build-composite-profile-tower`](../../acts/build-composite-profile-tower.md),
   [`presheaf`](../../acts/presheaf.md),
   [`sheaf-condition`](../../acts/sheaf-condition.md),
   [`sheafification`](../../acts/sheafification.md),
   [`discipline`](../../acts/discipline.md),
   [`filter`](../../acts/filter.md),
   [`compose-filter`](../../acts/compose-filter.md),
   [`flow`](../../acts/flow.md),
   [`nucleate`](../../acts/nucleate.md),
   [`commute-flow-and-nucleus`](../../acts/commute-flow-and-nucleus.md), and
   [`flow-composite-profile`](../../acts/flow-composite-profile.md) earn a
   unique structure `(Window, Fiber, Tower, Section, restrict, glue)`.
2. Define `State := Section` from that earned structure. Uniqueness of the
   sheaf together with the flow–nucleus compatibility clauses forces any
   carrier satisfying the same axioms to be nucleus-equivalent to `Section`.
3. Stability follows immediately from the flow–nucleus acts listed above, which
   commute with `restrict`/`glue` by construction of the sheaf.
4. No other mutable carrier is produced by these acts; hence `State` is the
   only admissible mutable state in the relational calculus.
