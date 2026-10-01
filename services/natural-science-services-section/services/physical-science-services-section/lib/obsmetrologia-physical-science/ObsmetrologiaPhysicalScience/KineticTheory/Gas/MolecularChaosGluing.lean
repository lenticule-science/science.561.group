import Obsmetrologia.Calculus.Real.Internal

/-!
# MolecularChaosGluing — gas: molecular chaos as separated gluing (DERIVED)

The kinetic-gas frontier (`…/obsmetrologia_gases_liquids_plasmas_proof_frontier.md`, §3.1.2 / Batch B) asks
for molecular chaos (Boltzmann's *Stosszahlansatz*, propagation of chaos) as a **vanishing obstruction**:
precollisional two-particle data **factorize** into a product of one-particle data, and the obstruction
to factorization is a connected-correlation class — the kinetic analogue of a nonzero `H¹`.

A two-particle (unnormalized) distribution is a `Joint = V → V → Int`. **Molecular chaos** is
`Factorizes J : ∃ p q, J(v,w) = p(v)·q(w)` — the joint is the **separated gluing** `glue p q` of two
single-particle sections. The obstruction is the **connected correlation** `corr` — the `2×2` minor
`J(a,c)·J(b,d) − J(a,d)·J(b,c)`, the discrete truncated two-point function: a joint factorizes (is
rank-1) exactly when every such minor vanishes. We prove the obstruction direction — **molecular chaos
forces every correlation minor to vanish** (`H¹ = 0` projection) — and exhibit a maximally-correlated joint
whose nonzero correlation provably **obstructs** factorization (the *Stosszahlansatz* fails). The minor
is a cocycle: antisymmetric under exchanging the two particles.

This is the finite combinatorial obstruction, the kinetic instance of `Cohomology.SettlingCohomologyH1`
/ `Flow.CurvatureRegime.vanishes_iff_flat` (`H¹ = 0 ⟺ flat ⟺ gluing unobstructed`); the
rank-1 *reconstruction* (decorrelated ⟹ factorizes) and Lanford's propagation-of-chaos theorem over a
continuum are the harder converse / not-visible analytic layer.

## Main definitions
* `Joint`, `Factorizes` — a two-particle distribution and molecular chaos (factorization).
* `corr`, `Decorrelated` — the connected-correlation minor (the obstruction) and its vanishing.
* `glue` — the separated gluing of two single-particle sections.

## Main results
* `factorizes_imp_decorrelated` — molecular chaos ⟹ every correlation minor vanishes (the `H¹=0` projection).
* `corr_swap_particles` — the correlation minor is antisymmetric under particle exchange (a cocycle).
* `glue_factorizes` — the gluing of two sections is molecular-chaos (factorized).
* `epr_not_factorizes` — a maximally-correlated joint cannot factorize (the obstruction has teeth).

## References
`content/.../obsmetrologia_gases_liquids_plasmas_proof_frontier.md` §3.1.2, Red node `MolecularChaosAsGluing`.
The conserved-quantity companion is `KineticTheory.Gas.DiscreteVelocityCollision`.

## Tags
molecular chaos, propagation of chaos, factorization, connected correlation, gluing, obstruction
-/

namespace Obsmetrologia
namespace KineticTheory.Gas

/-- A two-particle (unnormalized) **joint distribution**. -/
abbrev Joint (V : Type) : Type := V → V → Int

/-- **Molecular chaos**: the joint factorizes into a product of single-particle distributions
`J(v,w) = p(v)·q(w)` (the Boltzmann *Stosszahlansatz*). -/
def Factorizes {V : Type} (J : Joint V) : Prop := ∃ p q : V → Int, ∀ v w, J v w = p v * q w

/-- The **connected correlation** of a joint: the `2×2` minor `J(a,c)·J(b,d) − J(a,d)·J(b,c)`, the
discrete truncated two-point function and the obstruction to factorization. -/
def corr {V : Type} (J : Joint V) (a b c d : V) : Int := J a c * J b d - J a d * J b c

/-- A joint is **decorrelated** when every connected-correlation minor vanishes. -/
def Decorrelated {V : Type} (J : Joint V) : Prop := ∀ a b c d, corr J a b c d = 0

/-- **Molecular chaos forces every correlation minor to vanish** — the obstruction direction
(`H¹ = 0` projection): a factorized joint is rank-1, so all `2×2` minors are zero. -/
theorem factorizes_imp_decorrelated {V : Type} (J : Joint V) (h : Factorizes J) :
    Decorrelated J := by
  obtain ⟨p, q, hpq⟩ := h
  intro a b c d
  unfold corr
  rw [hpq a c, hpq b d, hpq a d, hpq b c]
  iring

/-- **The correlation minor is a cocycle**: exchanging the two particles flips its sign. -/
theorem corr_swap_particles {V : Type} (J : Joint V) (a b c d : V) :
    corr J a b c d = - corr J b a c d := by
  unfold corr; iring

/-- The **separated gluing** of two single-particle sections into a joint: `glue p q (v,w) = p(v)·q(w)`. -/
def glue {V : Type} (p q : V → Int) : Joint V := fun v w => p v * q w

/-- **The gluing of two sections is molecular-chaos** (factorized) — molecular chaos *is* the separated
gluing of the marginals. -/
theorem glue_factorizes {V : Type} (p q : V → Int) : Factorizes (glue p q) :=
  ⟨p, q, fun _ _ => rfl⟩

/-! ## The obstruction has teeth: a correlated joint cannot factorize -/

/-- A **maximally-correlated joint** on two states (the identity matrix `[[1,0],[0,1]]` — perfectly
correlated particles). -/
def eprJoint : Joint (Fin 2) := fun v w => if v = w then 1 else 0

/-- Its connected correlation is nonzero. -/
theorem epr_corr_one : corr eprJoint 0 1 0 1 = 1 := by decide

/-- **A correlated joint cannot satisfy molecular chaos.** Perfect correlation is an obstruction
to factorization — the *Stosszahlansatz* fails. -/
theorem epr_not_factorizes : ¬ Factorizes eprJoint := by
  intro h
  have h0 := factorizes_imp_decorrelated eprJoint h 0 1 0 1
  rw [epr_corr_one] at h0
  exact absurd h0 (by decide)

end KineticTheory.Gas
end Obsmetrologia
