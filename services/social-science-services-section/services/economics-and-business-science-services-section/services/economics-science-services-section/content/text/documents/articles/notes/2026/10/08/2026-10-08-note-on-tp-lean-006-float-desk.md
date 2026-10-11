---
title: "FloatDesk: Lean obligations for the draw refusal order and pricing (TP-LEAN-006)"
description: "The declarations proved in ObsmetrologiaEconomics.FloatDesk for Tidepool section A3 and Appendix A.7, the axioms they depend on, the vectors emitted for the Foundry realizer FloatDeskV1, the modelling choices made, and what is left open."
date-created: 2026-10-08
type: notes
name: 2026-10-08-note-on-tp-lean-006-float-desk
status: active
authors:
  - claude-sonnet-5-5
keywords:
  - tidepool
  - float-desk
  - refusal-order
  - pricing
  - lean
  - golden-vectors
---

## What was done

Task TP-LEAN-006 adds `ObsmetrologiaEconomics/FloatDesk.lean` (namespace `Obsmetrologia.Economics.FloatDesk`, imported from `ObsmetrologiaEconomics.lean`), the conformance rows `ObsmetrologiaConformance/FloatDesk.lean` (imported from `ObsmetrologiaConformance.lean` and `VectorsMain.lean`), the emitter `FloatDeskMain.lean`, a `writeGroup` call in `VectorsMain.lean` for group `desk`, the checked-in `float-desk.golden-vectors.jsonl`, and a `float-desk` suite in `lean-system-services-section/src/golden-vector/suites.mjs` (no realization registered yet: pending, an open obligation and not a nonconformance). Vectors are written to `obsmetrologia-conformance/vectors/desk/{drawAdmitted,pricePerson,priceBusiness}.json`.

The module was largely written before a host crash and resumed afterwards: this session verified it builds, found and removed a `Classical.choice` dependency, wrote the conformance side, and wrote this note.

## The model

`FloatDeskV1.draw` refuses at the first failing check, by a named error. `Refusal` has eight constructors in that order: `feeUnknown`, `termOutOfRange`, `exceedsLine`, `agentCap`, `poolCap`, `writeoff`, `crossesBarrier`, `admitted`. `drawAdmitted` takes `(feeAvoided, term, minTerm, maxTerm, amount, openExp, limit, cap, lent, poolCap, writeoff, budget)` and the Bool `drawSafe`, and is total. The contract's uptime check precedes it and reads no argument; repayment authorization, pricing and `lendFloat` come after admission. Caps that do not bind a member kind are passed as `type(uint256).max` (`cap`) or `0` (`writeoff`); the function does not know the kind. `termOf now dueDate` is guarded (`0` when the due date is not in the future).

## Declarations proved

All kernel-checked, no `sorry` (37 theorems).

- Order: `feeUnknown_first`, `termOutOfRange_second`, `exceedsLine_third`, `agentCap_fourth`, `poolCap_fifth`, `writeoff_sixth`, `crossesBarrier_last` (each refusal is reached only when all earlier checks passed), `drawAdmitted_eq_admitted_iff` (admission is exactly the conjunction of the checks), `drawAdmitted_cases`, `fee_zero_never_admitted`, `past_due_refused` (with `minTerm >= 1`), `term_in_range`, `termOf_of_le`, `termOf_of_lt`.
- Exposure and caps: `exposure_le_limit`, `exposure_le_line` (with `limit <= line`; `limitOf line capShare := min line capShare`, `exposure_le_line_of_min`, `exposure_le_capShare`), `pool_cap_respected`.
- Barrier: `horizonSafe` is `BarrierSeries.drawSafe` on `[now / 86400, (dueDate + settlementWindow) / 86400]`; `draw_never_crosses_barrier_over_horizon` composes `BarrierSeries.draw_safe`; `crosses_barrier_is_real` is the converse (a `crossesBarrier` refusal names a real crossing).
- Prices: `pricePerson` with `price_person_zero`, `price_cap_respected` (`pricePerson * 365 * 86400 * 10000 <= amount * capBps * termSeconds`), `price_person_tight`, `price_person_le_amount` (cap at most 10000), `price_person_mono`; `priceBusiness` with `price_business_ge_floor`, `price_business_ge_fraction`, `price_business_cases`, `price_business_mono_fee`, `price_business_zero_fraction`; `priceOf` by `Kind` and `person_free_in_v01`.
- Overdue and void over the small record `Desk`: `overdue_changes_three_things` (status, stale flag, cells list length +1), `markOverdue_requires`, `markOverdue_idempotent`, `void_releases_exposure` (subtraction guarded by `amount <= openExposure`), `void_then_no_overdue`.
- `decide` checks for the house cases, including each refusal and the barrier horizon on the BarrierSeries house obligations (float 200 less 90 clears, less 91 does not), `pricePerson 1200 1000000 (30 * 86400) = 9863`.

