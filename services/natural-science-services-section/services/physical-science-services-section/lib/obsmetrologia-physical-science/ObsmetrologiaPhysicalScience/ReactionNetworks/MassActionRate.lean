import ObsmetrologiaPhysicalScience.ReactionNetworks.Network
import Obsmetrologia.Calculus.Real.Multiplication
import Obsmetrologia.Calculus.Real.MultiplicationOrder

/-! # Mass-action rates and discrete-time flow — the reals pass

Reals are present (`Obsmetrologia/Calculus/Real/`), so the rate side of a reaction network is buildable:
a real **propensity** `rate r = k_r · ∏ₓ (cₓ)^{reactantₓ}` over `RReal`, a **rate vector
field** summing each reaction's propensity against its net stoichiometry, and a
discrete-time **Euler step** `c ↦ c + dt·V(c)`. Equilibrium is a fixed point of the
field, and an equilibrium is fixed by every Euler step (`equilibrium_is_fixed`).

With `RReal.mul_nonneg` (from `Real.MultiplicationOrder`), propensity **positivity** is
now a theorem too: at nonnegative concentrations and rate constants a propensity is
nonnegative (`propensity_nonneg`). What remains open is monotonicity in concentration and
convergence of the Euler iterates.

## Main definitions

* `rpow` — natural power on `RReal`.
* `netStoich` — a reaction's net production `product − reactant` as a real vector.
* `propensity` / `massActionField` — the mass-action rate and its vector field.
* `eulerStep` — one discrete-time step of an arbitrary rate field.
* `IsEquilibrium` — a state at which a field vanishes.

## Main results

* `rpow_add` — `a^(m+n) = a^m · a^n` (the law a real product needs).
* `propensity_zero_of_zero_rate` — a zero rate constant gives zero propensity.
* `propensity_nonneg` — a propensity is nonnegative at nonnegative data.
* `equilibrium_is_fixed` — an equilibrium is a fixed point of every Euler step.
* `eulerStep_zero_dt` — a zero time step is the identity.

## Tags

mass action, reaction rate, propensity, Euler step, equilibrium, RReal, settling
-/

namespace Obsmetrologia
namespace ReactionNetworks

open Obsmetrologia.Real.Internal

variable {Species : Type}

/-! ## Natural power and naturals on `RReal` -/

/-- Natural power on `RReal`, `a^n`, by iterated multiplication. -/
def rpow (a : RReal) : Nat → RReal
  | 0 => RReal.one
  | n + 1 => a * rpow a n

@[simp] theorem rpow_zero (a : RReal) : rpow a 0 = RReal.one := rfl

@[simp] theorem rpow_succ (a : RReal) (n : Nat) : rpow a (n + 1) = a * rpow a n := rfl

/-- `a^(m+n) = a^m · a^n` — the multiplicative bookkeeping of stoichiometric powers. -/
theorem rpow_add (a : RReal) (m n : Nat) : rpow a (m + n) = rpow a m * rpow a n := by
  induction m with
  | zero => simp [rpow_zero, RReal.one_mul]
  | succ k ih =>
    have : k + 1 + n = (k + n) + 1 := by omega
    rw [this, rpow_succ, ih, rpow_succ, RReal.mul_assoc]

/-- The real embedding of a particle count. -/
def rnat : Nat → RReal
  | 0 => RReal.zero
  | n + 1 => RReal.one + rnat n

/-! ## Concentrations, propensities and the rate field -/

/-- A real **concentration** vector — one nonnegative real per species (nonnegativity is
not enforced here; it is part of the order frontier). -/
abbrev Conc (Species : Type) : Type := Species → RReal

/-- The real product `∏_{x ∈ univ} g x`. -/
def rprod (univ : List Species) (g : Species → RReal) : RReal :=
  (univ.map g).foldr (· * ·) RReal.one

/-- The **mass-action propensity** of a reaction: rate constant times the product of
concentrations raised to their reactant stoichiometries. -/
def propensity (univ : List Species) (k : RReal) (r : Reaction Species) (c : Conc Species) :
    RReal :=
  k * rprod univ (fun x => rpow (c x) (r.reactant x))

