import Obsmetrologia.QuantumContextuality.MeasurementScenario
import Obsmetrologia.Calculus.Real.Internal

/-! # Leggett–Garg — contextuality in time (macrorealism violation)

Bell, PR, Hardy, and the magic square are contextuality across *space* (distinct parties or
co-measured observables). **Leggett–Garg** is the same obstruction across *time*: one system
measured at three times, where **macrorealism** — the assumption that the system has a definite
value at each time, revealable without disturbance — plays the role the global hidden variable
plays for Bell. The Leggett–Garg inequality `K₃ = C₁₂ + C₂₃ − C₁₃ ≤ 1` bounds the two-time
correlations of any macrorealist; quantum mechanics reaches `K₃ = 3/2`.

This module gives Leggett–Garg in three tiers:

* **Temporal scenario (possibilistic).** Three times `Fin 3`, the three time-pair contexts,
  and **macrorealism = `HasGlobalSection`** (a definite trajectory `q : Fin 3 → Bool`). The
  perfect-correlation temporal model `lgPerfect` (`q₀=q₁`, `q₁=q₂`, yet `q₀≠q₂`) has every pair
  separately realizable but no global trajectory — `StronglyContextual`, the temporal twin of
  the GHZ all-versus-nothing.
* **The macrorealist bound (`Int`).** For any definite `±1` trajectory, `K₃ ≤ 1`
  (`lg_macrorealist_bound`) — the deterministic Leggett–Garg inequality, by exhaustion.
* **The quantum value (`ℝ`).** Obsmetrologia **has reals** (`Obsmetrologia/Calculus/Real/`): the quantum value
  `3/2` is a `RReal`, and `lg_quantum_value_not_macrorealist` proves it exceeds every
  macrorealist trajectory value — no definite-trajectory `K₃` can equal `3/2`, because all are
  `≤ 1 < 3/2`.

## Main definitions

* `lgScenario`, `lgPerfect` — the three-time cover and the perfect-correlation temporal model.
* `K3`, `IsSign` — the Leggett–Garg functional and the `±1` trajectory predicate.
* `lgBoundQ`, `lgQuantumQ` — the macrorealist bound `1` and the quantum value `3/2` as rationals.

## Main results

* `lgPerfect_macrorealism_violated` — perfect temporal correlations admit no global trajectory
  (`StronglyContextual`): macrorealism maximally violated.
* `lg_macrorealist_bound` — every definite `±1` trajectory has `K₃ ≤ 1`.
* `lg_quantum_value_not_macrorealist` — the quantum value `3/2 : ℝ` is reached by no macrorealist
  trajectory (the `K₃ ≤ 1 < 3/2` separation, over the internal reals).

## Implementation notes

The possibilistic tier is the temporal all-versus-nothing skeleton; the `±1` bound is the
deterministic inequality; the `3/2` is real and reachable here. What is *not* built is the
operator/Hilbert temporal-correlation model (the quantum `C_ij = ½⟨{A(tᵢ),A(tⱼ)}⟩`) and the
full no-signaling-in-time probabilistic polytope (the temporal Fine theorem) — the analytic
layer on top of this skeleton.

## References

`content/.../sheaf`; Leggett & Garg 1985; Emary–Lambert–Nori 2014 (review). Siblings:
`QuantumContextuality.MeasurementScenario`, `QuantumContextuality.MagicSquare`; temporal spine `Predicating.Temporal`.

## Tags

Leggett–Garg, macrorealism, temporal contextuality, all-versus-nothing, reals, K3
-/

namespace Obsmetrologia
namespace QuantumContextuality

open Obsmetrologia.Real.Internal (RReal Rat)

/-! ## (A) The temporal scenario — macrorealism as a global trajectory -/

/-- The three time-pair contexts `{t₀,t₁}, {t₁,t₂}, {t₀,t₂}`. -/
def lgContexts : List (List (Fin 3)) := [[0, 1], [1, 2], [0, 2]]

/-- The Leggett–Garg temporal scenario: the cover by the three time-pairs. -/
def lgScenario : Scenario (Fin 3) := ⟨lgContexts⟩

/-- The perfect-correlation temporal support: the two nearest pairs are correlated (`qᵢ = qⱼ`)
and the outermost pair `{t₀,t₂}` is anti-correlated (`q₀ ≠ q₂`). -/
def lgAllowedB (C : List (Fin 3)) (g : Fin 3 → Bool) : Bool :=
  match C with
  | [i, j] => bif (i == 0) && (j == 2) then g i != g j else g i == g j
  | _ => false

/-- The **perfect-correlation Leggett–Garg model**: a macrorealist would need a single
trajectory `q` with `q₀=q₁`, `q₁=q₂`, and `q₀≠q₂`. -/
def lgPerfect : Model (Fin 3) Bool where
  scenario := lgScenario
  support := fun C g => lgAllowedB C g = true

/-! ## (B) Macrorealism is violated — no global trajectory -/

