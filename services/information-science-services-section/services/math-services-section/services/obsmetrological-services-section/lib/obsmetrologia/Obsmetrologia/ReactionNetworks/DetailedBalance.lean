import Obsmetrologia.ReactionNetworks.MassActionRate

/-! # Detailed balance — chemical equilibrium is a settling fixed point

A **reversible reaction** `A ⇌ B` carries a forward and a backward mass-action
propensity. Their difference is the **net flux**. The strict order on `RReal`
(`Real.MultiplicationOrder`) now lets the reaction's *direction* be a theorem:

* **the arrow** — when the backward propensity is strictly below the forward one, the
  net flux is strictly positive (`proceeds_forward`). The sign of the net flux is not
  decidable (no trichotomy on Bishop reals), so this is a directed implication, not a
  decidable classifier.
* **detailed balance** — `forwardProp = backwardProp` ⟺ `netFlux = 0`
  (`detailedBalance_iff_netFlux_zero`).
* **equilibrium = fixed point** — at detailed balance the reversible pair contributes
  nothing to the rate field, so the Euler flow leaves the state put
  (`detailedBalance_euler_fixed`): chemical equilibrium is the settling/closure fixed
  point (`equilibrium_is_fixed`).

The pair's field contribution `forwardProp·ν_fwd + backwardProp·ν_bwd` vanishes at
detailed balance because the reverse reaction's net stoichiometry is the negative of the
forward one — their sum cancels (`stoich_sum_reverse`), and the common propensity
multiplies that zero.

## Main definitions

* `reverse` — a reaction run backwards (reactants ↔ products).
* `Reversible` — a forward reaction with forward/backward rate constants.
* `forwardProp` / `backwardProp` / `netFlux` — the two propensities and their difference.
* `pairField` — the reversible pair's contribution to the mass-action rate field.
* `DetailedBalance` — forward and backward propensities agree.

## Main results

* `stoich_sum_reverse` — forward and reverse net stoichiometries cancel.
* `proceeds_forward` — a propensity imbalance gives a strictly signed net flux.
* `detailedBalance_iff_netFlux_zero` — detailed balance is zero net flux.
* `detailedBalance_euler_fixed` — detailed balance is a fixed point of the Euler flow.

## Tags

reaction network, detailed balance, net flux, equilibrium, settling fixed point
-/

namespace Obsmetrologia
namespace ReactionNetworks

open Obsmetrologia.Real.Internal

variable {Species : Type}

/-- A reaction run **backwards**: products become reactants and vice versa. -/
def reverse (r : Reaction Species) : Reaction Species := ⟨r.product, r.reactant⟩

/-- `(a − b) + (b − a) = 0` — the additive cancellation behind reversible stoichiometry. -/
private theorem add_swap_neg_cancel (a b : RReal) :
    (a + (-b)) + (b + (-a)) = RReal.zero := by
  rw [RReal.add_assoc, ← RReal.add_assoc (-b) b (-a), RReal.add_left_neg, RReal.zero_add,
    RReal.add_right_neg]

/-- Forward and reverse **net stoichiometries cancel**: one firing each way nets zero. -/
theorem stoich_sum_reverse (r : Reaction Species) (x : Species) :
    netStoich r x + netStoich (reverse r) x = RReal.zero := by
  show (rnat (r.product x) + (-(rnat (r.reactant x))))
        + (rnat (r.reactant x) + (-(rnat (r.product x)))) = RReal.zero
  exact add_swap_neg_cancel (rnat (r.product x)) (rnat (r.reactant x))

/-- A **reversible reaction**: a forward reaction with forward and backward rate
constants. -/
structure Reversible (Species : Type) where
  /-- The forward reaction. -/
  fwd : Reaction Species
  /-- Forward rate constant. -/
  kf : RReal
  /-- Backward rate constant. -/
  kb : RReal

/-- The forward mass-action propensity. -/
def forwardProp (R : Reversible Species) (univ : List Species) (c : Conc Species) : RReal :=
  propensity univ R.kf R.fwd c

/-- The backward mass-action propensity (over the reversed reaction). -/
def backwardProp (R : Reversible Species) (univ : List Species) (c : Conc Species) : RReal :=
  propensity univ R.kb (reverse R.fwd) c

/-- The **net flux**: forward minus backward propensity. -/
def netFlux (R : Reversible Species) (univ : List Species) (c : Conc Species) : RReal :=
  forwardProp R univ c + (-(backwardProp R univ c))

/-- The reversible pair's contribution to the mass-action **rate field**: each direction
fires along its own net stoichiometry. -/
def pairField (R : Reversible Species) (univ : List Species) :
    Conc Species → Species → RReal :=
  fun c x => forwardProp R univ c * netStoich R.fwd x
    + backwardProp R univ c * netStoich (reverse R.fwd) x

/-- **Detailed balance**: the forward and backward propensities agree. -/
def DetailedBalance (R : Reversible Species) (univ : List Species) (c : Conc Species) : Prop :=
  forwardProp R univ c = backwardProp R univ c

/-! ## The arrow and the equilibrium -/

/-- **The thermodynamic arrow.** When the backward propensity is strictly below the
forward one, the net flux is strictly positive — the reaction proceeds forward. -/
theorem proceeds_forward (R : Reversible Species) (univ : List Species) (c : Conc Species)
    (h : backwardProp R univ c < forwardProp R univ c) : RReal.zero < netFlux R univ c :=
  RReal.zero_lt_iff_pos.mpr h

/-- **Detailed balance is zero net flux.** -/
theorem detailedBalance_iff_netFlux_zero (R : Reversible Species) (univ : List Species)
    (c : Conc Species) : DetailedBalance R univ c ↔ netFlux R univ c = RReal.zero := by
  unfold DetailedBalance netFlux
  constructor
  · intro h; rw [h]; exact RReal.add_right_neg _
  · intro h
    have h2 : (forwardProp R univ c + (-(backwardProp R univ c))) + backwardProp R univ c
        = RReal.zero + backwardProp R univ c := by rw [h]
    rw [RReal.add_assoc, RReal.add_left_neg, RReal.add_zero, RReal.zero_add] at h2
    exact h2

/-- At detailed balance the reversible pair contributes nothing to the rate field. -/
theorem detailedBalance_is_equilibrium (R : Reversible Species) (univ : List Species)
    (c : Conc Species) (h : DetailedBalance R univ c) :
    IsEquilibrium (pairField R univ) c := by
  intro x
  show forwardProp R univ c * netStoich R.fwd x
      + backwardProp R univ c * netStoich (reverse R.fwd) x = RReal.zero
  rw [h, ← RReal.left_distrib, stoich_sum_reverse, RReal.mul_zero]

/-- **Chemical equilibrium is a settling fixed point.** At detailed balance, every Euler
step of the reversible pair's rate field leaves the state unchanged. -/
theorem detailedBalance_euler_fixed (R : Reversible Species) (univ : List Species)
    (c : Conc Species) (h : DetailedBalance R univ c) (dt : RReal) :
    eulerStep (pairField R univ) dt c = c :=
  equilibrium_is_fixed (pairField R univ) dt (detailedBalance_is_equilibrium R univ c h)

end ReactionNetworks
end Obsmetrologia
