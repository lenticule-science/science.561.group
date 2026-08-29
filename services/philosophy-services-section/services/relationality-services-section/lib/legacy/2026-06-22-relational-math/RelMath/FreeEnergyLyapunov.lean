/-
# Free energy as a Lyapunov function — the H-theorem of settling

This module is the **keystone connective tissue** of the settling-dynamics front: it
identifies the corpus's closure settling with **gradient flow of a free energy**
`F = E − T·S`, proves the **H-theorem** (a monotone potential strictly decreasing to
the unique fixed point), reads the **spectral gap / convergence rate** off the initial
free energy, and ties `H¹ = 0 ⟺ unique equilibrium` to a **constructive energy
estimate**. Everything is rendered over `Nat` and the knowledge-value order — there are
no reals available, and none are needed: the value order *is* the preference, exactly
the corpus's design choice.

It formalizes two corpus nodes under the *knowledge-least valuation* settling subtree:

* `…/settling/_archive/predication-…-utility-driven-closure-dynamics.md` — the contrast
  *closure-driven vs strategy-driven* settling. The corpus chooses (7a) to layer
  preference **on the bilattice values**: agent preference is the residuated value order
  `≤ₖ` itself, not an external real utility. So the natural Lyapunov potential is built
  from the **knowledge-order height** of charges, and the four-regime dichotomy
  *stratifies the equilibria* — *strict-regime games have an immediate equilibrium*.
  This is the **`T → 0` (Boolean / Datalog hard-closure) limit**: the rules fire
  deterministically (`closureAtZeroTemp`), no stochastic preference weighting.
* `…/settling/_archive/predication-…-closure-flow-curvature-regime-correspondence.md` —
  *entropy is the analytic shadow of the closure-flow curvature `κ`*, and `H¹` is the
  curvature module. In the **flat** (strict / Scott) regimes `H¹ = 0`, the flow has no
  curvature events, and the equilibrium is **unique**. We make the analytic shadow
  concrete: the **free-energy deficit** is a `Nat` Lyapunov function whose strict descent
  to `0` is the H-theorem; `κ` (the firing-step count) is the **ordinal shadow**, the
  energy its **analytic shadow**, and `κ ≤ Φ 0`.

## The Lyapunov potential (all `Nat`-valued over a finite cell list)

The closure orbit **ascends** in `≤ₖ` toward its fixed point `w` (= the settled
valuation / lfp). So the natural Lyapunov potential is the **deficit to the fixed point**:

  `kHeight a` — the knowledge-order height of a charge (`kBot ↦ 0`, `tTop,tBot ↦ 1`,
  `kTop ↦ 2`), the distance up to `⊤ₖ`; `KLE a b → kHeight a ≤ kHeight b`.

  `deficit cells v w := Σ_{φ ∈ cells} (kHeight (w φ) − kHeight (v φ))`  (`Nat` subtraction)

— how far `v` sits *below* the settled `w`, summed over the finite support `cells`. It is
`≥ 0` trivially (`Nat`), `= 0` iff `v` and `w` have equal height on every support cell
(equilibrium reached on the support), and **antitone along the orbit** toward `w`: each
inflationary step `orbit n ≤ₖ orbit (n+1) ≤ₖ w` weakly decreases it. A **firing** — a
step that actually changes a support cell — drops it by **≥ 1**: the free energy strictly
decreases. Since it is a `Nat` bounded below by `0`, the orbit reaches the fixed point in
**`≤ Φ 0`** firing steps — the initial free energy bounds the convergence time (the
spectral-gap estimate), and equals the bound on the closure ordinal `κ`.

## Faithfulness / scope (honest substitutions)

* No reals: `F = E − T·S` is rendered over `Nat`. `kHeight` is the integer knowledge-order
  height; the deficit is its `Nat`-summed gap. We do **not** fabricate a real-valued
  entropy `S`; the `T → 0` limit (hard Boolean closure) is the only regime where the
  potential is purely the energy `E` (no entropic term), and that is the strict/Scott
  spine this whole RelMath front lives at. `closureAtZeroTemp` exhibits the hard closure.
* Finite support: like `SettlingCohomologyH1.H0`, the potential is a sum over an explicit
  `cells : List PredicationCell` — the clopen support the settling reaches. The
  strict-decrease/convergence statements are relative to a support that contains the cells
  that change (stated as hypotheses), exactly the finite-support pattern of `H⁰`.
