import Mathlib.Order.CompleteLattice.Basic
import PredicationCategories.Categorical.PredicateMap
import PredicationCategories.Categorical.FiberFunctor
import PredicationCategories.Categorical.TwistProductCompleteLattice
import PredicationCategories.Categorical.ProjectionAdjoints

/-!
# Predicate specialization: partial-reindexing fiber action and quantifier adjoints

Mechanizes the fourth predicate-category generator class — *specialization* —
parallel to the three total generators handled in `PredicateMap.lean` and
`FiberFunctor.lean`. Closes the corpus claims:

- `morphisms/predicate-specialization.md` (the partial-reindexing morphism);
- `theorems/specialization-hyperdoctrinal-adjoints.md` (eight quantifier adjoints);
- the specialization clause of `theorems/predication-fiber-functor.md`.

Two complementary presentations are provided, both of which the corpus
identifies as the same "f^*":

1. **Endomorphism form** — `specPullback : PFA L E → PFA L E` with
   `(specPullback D v) p = if p ∈ D then v p else ⊥`. This matches the
   shape of `fiberConv`, `fiberSubj`, `fiberObj` (the three total
   generators) and is packaged as `specPullbackHom : BilatticeHom _ _`,
   re-exported as `fiberSpec`.

2. **Typed-restriction form** — `specRestrict : PFA L E →
   RestrictedFiberAlgebra L D` with `(specRestrict D v) ⟨p, _⟩ = v p`,
   where `RestrictedFiberAlgebra L D := ↥D → TwistProduct L` is the
   typed model of the small fiber `A_q`. This presentation makes the
   four hyperdoctrinal **Galois biconditionals unconditional**, faithful
   to the corpus statement of `specialization-hyperdoctrinal-adjoints.md`
   (where `w ∈ A_q` is by construction a function on `dom(q) = D`).

The two forms are connected by `specPullback D v p =
extend (specRestrict D v) p` for the appropriate boundary value, and
the existential extensions defined below are the inverses of
`specRestrict` extended by `⊥`/`⊤`/`f`/`t` off `D`.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice

namespace Categorical

/-! ## Restricted fiber algebra `A_q := ↥D → TwistProduct L` -/

/-- The **restricted fiber algebra** at a sub-support `D : Set (E × E)`:
the pointwise twist product on the dependent function space `↥D → TwistProduct L`.

Used as the fiber-algebra carrier `A_q` for a predicate `q` whose
domain is exactly `D ⊆ E × E`. Distinct from `PredicationFiberAlgebra L E`
(the carrier `A_p` for the larger predicate). -/
abbrev RestrictedFiberAlgebra (L : Type u) {E : Type v} (D : Set (E × E)) :
    Type (max u v) :=
  ↥D → TwistProduct L

namespace RestrictedFiberAlgebra
variable {L : Type u} {E : Type v} {D : Set (E × E)}

section LatticeOps
variable [Lattice L]

def infT (v w : RestrictedFiberAlgebra L D) : RestrictedFiberAlgebra L D :=
  fun p => TwistProduct.infT (v p) (w p)

def supT (v w : RestrictedFiberAlgebra L D) : RestrictedFiberAlgebra L D :=
  fun p => TwistProduct.supT (v p) (w p)

def infK (v w : RestrictedFiberAlgebra L D) : RestrictedFiberAlgebra L D :=
  fun p => TwistProduct.infK (v p) (w p)

def supK (v w : RestrictedFiberAlgebra L D) : RestrictedFiberAlgebra L D :=
  fun p => TwistProduct.supK (v p) (w p)

def negation (v : RestrictedFiberAlgebra L D) : RestrictedFiberAlgebra L D :=
  fun p => TwistProduct.negation (v p)

end LatticeOps

