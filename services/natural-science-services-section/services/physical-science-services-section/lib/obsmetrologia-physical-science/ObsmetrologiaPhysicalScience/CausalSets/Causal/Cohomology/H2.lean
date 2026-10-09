import ObsmetrologiaPhysicalScience.CausalSets.Causal.Cohomology

/-!
# Causal Ȟ² — the degree-2 cohomology of the causal order complex

`CausalCohomology` built the complex `C⁰ → C¹ → C²` with `δ⁰`, `δ¹` and `δ¹ ∘ δ⁰ = 0`, giving `H¹`.
This module extends it one degree: the **3-simplices** (composable chains `a ≤ b ≤ c ≤ d`), the
degree-2 coboundary `δ²` as the alternating sum over their four faces, and the next cochain identity

  `δ² ∘ δ¹ = 0`

so that `H² = ker δ² / im δ¹` is well-defined — the causal set's **Ȟ²**, the degree-2 gluing
obstruction.

This is also the home of the symplectic 2-form. A symplectic structure is a **closed 2-form**: a
2-cochain `ω` with `δ² ω = 0` (a 2-cocycle), and its class `[ω] ∈ H²`. So reaching `Ȟ²` builds the
cohomological home the symplectic frontier (`thm:cotangent-symplectic-flow`) needs to even state the
closedness of `ω`; the remaining piece is exhibiting a *nondegenerate* such cocycle.

## Main definitions

* `ThreeSimplex` — a composable causal chain `a ≤ b ≤ c ≤ d`.
* `face0`–`face3` — the four 2-simplex faces of a 3-simplex (omit one vertex).
* `delta2` — the degree-2 coboundary `C² → C³`.
* `Cocycle2` / `Coboundary2` — closed and exact 2-cochains; a `Closed2Form` is a 2-cocycle.

## Main results

