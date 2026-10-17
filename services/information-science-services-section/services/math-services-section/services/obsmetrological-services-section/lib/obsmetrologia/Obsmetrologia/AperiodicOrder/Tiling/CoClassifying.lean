import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.Site.DFrame
import Obsmetrologia.Cohomology.SettlingCohomologyH1

/-!
# Aperiodic co-classifying invariant — the strict-Boolean cosheaf-homology model

Corpus: `…/aperiodic-classifying-invariant/content/aperiodic-co-classifying-invariant/aperiodic-co-classifying-invariant.md`.
`cl-inv(v)` records the aperiodic settling's MLD-class as a sheaf cohomology class
(`Obsmetrologia.Cohomology`/`SettlingCohomologyH1`); the co-classifying invariant
`čcl-inv(v) ∈ H₁` records the same class as a cosheaf homology class. Verdier duality on
the bitopological settling site identifies `H¹(F_v) ≃ H₁(F̌_v)`, strictly in the Boolean
d-frame setting (`DFrame.dframe_of_bitopological`), q-fuzzy in general.

**Scope.** This module formalizes only the strict-Boolean case, by construction:
`H1Homology` is a coordinate-isomorphic copy of `H1Class`, and the spatial Verdier map
`dSpatial : H1Class → H1Homology`, `dSpatial ⟨c⟩ = ⟨c⟩`, is a bijection *definitionally*
(`rfl`) — not a proof that the cosheaf homology of the dual cosheaf `F̌_v` computes to
`H₁` in general. That general Verdier duality (via the derived-functor `𝔻`, q-fuzzy) is
open, recorded as blueprint node `thm:aperiodic-verdier-duality`. This module transports
the co-invariant's nonvanishing across the strict-Boolean identification and proves the
cosheaf-side Step 3 (an invertible settling-morphism preserves `čcl-inv`); full
co-classification rests on both the open Verdier duality and the open MLD classification
(`thm:aperiodic-mld-classification`).

`čcl-inv(v) := dSpatial v.clInv`. Because `dSpatial` is a bijection, `čcl-inv`-equality
coincides with cohomological equivalence: `cl-inv v = cl-inv v' ⟺ čcl-inv v = čcl-inv v'`.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling

open Obsmetrologia.AperiodicOrder.Tiling

/-! ## (1) The homology dual `H₁` — the cosheaf-homology class

`H1Class` (the sheaf-COHOMOLOGY class, `H¹`) carries a generator coordinate `coord : Int`.
The cosheaf-HOMOLOGY dual `H₁` carries the *dual* generator coordinate — `ě_μ` dual to `e_μ`.
We model `H₁` as `H1Homology`, an isomorphic copy of `H1Class`, so the Boolean-d-frame
Verdier duality `H¹ ≃ H₁` is a strict (coordinate-preserving) bijection. -/

/-- The **cosheaf-homology dual class** `H₁` — the values of the co-classifying invariant
`čcl-inv`. An isomorphic copy of `H1Class` carrying the **dual** generator coordinate
`dualCoord` (the cosheaf-homology generator `ě_μ`, dual to the sheaf-cohomology generator
`e_μ` of `H1Class.coord`). Modeled as a one-`Int` carrier so the Boolean-d-frame Verdier
duality `H¹ ≃ H₁` is a strict bijection. -/
structure H1Homology where
  /-- The dual generator coordinate — the cosheaf-homology generator `ě_μ`. The **zero
  homology class** is `0`. -/
  dualCoord : Int
  deriving DecidableEq, Repr

/-- The **zero `H₁`-homology class** `[0] = 0` — the cosheaf dual of `H1Class.zero` (the
collapsed cycle, dual to the identity-cochain coboundary). -/
def H1Homology.zero : H1Homology := ⟨0⟩

/-! ## (2) The strict-Boolean identification `𝔻_sp : H¹ → H₁`

In the finite **Boolean d-frame setting** (`DFrame.dframe_of_bitopological`) the corpus's
spatial Verdier duality is "strict". We *model* that strict case directly: `dSpatial` is the
coordinate map `⟨c⟩ ↦ ⟨c⟩` onto the renamed copy `H1Homology`, with inverse `dSpatialInv`. It
is a bijection by construction (the inverse laws are `rfl`). This is the identification, not a
proof that the cosheaf homology realizes it — see the module header. -/