instance instPreBilattice [Lattice L] : PreBilattice (RestrictedFiberAlgebra L D) where
  infT := infT
  supT := supT
  infK := infK
  supK := supK
  infT_comm v w := funext fun p => PreBilattice.infT_comm (v p) (w p)
  infT_assoc u v w := funext fun p => PreBilattice.infT_assoc (u p) (v p) (w p)
  supT_comm v w := funext fun p => PreBilattice.supT_comm (v p) (w p)
  supT_assoc u v w := funext fun p => PreBilattice.supT_assoc (u p) (v p) (w p)
  infT_supT_absorb v w := funext fun p => PreBilattice.infT_supT_absorb (v p) (w p)
  supT_infT_absorb v w := funext fun p => PreBilattice.supT_infT_absorb (v p) (w p)
  infK_comm v w := funext fun p => PreBilattice.infK_comm (v p) (w p)
  infK_assoc u v w := funext fun p => PreBilattice.infK_assoc (u p) (v p) (w p)
  supK_comm v w := funext fun p => PreBilattice.supK_comm (v p) (w p)
  supK_assoc u v w := funext fun p => PreBilattice.supK_assoc (u p) (v p) (w p)
  infK_supK_absorb v w := funext fun p => PreBilattice.infK_supK_absorb (v p) (w p)
  supK_infK_absorb v w := funext fun p => PreBilattice.supK_infK_absorb (v p) (w p)

instance instBilattice [Lattice L] : Bilattice (RestrictedFiberAlgebra L D) where
  negation := negation
  negation_negation v := funext fun p => Bilattice.negation_negation (v p)
  negation_antitone_T {a b} h := by
    funext p
    exact Bilattice.negation_antitone_T (congrFun h p)
  negation_monotone_K {a b} h := by
    funext p
    exact Bilattice.negation_monotone_K (congrFun h p)

theorem leK_pointwise [Lattice L] (v w : RestrictedFiberAlgebra L D) :
    v ≤ₖ w ↔ ∀ p, v p ≤ₖ w p := by
  refine ⟨fun h p => ?_, fun h => ?_⟩
  · show TwistProduct.infK (v p) (w p) = v p
    exact congrFun h p
  · show (fun p => TwistProduct.infK (v p) (w p)) = v
    funext p
    exact h p

theorem leT_pointwise [Lattice L] (v w : RestrictedFiberAlgebra L D) :
    v ≤ₜ w ↔ ∀ p, v p ≤ₜ w p := by
  refine ⟨fun h p => ?_, fun h => ?_⟩
  · show TwistProduct.infT (v p) (w p) = v p
    exact congrFun h p
  · show (fun p => TwistProduct.infT (v p) (w p)) = v
    funext p
    exact h p

end RestrictedFiberAlgebra

end Categorical

namespace PredicateMap

variable {L : Type u} {E : Type v}

/-! ## Endomorphism form: `specPullback : PFA → PFA`

Off-`D` cells default to the K-bottom `⊥`. Bilattice-operation
preservation is proved by case-split on `p ∈ D`. Packaged as
`specPullbackHom`/`fiberSpec`, parallel to the three total generators. -/

section Pullback
variable [Lattice L]

/-- **Partial cellular reindexing** along a sub-support `D ⊆ E × E`:
the fiber-algebra map sending `v` to its restriction-with-bottom-extension,
i.e. `v` on `D` and the K-bottom `⊥` off `D`. The fiber action of a
[predicate-specialization](../../morphisms/predicate-specialization.md)
morphism whose sub-support is `D`. -/
def specPullback (D : Set (E × E)) [DecidablePred (· ∈ D)]
    (v : PredicationFiberAlgebra L E) : PredicationFiberAlgebra L E :=
  fun p => if p ∈ D then v p else ⊥

variable (D : Set (E × E)) [DecidablePred (· ∈ D)]

theorem specPullback_apply_mem {v : PredicationFiberAlgebra L E} {p : E × E}
    (h : p ∈ D) : specPullback D v p = v p := if_pos h

theorem specPullback_apply_not_mem {v : PredicationFiberAlgebra L E} {p : E × E}
    (h : p ∉ D) : specPullback D v p = ⊥ := if_neg h

theorem specPullback_infT (v w : PredicationFiberAlgebra L E) :
    specPullback D (v ⊓ₜ w) = specPullback D v ⊓ₜ specPullback D w := by
  funext p
  show (if p ∈ D then (v ⊓ₜ w) p else (⊥ : TwistProduct L)) =
       TwistProduct.infT (if p ∈ D then v p else ⊥) (if p ∈ D then w p else ⊥)
  by_cases hp : p ∈ D
  · simp only [if_pos hp]; rfl
  · simp only [if_neg hp]
    apply TwistProduct.ext <;> simp

