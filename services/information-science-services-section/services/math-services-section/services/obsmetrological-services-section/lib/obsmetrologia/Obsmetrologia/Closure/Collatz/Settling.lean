import Obsmetrologia.Dynamics.Flow.ClosureFlowDynamics
import Obsmetrologia.Closure.Ordinal
import Obsmetrologia.Closure.Collatz.AffineTrace
import Obsmetrologia.Closure.Collatz.Reduction
import Obsmetrologia.Closure.Collatz.ResidueGap
import Obsmetrologia.Calculus.Order.SetNumberGraphTheory

/-!
# Collatz as a strict-finite settling flow (the bridge to the closure tier)

The corpus frames Collatz as the increment-driven settling `F_U(E)_τ = Cl(E) ∨ₖ u_τ`
with `Cl = id`, one predicate `reached`, entities `ℕ₊` (corpus node
`collatz-increment-sequence`/`collatz-settlement`). Obsmetrologia already builds that machinery
generically: `Valuation = Claim → Charge` hosts the infinite entity set
(`Entity = Mark` is string-backed), `ModalFrame.drive` is exactly `F_U`, and `Ord` +
`regimeOfOrd` carry the transfinite closure ordinal κ. This module instantiates
Collatz in that machinery, with **no new tier** — only the discrete frame realising `Cl = id`.

The discrete frame (`fiber φ = [φ]`) makes the modal closure the identity, so the driven
flow is pure accumulation of reached cells: `settling (n+1) = settling n ∨ₖ (cell reached
at step n)`. Under the descent input supplied by the Collatz reduction, the closure ordinal
κ of this reached-set flow is the corpus's total stopping time: quiescence is equivalent to
terminal reachability. The unconditional bridge remains a frontier statement because the
arithmetic descent holes in `SemigroupGap`/`Reduction` are still open.

## Main results

* `closureOp_discrete` — the discrete frame's closure is the identity (`Cl = id`).
* `settling_accumulates` — the Collatz settling is pure reached-cell accumulation.

The κ = stopping-time bridge and the regime placement are stated against this construction
in the blueprint frontier; they are the edge from the closure tier to the arithmetic
descent holes.

## Tags

collatz, settling, closure ordinal, strict-finite regime
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

open Obsmetrologia.Valuation

/-! ## The discrete frame: `Cl = id` -/

/-- The discrete fibration — each cell's accessibility fiber is just itself. -/
def discreteFib : FiniteFibration where
  base := id
  fiber := fun φ => [φ]
  mem_fiber := by intro ψ φ; simp

/-- The discrete modal frame: reflexive/symmetric/transitive trivially, and its modal
closure is the identity — the corpus's `Cl = id` Collatz settling closure. -/
def discreteFrame : ModalFrame where
  toFiniteFibration := discreteFib
  refl := by intro φ; simp [discreteFib]
  symm := by intro φ ψ h; simp_all [discreteFib]
  trans := by intro φ ψ χ h1 h2; simp_all [discreteFib]

/-- The discrete frame realises `Cl = id`: its modal closure fixes every valuation. -/
theorem closureOp_discrete (v : Valuation) : discreteFrame.closureOp v = v := by
  funext φ
  simp only [ModalFrame.closureOp, ModalFrame.necessitate, ModalFrame.possibilize,
    existsF, forallF, discreteFrame, discreteFib, List.map_cons, List.map_nil,
    Charge.joinList, Charge.meetList, List.foldr_cons, List.foldr_nil]
  cases v φ <;> decide

/-! ## The Collatz settling as an increment-driven flow -/

/-- The cell positing that integer `n` has been `reached` (diagonal use of one predicate),
indexing the entity by its unary mark. The κ-bridge below lives over the *integer* reached-set
`Discrete.Set Nat`, so this cell layer only witnesses that Obsmetrologia's generic `drive`/`F_U`
realises the `Cl = id` accumulation — no `String` injectivity is needed. -/
def reachedCell (n : Nat) : PredicationCell :=
  ⟨⟨String.ofList (List.replicate n 'x')⟩, ⟨"reached"⟩, ⟨String.ofList (List.replicate n 'x')⟩⟩

/-- The Collatz increment sequence for seed `m`: at step `τ` posit the cell for `orbit m τ`. -/
def collatzIncrement (m : Nat) : Nat → Valuation :=
  fun τ => fun φ => if φ = reachedCell (orbit m τ) then Charge.kTop else Charge.kBot