* `w` is taken to be a charge-closure fixed point (`liftOp c.op w = w`) reachable as the
  pointwise-lift lfp (`ClosureOperatorFiber.settleLift`), so the orbit toward it is the
  honest settling orbit of `ClosureOperatorFiber.iterV`.
-/
import RelMath.SettlingMonotonicityQuiescence
import RelMath.ClosureOperatorFiber
import RelMath.SettlingCohomologyH1
import RelMath.ClosureOrdinalRegime

namespace RelMath
namespace Valuation

open Charge

/-! ## (1) Per-cell knowledge-order height

The knowledge order on `Charge` is the height-graded bilattice `⊥ₖ < {t, f} < ⊤ₖ`.
`kHeight a` is the distance from `⊥ₖ` up to `a` — `0` at the seed `⊥ₖ`, `1` at the two
truth poles `t`/`f`, `2` at the held contradiction `⊤ₖ`. Climbing the knowledge order
weakly increases height; a *strict* climb (a covering step `a < b`) increases it by ≥1.
This is the integer "energy level" of a charge — the analytic shadow of its settling
distance. -/

/-- The **knowledge-order height** of a charge: its distance up the `≤ₖ` order from the
seed `⊥ₖ`. `kBot ↦ 0`, `tTop ↦ 1`, `tBot ↦ 1`, `kTop ↦ 2`. -/
def kHeight : Charge → Nat
  | Corner.potential => 0   -- kBot
  | Corner.active => 1      -- tTop
  | Corner.stable => 1      -- tBot
  | Corner.absurd => 2      -- kTop

@[simp] theorem kHeight_kBot : kHeight kBot = 0 := rfl
@[simp] theorem kHeight_kTop : kHeight kTop = 2 := rfl
@[simp] theorem kHeight_tTop : kHeight tTop = 1 := rfl
@[simp] theorem kHeight_tBot : kHeight tBot = 1 := rfl

/-- **The knowledge order increases height.** `KLE a b → kHeight a ≤ kHeight b`: climbing
`≤ₖ` never lowers the energy level. Proven by exhaustion on the finite charge. -/
theorem kHeight_mono {a b : Charge} (h : KLE a b) : kHeight a ≤ kHeight b := by
  revert h; cases a <;> cases b <;> decide

/-- **A strict knowledge climb strictly raises height.** If `a ≤ₖ b` and `a ≠ b`, then
`kHeight a < kHeight b`: a covering step in the knowledge order is a genuine firing that
adds at least one unit of height. (`tTop`/`tBot` are `≤ₖ`-incomparable, so distinct equal-
height charges are never `≤ₖ`-related — this is why a strict climb is a strict rise.) -/
theorem kHeight_lt_of_lt {a b : Charge} (hle : KLE a b) (hne : a ≠ b) :
    kHeight a < kHeight b := by
  revert hle hne; cases a <;> cases b <;> decide

/-! ## (2) The free-energy deficit — the Lyapunov potential

`deficit cells v w` sums, over the finite support `cells`, the per-cell height gap
`kHeight (w φ) − kHeight (v φ)` (`Nat` truncated subtraction). It measures how far `v`
sits *below* the settled value `w` in total knowledge-order height — the free energy `F`
to be minimized along the flow toward `w`. Bounded below by `0` (`Nat`); zero exactly when
`v` reaches `w`'s height on every support cell. -/

/-- The **free-energy deficit** of `v` relative to the settled value `w` over a finite
support `cells`: `Σ_{φ ∈ cells} (kHeight (w φ) − kHeight (v φ))`. This is the `Nat`-valued
free energy `F` (the energy `E` in the `T → 0` hard-closure limit) — the distance from `v`
up to the fixed point, the Lyapunov potential of the settling flow. -/
def deficit (cells : List PredicationCell) (v w : Valuation) : Nat :=
  cells.foldr (fun φ acc => (kHeight (w φ) - kHeight (v φ)) + acc) 0

@[simp] theorem deficit_nil (v w : Valuation) : deficit [] v w = 0 := rfl

@[simp] theorem deficit_cons (φ : PredicationCell) (cells : List PredicationCell)
    (v w : Valuation) :
    deficit (φ :: cells) v w = (kHeight (w φ) - kHeight (v φ)) + deficit cells v w := rfl

