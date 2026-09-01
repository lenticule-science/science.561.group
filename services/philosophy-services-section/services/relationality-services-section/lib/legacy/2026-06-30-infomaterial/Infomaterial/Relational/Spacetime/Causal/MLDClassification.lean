import Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness
import Infomaterial.Relational.Spacetime.Support.Polarization

/-!
# Causal MLD classification — the causal H¹ class is the MLD classifying invariant

The abstract aperiodic theory already carries the **MLD classification** programme: a settling's
classifying invariant is its `cl-inv` (`H¹`) class, two settlings are cohomologically equivalent iff
their `cl-inv` agree (`CohFramework.clInvEquiv`), the structural MLD relation **refines** that
equality (`CohFramework.mld_refines_clInvEquiv` — Step 3), and the converse — that equal `cl-inv`
forces an MLD — is the open classification (`thm:aperiodic-mld-classification`, red for the transfinite
`κ ≥ ω₁` carrier). This module exhibits the **concrete causal-cohomology** realization of that
programme and shows it runs in lockstep.

The causal `H¹` (`CausalCohomology` / `CausalCohomologyN`) is the chromatic `cl-inv` obstruction:
two cochains carry the **same `H¹` class** when they differ by a coboundary (`SameClass`). This is an
equivalence relation (cohomology is a congruence), and — the load-bearing fact — it is preserved by
the **factor-map pullback**: a map `f : E' → E` (the morphism under an MLD / sliding-block code) sends
same-class cochains to same-class cochains (`pullback_sameClass`, from
`Spacetime.Dimension.Manifoldlikeness.pullback_coboundary`). So the causal `H¹` class is an **MLD-invariant** — the
concrete Step 3, in lockstep with the abstract `mld_refines_clInvEquiv`. On the flat side the obstruction
collapses exactly as in the abstract framework: a global (`Bool`) polarization — the trivial `cl-inv` —
exists iff the causal graph is **bipartite** (`flat_clinv_collapse`, reusing
`CausalPolarization`), the obstruction being the odd causal cycle.

The two programmes therefore share both halves: the **invariance** (Step 3) is green here and abstractly,
and the **completeness** (equal `H¹` ⟹ MLD, the transfinite converse) is the one open node
`thm:aperiodic-mld-classification` in both. The causal light-cone cohomology and the aperiodic MLD
classification are the same object, the same proven invariance, and the same open completeness.

## Main definitions

* `SameClass` — two causal cochains carry the same `H¹` class (differ by a coboundary).

## Main results

* `sameClass_refl` / `sameClass_symm` / `sameClass_trans` — `SameClass` is an equivalence relation.
* `pullback_sameClass` — factor-map pullback preserves the `H¹` class: the causal `cl-inv` is
  MLD-invariant (the concrete Step 3).