/-- **Every time-pair is separately realizable.** Each context has a nonempty support: the two
correlated pairs by the constant `false`, the anti-correlated pair `{t₀,t₂}` by `true` on
time `2`. -/
theorem lgPerfect_inhabited : AllContextsInhabited lgPerfect := by
  intro C hC
  simp only [lgPerfect, lgScenario, lgContexts, List.mem_cons,
    List.not_mem_nil, or_false] at hC
  rcases hC with rfl | rfl | rfl
  · exact ⟨fun _ => false, by show lgAllowedB _ _ = true; decide⟩
  · exact ⟨fun _ => false, by show lgAllowedB _ _ = true; decide⟩
  · exact ⟨fun k => k == 2, by show lgAllowedB _ _ = true; decide⟩

/-- **No global trajectory.** A macrorealist `g : Fin 3 → Bool` in all three supports would
satisfy `g₀=g₁`, `g₁=g₂`, hence `g₀=g₂`, contradicting `g₀≠g₂` — the perfect temporal
correlations cannot come from a definite trajectory. -/
theorem lgPerfect_no_global : ¬ HasGlobalSection lgPerfect := by
  rintro ⟨g, hg⟩
  have a := hg [0, 1] (by decide)
  have b := hg [1, 2] (by decide)
  have c := hg [0, 2] (by decide)
  simp only [lgPerfect, lgAllowedB] at a b c
  revert a b c
  cases g 0 <;> cases g 1 <;> cases g 2 <;> decide

/-- **Macrorealism is maximally violated.** The perfect-correlation temporal model is strongly
contextual: every time-pair is realizable, yet no global (macrorealist) trajectory exists. The
temporal analogue of GHZ all-versus-nothing. -/
theorem lgPerfect_macrorealism_violated : StronglyContextual lgPerfect :=
  ⟨lgPerfect_inhabited, lgPerfect_no_global⟩

/-! ## (C) The Leggett–Garg functional and the macrorealist bound -/

/-- A `±1`-valued definite trajectory: each of the three times has outcome `+1` or `−1`. -/
def IsSign (q : Fin 3 → Int) : Prop :=
  (q 0 = 1 ∨ q 0 = -1) ∧ (q 1 = 1 ∨ q 1 = -1) ∧ (q 2 = 1 ∨ q 2 = -1)

/-- The Leggett–Garg functional `K₃ = q₀q₁ + q₁q₂ − q₀q₂` of a trajectory (each `qᵢqⱼ` is the
deterministic two-time correlation). -/
def K3 (q : Fin 3 → Int) : Int := q 0 * q 1 + q 1 * q 2 - q 0 * q 2

/-- **The Leggett–Garg inequality.** Every definite `±1` trajectory satisfies `K₃ ≤ 1` — the
macrorealist bound, by exhaustion over the eight sign trajectories. -/
theorem lg_macrorealist_bound (q : Fin 3 → Int) (h : IsSign q) : K3 q ≤ 1 := by
  obtain ⟨h0, h1, h2⟩ := h
  rcases h0 with h0 | h0 <;> rcases h1 with h1 | h1 <;> rcases h2 with h2 | h2 <;>
    simp only [K3, h0, h1, h2] <;> decide

/-! ## (D) The quantum value 3/2 over the internal reals -/

/-- The macrorealist bound `1`, as a rational. -/
def lgBoundQ := Rat.mk ⟨1, 1, by decide⟩

/-- The quantum Leggett–Garg value `3/2`, as a rational. -/
def lgQuantumQ := Rat.mk ⟨3, 2, by decide⟩

/-- **The quantum value exceeds the macrorealist bound.** `3/2 > 1` as internal reals: no
macrorealist `≤ 1` reaches it. -/
theorem lgQuantum_exceeds_bound :
    ¬ (RReal.ofRat lgQuantumQ ≤ RReal.ofRat lgBoundQ) := by
  rw [RReal.ofRat_le_iff]
  unfold lgQuantumQ lgBoundQ
  rw [Rat.mk_le]
  show ¬ ((3 : Int) * 1 ≤ 1 * 2)
  decide

/-- Every macrorealist trajectory value, sent into the reals, is `≤ 1`. -/
theorem lg_macrorealist_real_bound (q : Fin 3 → Int) (h : IsSign q) :
    RReal.ofRat (Rat.mk ⟨K3 q, 1, by decide⟩) ≤ RReal.ofRat lgBoundQ := by
  rw [RReal.ofRat_le_iff]
  unfold lgBoundQ
  rw [Rat.mk_le]
  show K3 q * 1 ≤ 1 * 1
  have hb := lg_macrorealist_bound q h
  omega

/-- **The quantum Leggett–Garg value is not macrorealist.** No definite `±1` trajectory has
`K₃ = 3/2` (as a real): every macrorealist value is `≤ 1 < 3/2`. The quantitative temporal
contextuality, witnessed over Obsmetrologia's internal reals. -/
theorem lg_quantum_value_not_macrorealist (q : Fin 3 → Int) (h : IsSign q) :
    RReal.ofRat (Rat.mk ⟨K3 q, 1, by decide⟩) ≠ RReal.ofRat lgQuantumQ := by
  intro heq
  have hb := lg_macrorealist_real_bound q h
  rw [heq] at hb
  exact lgQuantum_exceeds_bound hb

end QuantumContextuality
end Obsmetrologia