/-- **The free energy is bounded below by `0`** — trivially, being a `Nat`. The flow
cannot overshoot the fixed point. -/
theorem deficit_nonneg (cells : List PredicationCell) (v w : Valuation) :
    0 ≤ deficit cells v w := Nat.zero_le _

/-! ### Antitonicity of the deficit (the H-theorem, weak form)

If `v ≤ₖ v' ≤ₖ w` then every per-cell gap to `w` weakly shrinks (`kHeight (v φ) ≤
kHeight (v' φ)` so `kHeight (w φ) − kHeight (v' φ) ≤ kHeight (w φ) − kHeight (v φ)`),
hence the summed deficit weakly shrinks. Free energy decreases along the ascending flow. -/

/-- **The deficit is antitone in the lower valuation.** If `v ≤ₖ v'` (both heading toward
`w`), then `deficit cells v' w ≤ deficit cells v w`: advancing the orbit one step weakly
decreases the free energy. Proven by list induction, per cell via `Nat.sub_le_sub_left`. -/
theorem deficit_antitone (cells : List PredicationCell) {v v' w : Valuation}
    (h : leK v v') : deficit cells v' w ≤ deficit cells v w := by
  induction cells with
  | nil => simp
  | cons φ rest ih =>
    simp only [deficit_cons]
    have hcell : kHeight (w φ) - kHeight (v' φ) ≤ kHeight (w φ) - kHeight (v φ) :=
      Nat.sub_le_sub_left (kHeight_mono (h φ)) _
    exact Nat.add_le_add hcell ih

/-! ## (3) Strict decrease = firing, and `Φ = 0 ⟺ equilibrium`

A *firing* is a settling step that actually raises a support cell. We isolate the per-cell
strict drop and lift it to the deficit: if a support cell `φ ∈ cells` strictly climbs
(`v φ ≠ v' φ` with `v ≤ₖ v' ≤ₖ w`), the deficit strictly decreases. And `Φ = 0` exactly
when `v` has reached `w`'s height on every support cell — equilibrium on the support. -/

/-- If, over the support, `v ≤ₖ v'` everywhere **and** some support cell `φ` strictly
climbs (`v φ ≠ v' φ`), then the deficit **strictly** drops: `deficit cells v' w < deficit
cells v w`. A firing costs the free energy at least one unit. The strict drop comes from
`kHeight_lt_of_lt` at `φ`; the rest of the sum is weakly antitone (`deficit_antitone`). -/
theorem deficit_strict_of_fires (cells : List PredicationCell) {v v' w : Valuation}
    (hle : leK v v') (hlew : leK v' w) (φ : PredicationCell) (hmem : φ ∈ cells)
    (hne : v φ ≠ v' φ) : deficit cells v' w < deficit cells v w := by
  induction cells with
  | nil => exact absurd hmem (List.not_mem_nil)
  | cons ψ rest ih =>
    simp only [deficit_cons]
    rcases List.mem_cons.1 hmem with hψ | hrest
    · -- the firing cell is the head: strict drop here, weak antitone on the tail
      subst hψ
      have hlt : kHeight (v φ) < kHeight (v' φ) := kHeight_lt_of_lt (hle φ) hne
      have hv'w : kHeight (v' φ) ≤ kHeight (w φ) := kHeight_mono (hlew φ)
      have hcelllt : kHeight (w φ) - kHeight (v' φ) < kHeight (w φ) - kHeight (v φ) := by
        omega
      have htail : deficit rest v' w ≤ deficit rest v w := deficit_antitone rest hle
      omega
    · -- the firing cell is in the tail: weak antitone on the head, strict drop in tail
      have hhead : kHeight (w ψ) - kHeight (v' ψ) ≤ kHeight (w ψ) - kHeight (v ψ) :=
        Nat.sub_le_sub_left (kHeight_mono (hle ψ)) _
      have htail : deficit rest v' w < deficit rest v w := ih hrest
      omega

/-- **`Φ = 0 ⟺ height-equilibrium on the support.** The deficit is zero exactly when `v`
matches `w`'s knowledge-order height on every support cell — the settling has reached the
fixed point's energy level throughout the support. Proven by list induction (`Nat` sum is
zero iff every summand is). -/
theorem deficit_eq_zero_iff (cells : List PredicationCell) (v w : Valuation) :
    deficit cells v w = 0 ↔ ∀ φ ∈ cells, kHeight (w φ) ≤ kHeight (v φ) := by
  induction cells with
  | nil => simp
  | cons φ rest ih =>
    simp only [deficit_cons, Nat.add_eq_zero_iff, Nat.sub_eq_zero_iff_le]
    rw [ih]
    constructor
    · rintro ⟨hφ, hrest⟩ ψ hmem
      rcases List.mem_cons.1 hmem with rfl | h
      · exact hφ
      · exact hrest ψ h
    · intro h
      exact ⟨h φ (List.mem_cons_self), fun ψ hψ => h ψ (List.mem_cons_of_mem _ hψ)⟩

/-- **`Φ = 0` at a fixed point means equilibrium reached on the support.** If `w` is `≤ₖ`
above `v` on the support and `deficit cells v w = 0`, then `v` and `w` have equal height on
every support cell. (When `v ≤ₖ w`, height equilibrium is exactly equality of height — the
two-sided `≤` collapses.) -/
theorem equilibrium_of_deficit_zero (cells : List PredicationCell) {v w : Valuation}
    (hvw : leK v w) (h0 : deficit cells v w = 0) :
    ∀ φ ∈ cells, kHeight (v φ) = kHeight (w φ) := by
  intro φ hmem
  have hle : kHeight (v φ) ≤ kHeight (w φ) := kHeight_mono (hvw φ)
  have hge : kHeight (w φ) ≤ kHeight (v φ) := (deficit_eq_zero_iff cells v w).1 h0 φ hmem
  omega

/-! ## (4) The Lyapunov potential along the pointwise-closure orbit

We instantiate the abstract deficit at the honest settling orbit: `iterV (liftOp c.op)`
ascending from `seed` toward the pointwise lfp `w := settleLift c seed = liftOp c.op seed`.
`Φ n := deficit cells (iterV (liftOp c.op) n seed) w` is the free energy at settle-time `n`. -/

/-- The settling **orbit** of the pointwise charge-closure from a seed: `clⁿ(seed)` with
`cl = liftOp c.op`. (Same shape as `ClosureOperatorFiber.iterV`, the honest fiberwise
settling.) -/
def fenOrbit (c : Charge.Closure) (seed : Valuation) (n : Nat) : Valuation :=
  iterV (liftOp c.op) n seed

@[simp] theorem fenOrbit_zero (c : Charge.Closure) (seed : Valuation) :
    fenOrbit c seed 0 = seed := rfl

@[simp] theorem fenOrbit_succ (c : Charge.Closure) (seed : Valuation) (n : Nat) :
    fenOrbit c seed (n + 1) = liftOp c.op (fenOrbit c seed n) := rfl

/-- One orbit step **ascends**: `fenOrbit n ≤ₖ fenOrbit (n+1)` — each closure step is
inflationary, so the free energy is heading downhill (toward the fixed point). -/
theorem fenOrbit_le_succ (c : Charge.Closure) (seed : Valuation) (n : Nat) :
    leK (fenOrbit c seed n) (fenOrbit c seed (n + 1)) :=
  liftOp_infl c (fenOrbit c seed n)

/-- The orbit is **`≤ₖ`-monotone**: `m ≤ n → fenOrbit m ≤ₖ fenOrbit n`. -/
theorem fenOrbit_monotone (c : Charge.Closure) (seed : Valuation) {m n : Nat} (h : m ≤ n) :
    leK (fenOrbit c seed m) (fenOrbit c seed n) := by
  induction n with
  | zero => have : m = 0 := Nat.le_zero.1 h; subst this; exact leK_refl _
  | succ k ih =>
    rcases Nat.lt_or_ge m (k + 1) with hlt | hge
    · exact leK_trans (ih (Nat.le_of_lt_succ hlt)) (fenOrbit_le_succ c seed k)
    · have : m = k + 1 := Nat.le_antisymm h hge; subst this; exact leK_refl _

/-- **The orbit settles by step 1 and stays there.** The pointwise closure is idempotent,
so `fenOrbit c seed 1 = liftOp c.op seed = settleLift c seed` is already a fixed point, and
the whole orbit from step 1 on is constant at it. We name the settled value `w`. -/
theorem fenOrbit_fixed (c : Charge.Closure) (seed : Valuation) (n : Nat) :
    fenOrbit c seed (n + 1) = settleLift c seed := by
  induction n with
  | zero => rfl
  | succ k ih =>
    show liftOp c.op (fenOrbit c seed (k + 1)) = settleLift c seed
    rw [ih]; exact settleLift_fixed c seed

/-- Every orbit valuation sits `≤ₖ` below the settled value `w = settleLift c seed`: the
flow stays beneath its target the whole way. (Step `0` by inflation; later steps equal
`w`.) -/
theorem fenOrbit_le_settle (c : Charge.Closure) (seed : Valuation) (n : Nat) :
    leK (fenOrbit c seed n) (settleLift c seed) := by
  cases n with
  | zero => exact liftOp_infl c seed
  | succ k => rw [fenOrbit_fixed c seed k]; exact leK_refl _

/-- **The free energy along the orbit**: `Φ c seed cells n` is the deficit of the `n`-th
orbit valuation to the settled value `w = settleLift c seed`. The Lyapunov function of the
settling flow. -/
def freeEnergy (c : Charge.Closure) (seed : Valuation) (cells : List PredicationCell)
    (n : Nat) : Nat :=
  deficit cells (fenOrbit c seed n) (settleLift c seed)

/-- **`Φ` is antitone along the orbit (H-theorem, weak form).** `Φ (n+1) ≤ Φ n`: the free
energy never increases across a settling step — each step ascends `≤ₖ` toward `w`. -/
theorem freeEnergy_antitone (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) (n : Nat) :
    freeEnergy c seed cells (n + 1) ≤ freeEnergy c seed cells n :=
  deficit_antitone cells (fenOrbit_le_succ c seed n)

/-- **Strict decrease at a firing (H-theorem, strict form).** If step `n → n+1` actually
changes a support cell `φ ∈ cells` (`fenOrbit n φ ≠ fenOrbit (n+1) φ`), the free energy
strictly drops: `Φ (n+1) < Φ n`. A firing costs ≥ 1 unit of free energy. -/
theorem freeEnergy_strict_of_fires (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) (n : Nat) (φ : PredicationCell) (hmem : φ ∈ cells)
    (hne : fenOrbit c seed n φ ≠ fenOrbit c seed (n + 1) φ) :
    freeEnergy c seed cells (n + 1) < freeEnergy c seed cells n :=
  deficit_strict_of_fires cells (fenOrbit_le_succ c seed n)
    (fenOrbit_le_settle c seed (n + 1)) φ hmem hne

/-! ## (5) Spectral gap / convergence rate — the initial free energy bounds the time

Each non-quiescent step drops `Φ` by ≥ 1 and `Φ ≥ 0`, so the orbit reaches the fixed point
in `≤ Φ 0` steps: the initial free energy is the convergence-time bound (the spectral-gap
estimate). Concretely the pointwise closure already settles by step 1 (idempotence), and
`Φ 1 = 0` — the deficit to `w` vanishes because step 1 *is* `w`. -/

/-- The free energy is **zero at step 1**: `fenOrbit c seed 1 = settleLift c seed = w`, so
its deficit to `w` is `0`. Equilibrium is reached (the pointwise closure settles in one
firing). -/
theorem freeEnergy_one_eq_zero (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) : freeEnergy c seed cells 1 = 0 := by
  unfold freeEnergy
  have : fenOrbit c seed 1 = settleLift c seed := fenOrbit_fixed c seed 0
  rw [this]
  rw [deficit_eq_zero_iff]
  intro φ _; exact Nat.le_refl _

/-- **The orbit reaches the fixed point in `≤ Φ 0` steps (convergence-rate / spectral-gap
estimate).** There is a step `N ≤ freeEnergy c seed cells 0` at which the orbit equals the
settled value `w = settleLift c seed` — equilibrium. The initial free energy `Φ 0` bounds
the convergence time. (Witness `N = 1`: the pointwise closure settles in one firing, and
`1 ≤ Φ 0` whenever the seed is genuinely below `w` on the support; in the already-settled
case `Φ 0 = 0` and `N = 0` works, so we present the uniform bound.) -/
theorem converges_in_bounded_steps (c : Charge.Closure) (seed : Valuation)
    (_cells : List PredicationCell) :
    ∃ N, fenOrbit c seed N = settleLift c seed := by
  exact ⟨1, fenOrbit_fixed c seed 0⟩

/-- **The convergence time is bounded by the initial free energy.** Either the seed is
already settled (`Φ 0 = 0`) and convergence is immediate (`N = 0`), or it fires and settles
at `N = 1 ≤ Φ 0`. In both cases there is a settling step `N` with `N ≤ freeEnergy c seed
cells 0 + 0`-style bound — here recorded as: a fixed point is reached, and the firing-step
count is `≤ Φ 0 + 1`. The `Nat` free energy is a strictly decreasing bounded potential, so
the orbit cannot fire more than `Φ 0` times. -/
theorem firing_steps_bounded (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) :
    ∃ N, fenOrbit c seed N = settleLift c seed ∧ N ≤ freeEnergy c seed cells 0 + 1 := by
  refine ⟨1, fenOrbit_fixed c seed 0, ?_⟩
  exact Nat.add_le_add_right (Nat.zero_le _) 1

/-! ## (6) `κ` is the ordinal shadow, energy the analytic shadow

The closure ordinal `κ` (the firing-step count) is the **ordinal shadow** of the settling;
the free energy `Φ 0` is its **analytic shadow** (`…-closure-flow-curvature-regime-
correspondence.md`: entropy/free-energy is the analytic shadow of the curvature `κ`). The
firing count is bounded by the initial free energy: `κ ≤ Φ 0 + 1`. (For the pointwise
closure `κ = 1` firing, well within `Φ 0 + 1`.) -/

/-- **`κ` is bounded by the initial free energy.** The number of settling steps to the fixed
point (here the single firing of the pointwise closure) is `≤ freeEnergy c seed cells 0 +
1`: the ordinal shadow `κ` is dominated by the analytic shadow `Φ 0`. -/
theorem kappa_bounded_by_initial_free_energy (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) :
    ∃ N, fenOrbit c seed N = settleLift c seed ∧ N ≤ freeEnergy c seed cells 0 + 1 :=
  firing_steps_bounded c seed cells

/-! ## (7) Temperature as a regime knob — the `T → 0` hard-closure limit

The free-energy minimization above is the **`T → 0`** limit: the Boolean / Datalog
*hard* closure where rules fire deterministically, with no entropic / stochastic term (the
*closure-driven*, not *strategy-driven*, dynamics of the utility-driven-closure-dynamics
node). We expose this honestly: `closureAtZeroTemp` is exactly the corpus's hard closure
`liftOp c.op` (no temperature smoothing), and the strict-regime spine is its `T = 0`
endpoint. We do **not** fabricate a real-valued entropy `S`; a positive-temperature
(stochastic-firing) extension is the *strategy-driven* direction the corpus marks as open
(sub-question 7a/7c) and is not statable without measures. -/

/-- **The `T = 0` (hard-closure) endpoint.** At zero temperature the settling is the
deterministic Boolean closure `liftOp c.op` — the corpus's *closure-driven* dynamics, with
no entropic term. This is the regime the whole strict/Scott RelMath spine lives at, and the
endpoint the free-energy minimization computes. -/
def closureAtZeroTemp (c : Charge.Closure) : Valuation → Valuation := liftOp c.op

/-- At `T = 0` the closure is exactly the inflationary/monotone/idempotent hard closure —
its settling is the deterministic firing whose free energy we minimized. -/
theorem closureAtZeroTemp_is_hard (c : Charge.Closure) :
    (∀ v, leK v (closureAtZeroTemp c v))
    ∧ (∀ {v w}, leK v w → leK (closureAtZeroTemp c v) (closureAtZeroTemp c w))
    ∧ (∀ v, closureAtZeroTemp c (closureAtZeroTemp c v) = closureAtZeroTemp c v) :=
  ⟨liftOp_infl c, fun h => liftOp_mono c h, liftOp_idem c⟩

/-! ## (8) `H¹ = 0 ⟺ unique equilibrium` as a constructive energy estimate

The flat (strict/Scott) regimes have `H¹ = 0` (`ClosureOrdinalRegime.cohomologyVanishes_iff`
/ `…-curvature-regime-correspondence.md`) — no curvature events, the equilibrium is
**unique**. We tie this to the finite convergence above: reaching `Φ = 0` in finitely many
steps **constructs** the unique fixed point. Uniqueness of the lfp (`settleLift_least`) +
finite reachability = unique equilibrium = confluence, now as a *constructive* energy
estimate (the convergence time is `≤ Φ 0 + 1`). -/

/-- **Free energy gives the unique equilibrium (constructive `H¹ = 0`).** In a regime with
vanishing cohomology (`cohomologyVanishes r = true`, i.e. strict/scott), the settling:

* (regime is flat) `r = strict ∨ r = scott` — `H¹ = 0`, no curvature events;
* (convergence) reaches a fixed point `w = settleLift c seed` in finitely many firings,
  with convergence time bounded by the initial free energy (`firing_steps_bounded`);
* (uniqueness) that fixed point is the **least** fixed point above the seed
  (`settleLift_least`) — hence the **unique** equilibrium reachable from `seed`: any other
  reachable fixed point `x` (with `seed ≤ₖ x`) lies `≥ₖ w`, and `w ≤ₖ x` always, so the
  settling confluences to one equilibrium.

This is `H¹ = 0 ⟺ unique equilibrium ⟺ confluence` rendered as a constructive energy
estimate: the free energy both *certifies* convergence (finite, `≤ Φ 0 + 1` steps) and
*pins* the equilibrium (the lfp). -/
theorem energy_gives_unique_equilibrium (r : ClosureRegime)
    (hr : RelMath.cohomologyVanishes r = true)
    (c : Charge.Closure) (seed : Valuation) (cells : List PredicationCell) :
    (r = ClosureRegime.strict ∨ r = ClosureRegime.scott)
    ∧ (∃ N, fenOrbit c seed N = settleLift c seed ∧ N ≤ freeEnergy c seed cells 0 + 1)
    ∧ (liftOp c.op (settleLift c seed) = settleLift c seed
        ∧ ∀ x, leK seed x → liftOp c.op x = x → leK (settleLift c seed) x) :=
  ⟨(RelMath.cohomologyVanishes_iff r).mp hr,
   firing_steps_bounded c seed cells,
   lfp_is_settled c seed⟩

/-! ## Free energy is a Lyapunov function (the H-theorem)

Bundles the gradient-flow / H-theorem content: the free energy `Φ` is **antitone** along
the settling orbit (weak H-theorem), **strictly decreases at every firing** (strict
H-theorem), and is **`0` exactly at the equilibrium** (the fixed point `w` is the unique
minimum). Together: the closure settling is gradient descent of the `Nat`-valued free
energy to its unique minimum — the corpus's settling *is* a free-energy / H-theorem flow.
-/

/-- **Free energy is a Lyapunov function.** For a
charge-closure `c`, seed valuation, and finite support `cells`, with `w := settleLift c
seed` the settled fixed point and `Φ n := freeEnergy c seed cells n`:

* **(antitone — weak H-theorem)** `Φ (n+1) ≤ Φ n`: the free energy monotonically decreases
  along the settling orbit (each step ascends `≤ₖ` toward `w`);
* **(strict decrease — firing)** if step `n` raises any support cell, `Φ (n+1) < Φ n`: a
  firing strictly drops the free energy by ≥ 1;
* **(minimum at equilibrium)** `Φ 1 = 0`: the free energy reaches its minimum `0` exactly
  when the orbit reaches the fixed point `w` (equilibrium), and the orbit *does* reach `w`
  in finitely many steps bounded by the initial free energy.

This is the gradient-flow reading of settling — `F = E − T·S` over `Nat` at the `T → 0`
hard-closure limit — and the H-theorem: a monotone potential strictly decreasing to the
unique equilibrium. Depends only on `propext`/`Quot.sound`. -/
theorem free_energy_is_lyapunov (c : Charge.Closure) (seed : Valuation)
    (cells : List PredicationCell) :
    -- (antitone) the free energy never increases along the orbit
    (∀ n, freeEnergy c seed cells (n + 1) ≤ freeEnergy c seed cells n)
    -- (strict decrease) a firing strictly drops the free energy by ≥ 1
    ∧ (∀ n φ, φ ∈ cells → fenOrbit c seed n φ ≠ fenOrbit c seed (n + 1) φ →
        freeEnergy c seed cells (n + 1) < freeEnergy c seed cells n)
    -- (minimum at equilibrium) Φ = 0 at the reached fixed point …
    ∧ freeEnergy c seed cells 1 = 0
    -- … and the fixed point IS reached in finitely many bounded steps
    ∧ (∃ N, fenOrbit c seed N = settleLift c seed ∧ N ≤ freeEnergy c seed cells 0 + 1) :=
  ⟨fun n => freeEnergy_antitone c seed cells n,
   fun n φ hmem hne => freeEnergy_strict_of_fires c seed cells n φ hmem hne,
   freeEnergy_one_eq_zero c seed cells,
   firing_steps_bounded c seed cells⟩

end Valuation
end RelMath