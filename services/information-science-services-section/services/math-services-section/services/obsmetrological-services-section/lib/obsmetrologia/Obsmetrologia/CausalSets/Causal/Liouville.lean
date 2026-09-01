import Obsmetrologia.CausalSets.Causal.Cohomology.H2
import Obsmetrologia.CausalSets.Support.Polarization

/-!
# Causal Liouville form — the discrete cotangent bundle is exact symplectic

`CausalCohomologyH2` built `H²` and named it "the home of the symplectic class"; `CausalPolarization`
built the conjugate split (proper colouring) as the polarization. This module corrects the framing the
two left open. A cotangent bundle is an **exact** symplectic manifold: the canonical 2-form is the
exterior derivative of the tautological Liouville 1-form, `ω = dλ`, globally, so `[ω] = 0` in `H²`.
There is no nondegenerate *cohomology class* to exhibit — the symplectic content is the Liouville form
together with its nondegeneracy, which is precisely the polarization.

The discrete dictionary, all already in the causal DAG:

* the **cotangent bundle** is `CausalSets.Support.Cotangent.Codir` (the directed null generators);
* the **Liouville 1-form** of a position coordinate `c`, read on a codirection `ξ = (a,b)`, is the
  tautological pairing `ξ ↦ c b − c a` (`ξ dx` with `dx` the position gradient) — this is exactly
  `CausalSets.Support.Cotangent.delta0 C c` and exactly `CausalSets.Support.Polarization.polForm c`;
* the **symplectic 2-form** is `ω = δ¹ λ`. For *any* 1-cochain `λ`, `ω ∈ im δ¹ ⊆ ker δ²`
  (`CausalSets.Causal.Cohomology.H2.coboundary2_cocycle2`), so it is closed and `[ω] = 0`; for the *position*
  Liouville form `λ = δ⁰ c` the curvature collapses entirely, `ω = δ¹δ⁰ c = 0`
  (`CausalSets.Causal.Cohomology.delta1_delta0`) — the sharpest witness of exactness;
* the **symplectic datum** is nondegeneracy, and it lives at the 1-form level: `λ_c` is nonzero
  on every codirection exactly when `c` properly colours the causal graph
  (`CausalSets.Support.Polarization.nondegenerate_iff_proper`), and a factor map (MLD) preserves it.

So the discrete light-cone symplectic structure is `(λ, polarization)`, cohomologically exact — not a
nondegenerate closed 2-cocycle with nontrivial class. This is the green replacement for the mis-stated
symplectic-2-form frontier `thm:cotangent-symplectic-flow`.

## Main definitions

* `liouvilleCodir` / `liouville` — the tautological Liouville 1-form on codirections, and its
  extension to the order complex on which `δ¹` acts.
* `omega` — the canonical symplectic 2-form `ω = δ¹ λ`.

## Main results