/-- The Collatz settling of seed `m`: the `Cl = id` increment-driven flow over the
reached-cell valuations — exactly the corpus `F_U` at the Collatz increment sequence. -/
def collatzSettling (m : Nat) : Nat → Valuation :=
  discreteFrame.drive (collatzIncrement m) Valuation.knowledgeLeast

/-- The settling is pure accumulation: each step joins the newly-reached cell, with no
modal closure (because `Cl = id`). -/
theorem settling_accumulates (m n : Nat) :
    collatzSettling m (n + 1)
      = Valuation.joinK (collatzSettling m n) (collatzIncrement m n) := by
  simp only [collatzSettling, ModalFrame.drive, closureOp_discrete]

/-! ## The integer reached-set and the κ = stopping-time bridge

The corpus Collatz settling has `E = ℕ₊` and one predicate `reached`, so its state is literally
a set of naturals. We realise it over Obsmetrologia's internal set theory `Discrete.Set Nat = Nat → Bool`
(`SetNumberGraphTheory`): with `Cl = id` the settling is the pure union of the newly-reached
integer. Over this carrier integer-revisit is decidable and the bridge is `Classical`-free.
(`settling_accumulates` above shows Obsmetrologia's generic `drive` realises the same `Cl = id`
accumulation over the cell valuation.) -/

/-- The integers reached before stage `k`. Membership uses propositional equality of naturals
(`Nat.decEq`), not Bool `==` — the latter's `LawfulBEq Nat` instance pulls `Classical`. -/
def reachedSet (m : Nat) : Nat → Discrete.Set Nat
  | 0 => Discrete.Set.empty
  | k + 1 => fun v => reachedSet m k v || decide (orbit m k = v)

/-- `v` is reached before stage `k` iff some earlier orbit step hits it. -/
theorem mem_reachedSet (m k v : Nat) :
    reachedSet m k v = true ↔ ∃ j, j < k ∧ orbit m j = v := by
  induction k with
  | zero =>
    simp only [reachedSet, Discrete.Set.empty]
    constructor
    · intro h; exact absurd h (by decide)
    · rintro ⟨j, hj, _⟩; exact absurd hj (Nat.not_lt_zero j)
  | succ k ih =>
    simp only [reachedSet, Bool.or_eq_true, ih, decide_eq_true_eq]
    constructor
    · rintro (⟨j, hj, hje⟩ | he)
      · exact ⟨j, Nat.lt_succ_of_lt hj, hje⟩
      · exact ⟨k, Nat.lt_succ_self k, he⟩
    · rintro ⟨j, hj, hje⟩
      rcases Nat.lt_or_ge j k with h' | h'
      · exact Or.inl ⟨j, h', hje⟩
      · have : j = k := by omega
        subst this; exact Or.inr hje

/-- The reached-set quiesces at stage `k`: stage `k+1` reaches nothing new. The closure ordinal
κ of the Collatz settling is the least such `k`. -/
def ReachedQuiesces (m k : Nat) : Prop := reachedSet m (k + 1) = reachedSet m k

/-- `k` is the finite closure ordinal stage of the Collatz reached-set settling: the
first stage at which the reached set quiesces. -/
def ClosureOrdinalStage (m k : Nat) : Prop :=
  ReachedQuiesces m k ∧ ∀ j, j < k → ¬ ReachedQuiesces m j

/-- `k` is the Collatz settling's total stopping stage: the first stage whose orbit
value has already appeared. This is the reached-set formulation, not the classical
numeric "falls below the seed" stopping time. -/
def TotalStoppingStage (m k : Nat) : Prop :=
  (∃ j, j < k ∧ orbit m j = orbit m k) ∧
    ∀ t, t < k → ¬ ∃ j, j < t ∧ orbit m j = orbit m t

namespace PositiveSeed

/-- The strict finite Collatz κ-package for a carried positive seed: terminal
reachability, some closure-ordinal stage, and some total-stopping stage. -/
def KappaPackage (seed : PositiveSeed) : Prop :=
  ReachesTerminal seed.value ∧
    (∃ k, ClosureOrdinalStage seed.value k) ∧
      ∃ k, TotalStoppingStage seed.value k

end PositiveSeed

