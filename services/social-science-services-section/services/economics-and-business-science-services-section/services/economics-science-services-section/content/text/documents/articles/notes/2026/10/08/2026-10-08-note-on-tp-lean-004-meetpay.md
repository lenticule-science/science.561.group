---
title: "MeetPay: Lean obligations for pay-the-meet (TP-LEAN-004)"
description: "The declarations proved in ObsmetrologiaEconomics.MeetPay for Tidepool section 2.8, the axioms they depend on, the vectors emitted for the Foundry realizers of SiteWitnessV1.meetOf and TidepoolTreasuryV1.pullDistributable, the modelling choices made, and what is left open."
date-created: 2026-10-08
type: notes
name: 2026-10-08-note-on-tp-lean-004-meetpay
status: active
authors:
  - claude-sonnet-5-5
keywords:
  - tidepool
  - pay-the-meet
  - meetpay
  - lean
  - golden-vectors
---

## What was done

Task TP-LEAN-004 adds `ObsmetrologiaEconomics/MeetPay.lean` (namespace `Obsmetrologia.Economics.MeetPay`, imported from `ObsmetrologiaEconomics.lean`), the conformance rows `ObsmetrologiaConformance/MeetPay.lean` (imported from `ObsmetrologiaConformance.lean`), the emitter `MeetPayMain.lean`, a `writeGroup` call in `VectorsMain.lean` for group `meetpay`, and a `meetpay` suite in `lean-system-services-section/src/golden-vector/suites.mjs` (no realization registered yet, so the suite is pending, an open obligation and not a nonconformance). The vectors are written to `obsmetrologia-conformance/vectors/meetpay/{pay,heldMass,payAll}.json` by `VectorsMain`.

## The model

Specification section 2.8: pay-the-meet applies to one quantity reported by two witnesses, a site's own cycle inflow `T`. The treasury's distribution for the cycle is capped at `paid = min(T, claimedTotal)`; `heldMass = |T - claimedTotal|` stays in the treasury; an untold second witness is bottom and the local figure pays in full; there is no cross-site minimum, the global distributable being the sum of per-site meets, each in its own asset.

## Declarations proved

Definitions: `pay a b := min a b`; `heldMass a b := max a b - min a b` (the subtraction is guarded by `min_le_max'`, so it is the absolute difference and not a truncation standing in for a revert); `payAll own claims := claims.foldr min own`; `heldAll own claims := own - payAll own claims` (guarded by `payAll_le_local`); `perSiteSum`, `localSum`, `heldSum` over `List (Nat x List Nat)`, one `(local report, claims)` pair per site.

Theorems, all kernel-checked, no `sorry`:

- Two witnesses: `pay_le_both` (with `pay_le_left`, `pay_le_right`), `pay_greatest` (the meet is the greatest lower bound), `pay_comm`, `heldMass_comm`, `held_mass_zero_iff_agree`, `pay_add_mass_eq_max` (paid plus held is the larger report: nothing is lost between witnesses), `max_eq_pay_add_mass`, `heldMass_le_max`, `pay_self`, `pay_zero_left`.
- Several challengers: `untold_pays_local` (`payAll own [] = own`, by `rfl`), `payAll_single` (one challenger is `pay`), `payAll_le_local`, `payAll_le_each` (below every challenger's claim), `payAll_greatest`, `payAll_eq_local_or_mem` (the pay is the local report or some claim), `payAll_perm` (challenger order is irrelevant), `payAll_append` (claims told in two batches), `pay_add_heldAll`, `heldAll_nil`.
- Per site: `per_site_sum_nil`, `per_site_sum_cons`, `per_site_sum_append` (additive: one site's meet does not depend on any other), `per_site_sum_le_total` (the global distributable never exceeds the sum of local reports), `per_site_held_conserves` (paid plus held over the sites is the sum of local reports), `per_site_sum_untold` (every second witness untold: every site pays in full).
- `decide` checks for the house cases: `pay 10 7 = 7`, `heldMass 10 7 = 3`, `payAll 10 [7, 12, 3] = 3`, `payAll 10 [12, 15] = 10`, and a three-site sum (`perSiteSum` 18, `localSum` 23, `heldSum` 5).

A naming remark: the roadmap writes the local report as `local`, but `local` is a Lean command keyword and cannot be a binder, so the Lean binder is `own`; vector argument order is `[local, claims]`.

## Axioms reported

`#print axioms` over every theorem of the module (27): each depends on `propext` and `Quot.sound` at most (several on `propext` alone; `untold_pays_local` on none). The first draft of `held_mass_zero_iff_agree` used `omega` on the `Iff` directly and reported `Classical.choice`; it was rewritten as two `omega` calls inside an anonymous constructor and now reports `propext`, `Quot.sound`. No theorem outside the allowed set remains.

## Vectors

Emitted by `VectorsMain.lean` (6166 cases total in the run, all groups), meetpay group 786 rows, numbers as decimal strings so `uint256` boundaries survive JSON:

- `pay.json`: 81 rows, every ordered pair from `0, 1, 2, 7, 10, 10^6, 10^18, 2^255, 2^256 - 1`. Arguments `[a, b]`, result a decimal string.
- `heldMass.json`: the same 81 pairs.
- `payAll.json`: 624 rows: local reports `0, 5, 10, 10^18` times every claim list of length 0 to 3 over `0, 3, 7, 12, 10^18` (156 lists, the empty list being the untold second witness). Arguments `[local, [claim, ...]]`.

`MeetPayMain` prints 786 JSONL rows for the `meetpay` suite. The Foundry reader is the task TP-EVM-011b (`SiteWitnessV1.meetOf`) and TP-EVM-006b (`TidepoolTreasuryV1.pullDistributable`); copy to `tidepool-evm/test/vectors/lean/meetpay/` is theirs.

## uint256

`min`, `max` and the guarded subtraction never exceed their arguments, so `pay`, `heldMass` and `payAll` cannot overflow on `uint256` inputs; the boundary rows at `2^256 - 1` witness it. Only `perSiteSum` adds, and the contracts never form that sum on chain (each site pulls its own meet in its own asset); the sum's bound is the off-chain reconciler's concern and is not claimed here.

## Open

- `heldMass` and `payAll` model the quantities of 2.8; the event `MeetSettled(cycle, paid, heldMass, challengeUpheld)`, the grace-window timing, the bond logic and the release of held mass (`settleMeet`) are state-machine behaviour not covered; a later module could prove held mass is released to exactly one of the distributable or the reserve.
- `pullDistributable` also takes `min` with `distributablePending` and subtracts `reserveShare` and `floatShare`; that composition (with its hypotheses `reserveShare + floatShare <= paid`) is not stated here and belongs with the treasury vectors of TP-EVM-006b if wanted.
- The `meetpay` suite has no registered realization until the EVM vector tests exist.
- `ObsmetrologiaEconomics.lean` and `ObsmetrologiaConformance.lean` also gained concurrent imports from sibling tasks (BarrierSeries); only the MeetPay lines are this task's.