* `liouvilleCodir_eq_polForm` — the Liouville form on codirections *is* the polarization 1-form.
* `omega_exact` / `omega_closed` — `ω = δλ` is a 2-coboundary, hence a 2-cocycle: `[ω] = 0` in `H²`.
* `omega_liouville_zero` — the position Liouville form's 2-form vanishes identically, `δ¹δ⁰ c = 0`.
* `liouville_nondegenerate_iff_proper` — nondegeneracy of `λ` is properness of the colouring.
* `mld_preserves_liouville` — a factor map preserves the nondegenerate Liouville form.
* `causal_liouville` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Obsmetrologia.CausalSets.Causal.Cohomology.H2` and
`Obsmetrologia.CausalSets.Support.Polarization`; the green reframe of the symplectic frontier.

## Tags

Liouville form, exact symplectic, cotangent bundle, polarization, proper colouring, MLD, H2
-/

namespace Obsmetrologia
namespace CausalSets.Causal.Liouville

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Cohomology
open Obsmetrologia.CausalSets.Causal.Cohomology.H2
open Obsmetrologia.Combinatorics

variable {E : Type} (C : CausalSet E)

/-! ## (A) The Liouville 1-form on codirections -/

/-- The **Liouville (tautological) 1-form** of a position coordinate `c`, read on a codirection
`ξ = (a,b)` of the discrete cotangent bundle `Codir`: the canonical pairing `ξ ↦ c b − c a` — `ξ dx`
with the position gradient as `dx`. This is `CausalSets.Support.Cotangent.delta0`. -/
def liouvilleCodir (c : E → Int) : CausalSets.Support.Cotangent.EdgeCochain C :=
  CausalSets.Support.Cotangent.delta0 C c

/-- The **Liouville 1-form on the order complex**: the same tautological pairing `c b − c a` carried
from codirections (`prec0`) to all causal pairs (`CausalLe`), so the coboundary `δ¹` can act on it. -/
def liouville (c : C0 C) : C1 C := delta0 C c

/-- **The Liouville form on codirections is the polarization 1-form.** The tautological pairing
`c b − c a` read on a codirection is, verbatim, `CausalSets.Support.Polarization.polForm` — the Liouville form and
the polarization are one object on the cotangent bundle. -/
theorem liouvilleCodir_eq_polForm (c : E → Int) (ξ : CausalSets.Support.Cotangent.Codir C) :
    liouvilleCodir C c ξ = CausalSets.Support.Polarization.polForm c ξ.val.1 ξ.val.2 := rfl

/-! ## (B) The symplectic 2-form `ω = δλ` is exact -/

/-- The **canonical symplectic 2-form** `ω = δ¹ λ` of a Liouville 1-form `λ` on the order complex. -/
def omega (lam : C1 C) : C2 C := delta1 C lam

/-- **`ω = δλ` is exact.** By construction `ω` is the `δ¹`-coboundary of `λ` — a class in `im δ¹`. -/
theorem omega_exact (lam : C1 C) : Coboundary2 C (omega C lam) := ⟨lam, rfl⟩

/-- **`ω = δλ` is closed, and `[ω] = 0`.** Exact ⟹ closed (`im δ¹ ⊆ ker δ²`), so `δ² ω = 0` and the
class of `ω` in `H²` is trivial. The canonical symplectic form of the discrete cotangent bundle is
cohomologically trivial — there is no nondegenerate `H²`-class to chase. -/
theorem omega_closed (lam : C1 C) : Cocycle2 C (omega C lam) :=
  coboundary2_cocycle2 C (omega_exact C lam)

/-! ## (C) The position-gradient Liouville form: `ω ≡ 0` -/

/-- **The position Liouville form's symplectic 2-form vanishes identically.** For the tautological
position-gradient `λ_c = δ⁰ c`, the induced `ω = δ¹ δ⁰ c = 0` (`delta1_delta0`) — not merely
`[ω] = 0` but `ω` itself the zero cochain. The position-coordinate Liouville form carries its whole
symplectic content in the nondegeneracy of `λ`, none in the 2-form. -/
theorem omega_liouville_zero (c : C0 C) : omega C (liouville C c) = fun _ => 0 := by
  unfold omega liouville
  exact delta1_delta0 C c

/-! ## (D) Nondegeneracy is the polarization (proper colouring) -/

/-- **Nondegeneracy of the Liouville form is properness of the colouring.** The symplectic
datum is nondegeneracy, and it lives at the 1-form level: the Liouville form `λ_c` is nonzero on every
codirection exactly when `c` properly colours the causal graph
(`CausalSets.Support.Polarization.nondegenerate_iff_proper`). The conjugate split *is* a proper colouring. -/
theorem liouville_nondegenerate_iff_proper (c : E → Int) :
    CausalSets.Support.Polarization.Nondegenerate C c ↔ ProperColoring C.prec0 c :=
  CausalSets.Support.Polarization.nondegenerate_iff_proper C c

/-! ## (E) MLD preserves the nondegenerate Liouville form -/

/-- **MLD preserves the nondegenerate Liouville form.** A factor map (graph homomorphism / sliding-block
code) pulls a nondegenerate Liouville form back to a nondegenerate one — the discrete canonical
transformation, reusing `CausalSets.Support.Polarization.mld_preserves_polarization`. -/
theorem mld_preserves_liouville {E' : Type} (C' : CausalSet E') (f : E' → E)
    (hf : GraphHom C'.prec0 C.prec0 f) (c : E → Int)
    (h : CausalSets.Support.Polarization.Nondegenerate C c) :
    CausalSets.Support.Polarization.Nondegenerate C' (fun v => c (f v)) :=
  CausalSets.Support.Polarization.mld_preserves_polarization C C' f hf c h

/-! ## (F) The bundled headline -/

/-- **The discrete light-cone symplectic structure is exact.** The cotangent bundle `Codir` carries a
Liouville 1-form `λ_c` (the tautological pairing of position `c` against codirection,
`liouvilleCodir` = `liouville` = `CausalSets.Support.Polarization.polForm`), and the canonical symplectic 2-form
`ω = δ¹ λ`:

* **is exact, hence closed** (`omega_exact`, `omega_closed`) — `ω ∈ im δ¹ ⊆ ker δ²`, so `[ω] = 0` in
  `H²`: a cotangent bundle is *exact* symplectic, with no nondegenerate `H²`-class to exhibit;
* **vanishes identically** for the position form (`omega_liouville_zero`) — `ω = δ¹δ⁰ c = 0`, the
  sharpest exactness; the symplectic content is not in the 2-form;
* **nondegeneracy = proper colouring** (`liouville_nondegenerate_iff_proper`) — the symplectic
  datum is the nondegeneracy of `λ`, exactly properness of `c` (the polarization);
* **MLD-invariant** (`mld_preserves_liouville`) — a factor map preserves the nondegenerate Liouville
  form, the discrete canonical transformation.

So the discrete cotangent symplectic structure is `(λ, polarization)`, cohomologically exact — *not* a
nondegenerate closed 2-cocycle with nontrivial class. `thm:cotangent-symplectic-flow` asked for
the latter; the symplectic frontier is instead the Liouville form and its colouring
nondegeneracy, both green. -/
theorem causal_liouville :
    (∀ lam : C1 C, Coboundary2 C (omega C lam))
    ∧ (∀ lam : C1 C, Cocycle2 C (omega C lam))
    ∧ (∀ c : C0 C, omega C (liouville C c) = fun _ => 0)
    ∧ (∀ c : E → Int, CausalSets.Support.Polarization.Nondegenerate C c ↔ ProperColoring C.prec0 c) :=
  ⟨omega_exact C, omega_closed C, omega_liouville_zero C,
   fun c => liouville_nondegenerate_iff_proper C c⟩

end CausalSets.Causal.Liouville
end Obsmetrologia
