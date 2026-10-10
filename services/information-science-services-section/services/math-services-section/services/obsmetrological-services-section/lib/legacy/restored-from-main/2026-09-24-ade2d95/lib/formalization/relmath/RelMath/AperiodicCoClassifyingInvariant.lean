/-
# Aperiodic co-classifying invariant — the strict-Boolean cosheaf-homology model

This module formalizes the **aperiodic co-classifying invariant** `čcl-inv(v) ∈ H₁`, the
cosheaf-HOMOLOGY counterpart of the aperiodic classifying invariant `cl-inv(v) ∈ H¹`
(`Aperiodic.Settling.clInv`).

## What is modeled, and what is open

The corpus node states that Verdier duality identifies `H¹(F_v) ≃ H₁(F̌_v)` — but it is
explicit that this is *established at draft level*, holding "in q-fuzzy form (and strictly in
the corpus's Boolean d-frame setting)". We formalize **only the strict-Boolean case**, and we
do so by *construction*: `H1Homology` is a coordinate-isomorphic copy of `H1Class`, and the
spatial Verdier map `dSpatial` is the coordinate identity `⟨c⟩ ↦ ⟨c⟩`. That `dSpatial` is a
bijection is therefore *definitional* (it is `rfl`), not a proof that the cosheaf homology of
the genuine dual cosheaf computes to `H₁`. The genuine Verdier duality — that the actual
cosheaf homology `H₁(F̌_v)` agrees with `H¹(F_v)`, in q-fuzzy generality and via the
derived-functor `𝔻` — is **open**, recorded as the red blueprint node
`thm:aperiodic-verdier-duality`. What this module genuinely contributes over the strict-Boolean
identification is the *transport* of the co-invariant's nonvanishing and (by-construction)
MLD-completeness across that identification.

The corpus node:

* `…/settling/content/aperiodic-settling/content/aperiodic-classifying-invariant/content/aperiodic-co-classifying-invariant/aperiodic-co-classifying-invariant.md`
  — where `cl-inv(v)` records the aperiodic settling's MLD-class as a sheaf COHOMOLOGY class
  (cocycles on the bitopological settling site, `RelMath.Cohomology` / the cochain/cocycle
  pattern of `SettlingCohomologyH1`), the **co-classifying invariant** `čcl-inv(v)` records
  the SAME MLD-class as a cosheaf HOMOLOGY class (cycles on the cosheaf side). The two are
  related by **Verdier duality on the bitopological settling site**: the spatial Verdier
  duality `𝔻_sp` sends `cl-inv(v)` to `čcl-inv(v)`, and identifies `H¹(F_v) ≃ H₁(F̌_v)` —
  strictly in the **Boolean d-frame setting** (the d-frame `DFrame.dframe_of_bitopological`,
  where consistency is disjointness and the duality is exact; q-fuzzy in general).

## How the homology dual is modeled

The classifying invariant takes values in `Aperiodic.H1Class` — a one-coordinate `H¹`-class
(`coord : Int`, with `H1Class.zero = ⟨0⟩`), the sheaf-cohomology side. The **co-classifying
invariant takes values in `H1Homology`** — the cosheaf-HOMOLOGY dual, modeled as an
isomorphic copy of `H1Class` carrying the dual generator coordinate `dualCoord : Int` (the
cosheaf-homology generator `ě_μ` dual to the sheaf-cohomology generator `e_μ`). In the finite
**Boolean d-frame setting** Verdier duality `H¹ ≃ H₁` is a *strict bijection*; we realize it
as the coordinate-preserving bijection `dSpatial : H1Class → H1Homology`,
`dSpatial ⟨c⟩ = ⟨c⟩`, with two-sided inverse `dSpatialInv`.

This is the honest finite-Boolean reading: `H₁` is the dual of `H¹`, isomorphic in the
Boolean d-frame setting (`DFrame`), and the Verdier map is the identification — a `Bool`-free,
`rfl`-provable bijection. The full q-fuzzy / derived-functor `𝔻` (the six-functor `D`-functor,
the q-fuzzy quantale-enriched cosheaf) is documented in prose, not computed.

## The dual cosheaf

The **dual cosheaf** `F̌_v` is the Verdier dual of the settling-associated sheaf `F_v`. On the
Boolean d-frame `DFrame.dframe_of_bitopological X` the spatial Verdier duality is the d-frame
swap `(L₊, L₋, con, tot) ↦ (L₋, L₊, …)` exposing the cosheaf (cycle) side; we record the
cosheaf as the dual-coordinate carrier and reuse the d-frame's Boolean (disjointness)
consistency as the setting where the duality is strict.

## The co-classifying invariant and Verdier duality

