import Infomaterial.Calculus.Real.Internal

/-!
# DensityFunctionalFlow — liquid: DFT minimizer is a DDFT fixed point (DERIVED)

The liquid frontier (`…/infomaterial_gases_liquids_plasmas_proof_frontier.md`, §3.2.2) asks for classical
density-functional theory as fixed-point / free-energy minimization: the equilibrium density minimizes
the grand potential `Ω[ρ] = F[ρ] + ∫(V_ext − μ)ρ`, and dynamic DFT relaxes the density down the
free-energy gradient. The two structural facts — **minimizer = fixed point** and **the gradient flow
lowers the free energy** — hold for any descent with a real-valued free energy.

A `DFTFlow` bundles a state space, a **rational (internal-real) free energy** `Ω : State → ℚ` (the
repository's `Infomaterial.Real.Internal.Rat`), and a DDFT descent `step` that never raises `Ω` and changes
it whenever it actually moves. Then a minimizer of `Ω` is a fixed point of the flow
(`minimizer_is_equilibrium`), and `Ω` is monotonically non-increasing along the relaxation
(`orbit_Omega_antitone`, `orbit_Omega_le_init`) — the deterministic skeleton of DDFT.

This is the order/Lyapunov content with a genuine rational free energy (contrast the `Nat`-valued
`Flow.FreeEnergyLyapunov`). The continuum variational calculus (functional derivatives, convexity of
`F[ρ]` over `L¹` densities, existence of the minimizer) is the analytic layer above the reals.

## Main definitions
* `DFTFlow` — a state space with a rational free energy and a DDFT descent step.
* `IsEquilibrium`, `IsMinimizer`, `orbit` — fixed points, minimizers, the relaxation trajectory.

## Main results
* `minimizer_is_equilibrium` — a free-energy minimizer is a fixed point of the DDFT flow.
* `orbit_Omega_antitone` / `orbit_Omega_le_init` — DDFT lowers the free energy monotonically.
* `equilibrium_orbit_const` — the relaxation rests at an equilibrium density.

## References
`content/.../infomaterial_gases_liquids_plasmas_proof_frontier.md` §3.2.2. Companion to the `Nat`-valued
`Flow.FreeEnergyLyapunov`; free energy valued in `Infomaterial.Real.Internal.Rat` (ℚ).

## Tags
density functional theory, DDFT, free energy, gradient flow, fixed point, rational
-/

namespace Infomaterial
namespace Relational.Liquid

/-- A **density-functional descent flow**: a state space, a **rational** grand-potential free energy
`Ω`, and a DDFT gradient step that never raises `Ω` and changes it whenever it genuinely moves. -/
structure DFTFlow where
  State : Type
  Omega : State → Real.Internal.Rat
  step : State → State
  step_le : ∀ s, Omega (step s) ≤ Omega s
  step_settles : ∀ s, Omega (step s) = Omega s → step s = s

/-- A state is an **equilibrium density** when the DDFT flow leaves it fixed. -/
def IsEquilibrium (F : DFTFlow) (s : F.State) : Prop := F.step s = s

/-- A state **minimizes** the free energy. -/
def IsMinimizer (F : DFTFlow) (s : F.State) : Prop := ∀ t, F.Omega s ≤ F.Omega t

/-- **The DFT minimizer is a DDFT fixed point.** A free-energy minimizer is left fixed by the gradient
flow: any genuine step would lower `Ω`, contradicting minimality. -/
theorem minimizer_is_equilibrium (F : DFTFlow) (s : F.State) (h : IsMinimizer F s) :
    IsEquilibrium F s :=
  F.step_settles s (Real.Internal.Rat.le_antisymm (F.step_le s) (h (F.step s)))

/-- The **relaxation trajectory**: iterating the DDFT step. -/
def orbit (F : DFTFlow) (s : F.State) : Nat → F.State
  | 0 => s
  | (n + 1) => F.step (orbit F s n)

/-- **DDFT lowers the free energy** at every step. -/
theorem orbit_Omega_antitone (F : DFTFlow) (s : F.State) (n : Nat) :
    F.Omega (orbit F s (n + 1)) ≤ F.Omega (orbit F s n) :=
  F.step_le (orbit F s n)

/-- **The free energy along the whole relaxation stays below its initial value** — the DDFT H-theorem
(free energy as Lyapunov function). -/
theorem orbit_Omega_le_init (F : DFTFlow) (s : F.State) (n : Nat) :
    F.Omega (orbit F s n) ≤ F.Omega s := by
  induction n with
  | zero => exact Real.Internal.Rat.le_refl _
  | succ n ih => exact Real.Internal.Rat.le_trans (F.step_le (orbit F s n)) ih

/-- **The relaxation rests at equilibrium**: from an equilibrium density the trajectory stays put. -/
theorem equilibrium_orbit_const (F : DFTFlow) (s : F.State) (h : IsEquilibrium F s) (n : Nat) :
    orbit F s n = s := by
  induction n with
  | zero => rfl
  | succ n ih => show F.step (orbit F s n) = s; rw [ih]; exact h

/-- The **already-equilibrated flow** inhabits `DFTFlow` (every density is a fixed point and a
minimizer) — the structure is non-vacuous. -/
def settledFlow : DFTFlow where
  State := Unit
  Omega := fun _ => 0
  step := id
  step_le := fun _ => Real.Internal.Rat.le_refl _
  step_settles := fun _ _ => rfl

end Relational.Liquid
end Infomaterial