theorem specPullback_supT (v w : PredicationFiberAlgebra L E) :
    specPullback D (v ⊔ₜ w) = specPullback D v ⊔ₜ specPullback D w := by
  funext p
  show (if p ∈ D then (v ⊔ₜ w) p else (⊥ : TwistProduct L)) =
       TwistProduct.supT (if p ∈ D then v p else ⊥) (if p ∈ D then w p else ⊥)
  by_cases hp : p ∈ D
  · simp only [if_pos hp]; rfl
  · simp only [if_neg hp]
    apply TwistProduct.ext <;> simp

theorem specPullback_infK (v w : PredicationFiberAlgebra L E) :
    specPullback D (v ⊓ₖ w) = specPullback D v ⊓ₖ specPullback D w := by
  funext p
  show (if p ∈ D then (v ⊓ₖ w) p else (⊥ : TwistProduct L)) =
       TwistProduct.infK (if p ∈ D then v p else ⊥) (if p ∈ D then w p else ⊥)
  by_cases hp : p ∈ D
  · simp only [if_pos hp]; rfl
  · simp only [if_neg hp]
    apply TwistProduct.ext <;> simp

theorem specPullback_supK (v w : PredicationFiberAlgebra L E) :
    specPullback D (v ⊔ₖ w) = specPullback D v ⊔ₖ specPullback D w := by
  funext p
  show (if p ∈ D then (v ⊔ₖ w) p else (⊥ : TwistProduct L)) =
       TwistProduct.supK (if p ∈ D then v p else ⊥) (if p ∈ D then w p else ⊥)
  by_cases hp : p ∈ D
  · simp only [if_pos hp]; rfl
  · simp only [if_neg hp]
    apply TwistProduct.ext <;> simp

theorem specPullback_negation (v : PredicationFiberAlgebra L E) :
    specPullback D (~ v) = ~ specPullback D v := by
  funext p
  show (if p ∈ D then (~ v) p else (⊥ : TwistProduct L)) =
       TwistProduct.negation (if p ∈ D then v p else ⊥)
  by_cases hp : p ∈ D
  · simp only [if_pos hp]; rfl
  · simp only [if_neg hp]
    apply TwistProduct.ext <;> rfl

/-- **The partial-reindexing pullback as a bilattice homomorphism.** -/
def specPullbackHom :
    BilatticeHom (PredicationFiberAlgebra L E) (PredicationFiberAlgebra L E) where
  toFun        := specPullback D
  map_infT     := specPullback_infT D
  map_supT     := specPullback_supT D
  map_infK     := specPullback_infK D
  map_supK     := specPullback_supK D
  map_negation := specPullback_negation D

@[simp] theorem specPullbackHom_apply (v : PredicationFiberAlgebra L E) :
    (specPullbackHom D : BilatticeHom _ _) v = specPullback D v := rfl

/-- **The fiber action of the specialization generator** with sub-support
`D : Set (E × E)`. Parallel to `fiberConv`/`fiberSubj`/`fiberObj`; the
fourth and final generator class of the predicate category. -/
def fiberSpec :
    BilatticeHom (PredicationFiberAlgebra L E) (PredicationFiberAlgebra L E) :=
  specPullbackHom D

@[simp] theorem fiberSpec_apply (v : PredicationFiberAlgebra L E) :
    (fiberSpec D : BilatticeHom _ _) v = specPullback D v := rfl

theorem fiberSpec_apply_mem (v : PredicationFiberAlgebra L E) {p : E × E}
    (h : p ∈ D) : (fiberSpec D : BilatticeHom _ _) v p = v p := if_pos h

theorem fiberSpec_apply_not_mem (v : PredicationFiberAlgebra L E) {p : E × E}
    (h : p ∉ D) : (fiberSpec D : BilatticeHom _ _) v p = ⊥ := if_neg h

end Pullback

/-! ## Typed-restriction form: `specRestrict : PFA → RFA`

The same morphism `f^*`, presented with the restricted-fiber codomain.
Op-preservation is `rfl` (plain precomposition). Used below to state the
unconditional Galois biconditionals. -/

section Restrict
variable [Lattice L] (D : Set (E × E))

/-- The typed-restriction presentation of `f^*`: precomposition with the
subtype projection `↥D → E × E`. Equal in cellular value to
`specPullback D` on `D` (and undefined off `D` by virtue of the
codomain). -/
def specRestrict (v : PredicationFiberAlgebra L E) : RestrictedFiberAlgebra L D :=
  fun p => v p.val