* `delta2_delta1` — the cochain identity `δ² ∘ δ¹ = 0`.
* `coboundary2_cocycle2` — every 2-coboundary is a 2-cocycle (`im δ¹ ⊆ ker δ²`), so `H²` is defined.
* `symplectic_form_class_in_h2` — a closed 2-form is a 2-cocycle, its class living in `H²`.
* `causal_cohomology_h2` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Obsmetrologia.CausalSets.Causal.Cohomology`; the
degree-2 continuation of `thm:causal-cochain-complex`.

## Tags

causal cohomology, Cech H2, cochain complex, 3-simplex, coboundary, symplectic 2-form
-/

namespace Obsmetrologia
namespace CausalSets.Causal.Cohomology.H2

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Cohomology

variable {E : Type} (C : CausalSet E)

/-! ## (A) 3-simplices and the degree-3 cochains -/

/-- A **causal 3-simplex**: a composable chain `a ≤ b ≤ c ≤ d` (the skip edges `a ≤ c`, `a ≤ d`,
`b ≤ d` are forced by transitivity). -/
def ThreeSimplex : Type :=
  { q : E × E × E × E //
    CausalLe C q.1 q.2.1 ∧ CausalLe C q.2.1 q.2.2.1 ∧ CausalLe C q.2.2.1 q.2.2.2 }

/-- Degree-3 cochains: integer functions on composable causal quadruples. -/
abbrev C3 (C : CausalSet E) : Type := ThreeSimplex C → Int

/-! ## (B) The four faces of a 3-simplex -/

/-- Face omitting the first vertex: `(b,c,d)`. -/
def face0 (s : ThreeSimplex C) : TwoSimplex C :=
  ⟨(s.val.2.1, s.val.2.2.1, s.val.2.2.2), ⟨s.property.2.1, s.property.2.2⟩⟩

/-- Face omitting the second vertex: `(a,c,d)` (long edge `a ≤ c` by transitivity). -/
def face1 (s : ThreeSimplex C) : TwoSimplex C :=
  ⟨(s.val.1, s.val.2.2.1, s.val.2.2.2),
    ⟨causalLe_trans C s.property.1 s.property.2.1, s.property.2.2⟩⟩

/-- Face omitting the third vertex: `(a,b,d)` (long edge `b ≤ d` by transitivity). -/
def face2 (s : ThreeSimplex C) : TwoSimplex C :=
  ⟨(s.val.1, s.val.2.1, s.val.2.2.2),
    ⟨s.property.1, causalLe_trans C s.property.2.1 s.property.2.2⟩⟩

/-- Face omitting the last vertex: `(a,b,c)`. -/
def face3 (s : ThreeSimplex C) : TwoSimplex C :=
  ⟨(s.val.1, s.val.2.1, s.val.2.2.1), ⟨s.property.1, s.property.2.1⟩⟩

/-! ## (C) The degree-2 coboundary and the cochain identity -/

/-- The **degree-2 coboundary** `δ² ψ (a,b,c,d) = ψ(b,c,d) − ψ(a,c,d) + ψ(a,b,d) − ψ(a,b,c)` — the
simplicial alternating sum over the four faces. -/
def delta2 (ψ : C2 C) : C3 C :=
  fun s => ψ (face0 C s) - ψ (face1 C s) + ψ (face2 C s) - ψ (face3 C s)

/-- **`δ² ∘ δ¹ = 0`** — the next cochain identity. Applying `δ²` to a degree-1 coboundary, every edge
`φ(·,·)` appears twice with opposite signs over the four faces, so the alternating sum telescopes to
zero (proof irrelevance identifies the shared faces; `omega` closes the cancellation over `ℤ`). This
makes `im δ¹ ⊆ ker δ²` and `H²` well-defined. -/
theorem delta2_delta1 (φ : C1 C) : delta2 C (delta1 C φ) = fun _ => 0 := by
  funext s
  simp only [delta2, delta1, face0, face1, face2, face3, edge01, edge12, edge02]
  omega

/-! ## (D) Cocycles, coboundaries, and Ȟ² -/

/-- A 2-cochain is a **2-cocycle** (closed) when `δ²` annihilates it. -/
def Cocycle2 (ψ : C2 C) : Prop := delta2 C ψ = fun _ => 0

/-- A 2-cochain is a **2-coboundary** (exact) when it is `δ¹` of a 1-cochain. -/
def Coboundary2 (ψ : C2 C) : Prop := ∃ φ : C1 C, ψ = delta1 C φ

/-- **Every 2-coboundary is a 2-cocycle** (`im δ¹ ⊆ ker δ²`), so `H² = ker δ² / im δ¹` is
well-defined — the causal set's degree-2 gluing obstruction. -/
theorem coboundary2_cocycle2 {ψ : C2 C} (h : Coboundary2 C ψ) : Cocycle2 C ψ := by
  obtain ⟨φ, rfl⟩ := h
  exact delta2_delta1 C φ

/-! ## (E) The symplectic 2-form lives in Ȟ² -/

/-- A **closed 2-form** on the causal set: a 2-cochain `ω` with `δ² ω = 0` — a 2-cocycle. A symplectic
form is a closed 2-form (plus nondegeneracy); its cohomology class lives in `H²`. -/
def Closed2Form (ω : C2 C) : Prop := Cocycle2 C ω

/-- **The symplectic 2-form's class lives in Ȟ².** A closed 2-form *is* a 2-cocycle, hence represents
a class in `H² = ker δ² / im δ¹`. This is the cohomological home the symplectic frontier needs: `Ȟ²`
is where `[ω]` lives; the remaining open piece is exhibiting a *nondegenerate* closed 2-cocycle
(`thm:cotangent-symplectic-flow`). -/
theorem symplectic_form_class_in_h2 {ω : C2 C} (h : Closed2Form C ω) : Cocycle2 C ω := h

/-! ## (F) The bundled headline -/

/-- **Causal Ȟ².** The causal order complex extends to degree 2: the 3-simplices carry the degree-2
coboundary `δ²`, satisfying

* **`δ² ∘ δ¹ = 0`** (`delta2_delta1`) — the next cochain identity, telescoping over `ℤ`;
* **2-coboundaries are 2-cocycles** (`coboundary2_cocycle2`) — `im δ¹ ⊆ ker δ²`, so
  `H² = ker δ² / im δ¹` is well-defined, the degree-2 gluing obstruction;
* **the symplectic 2-form lives here** (`symplectic_form_class_in_h2`) — a closed 2-form is a
  2-cocycle, its class in `H²`.

The causal set is now a 2-truncated cochain complex `C⁰ → C¹ → C² → C³`; its `H¹` is the
`cl-inv` / chromatic obstruction (\texttt{thm:causal-cochain-complex}) and its `H²` is the home of the
symplectic class. -/
theorem causal_cohomology_h2 :
    (∀ φ : C1 C, delta2 C (delta1 C φ) = fun _ => 0)
    ∧ (∀ ψ : C2 C, Coboundary2 C ψ → Cocycle2 C ψ)
    ∧ (∀ ω : C2 C, Closed2Form C ω → Cocycle2 C ω) :=
  ⟨delta2_delta1 C,
   fun _ h => coboundary2_cocycle2 C h,
   fun _ h => symplectic_form_class_in_h2 C h⟩

end CausalSets.Causal.Cohomology.H2
end Obsmetrologia