* `flat_clinv_collapse` — the obstruction collapses iff bipartite (the flat trivial-class collapse).
* `causal_mld_classification` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`; `content/.../mutually-locally-derivable`. Built on
`Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness` and `Infomaterial.Relational.Spacetime.Support.Polarization`; the causal
realization of `Infomaterial.CohFramework` and `thm:aperiodic-mld-classification`.

## Tags

MLD classification, cl-inv, H1, classifying invariant, factor map, cohomological equivalence, causal set
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.MLDClassification

open Infomaterial.Relational.Spacetime.Causal.Cohomology.N
open Infomaterial.Relational.Spacetime.Dimension.Manifoldlikeness

variable {E E' : Type}

/-! ## (A) Coboundary linearity -/

/-- The coboundary of the zero cochain vanishes. -/
theorem delta_zero (σ : List E) : delta (fun _ : List E => (0 : Int)) σ = 0 := by
  induction σ with
  | nil => rfl
  | cons a τ ih => simp only [delta_cons]; rw [ih]; omega

/-- `δ` is additive on sums (the companion of `Spacetime.Causal.Cohomology.N.delta_sub`). -/
theorem delta_add (f g : Cochain E) (σ : List E) :
    delta (fun l => f l + g l) σ = delta f σ + delta g σ := by
  induction σ generalizing f g with
  | nil => rfl
  | cons a τ ih =>
    simp only [delta_cons]
    rw [ih (fun l => f (a :: l)) (fun l => g (a :: l))]
    omega

/-- `δ` commutes with negation. -/
theorem delta_neg (f : Cochain E) (σ : List E) :
    delta (fun l => - f l) σ = - delta f σ := by
  induction σ generalizing f with
  | nil => rfl
  | cons a τ ih =>
    simp only [delta_cons]
    rw [ih (fun l => f (a :: l))]
    omega

/-! ## (B) The `H¹`-class equivalence -/

/-- Two causal cochains carry the **same `H¹` class** when their difference is a coboundary — the
`cl-inv` classifying datum. The equivalence whose quotient is `H¹`. -/
def SameClass (φ ψ : Cochain E) : Prop := Coboundary (fun l => φ l - ψ l)

/-- **`SameClass` is reflexive.** A cochain differs from itself by the zero coboundary. -/
theorem sameClass_refl (φ : Cochain E) : SameClass φ φ := by
  refine ⟨fun _ => 0, ?_⟩
  funext l
  rw [delta_zero]
  omega

/-- **`SameClass` is symmetric.** Negate the primitive. -/
theorem sameClass_symm {φ ψ : Cochain E} (h : SameClass φ ψ) : SameClass ψ φ := by
  obtain ⟨χ, hχ⟩ := h
  refine ⟨fun l => - χ l, ?_⟩
  funext σ
  show ψ σ - φ σ = delta (fun l => - χ l) σ
  rw [delta_neg]
  have hc : delta χ σ = φ σ - ψ σ := by rw [← hχ]
  rw [hc]; omega

/-- **`SameClass` is transitive.** Add the primitives. -/
theorem sameClass_trans {φ ψ ρ : Cochain E} (h₁ : SameClass φ ψ) (h₂ : SameClass ψ ρ) :
    SameClass φ ρ := by
  obtain ⟨χ₁, h1⟩ := h₁
  obtain ⟨χ₂, h2⟩ := h₂
  refine ⟨fun l => χ₁ l + χ₂ l, ?_⟩
  funext σ
  show φ σ - ρ σ = delta (fun l => χ₁ l + χ₂ l) σ
  rw [delta_add]
  have e1 : delta χ₁ σ = φ σ - ψ σ := by rw [← h1]
  have e2 : delta χ₂ σ = ψ σ - ρ σ := by rw [← h2]
  rw [e1, e2]; omega

/-! ## (C) MLD-invariance — factor-map pullback preserves the `H¹` class -/

/-- **The causal `H¹` class is MLD-invariant.** The factor-map pullback `f^*` of a map `f : E' → E`
(the morphism under an MLD / sliding-block code) sends same-class cochains to same-class cochains:
`SameClass φ ψ → SameClass (f^*φ) (f^*ψ)`. The pullback of the primitive is a primitive of the pulled-
back difference (`Spacetime.Dimension.Manifoldlikeness.pullback_coboundary`). This is the **concrete Step 3** — the
causal realization of `CohFramework.mld_refines_clInvEquiv`: an MLD preserves the `cl-inv` class. -/
theorem pullback_sameClass (f : E' → E) {φ ψ : Cochain E} (h : SameClass φ ψ) :
    SameClass (pullback f φ) (pullback f ψ) :=
  pullback_coboundary f h

/-! ## (D) Flat collapse — the obstruction is the odd cycle -/

open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Combinatorics

/-- **The flat trivial-class collapse.** A global (`Bool`) polarization — a proper 2-colouring, the
trivial `cl-inv` — exists exactly when the causal graph is **bipartite**; the obstruction is an odd
causal cycle (`Spacetime.Support.Polarization.exists_bool_polarization_iff_bipartite`). This is the causal
analogue of `CohFramework.flat_settlings_collapse`: the flat regime collapses to the single trivial
`cl-inv` class, separated from the aperiodic stratum by the odd-cycle obstruction. -/
theorem flat_clinv_collapse (C : CausalSet E) :
    (∃ c : E → Bool, ProperColoring C.prec0 c) ↔ Bipartite C.prec0 :=
  Spacetime.Support.Polarization.exists_bool_polarization_iff_bipartite C

/-! ## (E) The bundled headline -/

/-- **Causal MLD classification.** The causal-cohomology `H¹` class is the MLD classifying invariant,
in lockstep with the abstract aperiodic programme (`CohFramework`):

* **`SameClass` is an equivalence relation** (`sameClass_refl`/`symm`/`trans`) — equality of `H¹`
  class is a congruence on causal cochains, the causal `clInvEquiv`;
* **it is MLD-invariant** (`pullback_sameClass`) — the factor-map pullback preserves the `H¹` class,
  the concrete Step 3 matching `CohFramework.mld_refines_clInvEquiv`: an MLD preserves `cl-inv`;
* **the flat regime collapses** (`flat_clinv_collapse`) — a global `Bool` polarization (trivial
  `cl-inv`) exists iff bipartite, the obstruction the odd causal cycle.

The remaining direction — that equal `H¹` class *forces* an MLD (completeness, the converse / Step 4) —
is the open classification `thm:aperiodic-mld-classification`, red for the transfinite `κ ≥ ω₁`
carrier, in the causal setting exactly as in the abstract one. So the light-cone `H¹` and the aperiodic
MLD classification share both their proven invariance and their single open completeness. -/
theorem causal_mld_classification :
    (∀ φ : Cochain E, SameClass φ φ)
    ∧ (∀ {φ ψ : Cochain E}, SameClass φ ψ → SameClass ψ φ)
    ∧ (∀ {φ ψ ρ : Cochain E}, SameClass φ ψ → SameClass ψ ρ → SameClass φ ρ)
    ∧ (∀ (f : E' → E) (φ ψ : Cochain E), SameClass φ ψ → SameClass (pullback f φ) (pullback f ψ))
    ∧ (∀ (C : CausalSet E),
        (∃ c : E → Bool, ProperColoring C.prec0 c) ↔ Bipartite C.prec0) :=
  ⟨sameClass_refl,
   fun h => sameClass_symm h,
   fun h₁ h₂ => sameClass_trans h₁ h₂,
   fun f _ _ h => pullback_sameClass f h,
   fun C => flat_clinv_collapse C⟩

end Relational.Spacetime.Causal.MLDClassification
end Infomaterial