/-- Quiescence means the orbit revisited an already-reached value. -/
theorem revisit_of_quiesce {m k : Nat} (hq : ReachedQuiesces m k) :
    ∃ j, j < k ∧ orbit m j = orbit m k := by
  have hc := congrFun hq (orbit m k)
  have he : reachedSet m (k + 1) (orbit m k)
      = (reachedSet m k (orbit m k) || decide (orbit m k = orbit m k)) := rfl
  have hd : decide (orbit m k = orbit m k) = true := by rw [decide_eq_true_eq]
  rw [he, hd, Bool.or_true] at hc
  exact (mem_reachedSet m k (orbit m k)).mp hc.symm

/-- Conversely, an orbit revisit makes the reached-set quiesce. -/
theorem quiesce_of_revisit {m k : Nat} (h : ∃ j, j < k ∧ orbit m j = orbit m k) :
    ReachedQuiesces m k := by
  funext v
  show (reachedSet m k v || decide (orbit m k = v)) = reachedSet m k v
  by_cases hv : orbit m k = v
  · subst hv
    rw [(mem_reachedSet m k (orbit m k)).mpr h]; rfl
  · have hb : decide (orbit m k = v) = false := decide_eq_false hv
    rw [hb, Bool.or_false]

/-- The closure ordinal stage is exactly the total stopping stage: least reached-set
quiescence is the same finite stage as the first orbit revisit. -/
theorem closureOrdinalStage_iff_totalStoppingStage (m k : Nat) :
    ClosureOrdinalStage m k ↔ TotalStoppingStage m k := by
  constructor
  · rintro ⟨hq, hmin⟩
    refine ⟨revisit_of_quiesce hq, ?_⟩
    intro t ht hrev
    exact hmin t ht (quiesce_of_revisit hrev)
  · rintro ⟨hrev, hmin⟩
    refine ⟨quiesce_of_revisit hrev, ?_⟩
    intro t ht hq
    exact hmin t ht (revisit_of_quiesce hq)

/-- A finite closure ordinal stage exists exactly when the reached-set settling
eventually quiesces. The proof chooses the least *orbit revisit* stage, avoiding any
decidable equality requirement for infinite reached-set functions. -/
theorem exists_closureOrdinalStage_iff_reachedQuiesces (m : Nat) :
    (∃ k, ClosureOrdinalStage m k) ↔ ∃ k, ReachedQuiesces m k := by
  constructor
  · rintro ⟨k, hk, _⟩
    exact ⟨k, hk⟩
  · rintro ⟨k, hq⟩
    obtain ⟨j, hjk, hrev⟩ := revisit_of_quiesce hq
    obtain ⟨s, hsrev, hsmin⟩ :=
      exists_least k
        (fun t => ∃ j, j < t ∧ orbit m j = orbit m t)
        (fun t => inferInstance)
        ⟨j, hjk, hrev⟩
    exact ⟨s, quiesce_of_revisit hsrev, fun t ht htq =>
      hsmin t ht (revisit_of_quiesce htq)⟩

/-- Existence of a total stopping stage is the same as existence of a finite closure
ordinal stage, by the stagewise `κ = stopping-stage` equivalence. -/
theorem exists_totalStoppingStage_iff_closureOrdinalStage (m : Nat) :
    (∃ k, TotalStoppingStage m k) ↔ ∃ k, ClosureOrdinalStage m k := by
  constructor
  · rintro ⟨k, hk⟩
    exact ⟨k, (closureOrdinalStage_iff_totalStoppingStage m k).mpr hk⟩
  · rintro ⟨k, hk⟩
    exact ⟨k, (closureOrdinalStage_iff_totalStoppingStage m k).mp hk⟩

/-- Existence of a total stopping stage is the same as eventual reached-set
quiescence. -/
theorem exists_totalStoppingStage_iff_reachedQuiesces (m : Nat) :
    (∃ k, TotalStoppingStage m k) ↔ ∃ k, ReachedQuiesces m k := by
  rw [exists_totalStoppingStage_iff_closureOrdinalStage m,
    exists_closureOrdinalStage_iff_reachedQuiesces m]