`čcl-inv(v) := 𝔻_sp(cl-inv(v)) = dSpatial v.clInv ∈ H1Homology`. The two invariants encode
the SAME MLD-class because `dSpatial` is a *bijection*: `cl-inv v = cl-inv v' ⟺ čcl-inv v =
čcl-inv v'`. Combined with `cl-inv`'s completeness for MLD
(`Aperiodic.classifying_invariant_complete_mld`), the co-invariant is ALSO complete:
`v ~MLD v' ⟺ čcl-inv v = čcl-inv v'`.
-/
import RelMath.AperiodicClassification
import RelMath.DFrame
import RelMath.SettlingCohomologyH1

namespace RelMath
namespace CoClassify

open RelMath.Aperiodic

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
proof that the genuine cosheaf homology realizes it — see the module header. -/

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
  `H₁(F̌_v)` of the genuine dual cosheaf agrees with `H¹(F_v)` (that is the open Verdier
  duality, blueprint `thm:aperiodic-verdier-duality`);
* **the two presentations carry the SAME data** — since `𝔻_sp` is a bijection,
  `cl-inv v = cl-inv v' ⟺ čcl-inv v = čcl-inv v'`.

Corpus: `aperiodic-co-classifying-invariant.md` (which states the genuine duality only "at
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
    -- the two invariants encode the same MLD-class: cl-inv equal ⟺ čcl-inv equal
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

/-! ## `čcl-inv` is also complete for MLD (via the Verdier bijection)

`čcl-inv` is complete for MLD: `v ~MLD v' ⟺ čcl-inv v = čcl-inv v'`. This is `cl-inv`'s
completeness (`Aperiodic.classifying_invariant_complete_mld`) transported across the Verdier
bijection `𝔻_sp`. -/

/-- **`čcl-inv` is complete for MLD.** `v ~MLD v' ⟺ čcl-inv v = čcl-inv v'`: equal
co-classifying invariants is exactly mutual-local-derivability. Forward by `cl-inv`'s
soundness + `𝔻_sp` a function; backward by `𝔻_sp` injective + `cl-inv`'s completeness. -/
theorem coClInv_complete_mld (v v' : Settling) : MLD v v' ↔ coClInv v = coClInv v' := by
  constructor
  · intro h
    simp only [coClInv]
    exact congrArg dSpatial (clInv_sound h)
  · intro h
    exact clInv_complete (dSpatial_injective h)

/-- **`čcl-inv` transports the by-construction MLD invariant across the strict-Boolean
identification.** Bundles, on the cosheaf-homology side:

* **`MLD` is an equivalence relation** — reflexive, symmetric, transitive (reused from
  `Aperiodic`'s `mld_refl`/`mld_symm`/`mld_trans`, the pullback of equality);
* **`čcl-inv` separates MLD-classes** — `v ~MLD v' ⟺ čcl-inv v = čcl-inv v'`. As upstream,
  this is *by construction*: `MLD` is *defined* as `cl-inv`-equality (`Aperiodic.MLD`) and
  `𝔻_sp` is the coordinate identity, so the equivalence is `rfl`-level, not a classification
  of an independent local-derivability relation (that classification is open);
* **agreement with `cl-inv`** — `čcl-inv v = čcl-inv v' ⟺ cl-inv v = cl-inv v'` (the
  strict-Boolean bijection identifies the two presentations);
* **the aperiodic witness has nonzero `čcl-inv`** — `čcl-inv(aperiodicWitness) ≠ 0`, the
  genuine content here: the witness's nonvanishing class transports to the cosheaf side.

Corpus: `aperiodic-co-classifying-invariant.md`. -/
theorem co_classifying_complete_mld :
    -- MLD is an equivalence relation
    (∀ v : Settling, MLD v v)
    ∧ (∀ v v' : Settling, MLD v v' → MLD v' v)
    ∧ (∀ v v' v'' : Settling, MLD v v' → MLD v' v'' → MLD v v'')
    -- čcl-inv is a complete invariant: MLD ⟺ equal co-classifying invariant
    ∧ (∀ v v' : Settling, MLD v v' ↔ coClInv v = coClInv v')
    -- čcl-inv and cl-inv cut out the SAME MLD-classes (the Verdier bijection)
    ∧ (∀ v v' : Settling, coClInv v = coClInv v' ↔ v.clInv = v'.clInv)
    -- the aperiodic witness has nonzero čcl-inv
    ∧ (coClInv aperiodicWitness ≠ H1Homology.zero) :=
  ⟨mld_refl,
   fun _ _ h => mld_symm h,
   fun _ _ _ h h' => mld_trans h h',
   coClInv_complete_mld,
   fun _ _ => ⟨fun h => clInv_complete (dSpatial_injective h),
               fun h => congrArg dSpatial h⟩,
   coClInv_aperiodicWitness_nonzero⟩

end CoClassify
end RelMath