## Axioms reported

`#print axioms` over all 37 theorems: `propext` and `Quot.sound` at most. The first version of `drawAdmitted_eq_admitted_iff` (case split by `by_cases` plus `simp` and `omega`) reported `Classical.choice`, and with it seven theorems derived from it. It was rewritten with `split at`, explicit `Nat.le_of_not_lt` and `if_neg`; it now reports `propext` alone and no theorem reports `Classical.choice`.

## Vectors

1988 rows in the group (10523 cases in the whole `VectorsMain` run), numbers as decimal strings, `drawSafe` a JSON boolean, results the refusal's name:

- `drawAdmitted.json`: 1628 rows. A 1620-row product grid around a base draw (amount 20, window 3 to 30 days, line 100, lent 500, budget 10): fee {known, unknown} x term {interior, at min, at max, one below, one above} x line {interior, exactly at, one over} x agent cap {interior, equal, one under} x pool cap {interior, exactly full, one over} x writeoff {interior, at budget, one over} x barrier {safe, crosses}. Every combination of failures is present, so the first failure named is the order. Result counts over the file: admitted 53, feeUnknown 810, termOutOfRange 324, exceedsLine 163, agentCap 108, poolCap 74, writeoff 48, crossesBarrier 48. Plus 8 `uint256` rows.
- `pricePerson.json`: 200 rows (caps 0, 1, 50, 1200, 10000 x amounts up to `2^256 - 1` x terms up to one year).
- `priceBusiness.json`: 160 rows (floors up to `2^255` x fees up to `2^256 - 1` x fractions 0, 1, 500, 10000).

The Foundry reader is task TP-EVM-009a (`FloatDeskV1.draw` refusal order, `priceOf`); copy to `tidepool-evm/test/vectors/lean/desk/` is theirs.

## uint256

The sums `amount + openExp` and `lent + amount` are `Nat` here; the boundary rows have them at or above `2^256`, where `Nat` answers `exceedsLine` or `poolCap`. The realizer must reach the same refusal (checked arithmetic that maps overflow to that refusal, or comparison in the subtracted form) and not a panic. Both prices need full-precision `mulDiv`: the products overflow `uint256` for large amounts while the result (at most the amount for caps up to 10000 and terms up to a year; at most the fee for fractions up to 10000) fits. Larger caps or terms are outside the vector domain.

## Open

- `drawSafe` is an input boolean in the vectors; its horizon composition is proved in Lean (`horizonSafe`), but the realizer's day-bucketed barrier is judged by the `barrier` vectors, not here.
- The `float-desk` suite has no registered realization until the EVM vector test exists.
- `Desk` is a deliberately small model of overdue and void; the full storage layout, events and the relay-grace timing are not covered.
- `TallyCredit.lean` of the sibling task TP-LEAN-001 was mid-edit and failed to build in the shared package at the time of this run (17:35), so `lake build ObsmetrologiaEconomics` as a whole fails today; `ObsmetrologiaEconomics.FloatDesk` and `ObsmetrologiaConformance` targets build. Not this task's.
- `VectorsMain.lean` does not yet call the `tally` group; also the sibling's.