/-- **Spatial Verdier duality** `𝔻_sp : H¹ → H₁` — sends a sheaf-cohomology class to its
cosheaf-homology dual. In the Boolean d-frame setting it is the coordinate-preserving
identification `⟨c⟩ ↦ ⟨c⟩` (the sheaf generator `e_μ` to the cosheaf generator `ě_μ`). -/
def dSpatial (x : H1Class) : H1Homology := ⟨x.coord⟩

/-- **The inverse spatial Verdier duality** `𝔻_sp⁻¹ : H₁ → H¹` — sends a cosheaf-homology
class back to its sheaf-cohomology dual. The two-sided inverse of `dSpatial`. -/
def dSpatialInv (y : H1Homology) : H1Class := ⟨y.dualCoord⟩

/-- **`𝔻_sp` is a left inverse of `𝔻_sp⁻¹`** — `𝔻_sp⁻¹(𝔻_sp x) = x`. -/
theorem dSpatialInv_dSpatial (x : H1Class) : dSpatialInv (dSpatial x) = x := rfl

/-- **`𝔻_sp` is a right inverse of `𝔻_sp⁻¹`** — `𝔻_sp(𝔻_sp⁻¹ y) = y`. -/
theorem dSpatial_dSpatialInv (y : H1Homology) : dSpatial (dSpatialInv y) = y := rfl

/-- **`𝔻_sp` is injective** — `𝔻_sp x = 𝔻_sp x' → x = x'` (it has a left inverse). The
injectivity half of "the Verdier duality is a bijection". -/
theorem dSpatial_injective {x x' : H1Class} (h : dSpatial x = dSpatial x') : x = x' := by
  have := congrArg dSpatialInv h
  rwa [dSpatialInv_dSpatial, dSpatialInv_dSpatial] at this

/-- **`𝔻_sp` is surjective** — every `H₁`-class is `𝔻_sp x` for some `x` (its inverse image).
The surjectivity half of "the Verdier duality is a bijection". -/
theorem dSpatial_surjective (y : H1Homology) : ∃ x : H1Class, dSpatial x = y :=
  ⟨dSpatialInv y, dSpatial_dSpatialInv y⟩

/-- **`𝔻_sp` sends the zero `H¹`-class to the zero `H₁`-class** — the duality is
zero-preserving (the strict/Scott vanishing class maps to the collapsed cycle). -/
theorem dSpatial_zero : dSpatial H1Class.zero = H1Homology.zero := rfl

/-! ## (3) The dual cosheaf `F̌_v` — the Verdier dual on the Boolean d-frame

The dual cosheaf is the Verdier dual of the settling-associated sheaf. On the Boolean d-frame
`DFrame.dframe_of_bitopological X` the spatial Verdier duality is exact (consistency =
disjointness); we record the cosheaf as the dual-coordinate carrier over that Boolean d-frame,
reusing `DFrame`'s `dframe_of_bitopological` as the setting where the duality is strict. -/

/-- The **dual cosheaf** `F̌_v` of a settling — the Verdier dual of the settling-associated
sheaf `F_v`, carrying the cosheaf-homology class. We bundle the underlying Boolean d-frame
(the setting `DFrame.dframe_of_bitopological X` in which Verdier duality is strict) with the
cosheaf-homology class `[F̌_v] = čcl-inv(v) = 𝔻_sp(cl-inv(v))`. -/
structure DualCosheaf where
  /-- The point set of the underlying bitopological space / Boolean d-frame. -/
  points : Type
  /-- The cosheaf-homology class carried by the dual cosheaf. -/
  homologyClass : H1Homology

/-- **The dual cosheaf of a settling** `v` over a point set `X`: the Boolean d-frame
`dframe_of_bitopological X` (the setting where Verdier duality is strict) together with the
cosheaf-homology class `𝔻_sp(cl-inv(v))`. -/
def dualCosheaf (X : Type) (v : Settling) : DualCosheaf where
  points := X
  homologyClass := dSpatial v.clInv

/-- **The dual cosheaf lives over the Boolean d-frame** where Verdier duality is strict: its
`con`/`tot` are disjointness/covering on `𝒫(X)` (`DFrame.dframe_of_bitopological`). This ties
the cosheaf to the Boolean (exact-duality) setting, reusing `DFrame`. -/
theorem dualCosheaf_boolean_dframe (X : Type)
    (U V : (DFrame.dframe_of_bitopological X).Lplus.carrier) :
    ((DFrame.dframe_of_bitopological X).con U V ↔ ∀ x, ¬(U x ∧ V x))
      ∧ ((DFrame.dframe_of_bitopological X).tot U V ↔ ∀ x, U x ∨ V x) :=
  DFrame.dframe_of_bitopological_relations X U V

