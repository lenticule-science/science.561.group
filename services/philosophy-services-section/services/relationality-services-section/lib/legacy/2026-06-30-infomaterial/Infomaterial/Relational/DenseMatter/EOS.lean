/-!
# EOS — the neutron-matter regime: equation-of-state admissibility (DERIVED)

The dense-matter map (`…/infomaterial_frontier_map_blackhole_quark_neutron_2026-06-27.md`, §13.1) asks for a
finite equation-of-state admissibility module: a neutron-star EOS must be **stable** (`dP/dε ≥ 0`,
pressure rises with energy density) and **causal** (sound speed `c_s² = dP/dε ≤ c²`). The continuum EOS
is a real function with derivatives; the admissibility *constraints* are order/arithmetic facts that a
finite sampled EOS already carries — exactly the repository's strength.

A `FiniteEOS` is sampled pressure/energy over a finite list of states. `StableEOS` is monotone
pressure; `CausalEOS c²` bounds each pressure increment by `c²` times the energy increment. The
constraints have teeth (a super-stiff EOS fails causality), compose into a speed bound, and pin the
incompressible limit (`c² = 0` ∧ stable ⟹ uniform pressure).

This is finite sampled EOS admissibility, not nuclear physics: the real TOV structure equations,
χEFT interactions, and many-body Hilbert spaces are the not-visible analytic layer (§14).

## Main definitions
* `FiniteEOS`, `StableEOS`, `CausalEOS`, `Admissible` — sampled EOS and its admissibility constraints.

## Main results
* `incompressible_of_causal_zero` — a stable EOS with `c² = 0` has uniform pressure (incompressible).
* `admissible_speed_bound` — pressure cannot outrun the causal sound-speed bound.
* `stiffEOS_admissible` / `superluminal_not_causal` — the constraints are inhabited and have teeth.
* `maxEOS_stable` — the pointwise-max of two stable EOS is stable.

## References
`content/.../infomaterial_frontier_map_blackhole_quark_neutron_2026-06-27.md` §13.1.

## Tags
neutron star, equation of state, stability, causality, sound speed
-/

namespace Infomaterial
namespace Relational.DenseMatter

/-- A **finite equation of state**: sampled pressure and energy density over a finite list of states
(indexed by `Nat`). -/
structure FiniteEOS where
  pressure : Nat → Nat
  energy : Nat → Nat
  samples : List Nat

/-- **Thermodynamic stability** `dP/dε ≥ 0`: pressure is monotone in the (energy-ordered) samples. -/
def StableEOS (E : FiniteEOS) : Prop :=
  ∀ a ∈ E.samples, ∀ b ∈ E.samples, a ≤ b → E.pressure a ≤ E.pressure b

/-- **Causality** `c_s² = dP/dε ≤ c²`: every pressure increment is bounded by `c²` times the energy
increment. -/
def CausalEOS (E : FiniteEOS) (c2 : Nat) : Prop :=
  ∀ a ∈ E.samples, ∀ b ∈ E.samples, a ≤ b →
    E.pressure b - E.pressure a ≤ c2 * (E.energy b - E.energy a)

/-- An **admissible** EOS is stable and causal. -/
def Admissible (E : FiniteEOS) (c2 : Nat) : Prop := StableEOS E ∧ CausalEOS E c2

/-- **The incompressible limit.** A stable EOS whose sound speed is zero (`c² = 0`) has uniform
pressure across the samples — stability forbids any drop, causality-at-zero forbids any rise. -/
theorem incompressible_of_causal_zero (E : FiniteEOS)
    (hs : StableEOS E) (hc : CausalEOS E 0)
    {a b : Nat} (ha : a ∈ E.samples) (hb : b ∈ E.samples) (hab : a ≤ b) :
    E.pressure a = E.pressure b := by
  have h1 := hs a ha b hb hab
  have h2 := hc a ha b hb hab
  simp only [Nat.zero_mul] at h2
  omega

/-- **The causal speed bound.** For an admissible EOS, pressure cannot outrun the sound-speed bound:
`P(b) ≤ P(a) + c²·(ε(b) − ε(a))`. -/
theorem admissible_speed_bound (E : FiniteEOS) (c2 : Nat) (h : Admissible E c2)
    {a b : Nat} (ha : a ∈ E.samples) (hb : b ∈ E.samples) (hab : a ≤ b) :
    E.pressure b ≤ E.pressure a + c2 * (E.energy b - E.energy a) := by
  have h1 := h.1 a ha b hb hab
  have h2 := h.2 a ha b hb hab
  omega

/-- The **stiff causal EOS** `P = ε` (sound speed exactly `c`, `c² = 1`). -/
def stiffEOS : FiniteEOS := { pressure := fun n => n, energy := fun n => n, samples := [0, 1, 2, 3] }

/-- The stiff EOS `P = ε` is admissible at `c² = 1` (the causal limit). -/
theorem stiffEOS_admissible : Admissible stiffEOS 1 := by
  refine ⟨?_, ?_⟩
  · intro a _ b _ hab; exact hab
  · intro a _ b _ hab; show b - a ≤ 1 * (b - a); omega

/-- A **superluminal EOS** `P = 2ε` (sound speed `√2·c`). -/
def superluminalEOS : FiniteEOS :=
  { pressure := fun n => 2 * n, energy := fun n => n, samples := [0, 1, 2, 3] }

/-- The constraint has teeth: the superluminal EOS `P = 2ε` is **not** causal at `c² = 1`. -/
theorem superluminal_not_causal : ¬ CausalEOS superluminalEOS 1 := by
  intro h
  have hc := h 0 (by decide) 1 (by decide) (by omega)
  simp [superluminalEOS] at hc

/-- The **pointwise max** of two EOS (sharing energy/samples). -/
def maxEOS (E1 E2 : FiniteEOS) : FiniteEOS :=
  { pressure := fun n => Nat.max (E1.pressure n) (E2.pressure n)
  , energy := E1.energy
  , samples := E1.samples }

/-- **Stability is preserved by the pointwise max**: the stiffer envelope of two stable EOS is stable
(a step toward closing the admissible set under constraints). -/
theorem maxEOS_stable (E1 E2 : FiniteEOS) (h1 : StableEOS E1)
    (h2 : ∀ a ∈ E1.samples, ∀ b ∈ E1.samples, a ≤ b → E2.pressure a ≤ E2.pressure b) :
    StableEOS (maxEOS E1 E2) := by
  intro a ha b hb hab
  have p1 := h1 a ha b hb hab
  have p2 := h2 a ha b hb hab
  show Nat.max (E1.pressure a) (E2.pressure a) ≤ Nat.max (E1.pressure b) (E2.pressure b)
  exact Nat.max_le.mpr
    ⟨Nat.le_trans p1 (Nat.le_max_left _ _), Nat.le_trans p2 (Nat.le_max_right _ _)⟩

end Relational.DenseMatter
end Infomaterial
