import Infomaterial.Dynamics.Flow.ClosureFlowDynamics
import Infomaterial.Closure.Ordinal
import Infomaterial.Closure.Collatz.AffineTrace
import Infomaterial.Closure.Collatz.Reduction
import Infomaterial.Calculus.Order.SetNumberGraphTheory

/-!
# Collatz as a strict-finite settlement (the bridge to the closure tier)

The corpus frames Collatz as the increment-driven settling `F_U(E)_τ = Cl(E) ∨ₖ u_τ`
with `Cl = id`, one predicate `reached`, entities `ℕ₊` (corpus node
`collatz-increment-sequence`/`collatz-settlement`). Infomaterial already builds that machinery
generically: `Valuation := PredicationCell → Charge` hosts the infinite entity set
(`Entity = Mark` is string-backed), `ModalFrame.drive` is exactly `F_U`, and `Ord` +
`regimeOfOrd` carry the genuine transfinite closure ordinal κ. This module instantiates
Collatz in that machinery, with **no new tier** — only the discrete frame realising `Cl = id`.

The discrete frame (`fiber φ = [φ]`) makes the modal closure the identity, so the driven
flow is pure accumulation of reached cells: `settlement (n+1) = settlement n ∨ₖ (cell reached
at step n)`. The closure ordinal κ of this flow is then the corpus's identification of the
**total stopping time** with the settling descent, and the regime placement
(`regimeOfOrd κ`) says Collatz is strict-finite (`κ < ω`) exactly when the orbit is confined —
the settling-side face of the arithmetic descent holes in `SemigroupGap`/`Reduction`.

## Main results

* `closureOp_discrete` — the discrete frame's closure is the identity (`Cl = id`).
* `settlement_accumulates` — the Collatz settlement is pure reached-cell accumulation.

The κ = stopping-time bridge and the regime placement are stated against this construction
in the blueprint frontier; they are the honest edge from the closure tier to the arithmetic
descent holes.

## Tags

collatz, settlement, settling endofunctor, closure ordinal, strict-finite regime
-/

namespace Infomaterial
namespace Closure
namespace Collatz

open Infomaterial.Valuation

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

/-! ## The Collatz settlement as an increment-driven flow -/

/-- The cell positing that integer `n` has been `reached` (diagonal use of one predicate),
indexing the entity by its unary mark. The κ-bridge below lives over the *integer* reached-set
`Discrete.Set Nat`, so this cell layer only witnesses that Infomaterial's generic `drive`/`F_U`
realises the `Cl = id` accumulation — no `String` injectivity is needed. -/
def reachedCell (n : Nat) : PredicationCell :=
  ⟨⟨String.ofList (List.replicate n 'x')⟩, ⟨"reached"⟩, ⟨String.ofList (List.replicate n 'x')⟩⟩

/-- The Collatz increment sequence for seed `m`: at step `τ` posit the cell for `orbit m τ`. -/
def collatzIncrement (m : Nat) : Nat → Valuation :=
  fun τ => fun φ => if φ = reachedCell (orbit m τ) then Charge.kTop else Charge.kBot

/-- The Collatz settlement of seed `m`: the `Cl = id` increment-driven flow over the
reached-cell valuations — exactly the corpus `F_U` at the Collatz increment sequence. -/
def collatzSettlement (m : Nat) : Nat → Valuation :=
  discreteFrame.drive (collatzIncrement m) Valuation.knowledgeLeast

/-- The settlement is pure accumulation: each step joins the newly-reached cell, with no
modal closure (because `Cl = id`). -/
theorem settlement_accumulates (m n : Nat) :
    collatzSettlement m (n + 1)
      = Valuation.joinK (collatzSettlement m n) (collatzIncrement m n) := by
  simp only [collatzSettlement, ModalFrame.drive, closureOp_discrete]

/-! ## The integer reached-set and the κ = stopping-time bridge

The corpus Collatz settlement has `E = ℕ₊` and one predicate `reached`, so its state is literally
a set of naturals. We realise it over Infomaterial's internal set theory `Discrete.Set Nat = Nat → Bool`
(`SetNumberGraphTheory`): with `Cl = id` the settling is the pure union of the newly-reached
integer. Over this carrier integer-revisit is decidable and the bridge is `Classical`-free.
(`settlement_accumulates` above shows Infomaterial's generic `drive` realises the same `Cl = id`
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
κ of the Collatz settlement is the least such `k`. -/
def ReachedQuiesces (m k : Nat) : Prop := reachedSet m (k + 1) = reachedSet m k

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

/-- An orbit revisit forces termination: the orbit then takes finitely many values, with a
global minimum `V`; `V` cannot fall below itself, so by descent (`all_fall_below`) `V ≤ 2`. -/
theorem reachesTerminal_of_revisit {m : Nat} (hm : 0 < m) {j n : Nat}
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
    · exact absurd (all_fall_below (orbit m s) h) hnofall
    · exact h
  have hV1 : 0 < orbit m s := orbit_pos hm s
  refine ⟨s, ?_⟩
  show orbit m s = 1 ∨ orbit m s = 2
  omega

theorem reachedQuiesces_iff_reachesTerminal (m : Nat) (hm : 0 < m) :
    (∃ k, ReachedQuiesces m k) ↔ ReachesTerminal m := by
  constructor
  · rintro ⟨n, hq⟩
    obtain ⟨j, hjn, hrev⟩ := revisit_of_quiesce hq
    exact reachesTerminal_of_revisit hm hjn hrev
  · rintro ⟨k, hk⟩
    have horb : orbit m (k + 2) = orbit m k := by
      show step (step (orbit m k)) = orbit m k
      rcases hk with h1 | h1 <;> rw [h1] <;> decide
    exact ⟨k + 2, quiesce_of_revisit ⟨k, by omega, horb.symm⟩⟩

end Collatz
end Closure
end Infomaterial
