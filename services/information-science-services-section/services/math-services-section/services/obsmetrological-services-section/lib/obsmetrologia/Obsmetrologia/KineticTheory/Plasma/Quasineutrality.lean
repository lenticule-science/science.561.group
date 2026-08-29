/-!
# Quasineutrality — the plasma regime: Debye relaxation to charge neutrality (DERIVED)

The plasma frontier (`…/obsmetrologia_gases_liquids_plasmas_proof_frontier.md`, Batch D / Red node 5) asks
for quasineutrality `Σ_s q_s n_s ≈ 0` as a closure/equilibrium: a plasma screens any net charge over a
Debye length, so the mobile charges relax to a **quasineutral** state. Stripped to its deterministic
monotone skeleton, that relaxation has a `Nat`-valued Lyapunov — the charge **imbalance** `|net charge|`
— which a screening step strictly lowers until it vanishes.

A plasma cell's mobile content is the multiset of particle charges (`List Int`); its `netCharge` is
their sum (`= Σ_s q_s n_s`), and it is **quasineutral** when that is `0`. A `screen` step adds one
screening charge opposite to the imbalance, lowering `|net charge|` by one; iterating `imbalance`-many
steps reaches quasineutrality, which is exactly the fixed point of screening.

This is the order skeleton of Debye screening; the spatial `e^{-r/λ_D}/r` screened potential is the
analytic Green's-function form, which needs Euclidean ℝᵈ geometry (the -absent layer — *not*
reals: `Obsmetrologia.Real.ExpSeries` already has `exp`). The relaxation-to-neutrality and its finite Lyapunov
convergence are proved here, exactly.

## Main definitions
* `netCharge`, `Quasineutral`, `imbalance` — net charge `Σ q_s n_s`, neutrality, and its `Nat` Lyapunov.
* `screen`, `relax` — one Debye screening step and the `n`-fold relaxation.

## Main results
* `imbalance_screen_le` / `imbalance_screen_lt` — screening is a Lyapunov: imbalance is non-increasing,
  and strictly decreasing while charged.
* `quasineutral_iff_screen_fixed` — quasineutral ⟺ a fixed point of screening (equilibrium).
* `relax_neutral` — `imbalance`-many screening steps reach quasineutrality (finite convergence).

## References
`content/.../obsmetrologia_gases_liquids_plasmas_proof_frontier.md` §3.3.1–2, Red node 5. The conserved-charge
companion is the collision-invariant `KineticTheory.Gas.DiscreteVelocityCollision`.

## Tags
plasma, quasineutrality, Debye screening, Lyapunov, charge neutrality
-/

namespace Obsmetrologia
namespace KineticTheory.Plasma

/-- The **net charge** `Σ_s q_s n_s` of a plasma cell, presented as the multiset of mobile particle
charges. -/
def netCharge : List Int → Int
  | [] => 0
  | x :: rest => x + netCharge rest

/-- A cell is **quasineutral** when its net charge vanishes. -/
def Quasineutral (c : List Int) : Prop := netCharge c = 0

/-- The charge **imbalance** `|net charge|` — the `Nat`-valued Lyapunov of Debye relaxation. -/
def imbalance (c : List Int) : Nat := (netCharge c).natAbs

/-- One **Debye screening step**: introduce a single screening charge opposite to the imbalance
(none if already neutral). -/
def screen (c : List Int) : List Int :=
  if 0 < netCharge c then (-1) :: c
  else if netCharge c < 0 then 1 :: c
  else c

theorem screen_pos {c : List Int} (h : 0 < netCharge c) : screen c = (-1) :: c := by
  unfold screen; exact if_pos h

theorem screen_neg {c : List Int} (h : netCharge c < 0) : screen c = 1 :: c := by
  unfold screen; rw [if_neg (by omega), if_pos h]

theorem screen_zero {c : List Int} (h : netCharge c = 0) : screen c = c := by
  unfold screen; rw [if_neg (by omega), if_neg (by omega)]

/-- **Screening is a Lyapunov step**: the imbalance never increases. -/
theorem imbalance_screen_le (c : List Int) : imbalance (screen c) ≤ imbalance c := by
  unfold imbalance
  by_cases h1 : 0 < netCharge c
  · rw [screen_pos h1]; show ((-1) + netCharge c).natAbs ≤ (netCharge c).natAbs; omega
  · by_cases h2 : netCharge c < 0
    · rw [screen_neg h2]; show (1 + netCharge c).natAbs ≤ (netCharge c).natAbs; omega
    · rw [screen_zero (by omega)]; omega

/-- **Strict descent while charged**: a screening step strictly lowers the imbalance unless the cell
is already quasineutral. -/
theorem imbalance_screen_lt (c : List Int) (h : ¬ Quasineutral c) :
    imbalance (screen c) < imbalance c := by
  unfold Quasineutral at h
  unfold imbalance
  by_cases h1 : 0 < netCharge c
  · rw [screen_pos h1]; show ((-1) + netCharge c).natAbs < (netCharge c).natAbs; omega
  · by_cases h2 : netCharge c < 0
    · rw [screen_neg h2]; show (1 + netCharge c).natAbs < (netCharge c).natAbs; omega
    · exact absurd (by omega : netCharge c = 0) h

/-- **Equilibrium is quasineutrality**: a cell is quasineutral iff screening leaves it unchanged. -/
theorem quasineutral_iff_screen_fixed (c : List Int) :
    Quasineutral c ↔ screen c = c := by
  unfold Quasineutral
  constructor
  · intro h; exact screen_zero h
  · intro h
    by_cases h1 : 0 < netCharge c
    · rw [screen_pos h1] at h
      have hlen := congrArg List.length h
      rw [List.length_cons] at hlen; omega
    · by_cases h2 : netCharge c < 0
      · rw [screen_neg h2] at h
        have hlen := congrArg List.length h
        rw [List.length_cons] at hlen; omega
      · omega

/-- The **`n`-fold Debye relaxation**. -/
def relax : Nat → List Int → List Int
  | 0, c => c
  | (n + 1), c => relax n (screen c)

/-- **Finite convergence to quasineutrality.** After `imbalance`-many screening steps (any `n ≥
imbalance` suffices), the cell is quasineutral — the deterministic Debye relaxation reaches charge
neutrality in finite time, bounded by the initial imbalance. -/
theorem relax_neutral : ∀ (n : Nat) (c : List Int), imbalance c ≤ n → Quasineutral (relax n c)
  | 0, c, h => by
      unfold imbalance at h
      unfold Quasineutral
      show netCharge c = 0
      omega
  | (n + 1), c, h => by
      show Quasineutral (relax n (screen c))
      by_cases hz : netCharge c = 0
      · rw [screen_zero hz]
        exact relax_neutral n c (by unfold imbalance; omega)
      · have hlt := imbalance_screen_lt c (by unfold Quasineutral; exact hz)
        exact relax_neutral n (screen c) (by unfold imbalance at hlt h ⊢; omega)

end KineticTheory.Plasma
end Obsmetrologia