@[simp] theorem specRestrict_apply (v : PredicationFiberAlgebra L E) (p : ↥D) :
    specRestrict D v p = v p.val := rfl

theorem specRestrict_infT (v w : PredicationFiberAlgebra L E) :
    specRestrict D (v ⊓ₜ w) = specRestrict D v ⊓ₜ specRestrict D w := rfl

theorem specRestrict_supT (v w : PredicationFiberAlgebra L E) :
    specRestrict D (v ⊔ₜ w) = specRestrict D v ⊔ₜ specRestrict D w := rfl

theorem specRestrict_infK (v w : PredicationFiberAlgebra L E) :
    specRestrict D (v ⊓ₖ w) = specRestrict D v ⊓ₖ specRestrict D w := rfl

theorem specRestrict_supK (v w : PredicationFiberAlgebra L E) :
    specRestrict D (v ⊔ₖ w) = specRestrict D v ⊔ₖ specRestrict D w := rfl

theorem specRestrict_negation (v : PredicationFiberAlgebra L E) :
    specRestrict D (~ v) = ~ specRestrict D v := rfl

/-- The typed-restriction form packaged as a bilattice homomorphism. -/
def specRestrictHom :
    BilatticeHom (PredicationFiberAlgebra L E) (RestrictedFiberAlgebra L D) where
  toFun        := specRestrict D
  map_infT     _ _ := rfl
  map_supT     _ _ := rfl
  map_infK     _ _ := rfl
  map_supK     _ _ := rfl
  map_negation _   := rfl

end Restrict

/-! ## Specialization quantifier adjoints

Stated against the typed-restriction form `specRestrict`, all four Galois
biconditionals are unconditional and match the corpus statement of
`specialization-hyperdoctrinal-adjoints.md` literally. -/

section Adjoints
variable [CompleteLattice L] (D : Set (E × E)) [DecidablePred (· ∈ D)]

/-! ### K-existential `∃_f^k ⊣ f^*` (extension by `⊥`) -/

/-- `∃_f^k(w)`: extension of `w ∈ A_q` by the K-bottom `⊥` off `D`. -/
def existsK_spec (w : RestrictedFiberAlgebra L D) : PredicationFiberAlgebra L E :=
  fun p => if h : p ∈ D then w ⟨p, h⟩ else ⊥

theorem existsK_spec_mem {w : RestrictedFiberAlgebra L D} {p : E × E} (h : p ∈ D) :
    existsK_spec D w p = w ⟨p, h⟩ := dif_pos h

theorem existsK_spec_not_mem {w : RestrictedFiberAlgebra L D} {p : E × E}
    (h : p ∉ D) : existsK_spec D w p = ⊥ := dif_neg h

/-- **K-existential adjunction for specialization**: `∃_f^k ⊣ f^*`. -/
theorem existsK_spec_galois_K (w : RestrictedFiberAlgebra L D)
    (v : PredicationFiberAlgebra L E) :
    existsK_spec D w ≤ₖ v ↔ w ≤ₖ specRestrict D v := by
  rw [PredicateMap.leK_pointwise, RestrictedFiberAlgebra.leK_pointwise]
  refine ⟨fun h ⟨p, hp⟩ => ?_, fun h p => ?_⟩
  · have := h p
    rwa [existsK_spec_mem hp] at this
  · by_cases hp : p ∈ D
    · rw [existsK_spec_mem hp]
      exact h ⟨p, hp⟩
    · rw [existsK_spec_not_mem hp]
      exact TwistProduct.bot_leK _

/-! ### K-universal `f^* ⊣ ∀_f^k` (extension by `⊤`) -/

/-- `∀_f^k(w)`: extension of `w ∈ A_q` by the K-top `⊤` off `D`. -/
def forallK_spec (w : RestrictedFiberAlgebra L D) : PredicationFiberAlgebra L E :=
  fun p => if h : p ∈ D then w ⟨p, h⟩ else ⊤

theorem forallK_spec_mem {w : RestrictedFiberAlgebra L D} {p : E × E} (h : p ∈ D) :
    forallK_spec D w p = w ⟨p, h⟩ := dif_pos h

