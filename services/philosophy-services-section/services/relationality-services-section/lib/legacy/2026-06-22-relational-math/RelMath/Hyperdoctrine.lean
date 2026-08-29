/-
# Predication Hyperdoctrine — quantifier adjoints

A predication hyperdoctrine is the predication-fibration of bilattice-valued
valuations over the predicate-category base, satisfying Lawvere's hyperdoctrine
conditions: for every base map `f`, reindexing `f*` has adjoints
`∃_f ⊣ f* ⊣ ∀_f` (in both the knowledge and truth orders), with Frobenius
reciprocity and Beck–Chevalley coherence. It sits at the **settling** level — the
lowest node where reindexing (predicating), the two orders and fibers (positing),
and the closure (settling) are all in scope.

Reindexing acts on valuations by **precomposition**: `f* v = v ∘ f`. This module
derives the adjoint structure for the **bijection** case — the converse generator,
which is an involution on cells, so its reindexing is an order-iso and its own
left and right adjoint (`∃_converse = ∀_converse = reindex converse`). This is the
*converse-quantifier-adjoint* system, with Frobenius and Beck–Chevalley proven.

The **projection** generators (subject/object) collapse the entity pair and are not
bijective; their `∃_f`/`∀_f` are fiber join/meet over `f⁻¹(–)`, which needs a
completeness/finiteness assumption on the entity index (the fiber is the *finite*
complete lattice `Charge`, but the index set may be infinite). That refinement is
the next step; here we derive the part that is unconditionally constructive.
-/
import RelMath.Settling

namespace RelMath
namespace Valuation

/-- Pointwise knowledge-meet of valuations (companion to `joinK`). -/
def meetK (v w : Valuation) : Valuation := fun φ => Charge.meetK (v φ) (w φ)

/-- Reindexing along a base map: `f* v = v ∘ f`. -/
def reindex (r : PredicationCell → PredicationCell) (v : Valuation) : Valuation :=
  fun φ => v (r φ)

@[simp] theorem reindex_id (v : Valuation) : reindex id v = v := rfl

/-- Reindexing is contravariantly functorial: `r* ∘ s* = (s ∘ r)*`. -/
theorem reindex_comp (r s : PredicationCell → PredicationCell) (v : Valuation) :
    reindex r (reindex s v) = reindex (s ∘ r) v := rfl

/-- Reindexing is **monotone** in the knowledge order — functoriality of the
fibration. -/
theorem reindex_mono (r : PredicationCell → PredicationCell) {v w : Valuation}
    (h : leK v w) : leK (reindex r v) (reindex r w) := fun φ => h (r φ)

/-- Reindexing preserves pointwise meet (used for Frobenius). -/
@[simp] theorem reindex_meetK (r : PredicationCell → PredicationCell) (v w : Valuation) :
    reindex r (meetK v w) = meetK (reindex r v) (reindex r w) := rfl

/-! ## Galois connection — the adjunction shape -/

/-- `L ⊣ R` in the valuation knowledge order: a Galois connection. -/
def GaloisK (L R : Valuation → Valuation) : Prop :=
  ∀ v w, (leK (L v) w ↔ leK v (R w))

/-- A base isomorphism: a bijection on cells, packaged with its inverse and both
round-trip laws. -/
structure BaseIso where
  fwd : PredicationCell → PredicationCell
  bwd : PredicationCell → PredicationCell
  left : ∀ φ, bwd (fwd φ) = φ
  right : ∀ φ, fwd (bwd φ) = φ

/-- **Reindexing along a bijection is self-dual adjoint:** `fwd* ⊣ bwd*`. With the
roles swapped one also gets `bwd* ⊣ fwd*`, so for a bijection the existential and
universal quantifiers coincide with reindexing along the inverse. -/
theorem galois_reindex (e : BaseIso) : GaloisK (reindex e.fwd) (reindex e.bwd) := by
  intro v w
  constructor
  · intro h ψ
    have := h (e.bwd ψ)
    -- v (fwd (bwd ψ)) = v ψ
    simpa [reindex, e.right ψ] using this
  · intro h ψ
    have := h (e.fwd ψ)
    -- w (bwd (fwd ψ)) = w ψ
    simpa [reindex, e.left ψ] using this

/-! ## The converse adjoint system -/

/-- Converse as a base isomorphism — an involution on cells (`Predicating`). -/
def converseIso : BaseIso where
  fwd := PredicationCell.converse
  bwd := PredicationCell.converse
  left := PredicationCell.converse_converse
  right := PredicationCell.converse_converse

/-- **(B1, converse)** The converse quantifier adjunction
`∃_converse ⊣ converse* ⊣ ∀_converse`, with all three equal to `reindex converse`. -/
theorem converse_adjunction :
    GaloisK (reindex PredicationCell.converse) (reindex PredicationCell.converse) :=
  galois_reindex converseIso

/-- Reindexing along converse is self-inverse (it is an order-iso). -/
@[simp] theorem reindex_converse_converse (v : Valuation) :
    reindex PredicationCell.converse (reindex PredicationCell.converse v) = v := by
  funext φ
  show v (PredicationCell.converse (PredicationCell.converse φ)) = v φ
  rw [PredicationCell.converse_converse]

/-- **(B2, converse) Frobenius reciprocity** for the converse quantifier:
`∃_f(f*α ⊓ φ) = α ⊓ ∃_f φ`, with `∃_f = f* = reindex converse`. -/
theorem converse_frobenius (α φ : Valuation) :
    reindex PredicationCell.converse (meetK (reindex PredicationCell.converse α) φ)
      = meetK α (reindex PredicationCell.converse φ) := by
  rw [reindex_meetK, reindex_converse_converse]

/-- **(B3) Beck–Chevalley** in the bijection case: reindexings along commuting base
maps commute. Over a pullback of bijections the canonical comparison is the
identity. -/
theorem beck_chevalley (r s : PredicationCell → PredicationCell)
    (hcomm : s ∘ r = r ∘ s) (v : Valuation) :
    reindex r (reindex s v) = reindex s (reindex r v) := by
  rw [reindex_comp, reindex_comp, hcomm]

end Valuation

end RelMath