/-! ## (4) The co-classifying invariant `čcl-inv(v) := 𝔻_sp(cl-inv(v))` -/

/-- **The aperiodic co-classifying invariant** `čcl-inv(v) := 𝔻_sp(cl-inv(v)) ∈ H₁` — the
cosheaf-homology class obtained by applying spatial Verdier duality to the (sheaf-cohomology)
classifying invariant `cl-inv(v) = v.clInv`. The cosheaf-side record of the settling's
MLD-class. -/
def coClInv (v : Settling) : H1Homology := dSpatial v.clInv

/-- **`čcl-inv` is `𝔻_sp` of `cl-inv`** (definitional) — the co-classifying invariant equals
the Verdier dual of the classifying invariant. -/
theorem coClInv_eq_dSpatial_clInv (v : Settling) : coClInv v = dSpatial v.clInv := rfl

/-- **`čcl-inv` of the aperiodic witness is nonzero** — the co-classifying invariant inherits
the nonzero aperiodic class from `cl-inv` through the (zero-preserving, injective) Verdier
duality: `čcl-inv(aperiodicWitness) ≠ 0` in `H₁`. The cosheaf-homology analog of the nonzero
sheaf-cohomology class at the non-Scott firings. -/
theorem coClInv_aperiodicWitness_nonzero : coClInv aperiodicWitness ≠ H1Homology.zero := by
  decide

/-! ## `čcl-inv = 𝔻_sp(cl-inv)`; Verdier duality is an isomorphism; same data -/

/-- **The strict-Boolean co-classifying model.** Records the facts that hold *by construction*
once `H₁` is taken to be the coordinate-isomorphic copy `H1Homology` of `H¹` and `𝔻_sp` the
coordinate identity:

* **`čcl-inv = 𝔻_sp(cl-inv)`** — the co-classifying invariant is `𝔻_sp` applied to `cl-inv`
  (definitional);
* **`𝔻_sp` is a bijection** — two-sided inverse `𝔻_sp⁻¹`, injective, surjective,
  zero-preserving. This is `rfl`-true *because* `H1Homology` is the renamed copy of `H1Class`;
  it is the strict-Boolean *identification*, **not** a proof that the cosheaf homology
  `H₁(F̌_v)` of the dual cosheaf agrees with `H¹(F_v)` (that is the open Verdier
  duality, blueprint `thm:aperiodic-verdier-duality`);
* **the two presentations carry the SAME data** — since `𝔻_sp` is a bijection,
  `cl-inv v = cl-inv v' ⟺ čcl-inv v = čcl-inv v'`.

