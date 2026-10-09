---
title: "TP-LEAN-002: BarrierSeries, the barrier as a day-bucketed step function"
description: "What was proved about the Tidepool barrier (pending windows in UTC day buckets, counted contributions, the capped sum, breakpoints, draw safety over a horizon), the axioms reported, the vector counts per file, the decisions taken where the roadmap left a choice, and what was left open for TP-EVM-007 and TP-LEAN-006."
date-created: 2026-10-08
type: notes
name: 2026-10-08-note-on-tp-lean-002-barrier-series
status: active
authors:
  - claude-sonnet-5-5
keywords:
  - tidepool
  - barrier-series
  - lean
  - golden-vectors
  - day-buckets
  - draw-safety
---

## What was done

`ObsmetrologiaEconomics/BarrierSeries.lean` (namespace `Obsmetrologia.Economics.BarrierSeries`) states the pool barrier of specification section A6 over `Nat` and proves it; it is imported from `ObsmetrologiaEconomics.lean`. The conformance row module `ObsmetrologiaConformance/BarrierSeries.lean`, the emitter `BarrierSeriesMain.lean`, a `writeGroup ... "barrier-series" "barrier"` call in `VectorsMain.lean`, and the suite `barrier-series` in `lean-system-services-section/src/golden-vector/suites.mjs` (no realization registered, so the suite is pending, never a nonconformance) carry it to `obsmetrologia-conformance/vectors/barrier/`. `lake build ObsmetrologiaEconomics.BarrierSeries` succeeds; the vectors were read off the Lean with `scripts/emit-golden-vectors.mjs --suite barrier-series` (2137 rows, address `ni:///sha-256;O-nANVfmrsNxPrh2wrvS-Lj1liopL7fI83UPtUXBPR4`) and projected with `VectorsMain.lean`.

## Declarations

Definitions: `Obligation {due amount settled contested}`, `startDay`, `endDay`, `pending`, `contribution`, `capOf`, `pendingSum`, `barrierAt`, `breakpoints`, `insertDay`/`dayset`, `daysFrom`, `projectedSafe`, `drawSafe`, `firstCrossing`.

Theorems (37), grouped:

- Pending: `startDay_of_le`, `pending_iff`, `pending_settled`, `pending_on_due_day`.
- Contribution: `member_contribution_le_sleeve`, `contribution_le_declared`, `contribution_le_cap`, `contribution_eq_declared`, `capOf_le_float` (for `bps <= 10000`), `contribution_le_float`.
- Barrier: `barrier_le_ceiling`, `barrierAt_nil`, `barrierAt_ge_floor`, `pendingSum_sublist`, `barrierAt_monotone_pending` (a sublist of the obligations gives a barrier no higher, on every day), `barrierAt_declare_ge`, `barrierAt_settle_le`, `barrierAt_declare_exact` (a pending obligation raises the barrier by exactly its amount when the ceiling does not bind).
- Breakpoints: `breakpoints_length` (two per obligation), `insertDay_length_le`, `mem_insertDay`, `dayset_length_le`, `mem_dayset`, `breakpoints_bounded` (at most 64 distinct days when at most 32 obligations), `pending_step`, `pendingSum_step`, `barrierAt_step` (the barrier is constant between breakpoints, which is what makes day buckets a complete representation of the series).
- Draw safety: `mem_daysFrom`, `projectedSafe_iff`, `drawSafe_eq_projected`, `draw_safe` (`drawSafe = true` gives `float - amount >= barrierAt d` on every day of `[fromDay, toDay]`), `firstCrossing_none_iff`, `draw_unsafe` (the converse: an unsafe draw has a first day with `float - amount < barrierAt d`), `drawSafe_zero`, `drawSafe_zero_of_ceiling` (a float at least the ceiling never blocks a zero draw, so a barrier cannot forbid everything), `projectedSafe_mono`, `drawSafe_antitone`.
- Ten `decide` checks: the `pool-service` fixture (20 before the window, 110 inside it on the due day and ten days before, 20 the day after), a binding ceiling, the 45-against-50 crossing, settled obligations not counting, contested obligations counting.

## Axioms reported