/-- The orbit attains a minimum value within its first `n + 1` stages. -/
theorem exists_min_le (m n : Nat) :
    ∃ s, s ≤ n ∧ ∀ t, t ≤ n → orbit m s ≤ orbit m t := by
  induction n with
  | zero => exact ⟨0, Nat.zero_le _, fun t ht => by
      have : t = 0 := by omega
      subst this; exact Nat.le_refl _⟩
  | succ n ih =>
    obtain ⟨s, hsn, hmin⟩ := ih
    by_cases hcmp : orbit m s ≤ orbit m (n + 1)
    · refine ⟨s, Nat.le_succ_of_le hsn, fun t ht => ?_⟩
      by_cases htn : t ≤ n
      · exact hmin t htn
      · have : t = n + 1 := by omega
        subst this; exact hcmp
    · refine ⟨n + 1, Nat.le_refl _, fun t ht => ?_⟩
      by_cases htn : t ≤ n
      · have h3 := hmin t htn; omega
      · have : t = n + 1 := by omega
        subst this; exact Nat.le_refl _

/-- An orbit revisit forces termination under universal descent: the orbit then takes
finitely many values, with a global minimum `V`; `V` cannot fall below itself, so by
descent `V ≤ 2`. -/
theorem reachesTerminal_of_revisit_of_all_fall_below
    (hdesc : ∀ n, 2 < n → FallsBelowSelf n) {m : Nat} (hm : 0 < m) {j n : Nat}
    (hjn : j < n) (hrev : orbit m j = orbit m n) : ReachesTerminal m := by
  have hshift : ∀ t, orbit m (n + t) = orbit m (j + t) := by
    intro t
    induction t with
    | zero => exact hrev.symm
    | succ t iht => simp only [Nat.add_succ, orbit_succ, iht]
  have hwithin : ∀ t, ∃ s, s ≤ n ∧ orbit m t = orbit m s := by
    intro t
    induction t using Nat.strongRecOn with
    | ind t iht =>
      by_cases htn : t ≤ n
      · exact ⟨t, htn, rfl⟩
      · have ht : t = n + (t - n) := by omega
        have key : orbit m t = orbit m (j + (t - n)) := by
          have h2 := hshift (t - n); rwa [← ht] at h2
        obtain ⟨s, hsn, hse⟩ := iht (j + (t - n)) (by omega)
        exact ⟨s, hsn, key.trans hse⟩
  obtain ⟨s, hsn, hmin⟩ := exists_min_le m n
  have hglob : ∀ t, orbit m s ≤ orbit m t := by
    intro t; obtain ⟨s', hs'n, hse⟩ := hwithin t; rw [hse]; exact hmin s' hs'n
  have hnofall : ¬ FallsBelowSelf (orbit m s) := by
    rintro ⟨k, hk⟩
    rw [← orbit_add] at hk
    have := hglob (s + k)
    omega
  have hV2 : orbit m s ≤ 2 := by
    rcases Nat.lt_or_ge 2 (orbit m s) with h | h
    · exact absurd (hdesc (orbit m s) h) hnofall
    · exact h
  have hV1 : 0 < orbit m s := orbit_pos hm s
  refine ⟨s, ?_⟩
  show orbit m s = 1 ∨ orbit m s = 2
  omega

