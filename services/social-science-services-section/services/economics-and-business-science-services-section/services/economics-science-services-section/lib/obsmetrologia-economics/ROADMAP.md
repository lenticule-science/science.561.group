# ObsmetrologiaEconomics roadmap: Lean obligations for the Tidepool protocol (revision 3)

Spec: master specification 2026-10-08 revision 3, Appendix B. Each task adds one module `ObsmetrologiaEconomics/<Module>.lean` declaring `namespace Obsmetrologia.Economics.<Module>` (the existing `PoolSplit.lean` convention; Appendix B's names are these declaration names), imported from `ObsmetrologiaEconomics.lean`; conformance rows `lean-system-services-section/lib/obsmetrologia-conformance/ObsmetrologiaConformance/<Module>.lean` (the `PoolSplit.lean` and `Row.lean` pattern); an emitter `<Module>Main.lean`; `VectorsMain.lean` extended with a `writeGroup` call naming the **group directory pinned here** (`tally`, `barrier`, `withdrawal`, `meetpay`, `sleeve`, `desk`, `reseed`, `netting`, `apportion`, …) so `obsmetrologia-conformance/vectors/<group>/<op>.json` matches the `tidepool-evm` acceptance paths; registration in `lean-system-services-section/src/golden-vector/suites.mjs`. Everything over `Nat`/`Int` with every subtraction carrying its hypothesis (no truncated subtraction stands in for a revert); a remark on the `uint256` realization where overflow matters. Conventions: axioms `propext` and `Quot.sound` only (`lean-check` in `mode: "declaration"` is the check); `decide` checks for the house cases; one targeted `lake build` at a time under `lean.slice` with `LEAN_NUM_THREADS=2`. **Note rule:** every task's acceptance includes a note at `economics-science-services-section/content/text/documents/articles/notes/YYYY/MM/DD/YYYY-MM-DD-note-on-<task-id>-<slug>.md` recording the declarations proved, the axioms reported, the vector counts, and what was left open. Existing: `PoolSplit` (kernel-checked). Open derivations from the 2026-10-08 invariants note are named where a task closes one.

## Phase 1 (v0.1)

### TP-LEAN-001 `v0.1` TallyCredit (group `tally`)
- Declarations: `median : List Nat → Nat` (sort; odd length the middle; even length `(a + b) / 2` of the two middles, matching `pool-service` at integer scale; `median_mem_or_between`, `median_le_max`); `clip (size currentMedian minDraw : Nat) : Nat := min size (2 * max currentMedian minDraw)`; `deriveLine (count : Nat) (ring : List Nat) (stale : Bool) : Nat := if stale then 0 else count * median ring` with the hypotheses `count ≤ 16` and `ring.length ≤ 16` carried as arguments of the theorems; `factor_zero_iff_stale`; `append_ge_median_never_lowers : s ≥ median ring → median (ring ++ [s]) ≥ median ring` (replaces the false monotonicity claim; the review's counterexample `[1,100,1000] ++ [1]` is a `decide` check that the old statement fails); `line_growth_bounded : ∀ ring, (every entry clipped) → median (ring') ≤ 2 * median ring` for one window of 9 clipped appends (the ratchet is at most ×2 per nine counted pairs); `limit (line cap : Nat) := min line cap`; `exposure_le_limit : admitted amount open limit → amount + open ≤ limit`.
- Vectors: `tally/{median,clip,deriveLine,limit}.json` (rings up to length 16; the `pool-service` fixture lines restated at integer scale).
- Realizer: `TallyLedgerV1.{median, clip, deriveLine, limitOf}` (TP-EVM-008).

### TP-LEAN-002 `v0.1` BarrierSeries (group `barrier`) — status: done (2026-10-08; note 2026-10-08-note-on-tp-lean-002-barrier-series)
- Declarations: `Obligation := {due : Nat, amount : Nat, settled : Bool, contested : Bool}`; `pending (leadSeconds day : Nat) (o : Obligation) : Bool := ¬o.settled ∧ (o.due − leadSeconds) / 86400 ≤ day ∧ day ≤ o.due / 86400` (UTC day buckets; `leadSeconds` from the charter, not per obligation; subtraction guarded by `leadSeconds ≤ o.due`); `contribution (declared sleeve cap : Nat) := min declared (min sleeve cap)`; `barrierAt (floor ceiling : Nat) (obs : List Obligation) (day : Nat) : Nat := min ceiling (floor + Σ pending contributions)`; `barrierAt_monotone_pending`; `breakpoints_bounded` (at most 64 distinct days active); `barrier_le_ceiling`; `member_contribution_le_sleeve`; `drawSafe (float amount : Nat) (h : amount ≤ float) (obs) (fromDay toDay : Nat) : Bool` and `draw_safe : drawSafe = true → ∀ d ∈ [fromDay, toDay], float − amount ≥ barrierAt d` (horizon to `due + settlementWindow` is the caller's choice of `toDay`; `amount > float` is not in the domain and the vector rows carry `amount ≤ float` only).
- Vectors: `barrier/{barrierAt,drawSafe,contribution}.json` (the `pool-service` fixtures converted from ISO days to unix days as stated).
- Realizer: `BarrierSeriesV1.{barrierAt, wouldCross, contributionOf}` (TP-EVM-007).

### TP-LEAN-003 `v0.1` Withdrawal (group `withdrawal`)
- Status: done (2026-10-08); note `2026-10-08-note-on-tp-lean-003-withdrawal`.
- Declarations over the storage model: `Participation := silent | assented | objected | withdrawn`; `counts (ps : List Participation) : (heard, withdrawn, objections)`; `Outcome := consensus | escalated | adjourned`; `quiesce (heard withdrawn objections quorum : Nat) : Outcome × Bool` (the Bool: the standing formula executes) with: `heard = 0 → (adjourned, false)`; `objections ≥ quorum → (escalated, false)`; else `(consensus, true)`; `quiesce_cases`; `lone_objection_keeps_default : objections < quorum → heard > 0 → (quiesce …).2 = true`; `silence_is_bottom : counts (ps ++ [silent]) = counts ps`; `withdraw_touches_one` stated over the storage list (changing one member's entry changes exactly one position; the cell list only grows); `engaged_antitone`; `terminates` (finite list).
- Vectors: `withdrawal/{quiesce,counts}.json` (all multisets up to 6 members, quorums 1..4).
- Realizer: `WithdrawalAllocatorV1.quiesce` (TP-EVM-010b).

### TP-LEAN-004 `v0.1` MeetPay (group `meetpay`)
- Status: done (2026-10-08); note `2026-10-08-note-on-tp-lean-004-meetpay`.
- Declarations: `pay (a b : Nat) := min a b`; `heldMass (a b) := max a b − min a b`; `pay_le_both`; `held_mass_zero_iff_agree`; `pay_add_mass_eq_max`; `payAll (local : Nat) (claims : List Nat) : Nat := claims.foldr min local` (several challengers); `payAll_le_each`; `untold_pays_local : payAll local [] = local`; `perSiteSum (sites : List (Nat × List Nat)) := Σ payAll` with `per_site_sum_le_total`.
- Vectors: `meetpay/{pay,heldMass,payAll}.json`.
- Realizer: `SiteWitnessV1.meetOf`, `TidepoolTreasuryV1.pullDistributable` (TP-EVM-011b, TP-EVM-006b).

### TP-LEAN-005 `v0.1` Sleeve (group `sleeve`)
- Status: done (2026-10-08); note `2026-10-08-note-on-tp-lean-005-sleeve`.
- Declarations: `routableYield (value hwm : Nat) (h : hwm ≤ value) := value − hwm`; `routeYield (value hwm maxA) (h) := min maxA (value − hwm)` and `routeYield_preserves_principal : value − routeYield ≥ hwm`; `hwmAfterLoss (value hwm) := min hwm value` with `hwm_after_loss_le_value`; `redeemable (hwm value maxWithdraw) := min hwm (min value maxWithdraw)` with `redeem_le_redeemable` and `redeem_lowers_hwm : hwm' = hwm − min hwm assetsOut`; remark that `ShareValueMonotone` (open) is the vault-side assumption this module does not prove and that the EVM realizer tolerates one share of rounding.
- Vectors: `sleeve/{routableYield,routeYield,hwmAfterLoss,redeemable}.json`.
- Realizer: `MemberSleeveV1.{routableYield, redeemablePrincipal}` (TP-EVM-004a).

### TP-LEAN-006 `v0.1` FloatDesk (group `desk`)
- Declarations: `Refusal := feeUnknown | termOutOfRange | exceedsLine | agentCap | poolCap | writeoff | crossesBarrier | admitted`; `drawAdmitted` as the ordered refusal function over `(feeAvoided, term, minTerm, maxTerm, amount, open, limit, cap, lent, poolCap, writeoff, budget, drawSafe)`; `exposure_le_line`; `draw_never_crosses_barrier_over_horizon` (composes TP-LEAN-002 with `toDay = (due + settlementWindow) / 86400`); `pricePerson (capBpsPerYear amount termSeconds : Nat) := amount * capBpsPerYear * termSeconds / (365 * 86400 * 10000)` with `price_person_zero : capBpsPerYear = 0 → pricePerson = 0` and `price_cap_respected : pricePerson * 365 * 86400 * 10000 ≤ amount * capBpsPerYear * termSeconds` (rounding down); `priceBusiness (floor feeAvoided fractionBps) := max floor (feeAvoided * fractionBps / 10000)`; `overdue_changes_three_things` (over a small record: status, stale flag, cells list length +1); `void_releases_exposure`.
- Vectors: `desk/{drawAdmitted,pricePerson,priceBusiness}.json`.
- Realizer: `FloatDeskV1.{draw refusal order, priceOf}` (TP-EVM-009a).

## Phase 2 (v0.2)

### TP-LEAN-007 Apportion (group `apportion`; closes `LargestRemainder`)
- Declarations: `apportion (total : Nat) (weights : List Nat) : List Nat` (floors, then one unit each to the largest remainders until the sum is `total`, ties resolved by splitting the last unit's position evenly as a disclosed rule stated as a function); `apportion_sum`; `apportion_within_one`; `apportion_length`; `tie_even_is_chirality_free` (invariant under reversing the weight list, in contrast to `AllocationSolver.bias_witness`).
- Vectors: `apportion/apportion.json` (the `pool-service` fixtures among the cases). Realizer: `TallyVoteV1.apportion`.

### TP-LEAN-008 Netting (group `netting`)
- Declarations: `Edge := {debtor creditor : Nat, remaining : Nat}`; `Cycle := {edges : List Nat, amount : Nat}`; `isClosed`; `clear`; `clear_edge_le`; `clear_conserves_net`; `no_transfer` (clearing is a function on `remaining` only).
- Vectors: `netting/{clear,netPosition}.json`. Realizer: `ClearinghouseV1.clear` (TP-EVM-013; its vector test is pending until this lands).

### TP-LEAN-009 Reseed (group `reseed`)
- Declarations: `payout (cap gap reserve) := min cap (min gap reserve)`; `payout_le_cap`; `payout_le_gap`; `prorata (claims : List Nat) (budget : Nat)` with `prorata_sum_le_cap`; `nEff (N : Nat) (rhoBps : Nat) : Nat := N * 10000 / (10000 + (N − 1) * rhoBps)` with `nEff_le_N`; `reserve_stays_above_barrier`.
- Vectors: `reseed/{payout,prorata,nEff}.json`. Realizer: `ReseedMutualV1.{grant, capFor}` (TP-EVM-012; vector test pending until this lands).

### TP-LEAN-010 HoldRule; TP-LEAN-011 Demurrage; TP-LEAN-012 SiteCover; TP-LEAN-013 Bounty; TP-LEAN-014 Algedonic
- As revision 2, with `SiteCover.isForest` judged against `GraphCohomology.betti` (`h1 = E − V + C = 0`).

## Phase 3 (v0.3)

### TP-LEAN-015 Decorrelation; TP-LEAN-016 EnergyCommons; TP-LEAN-017 Rota; TP-LEAN-018 CellEligibility; TP-LEAN-019 Federation; TP-LEAN-020 CycleAsClosure
- As revision 2.
