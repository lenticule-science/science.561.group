# ObsmetrologiaEconomics roadmap: Lean obligations for the Tidepool protocol

Spec: master specification 2026-10-08, Appendix B. Each task adds one module `ObsmetrologiaEconomics/<Module>.lean` (imported from `ObsmetrologiaEconomics.lean`), its conformance rows `lean-system-services-section/lib/obsmetrologia-conformance/ObsmetrologiaConformance/<Module>.lean` (following `PoolSplit.lean` there and `Row.lean`), an emitter `<Module>Main.lean` (the `PoolSplitMain.lean` pattern), plain-JSON vectors under `obsmetrologia-conformance/vectors/<suite>/<op>.json` in the `{suite, declaration, cases:[{op,args,result}]}` shape (`VectorsMain.lean` extended), and a registration in `lean-system-services-section/src/golden-vector/suites.mjs`. Everything over `Nat`/`Int` (unbounded), with a remark on the `uint256` realization where overflow matters. Conventions: axioms `propext` and `Quot.sound` only (the invariants note's standard; `lean-check` in `mode: "declaration"` is the check); `decide` checks for the house cases; one `lake build` at a time under `lean.slice`. **Note rule:** every task's acceptance includes a note at `economics-science-services-section/content/text/documents/articles/notes/YYYY/MM/DD/YYYY-MM-DD-note-on-<task-id>-<slug>.md` recording the declarations proved, the axioms reported, the vector counts, and what was left open; a task without its note is unfinished. Existing: `PoolSplit` (done, kernel-checked); open derivations from the 2026-10-08 invariants note are named where a task closes one.

## Phase 1 (v0.1)

### TP-LEAN-001 `v0.1` TallyCredit
- Declarations: `median : List Nat → Nat` (lower median of the sorted list; `median_mem`, `median_le_max`); `deriveLine (matched : List Nat) (stale : Bool) : Nat := if stale then 0 else matched.length * median matched`; `factor_zero_iff_stale`; `line_monotone_in_matched` (appending a matched size never lowers the line when not stale); `line_zero_of_no_history`.
- Vectors: suite `tally-credit`, ops `median`, `deriveLine` (lists up to length 16, including the ring-buffer boundary).
- Realizer: `TallyLedgerV1.median`, `deriveLine` (TP-EVM-008).
- Acceptance: builds; axioms as above; vectors emitted; the `pool-service` fixture lines appear among the cases.

### TP-LEAN-002 `v0.1` BarrierSeries
- Declarations: `Obligation := {due : Nat, amount : Nat, lead : Nat}`; `pending (t) (obs)`; `barrierAt (floor) (obs) (t) : Nat := floor + wsum (pending t obs).map amount`; `barrierAt_monotone_pending`; `breakpoints`; `drawSafe (float amount) (obs) (from due) : Bool` (no breakpoint in `[from, due]` with `float − amount < barrierAt`); `draw_safe : drawSafe = true → ∀ t ∈ [from, due], float − amount ≥ barrierAt t`.
- Vectors: suite `barrier-series`, ops `barrierAt`, `drawSafe`.
- Realizer: `BarrierSeriesV1.barrierAt`, `wouldCross` (TP-EVM-007).

### TP-LEAN-003 `v0.1` Withdrawal
- Declarations: `Engagement := assent | object | withdrawn | silent`; `Outcome := consensus | escalated | adjourned`; `quiesce (members : List Engagement) : Outcome` (heard = assent + object; any object among heard → escalated; no heard → adjourned; else consensus); `quiesce_cases`; `silence_is_bottom` (adding silent members never changes the outcome); `withdraw_touches_one` (stated over a cell list: withdrawal changes exactly the participation cell); `engaged_antitone`; `terminates` (trivial finiteness, stated to mirror the Lakota theorem's finiteness argument).
- Vectors: suite `withdrawal`, op `quiesce` (all engagement multisets up to 6 members).
- Realizer: `WithdrawalAllocatorV1.quiesce` (TP-EVM-010).

### TP-LEAN-004 `v0.1` MeetPay
- Declarations: `pay (a b : Nat) := min a b`; `heldMass (a b) := max a b − min a b`; `pay_eq_min`; `pay_le_both`; `held_mass_zero_iff_agree`; `pay_add_mass_eq_max`.
- Vectors: suite `meet-pay`, ops `pay`, `heldMass`.
- Realizer: `SiteWitnessV1.meetOf` (TP-EVM-011).

### TP-LEAN-005 `v0.1` Sleeve
- Declarations: `routableYield (value hwm : Nat) := value − hwm`; `routeYield (value hwm maxAssets)` returns `(routed, value')` with `routed = min maxAssets (value − hwm)`; `routeYield_preserves_principal : value' ≥ hwm`; `redeem_le_highwater`; a remark that `ShareValueMonotone` (open) is the vault-side assumption this module does not prove.
- Vectors: suite `sleeve`, ops `routableYield`, `routeYield`.
- Realizer: `MemberSleeveV1` (TP-EVM-004).

## Phase 2 (v0.2)

### TP-LEAN-006 FloatDesk
- Declarations: `Refusal := feeUnknown | exceedsLine | agentCap | crossesBarrier | admitted`; `drawAdmitted` as the ordered refusal function over `(feeAvoided, amount, line, cap, drawSafe)`; `draw_never_crosses_barrier` (composes TP-LEAN-002); `overdue_changes_two_cells`; `no_transition_reduces_principal` stated over a small transition system (deposit/route/draw/settle/overdue) with principal as an invariant.
- Vectors: suite `float-desk`, op `drawAdmitted`.

### TP-LEAN-007 Apportion (closes `LargestRemainder`)
- Declarations: `apportion (total : Nat) (weights : List Nat) : List Nat` (floors, then the largest remainders receive one unit each until the sum is `total`, ties split evenly across the tied set by the disclosed rule, stated as a function); `apportion_sum`; `apportion_within_one`; `apportion_length`; `tie_even_is_chirality_free` (the result is invariant under reversing the weight list, in contrast to `AllocationSolver.bias_witness`).
- Vectors: suite `apportion`, op `apportion` (the `pool-service` fixtures among the cases).
- Realizer: `TallyVoteV1.apportion` (TP-EVM-016).

### TP-LEAN-008 Netting
- Declarations: `Edge := {debtor creditor : Nat, remaining : Nat}`; `Cycle := {edges : List Nat, amount : Nat}`; `isClosed`; `clear (edges) (cycles)`; `clear_edge_le` (no edge below zero); `clear_conserves_net` (each node's net position unchanged); `residual_le_line` (stated with a line function).
- Vectors: suite `netting`, ops `clear`, `netPosition`.

### TP-LEAN-009 Reseed
- Declarations: `payout (cap gap reserve) := min cap (min gap reserve)`; `payout_le_cap`; `payout_le_gap`; `reserve_stays_above_barrier (reserve barrier payout)`.
- Vectors: suite `reseed`, op `payout`.

### TP-LEAN-010 HoldRule
- Declarations: over `Obsmetrologia`'s FOUR: `moneyMoves : Point → Bool` with `moneyMoves Both = false ∧ moneyMoves None = false`; `no_money_moves_from_top`; the branch table as a function judged by vectors.
- Vectors: suite `hold-rule`, op `branch`.

### TP-LEAN-011 Demurrage
- Declarations: `step (float reserve rateBps)`; `step_conserves : float' + reserve' = float + reserve`; `index_monotone`; `kwhToAssets (kwhE3 usdPerKwhE6)`.
- Vectors: suite `demurrage`, ops `step`, `kwhToAssets`.

### TP-LEAN-012 SiteCover
- Declarations: `isForest (edges : List (Nat × Nat)) : Bool` via union-find or by `E − V + C = 0`; `forest_iff_h1_zero` relating to `Obsmetrologia.Cohomology.CoordinationCohomology` (`h1_vanishes_iff_forest`, existing) by the cover-nerve construction; `addEdge_creates_cycle_iff`.
- Vectors: suite `site-cover`, op `isForest`.
- Realizer: `SiteWitnessV1.isForest` through `GraphCohomology.betti` (and signstuff-evm P3.4's certificate verifier when it lands).

### TP-LEAN-013 Bounty
- Declarations: `payout_iff_two_witness (settlementDeterminate posterAdmitted : Bool)`; stated over FOUR points for the settlement cell (`True ∨ False`, not `Both`, not `None`).
- Vectors: suite `bounty`, op `payoutAllowed`.

### TP-LEAN-014 Algedonic
- Declarations: `bond_conserves (warranted)`; `cap (matched) := 1 + matched / 4`; `cap_monotone_in_matched`.
- Vectors: suite `algedonic`, op `cap`.

## Phase 3 (v0.3)

### TP-LEAN-015 Decorrelation
- Declarations (over `Int` with fixed scaling, matching the `E6`/`E12` interfaces): `pooledVariance (sigma : List Nat) (rho : List (List Int)) : Nat` = `(1/N²) Σᵢⱼ σᵢσⱼρᵢⱼ` in scaled integers; `marginalReduction (table) (i)`; `premium (sigma2 N) := sigma2 * (N − 1) / (2N)` scaled; `premium_nonneg`; `premium_zero_iff_perfect_correlation` (ρ ≡ 1 ⇒ limit μ − σ²/2, premium 0); `shouldShare (mu1 s1 mu2 s2) := 4·mu1 − 3·s1 < 4·mu2 − s2`; `shouldShare_irreflexive_at_equal`.
- Vectors: suite `decorrelation`, ops `pooledVariance`, `marginalReduction`, `shouldShare`, `premium`.
- Realizer: `DecorrelationV1` (TP-EVM-028).

### TP-LEAN-016 EnergyCommons
- Declarations: `repayKwh (owed repaid attested)`; `repay_conserves_kwh`; `eroeiWeight (netJoules total)`; `eroei_weight_nonneg`.
- Vectors: suite `energy-commons`, ops `repayKwh`, `eroeiWeight`.

### TP-LEAN-017 Rota
- Declarations: `pot (n c d) := n*c − d`; `pot_conserves : pot + d = n*c`; `no_double_turn` over a winners list; the even split by `PoolSplit.split` with equal weights.
- Vectors: suite `rota`, ops `pot`, `award`.

### TP-LEAN-018 CellEligibility
- Declarations: `eligible (lastReceiptCycle cadence now) := now − lastReceiptCycle ≤ cadence`; `eligible_iff_receipt_in_cadence`; `flagged_after_three_silent`.
- Vectors: suite `cells`, op `eligible`.

### TP-LEAN-019 Federation
- Declarations: `aggregation_conjunctive` (existence of the federation as the conjunction of recognition cells; lapse of one does not collapse the rest, stated over FOUR); `edgeAdmitted (mu1 s1 mu2 s2 reduction) := shouldShare ∧ reduction > 0`; `edge_admitted_iff_sharing_and_reduction`; `health (crossPoolHeldOlderThanWindow) := crossPoolHeld = 0`; `health_iff_no_persistent_top`.
- Vectors: suite `federation`, ops `edgeAdmitted`, `health`.

### TP-LEAN-020 CycleAsClosure (closes an open derivation)
- Declarations: Tidepool's cycle (`closeCycle` as a reading transition over the section) as a closure operator on readings, so the invariants note's invariant 7 (`FreeEnergyLyapunov`) applies to the cycle; stated and proved if the library's closure interface admits it, else the precise gap recorded in the note.
- Acceptance: either a kernel-checked statement or a note naming the missing library interface; no vectors.