/-- Under universal descent, reached-set quiescence is equivalent to terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_all_fall_below
    (hdesc : ∀ n, 2 < n → FallsBelowSelf n) (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m := by
  constructor
  · rintro ⟨n, hq⟩
    obtain ⟨j, hjn, hrev⟩ := revisit_of_quiesce hq
    exact reachesTerminal_of_revisit_of_all_fall_below hdesc hm hjn hrev
  · rintro ⟨k, hk⟩
    have horb : orbit m (k + 2) = orbit m k := by
      show step (step (orbit m k)) = orbit m k
      rcases hk with h1 | h1 <;> rw [h1] <;> decide
    exact ⟨k + 2, quiesce_of_revisit ⟨k, by omega, horb.symm⟩⟩

/-- Under universal descent, existence of the finite closure ordinal stage is
equivalent to terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below
    (hdesc : ∀ n, 2 < n → FallsBelowSelf n) (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m := by
  rw [exists_closureOrdinalStage_iff_reachedQuiesces m]
  exact reachedQuiesces_iff_reachesTerminal_of_all_fall_below hdesc m hm

/-- Under universal descent, existence of a total stopping stage is equivalent to
terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_all_fall_below
    (hdesc : ∀ n, 2 < n → FallsBelowSelf n) (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m := by
  rw [exists_totalStoppingStage_iff_closureOrdinalStage m]
  exact closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below hdesc m hm

/-- The parent-barrier gap and crossing hypothesis identify reached-set quiescence with
terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_gap_and_crossing
    (hgap : ParentBarrierGap) (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_all_fall_below
    (allFallBelow_of_gap_and_crossing hgap hcross) m hm

/-- The residue inequality and crossing hypothesis identify reached-set quiescence with
terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_residueGap_and_crossing
    (hres : ParentBarrierResidueGap) (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_gap_and_crossing
    (parentBarrierResidueGap_implies_parentBarrierGap hres) hcross m hm

/-- The residue inequality and absence of positive infinite barrier streams identify
reached-set quiescence with terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    (hres : ParentBarrierResidueGap) (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_residueGap_and_crossing hres
    (everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr hbar) m hm

/-- The packaged Collatz frontier inputs identify reached-set quiescence with
terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_frontierInputs
    (h : CollatzFrontierInputs) (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    h.residueGap h.noPositiveInfiniteBarrierStream m hm

/-- The residue inequality and crossing hypothesis identify finite closure-ordinal-stage
existence with terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_crossing
    (hres : ParentBarrierResidueGap) (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below
    (allFallBelow_of_residueGap_and_crossing hres hcross) m hm

/-- The residue inequality and crossing hypothesis identify total-stopping-stage
existence with terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_residueGap_and_crossing
    (hres : ParentBarrierResidueGap) (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m := by
  rw [exists_totalStoppingStage_iff_closureOrdinalStage m]
  exact closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_crossing
    hres hcross m hm

/-- The residue inequality and absence of positive infinite barrier streams identify
finite closure-ordinal-stage existence with terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    (hres : ParentBarrierResidueGap) (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_crossing hres
    (everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr hbar) m hm

/-- The residue inequality and absence of positive infinite barrier streams identify
total-stopping-stage existence with terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    (hres : ParentBarrierResidueGap) (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m := by
  rw [exists_totalStoppingStage_iff_closureOrdinalStage m]
  exact closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    hres hbar m hm

/-- The packaged Collatz frontier inputs identify finite closure-ordinal-stage existence
with terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_frontierInputs
    (h : CollatzFrontierInputs) (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    h.residueGap h.noPositiveInfiniteBarrierStream m hm

/-- The packaged Collatz frontier inputs identify total-stopping-stage existence
with terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_frontierInputs
    (h : CollatzFrontierInputs) (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m := by
  rw [exists_totalStoppingStage_iff_closureOrdinalStage m]
  exact closureOrdinalStage_exists_iff_reachesTerminal_of_frontierInputs h m hm

/-- The semigroup gap plus the named one-lock collapse identify reached-set
quiescence with terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_all_fall_below
    (allFallBelow_of_parentBarrierGap_and_oneLock hgap hlock) m hm

/-- The residue gap plus the named one-lock collapse identify reached-set
quiescence with terminal reachability. -/
theorem reachedQuiesces_iff_reachesTerminal_of_residueGap_and_oneLock
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    hres (noPositiveInfiniteBarrierStream_of_residueGap_and_oneLock hres hlock) m hm

/-- The semigroup gap plus the named one-lock collapse identify finite
closure-ordinal-stage existence with terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below
    (allFallBelow_of_parentBarrierGap_and_oneLock hgap hlock) m hm

/-- The residue gap plus the named one-lock collapse identify finite
closure-ordinal-stage existence with terminal reachability. -/
theorem closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_oneLock
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (∃ k, ClosureOrdinalStage m k) ↔ ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    hres (noPositiveInfiniteBarrierStream_of_residueGap_and_oneLock hres hlock) m hm

/-- The semigroup gap plus the named one-lock collapse identify total-stopping-stage
existence with terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m := by
  rw [exists_totalStoppingStage_iff_closureOrdinalStage m]
  exact closureOrdinalStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock
    hgap hlock m hm

/-- The residue gap plus the named one-lock collapse identify total-stopping-stage
existence with terminal reachability. -/
theorem totalStoppingStage_exists_iff_reachesTerminal_of_residueGap_and_oneLock
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (∃ k, TotalStoppingStage m k) ↔ ReachesTerminal m := by
  rw [exists_totalStoppingStage_iff_closureOrdinalStage m]
  exact closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_oneLock
    hres hlock m hm

/-! ## One-frontier κ criterion -/

/-- A one-frontier reduction to the modular residue gap gives the full
termination/κ/total-stopping package exactly when the same residue gap rules out
positive infinite barrier streams. This is the settling-level version of the
one-frontier criterion from `Reduction`: it packages terminal reachability,
finite closure-ordinal-stage existence, and finite total-stopping-stage existence. -/
theorem residueGap_alone_solves_kappa_package_iff_residueGap_implies_noStream :
    (ParentBarrierResidueGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) ↔
      (ParentBarrierResidueGap → NoPositiveInfiniteBarrierStream) := by
  constructor
  · intro hpack hres
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz
      (fun n hn => (hpack hres n hn).1)
  · intro hbar hres m hm
    have hterm : ReachesTerminal m :=
      collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream
        hres (hbar hres) m hm
    have hclosure : ∃ k, ClosureOrdinalStage m k :=
      (closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
        hres (hbar hres) m hm).mpr hterm
    have htotal : ∃ k, TotalStoppingStage m k :=
      (totalStoppingStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
        hres (hbar hres) m hm).mpr hterm
    exact ⟨hterm, hclosure, htotal⟩

/-- A one-frontier reduction to the original parent-barrier semigroup gap gives
the full termination/κ/total-stopping package exactly when that same semigroup
gap rules out positive infinite barrier streams. -/
theorem parentBarrierGap_alone_solves_kappa_package_iff_parentBarrierGap_implies_noStream :
    (ParentBarrierGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) ↔
      (ParentBarrierGap → NoPositiveInfiniteBarrierStream) := by
  constructor
  · intro hpack hgap
    exact noPositiveInfiniteBarrierStream_of_acceleratedCollatz
      (fun n hn => (hpack hgap n hn).1)
  · intro hbar hgap m hm
    have hcross : EveryNonterminalHasCrossing :=
      everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream.mpr
        (hbar hgap)
    have hdesc : ∀ n, 2 < n → FallsBelowSelf n :=
      allFallBelow_of_gap_and_crossing hgap hcross
    have hterm : ReachesTerminal m :=
      collatz_from_parentBarrierGap_and_crossing hgap hcross m hm
    have hclosure : ∃ k, ClosureOrdinalStage m k :=
      (closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below
        hdesc m hm).mpr hterm
    have htotal : ∃ k, TotalStoppingStage m k :=
      (totalStoppingStage_exists_iff_reachesTerminal_of_all_fall_below
        hdesc m hm).mpr hterm
    exact ⟨hterm, hclosure, htotal⟩

/-- The named one-lock collapse proposition is exactly the statement that
`ParentBarrierGap` alone gives terminal reachability together with the finite
closure-ordinal and total-stopping stages. -/
theorem parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package :
    Obsmetrologia.Closure.Collatz.ParentBarrierOneLockCollapse ↔
      (ParentBarrierGap → ∀ m, 0 < m →
        ReachesTerminal m ∧
          (∃ k, ClosureOrdinalStage m k) ∧
            (∃ k, TotalStoppingStage m k)) :=
  (parentBarrierGap_alone_solves_kappa_package_iff_parentBarrierGap_implies_noStream).symm

/-- Forward use of the named one-lock collapse: from the semigroup gap and the
one-lock collapse, terminal reachability, finite closure-ordinal-stage existence,
and finite total-stopping-stage existence all follow. -/
theorem kappaPackage_of_parentBarrierGap_and_oneLock
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) :=
  (parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package.mp
    hlock) hgap

/-- Forward use of the named one-lock collapse at the residue face: from the
modular residue gap and the one-lock collapse, terminal reachability, finite
closure-ordinal-stage existence, and finite total-stopping-stage existence all
follow. -/
theorem kappaPackage_of_residueGap_and_oneLock
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse) :
    ∀ m, 0 < m →
      ReachesTerminal m ∧
        (∃ k, ClosureOrdinalStage m k) ∧
          (∃ k, TotalStoppingStage m k) := by
  exact kappaPackage_of_parentBarrierGap_and_oneLock
    (parentBarrierResidueGap_implies_parentBarrierGap hres) hlock

end Collatz
end Closure
end Obsmetrologia