theorem forallK_spec_not_mem {w : RestrictedFiberAlgebra L D} {p : E × E}
    (h : p ∉ D) : forallK_spec D w p = ⊤ := dif_neg h

/-- **K-universal adjunction for specialization**: `f^* ⊣ ∀_f^k`. -/
theorem forallK_spec_galois_K (v : PredicationFiberAlgebra L E)
    (w : RestrictedFiberAlgebra L D) :
    specRestrict D v ≤ₖ w ↔ v ≤ₖ forallK_spec D w := by
  rw [RestrictedFiberAlgebra.leK_pointwise, PredicateMap.leK_pointwise]
  refine ⟨fun h p => ?_, fun h ⟨p, hp⟩ => ?_⟩
  · by_cases hp : p ∈ D
    · rw [forallK_spec_mem hp]
      exact h ⟨p, hp⟩
    · rw [forallK_spec_not_mem hp]
      exact TwistProduct.leK_top _
  · have := h p
    rwa [forallK_spec_mem hp] at this

/-! ### T-existential `∃_f^t ⊣ f^*` (extension by `f`) -/

/-- `∃_f^t(w)`: extension of `w ∈ A_q` by the T-bottom `f` off `D`. -/
def existsT_spec (w : RestrictedFiberAlgebra L D) : PredicationFiberAlgebra L E :=
  fun p => if h : p ∈ D then w ⟨p, h⟩ else TwistProduct.f

theorem existsT_spec_mem {w : RestrictedFiberAlgebra L D} {p : E × E} (h : p ∈ D) :
    existsT_spec D w p = w ⟨p, h⟩ := dif_pos h

theorem existsT_spec_not_mem {w : RestrictedFiberAlgebra L D} {p : E × E}
    (h : p ∉ D) : existsT_spec D w p = TwistProduct.f := dif_neg h

/-- **T-existential adjunction for specialization**: `∃_f^t ⊣ f^*`. -/
theorem existsT_spec_galois_T (w : RestrictedFiberAlgebra L D)
    (v : PredicationFiberAlgebra L E) :
    existsT_spec D w ≤ₜ v ↔ w ≤ₜ specRestrict D v := by
  rw [PredicateMap.leT_pointwise, RestrictedFiberAlgebra.leT_pointwise]
  refine ⟨fun h ⟨p, hp⟩ => ?_, fun h p => ?_⟩
  · have := h p
    rwa [existsT_spec_mem hp] at this
  · by_cases hp : p ∈ D
    · rw [existsT_spec_mem hp]
      exact h ⟨p, hp⟩
    · rw [existsT_spec_not_mem hp]
      exact TwistProduct.f_leT _

/-! ### T-universal `f^* ⊣ ∀_f^t` (extension by `t`) -/

/-- `∀_f^t(w)`: extension of `w ∈ A_q` by the T-top `t` off `D`. -/
def forallT_spec (w : RestrictedFiberAlgebra L D) : PredicationFiberAlgebra L E :=
  fun p => if h : p ∈ D then w ⟨p, h⟩ else TwistProduct.t

theorem forallT_spec_mem {w : RestrictedFiberAlgebra L D} {p : E × E} (h : p ∈ D) :
    forallT_spec D w p = w ⟨p, h⟩ := dif_pos h

theorem forallT_spec_not_mem {w : RestrictedFiberAlgebra L D} {p : E × E}
    (h : p ∉ D) : forallT_spec D w p = TwistProduct.t := dif_neg h

/-- **T-universal adjunction for specialization**: `f^* ⊣ ∀_f^t`. -/
theorem forallT_spec_galois_T (v : PredicationFiberAlgebra L E)
    (w : RestrictedFiberAlgebra L D) :
    specRestrict D v ≤ₜ w ↔ v ≤ₜ forallT_spec D w := by
  rw [RestrictedFiberAlgebra.leT_pointwise, PredicateMap.leT_pointwise]
  refine ⟨fun h p => ?_, fun h ⟨p, hp⟩ => ?_⟩
  · by_cases hp : p ∈ D
    · rw [forallT_spec_mem hp]
      exact h ⟨p, hp⟩
    · rw [forallT_spec_not_mem hp]
      exact TwistProduct.leT_t _
  · have := h p
    rwa [forallT_spec_mem hp] at this

end Adjoints

end PredicateMap