/-- A zero rate constant yields zero propensity — the rate constant is the on/off knob,
exactly as `ruleFire` is gated by its antecedent in the monotone support projection. -/
theorem propensity_zero_of_zero_rate (univ : List Species) (r : Reaction Species)
    (c : Conc Species) : propensity univ RReal.zero r c = RReal.zero := by
  unfold propensity; rw [RReal.zero_mul]

/-! ## Positivity (via `RReal.mul_nonneg`) -/

/-- A natural power of a nonnegative real is nonnegative. -/
theorem rpow_nonneg {a : RReal} (ha : RReal.zero ≤ a) : ∀ n, RReal.zero ≤ rpow a n
  | 0 => RReal.zero_le_one
  | n + 1 => RReal.mul_nonneg ha (rpow_nonneg ha n)

/-- A product of nonnegative reals over the roster is nonnegative. -/
theorem rprod_nonneg (univ : List Species) (g : Species → RReal)
    (hg : ∀ x, RReal.zero ≤ g x) : RReal.zero ≤ rprod univ g := by
  induction univ with
  | nil => exact RReal.zero_le_one
  | cons a rest ih =>
    show RReal.zero ≤ g a * rprod rest g
    exact RReal.mul_nonneg (hg a) ih

/-- **Propensities are nonnegative.** At nonnegative concentrations and a nonnegative rate
constant, a mass-action propensity is `≥ 0` — the rate-positivity that the multiplicative
order on `RReal` (`mul_nonneg`) now makes a theorem rather than a frontier. -/
theorem propensity_nonneg (univ : List Species) (k : RReal) (r : Reaction Species)
    (c : Conc Species) (hk : RReal.zero ≤ k) (hc : ∀ x, RReal.zero ≤ c x) :
    RReal.zero ≤ propensity univ k r c :=
  RReal.mul_nonneg hk (rprod_nonneg univ _ (fun x => rpow_nonneg (hc x) (r.reactant x)))

/-- A reaction's **net stoichiometry** `product − reactant` as a real vector: how much of
each species one firing nets. -/
def netStoich (r : Reaction Species) : Species → RReal :=
  fun x => rnat (r.product x) + (-(rnat (r.reactant x)))

/-- The **mass-action rate field**: at concentration `c`, each species changes at the
rate summed over reactions of propensity times net stoichiometry. `k` assigns a rate
constant to each reaction. -/
def massActionField (univ : List Species) (reactions : List (Reaction Species))
    (k : Reaction Species → RReal) (c : Conc Species) : Species → RReal :=
  fun x => (reactions.map (fun r => propensity univ (k r) r c * netStoich r x)).foldr
    (· + ·) RReal.zero

/-! ## Discrete-time flow and equilibrium

The Euler step is stated for an arbitrary rate field `V`, so the dynamics results are
independent of the (order-bound) mass-action specifics. -/

/-- One **Euler step** of a rate field `V` with time increment `dt`. -/
def eulerStep (V : Conc Species → Species → RReal) (dt : RReal) (c : Conc Species) :
    Conc Species := fun x => c x + dt * V c x

/-- A concentration is an **equilibrium** of a field when the field vanishes there. -/
def IsEquilibrium (V : Conc Species → Species → RReal) (c : Conc Species) : Prop :=
  ∀ x, V c x = RReal.zero

/-- **Equilibrium is a fixed point.** A state where the rate field vanishes is left
unchanged by every Euler step, for any `dt`: the discrete-time analogue of "`ċ = 0` ⟹
stationary." This is the dynamics counterpart of the settling fixed point. -/
theorem equilibrium_is_fixed (V : Conc Species → Species → RReal) (dt : RReal)
    {c : Conc Species} (h : IsEquilibrium V c) : eulerStep V dt c = c := by
  funext x
  unfold eulerStep
  rw [h x, RReal.mul_zero, RReal.add_zero]

/-- A zero time step is the identity, for any field. -/
theorem eulerStep_zero_dt (V : Conc Species → Species → RReal) (c : Conc Species) :
    eulerStep V RReal.zero c = c := by
  funext x
  unfold eulerStep
  rw [RReal.zero_mul, RReal.add_zero]

end ReactionNetworks
end Obsmetrologia
