---
title: "Sleeve: Lean obligations for the member sleeve (TP-LEAN-005)"
description: "The declarations proved in ObsmetrologiaEconomics.Sleeve for Tidepool A1 and Appendix A.3, the axioms they depend on, the vectors emitted for the Foundry realizers of MemberSleeveV1.routableYield and redeemablePrincipal, the modelling choices made, and what is left open."
date-created: 2026-10-08
type: notes
name: 2026-10-08-note-on-tp-lean-005-sleeve
status: active
authors:
  - claude-sonnet-5-5
keywords:
  - tidepool
  - member-sleeve
  - high-water-mark
  - lean
  - golden-vectors
---

## What was done

Task TP-LEAN-005 adds `ObsmetrologiaEconomics/Sleeve.lean` (namespace `Obsmetrologia.Economics.Sleeve`, imported from `ObsmetrologiaEconomics.lean`), the conformance rows `ObsmetrologiaConformance/Sleeve.lean` (imported from `ObsmetrologiaConformance.lean`), the emitter `SleeveMain.lean`, a `writeGroup` call in `VectorsMain.lean` for group `sleeve`, and a `sleeve` suite in `lean-system-services-section/src/golden-vector/suites.mjs` (no realization registered yet, so the suite is pending, an open obligation and not a nonconformance). Vectors are written to `obsmetrologia-conformance/vectors/sleeve/`. The work resumed after a host crash: the module, rows, emitter and suite registration had survived; this session re-verified the build and axioms, emitted the missing `vectors/sleeve/` files, and wrote this note and the roadmap status.

## The model

A sleeve is two numbers: `value` (`totalValue()`, the vault assets its shares are worth) and `hwm` (the principal high-water mark). The treasury may be routed the surplus above the mark, never principal. The owner may withdraw up to `min hwm (min value maxWithdraw)`, never gated by any pool state.

## Declarations proved

Definitions: `routableYield value hwm (h : hwm <= value) := value - hwm`; `routeYield value hwm maxA h := min maxA (routableYield ..)`; `hwmAfterLoss value hwm := min hwm value`; `routeAfterLoss` (routing from the lowered mark, hypothesis discharged); `surplus` (the floored view, zero under water); `redeemable hwm value maxWithdraw := min hwm (min value maxWithdraw)`; `hwmAfterRedeem hwm out := hwm - min hwm out` (guarded).

Theorems (31, kernel-checked, no `sorry`):

- Routing: `routeYield_le_surplus`, `routeYield_le_max`, `routeYield_le_value`, `routeYield_preserves_principal` (`value - routeYield >= hwm`), `routeYield_all`, `routeYield_of_ge`, `routeYield_zero_iff`, `rounding_allowance` (any allowance suffices in the exact model).
- Loss-aware mark: `hwm_after_loss_le_value`, `hwm_after_loss_le_hwm`, `hwm_after_loss_idem`, `hwm_after_loss_of_le`, `hwm_after_loss_of_lt`, `hwm_after_loss_greatest`, `hwm_after_loss_routable`, `route_after_loss_le_value`, `route_after_loss_zero`, `surplus_of_le`, `surplus_of_lt`.
- Redemption: `redeemable_le_hwm`, `redeemable_le_value`, `redeemable_le_max`, `redeem_le_redeemable` (an amount is within the bound iff within each of the three limits), `redeem_lowers_hwm` (`hwm' = hwm - min hwm assetsOut`), `redeem_lowers_hwm_exact`, `hwm_after_redeem_le`, `redeem_keeps_solvent`, `redeem_keeps_surplus` (an owner exit never changes what is routable), `deposit_keeps_solvent`, `redeem_all_zeroes_hwm`.
- `decide` house cases: `routableYield 120 100 = 20`, `routeYield 120 100 5 = 5`, `routeYield 120 100 50 = 20`, `hwmAfterLoss 80 100 = 80`, `redeemable 100 80 90 = 80`, `hwmAfterRedeem 100 130 = 0`, and others.

## Axioms reported

`#print axioms` over all 31 theorems: 29 depend on `propext` and `Quot.sound`, one on `propext` alone, one on no axiom. No `Classical.choice`, no `sorryAx`.

## Vectors

`VectorsMain` run total 7796 cases over all groups; sleeve group 1630 rows (matching the 1630 JSONL rows of `SleeveMain`), numbers as decimal strings so `uint256` boundaries survive JSON, values over `0, 1, 2, 7, 10, 100, 10^6, 10^18, 2^255, 2^256 - 1`:

- `routableYield.json` 55 rows (in-domain pairs `hwm <= value`).
- `routeYield.json` 275 rows (in-domain pairs times `maxA` over `0, 1, 5, 10^18, 2^256 - 1`).
- `hwmAfterLoss.json` 100, `surplus.json` 100, `hwmAfterRedeem.json` 100, `redeemable.json` 1000 (every triple).

Argument order is the Lean order (`redeemable [hwm, value, maxWithdraw]`). The Foundry reader is TP-EVM-004a (`MemberSleeveV1.routableYield`, `redeemablePrincipal`); copy to `tidepool-evm/test/vectors/lean/sleeve/` is theirs. Out-of-domain `routableYield`/`routeYield` pairs (`hwm > value`) have no rows: the realizer lowers the mark first, and `surplus` and `hwmAfterLoss` carry that case.

## uint256

`min` and the guarded subtraction never exceed their arguments. `value - hwm` cannot underflow once the mark is lowered (done first on every owner action). Deposits add; `hwm + assets <= 2^256 - 1` follows from the vault's own supply bound.

## Open

- `ShareValueMonotone`: nothing here says a vault's share price does not fall. The module takes `value` as given at each step; the loss-aware mark is the reply to a fall, not a proof none occurs. The EVM realizer tolerates one share of rounding where the vault's conversion rounds down.
- No ERC-4626 conversion model (shares to assets rounding) is stated; the exact model needs no allowance.
- `maxWithdraw` is an opaque input; vault illiquidity is not modelled.