Corpus: `aperiodic-co-classifying-invariant.md` (which states the duality only "at
draft level... strictly in the Boolean d-frame setting"). The q-fuzzy / derived-functor `𝔻` is
not modeled here. -/
theorem co_classifying_strict_boolean_model :
    -- čcl-inv = 𝔻_sp(cl-inv)
    (∀ v : Settling, coClInv v = dSpatial v.clInv)
    -- the Verdier duality is an isomorphism: two-sided inverse
    ∧ (∀ x : H1Class, dSpatialInv (dSpatial x) = x)
    ∧ (∀ y : H1Homology, dSpatial (dSpatialInv y) = y)
    -- injective and surjective (a bijection)
    ∧ (∀ x x' : H1Class, dSpatial x = dSpatial x' → x = x')
    ∧ (∀ y : H1Homology, ∃ x : H1Class, dSpatial x = y)
    -- zero-preserving: H¹-zero ↦ H₁-zero
    ∧ (dSpatial H1Class.zero = H1Homology.zero)
    -- the two presentations carry the same cohomology class: cl-inv equal ⟺ čcl-inv equal
    ∧ (∀ v v' : Settling, v.clInv = v'.clInv ↔ coClInv v = coClInv v') :=
  ⟨fun v => coClInv_eq_dSpatial_clInv v,
   dSpatialInv_dSpatial,
   dSpatial_dSpatialInv,
   fun _ _ h => dSpatial_injective h,
   dSpatial_surjective,
   dSpatial_zero,
   fun v v' =>
     ⟨fun h => by simp only [coClInv]; exact congrArg dSpatial h,
      fun h => dSpatial_injective h⟩⟩

/-! ## `čcl-inv`-equality is cohomological equivalence; MLD refines it (Step 3)

On the cosheaf side, `čcl-inv`-equality cuts out exactly cohomological equivalence `CohEquiv`
(transported across the Verdier bijection `𝔻_sp`), and the structural MLD relation only
**refines** it (Step 3). The converse — that `čcl-inv`-equality implies MLD — needs both the
open Verdier duality and the open MLD classification. -/

/-- **`čcl-inv`-equality coincides with cohomological equivalence.** `čcl-inv v = čcl-inv v' ⟺
CohEquiv v v'` (`= cl-inv v = cl-inv v'`): since `𝔻_sp` is injective, the cosheaf-side invariant
cuts out the same cohomology classes as the sheaf side. This is the strict-Boolean transport of
cohomological equivalence — **not** a classification of the structural MLD relation. -/
theorem coClInv_eq_iff_cohEquiv (v v' : Settling) : coClInv v = coClInv v' ↔ CohEquiv v v' := by
  constructor
  · intro h
    exact dSpatial_injective h
  · intro h
    simp only [coClInv]
    exact congrArg dSpatial h

/-- **MLD refines `čcl-inv`-equality (Step 3, the easy direction) on the cosheaf side.** An
invertible settling-morphism preserves `cl-inv`, hence preserves `čcl-inv`: `D.Mld v v' →
čcl-inv v = čcl-inv v'`. The converse is the open co-classification. -/
theorem mld_refines_coClInv_eq (D : LocalDerivability) {v v' : Settling} (h : D.Mld v v') :
    coClInv v = coClInv v' :=
  (coClInv_eq_iff_cohEquiv v v').mpr (mld_refines_cohEquiv D h)

/-- **The strict-Boolean cosheaf model and the co-classification frontier.** For any
local-derivability structure `D`, bundles, on the cosheaf-homology side:

* **`čcl-inv`-equality is an equivalence relation** — reflexive, symmetric, transitive (it is
  cohomological equivalence transported across the Verdier bijection);
* **`čcl-inv`-equality coincides with cohomological equivalence** — `čcl-inv v = čcl-inv v' ⟺
  cl-inv v = cl-inv v'` (the strict-Boolean bijection identifies the two presentations);
* **MLD refines `čcl-inv`-equality (Step 3, proved)** — `D.Mld v v' → čcl-inv v = čcl-inv v'`;
* **the aperiodic witness has nonzero `čcl-inv`** — `čcl-inv(aperiodicWitness) ≠ 0`: the
  witness's nonvanishing class transports to the cosheaf side (the content here).

The converse to Step 3 — that `čcl-inv`-equality implies the structural MLD — rests on the open
Verdier duality (`thm:aperiodic-verdier-duality`) and the open MLD classification
(`thm:aperiodic-mld-classification`); it is **not** asserted here.

Corpus: `aperiodic-co-classifying-invariant.md`. -/
theorem co_classifying_model (D : LocalDerivability) :
    -- čcl-inv-equality is an equivalence relation
    (∀ v : Settling, coClInv v = coClInv v)
    ∧ (∀ v v' : Settling, coClInv v = coClInv v' → coClInv v' = coClInv v)
    ∧ (∀ v v' v'' : Settling,
        coClInv v = coClInv v' → coClInv v' = coClInv v'' → coClInv v = coClInv v'')
    -- čcl-inv-equality coincides with cohomological equivalence
    ∧ (∀ v v' : Settling, coClInv v = coClInv v' ↔ v.clInv = v'.clInv)
    -- Step 3: MLD refines čcl-inv-equality
    ∧ (∀ v v' : Settling, D.Mld v v' → coClInv v = coClInv v')
    -- the aperiodic witness has nonzero čcl-inv
    ∧ (coClInv aperiodicWitness ≠ H1Homology.zero) :=
  ⟨fun _ => rfl,
   fun _ _ h => h.symm,
   fun _ _ _ h h' => h.trans h',
   fun v v' => coClInv_eq_iff_cohEquiv v v',
   fun _ _ h => mld_refines_coClInv_eq D h,
   coClInv_aperiodicWitness_nonzero⟩

end AperiodicOrder.Tiling
end Obsmetrologia
