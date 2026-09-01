import Infomaterial.Calculus.Real.Logarithm

/-!
# BoltzmannEntropy — the real-valued H-theorem: `S = k log W` (DERIVED)

The kinetic-gas frontier asked for the Boltzmann H-theorem, and an earlier pass deferred it as needing
"real entropy". It does not: Infomaterial *has* reals — `Infomaterial.Real.Logarithm` builds the Bishop-real
logarithm `logNat 2 N` of a natural number, with the two facts that matter, `logNat_mul` (log is
additive) and `logNat_mono` (log is monotone). That is exactly enough for Boltzmann's entropy in its
original combinatorial form, `S = k log W`, and for the H-theorem, with **genuine real-valued** logs.

A coarse configuration is the multiset of occupation numbers `(n₁, …, n_k)` of the velocity cells. Its
number of microstates is the multinomial `W = N! / ∏ nₘ!`, so `S = log W = log N! − Σ log nₘ!`. With
`N` fixed, the part that varies is **Boltzmann's H-functional** `H = Σ log nₘ!` (so `S = log N! − H`):
maximizing entropy is minimizing `H`. We compute `H` directly via `logNat`, sidestepping the division
in `W`, and prove the **H-theorem**: an equilibrating exchange — moving one particle from a fuller cell
to an emptier one — does not increase `H` (hence does not decrease the entropy `S = log N! − H`). The
entropy increment is exactly `log(a+1) − log(b+1) ≥ 0`, a real number.

This is the deterministic monotone skeleton of the H-theorem (the smoothing direction), the entropic
companion to `Kinetic.DiscreteVelocityCollision` (which proves the *conservation* side — number,
momentum, energy). The stochastic-rate Boltzmann `H = ∫ f log f` over a continuum still needs measure
theory; the finite real-valued `Σ log nₘ!` does not, and is proved here.

## Main definitions
* `cellH`, `configH` — a cell's `log(n!)` contribution and a configuration's Boltzmann `H`.
* `Exchange` — an equilibrating particle exchange between two cells.

## Main results
* `cellH_succ` — `log((n+1)!) = log(n+1) + log(n!)` (the additive law in entropy form).
* `htheorem_pair` — the core: a smoothing exchange does not increase `H`.
* `configH_perm`, `htheorem` — `H` is multiset-invariant and non-increasing under any equilibrating
  exchange; `htheorem_evolution` extends it along a whole relaxation.

## References
`Infomaterial.Real.Logarithm` (Bishop-real `logNat`); the conservation companion is
`Kinetic.DiscreteVelocityCollision`. Boltzmann `S = k log W`.

## Tags
Boltzmann entropy, H-theorem, real logarithm, microstates, relaxation
-/

namespace Infomaterial
namespace Relational.Thermo

open Infomaterial.Real.Internal

/-- Factorial (defined here). -/
def fact : Nat → Nat
  | 0 => 1
  | (n + 1) => (n + 1) * fact n

/-- `n!` is positive. By `fact (n+1) = (n+1) * fact n` this also reads `1 ≤ (n+1) * fact n`. -/
theorem fact_pos : ∀ n, 1 ≤ fact n
  | 0 => Nat.le_refl 1
  | (n + 1) => by
      have ih := fact_pos n
      have h := Nat.mul_le_mul (Nat.succ_le_succ (Nat.zero_le n)) ih
      show 1 ≤ (n + 1) * fact n
      simpa using h

/-- `logNat`-of-a-natural is proof-irrelevant in its positivity argument and respects equality of the
argument. -/
theorem logNat_congr {b m m' : Nat} (hb : 2 ≤ b) (hm : 1 ≤ m) (hm' : 1 ≤ m') (e : m = m') :
    logNat b m hb hm = logNat b m' hb hm' := by
  subst e; rfl

/-- The **entropy contribution of a cell** with occupation `n`: the real logarithm `log₂(n!)`. -/
def cellH (n : Nat) : RReal := logNat 2 (fact n) (by decide) (fact_pos n)

/-- **The additive law in entropy form**: `log((n+1)!) = log(n+1) + log(n!)`. The single fact behind
the H-theorem — adding a particle to a cell of size `n` costs `log(n+1)` of `H`. -/
theorem cellH_succ (n : Nat) :
    cellH (n + 1) = logNat 2 (n + 1) (by decide) (Nat.succ_pos n) + cellH n := by
  unfold cellH
  rw [logNat_congr (by decide) (fact_pos (n + 1)) (fact_pos (n + 1))
        (show fact (n + 1) = (n + 1) * fact n from rfl)]
  exact logNat_mul 2 (n + 1) (fact n) (by decide) (Nat.succ_pos n) (fact_pos n)