`#print axioms` over all 37 theorems (the `lean-check` declaration check, run as a plain `#print axioms` list on the whole module): 27 depend on `[propext, Quot.sound]`, 9 on `[propext]`, 1 on none. No `Classical.choice`, no `sorryAx`. The first draft of `draw_unsafe`, `mem_daysFrom` and `pending_step` pulled in `Classical.choice` through `by_contra` and `omega` over negated conjunctions; they were rewritten with `find?` witnesses and explicit `Nat` order lemmas, which is why `firstCrossing` exists as a declaration and not only as a vector.

## Decisions where the roadmap left a choice

- `barrierAt` takes `leadSeconds` as its first argument (the roadmap's signature omitted it, and the same entry says `pending` needs it, from the charter).
- `Obligation.amount` is the member's counted contribution. The roadmap defines `barrierAt` as `min ceiling (floor + sum of pending contributions)` and `contribution` per member; `BarrierSeriesV1` stores both the declared amount and the counted one. The per-member `contribution` is therefore a separate function (with `capOf`) and the series sums counted figures.
- The subtraction `due - leadSeconds` is guarded by `if leadSeconds <= due`, with `0` otherwise (`startDay`); the vectors only carry `leadSeconds <= due`, the domain of the `uint64` realization.
- `contested` does not appear in `pending`: a contested obligation counts while open (spec A6), so only `settled` removes it. A daimon settlement that closes a contest sets `settled` (upheld) or leaves it counted.
- `drawSafe` carries `amount <= float` as an argument; the vector rows are filtered by it. `wouldCross` of the realizer is `projectedSafe` at `projected = float - amount` (and `firstCrossing` supplies `atDay`); both are emitted so TP-EVM-007 can judge `wouldCross` directly, which the roadmap's three vector files did not cover. Horizons with `toDay < fromDay` are excluded from the vectors (vacuously safe in Lean, an input error in a contract).
- The `pool-service` fixture (`derivePoolBarrierSeries`, `leadDays` 10, floor 20, three obligations of 30 due 2026-09-25) converts to unix day 20721; `pool-service` ends a window the day after the due day, exclusive, which is `day <= due / 86400` inclusive here, and the vector `barrierAt` rows at days 20711 to 20722 reproduce 110 inside and 20 outside.

## Vectors

`vectors/barrier/`: `barrierAt.json` 102 cases (twelve charter-and-obligation configurations, each read at every breakpoint and a day either side, plus days 0 and 1000000), `drawSafe.json` 1000, `projectedSafe.json` 440, `firstCrossing.json` 440, `contribution.json` 125, `capOf.json` 30; 2137 in all. All numbers are decimal strings; obligations are objects with keys in alphabetical order (`amount`, `contested`, `due`, `settled`), the order Foundry's `vm.parseJson` decodes structs in. The 2137 rows were checked a second time against an independent Python reimplementation of the same definitions written from the roadmap text (all agree). The Lean emitter is the only source of the files; nothing was written by hand.

## uint256 realization

Everything is `Nat`. `floor + sum` can exceed `2^256` only if the pending counted amounts do; each is at most the member cap, itself at most the float (`contribution_le_float`), and `min ceiling x` is unchanged by saturating `x` at `ceiling`, so a saturating add agrees on all inputs. No vector row has a sum at or beyond `2^256` (the largest rows use `2^254` amounts under a `2^255` ceiling). `capOf` multiplies before dividing, so a realization needs a full-precision mulDiv for floats near `2^256`; the `capOf` vectors stop at `2^200`.

## Open

- TP-EVM-007 should read the six files; the pending vector test `lean/barrier` can now be written. Copying the files byte-for-byte to `tidepool-evm/test/vectors/lean/barrier/` is the realizer task's step (this task did not touch `tidepool-evm`).
- The 64-day bound is proved for 32 obligations (two breakpoints each, the worst case where no day is shared); the contract's `BucketsExhausted` condition is by distinct days, and `dayset_length_le` is the general statement. A tighter bound from the `maxActiveObligationsPerMember = 2` cap needs a member count and belongs with the contract.
- Not proved here: the "declaration older than `leadSeconds` cannot be raised more than 2x" rule, bonds conserving across `declare/settle/expire`, and the `expire` timing (storage-model statements of TP-EVM-007). The composition `draw_never_crosses_barrier_over_horizon` is TP-LEAN-006.
- Not run: the `lean-check` tool itself (`mode: "declaration"`); the axiom list above is the same check by `#print axioms`. The vectors for this suite carry no registered realization.
