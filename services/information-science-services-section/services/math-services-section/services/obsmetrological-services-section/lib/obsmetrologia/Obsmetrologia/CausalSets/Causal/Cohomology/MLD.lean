import Obsmetrologia.CausalSets.Causal.Cohomology.N

/-!
# The geometric-MLD coboundary groupoid, in every degree Hⁿ

`CausalCohomologyN` built the graded causal complex with a single coboundary `δ` (`δ ∘ δ = 0`) for all
degrees at once. `CausalMLDClassification` read the degree-1 classifying relation `SameClass` (cochains
differing by a coboundary) and proved it an equivalence relation invariant under the factor-map pullback
(the concrete Step 3). This module lifts that relation to the **full graded complex**: the geometric-MLD
relation "differ by a coboundary" is an equivalence relation — a **morphism groupoid** whose arrows are
coboundaries — in **every degree** `Hⁿ`, proved from `δ`-linearity (`delta_sub`) alone, with no
degree-specific bookkeeping.

This is the cochain-level projection of the corpus's mutual-local-derivability — the invariant side (Step 3),
now in all degrees. It is **not** the completeness converse: here "differ by a coboundary" *is* the
definition of `Mld`, so it gives the groupoid of cohomology classes, not a proof that equal `cl-inv`
forces an invertible settling-morphism of the carriers (the substantive Step 4, abstractly discharged in
`AperiodicOrder.Tiling.GeometricMldComplete`; the carrier identification is `thm:aperiodic-mld-classification`).

## Main definitions

* `Mld` — geometric MLD on cochains: differ by a coboundary (the cohomology-class relation), any degree.

## Main results

* `delta_zero`, `coboundary_zero` — `δ` kills the zero cochain; the zero cochain is a coboundary.
* `mld_refl` / `mld_symm` / `mld_trans` — `Mld` is an equivalence relation in every degree (the
  coboundary groupoid: identity `0`, inverse `−χ`, composite `χ + η`).
* `cohomological_mld_groupoid` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`; the all-degree continuation of
`Obsmetrologia.CausalSets.Causal.MLDClassification` over `Obsmetrologia.CausalSets.Causal.Cohomology.N`.

## Tags

mutual local derivability, cohomology, coboundary, groupoid, Hn, equivalence relation
-/

namespace Obsmetrologia
namespace CausalSets.Causal.Cohomology.MLD

open Obsmetrologia.CausalSets.Causal.Cohomology.N

variable {E : Type}

/-! ## (A) The coboundary kills zero -/

/-- **`δ` annihilates the zero cochain.** By chain-length induction off the cone recursion. -/
theorem delta_zero (σ : List E) : delta (fun _ => (0 : Int)) σ = 0 := by
  induction σ with
  | nil => rfl
  | cons a τ ih =>
    rw [delta_cons]
    show (0 : Int) - delta (fun _ => (0 : Int)) τ = 0
    rw [ih]; omega

/-- **The zero cochain is a coboundary** (`δ 0 = 0`), so `Mld` is reflexive. -/
theorem coboundary_zero :
    Obsmetrologia.CausalSets.Causal.Cohomology.N.Coboundary (fun _ : List E => (0 : Int)) :=
  ⟨fun _ => 0, by funext σ; exact (delta_zero σ).symm⟩

/-! ## (B) Geometric MLD as a coboundary difference -/

/-- **Geometric mutual local derivability on cochains**: `φ` and `ψ` are MLD iff they **differ by a
coboundary** — there is a cochain `χ` with `φ − ψ = δχ`. On cocycles this is equality of `Hⁿ` classes;
the coboundary `χ` is the gauge between cohomologous representatives. This is the cochain-level (Step-3)
relation, in any degree — not the carrier-level completeness converse. -/
def Mld (φ ψ : Cochain E) : Prop :=
  Obsmetrologia.CausalSets.Causal.Cohomology.N.Coboundary (fun l => φ l - ψ l)

/-- **`Mld` is reflexive** — the identity arrow is the zero coboundary. -/
theorem mld_refl (φ : Cochain E) : Mld φ φ := by
  have h : (fun l => φ l - φ l) = (fun _ : List E => (0 : Int)) := by funext l; omega
  rw [Mld, h]; exact coboundary_zero

/-- **`Mld` is symmetric** — the inverse arrow is the negated coboundary `−χ`. -/
theorem mld_symm {φ ψ : Cochain E} (h : Mld φ ψ) : Mld ψ φ := by
  obtain ⟨χ, hχ⟩ := h
  refine ⟨fun l => 0 - χ l, ?_⟩
  funext σ
  have h1 : delta (fun l => (0 : Int) - χ l) σ = delta (fun _ => (0 : Int)) σ - delta χ σ :=
    delta_sub _ _ σ
  have h2 : delta χ σ = φ σ - ψ σ := by rw [← hχ]
  rw [h1, delta_zero, h2]; omega

/-- **`Mld` is transitive** — composed arrows add their coboundaries, `χ + η`. -/
theorem mld_trans {φ ψ ρ : Cochain E} (h : Mld φ ψ) (h' : Mld ψ ρ) : Mld φ ρ := by
  obtain ⟨χ, hχ⟩ := h
  obtain ⟨η, hη⟩ := h'
  refine ⟨fun l => χ l + η l, ?_⟩
  funext σ
  have hneg : delta (fun l => χ l - (0 - η l)) σ = delta χ σ - delta (fun l => 0 - η l) σ :=
    delta_sub _ _ σ
  have h0 : delta (fun l => (0 : Int) - η l) σ = delta (fun _ => (0 : Int)) σ - delta η σ :=
    delta_sub _ _ σ
  have hχσ : delta χ σ = φ σ - ψ σ := by rw [← hχ]
  have hησ : delta η σ = ψ σ - ρ σ := by rw [← hη]
  have hsum : (fun l => χ l + η l) = (fun l => χ l - (0 - η l)) := by funext l; omega
  rw [hsum, hneg, h0, delta_zero, hχσ, hησ]; omega

/-! ## (C) The headline -/

/-- **The geometric-MLD coboundary groupoid, in every degree.** On the graded causal `δ`-complex, the
geometric-MLD relation `Mld φ ψ := φ − ψ` is a coboundary is an **equivalence relation** — a morphism
groupoid whose arrows are coboundaries (identity `0`, inverse `−χ`, composite `χ + η`) — for **all
degrees** `Hⁿ` at once, proved from `δ`-linearity (`delta_sub`) alone. This lifts the degree-1
`SameClass` of `CausalMLDClassification` to the full graded complex. It is the invariant (Step-3) side;
the completeness converse — equal `cl-inv` forcing a settling-morphism of the carriers — is
`AperiodicOrder.Tiling.GeometricMldComplete` abstractly, `thm:aperiodic-mld-classification` for the carrier
identification, and is deliberately not asserted here. -/
theorem cohomological_mld_groupoid :
    (∀ φ : Cochain E, Mld φ φ)
    ∧ (∀ φ ψ : Cochain E, Mld φ ψ → Mld ψ φ)
    ∧ (∀ φ ψ ρ : Cochain E, Mld φ ψ → Mld ψ ρ → Mld φ ρ) :=
  ⟨mld_refl, fun _ _ h => mld_symm h, fun _ _ _ h h' => mld_trans h h'⟩

end CausalSets.Causal.Cohomology.MLD
end Obsmetrologia