/-- **The core H-theorem.** Moving one particle from a cell of size `a+1` to a cell of size `b ≤ a`
(an equilibrating exchange) does not increase Boltzmann's `H`: `cellH a + cellH (b+1) ≤ cellH (a+1) +
cellH b`. The entropy increment `log(a+1) − log(b+1)` is `≥ 0` because `b+1 ≤ a+1`. -/
theorem htheorem_pair (a b : Nat) (hab : b ≤ a) :
    cellH a + cellH (b + 1) ≤ cellH (a + 1) + cellH b := by
  have key : logNat 2 (b + 1) (by decide) (Nat.succ_pos b)
      ≤ logNat 2 (a + 1) (by decide) (Nat.succ_pos a) :=
    logNat_mono 2 (by decide) (Nat.succ_pos b) (by omega)
  rw [cellH_succ a, cellH_succ b]
  -- goal: cellH a + (log(b+1) + cellH b) ≤ (log(a+1) + cellH a) + cellH b
  calc cellH a + (logNat 2 (b + 1) (by decide) (Nat.succ_pos b) + cellH b)
      = (cellH a + cellH b) + logNat 2 (b + 1) (by decide) (Nat.succ_pos b) := by
        rw [RReal.add_comm (logNat 2 (b + 1) (by decide) (Nat.succ_pos b)) (cellH b),
          ← RReal.add_assoc]
    _ ≤ (cellH a + cellH b) + logNat 2 (a + 1) (by decide) (Nat.succ_pos a) :=
        RReal.add_le_add_left key _
    _ = (logNat 2 (a + 1) (by decide) (Nat.succ_pos a) + cellH a) + cellH b := by
        rw [RReal.add_assoc, RReal.add_comm (cellH b)
          (logNat 2 (a + 1) (by decide) (Nat.succ_pos a)), ← RReal.add_assoc,
          RReal.add_comm (cellH a) (logNat 2 (a + 1) (by decide) (Nat.succ_pos a))]

/-! ## Whole-configuration `H` -/

/-- A configuration's **Boltzmann `H`**: the sum of cell contributions over the occupation multiset. -/
def configH : List Nat → RReal
  | [] => RReal.zero
  | n :: rest => cellH n + configH rest

/-- `H` is **multiset-invariant**: reordering the cells does not change it. -/
theorem configH_perm {p q : List Nat} (h : List.Perm p q) : configH p = configH q := by
  induction h with
  | nil => rfl
  | cons n _ ih => show cellH n + configH _ = cellH n + configH _; rw [ih]
  | swap m n l =>
      show cellH n + (cellH m + configH l) = cellH m + (cellH n + configH l)
      rw [← RReal.add_assoc, RReal.add_comm (cellH n) (cellH m), RReal.add_assoc]
  | trans _ _ ih1 ih2 => exact ih1.trans ih2

/-- An **equilibrating exchange**: from one cell with `a+1` particles and another with `b ≤ a`, move a
particle to the smaller cell, reaching `a` and `b+1`. Cells may sit anywhere (the `Perm`s). -/
def Exchange (p q : List Nat) : Prop :=
  ∃ a b rest, b ≤ a ∧ List.Perm p ((a + 1) :: b :: rest) ∧ List.Perm q (a :: (b + 1) :: rest)

/-- **The H-theorem.** An equilibrating exchange does not increase Boltzmann's `H` (so it does not
decrease the entropy `S = log N! − H`). -/
theorem htheorem {p q : List Nat} (h : Exchange p q) : configH q ≤ configH p := by
  obtain ⟨a, b, rest, hab, hp, hq⟩ := h
  rw [configH_perm hp, configH_perm hq]
  show cellH a + (cellH (b + 1) + configH rest) ≤ cellH (a + 1) + (cellH b + configH rest)
  rw [← RReal.add_assoc, ← RReal.add_assoc]
  exact RReal.add_le_add_right (htheorem_pair a b hab) (configH rest)

/-- A **relaxation**: a reflexive–transitive chain of equilibrating exchanges. -/
inductive Relaxes : List Nat → List Nat → Prop
  | refl (p : List Nat) : Relaxes p p
  | step {p q r : List Nat} : Exchange p q → Relaxes q r → Relaxes p r

/-- **`H` is non-increasing along an entire relaxation** — the monotone H-theorem for the dynamics. -/
theorem htheorem_evolution {p q : List Nat} (h : Relaxes p q) : configH q ≤ configH p := by
  induction h with
  | refl _ => exact RReal.le_refl _
  | step hstep _ ih => exact RReal.le_trans ih (htheorem hstep)

end Relational.Thermo
end Infomaterial
