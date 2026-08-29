/-
# LinearLogicChu — Chu spaces over FOUR and FOUR's *-autonomous alphabet

The corpus node
`positing/content/residuated-lattice/content/twist-product/.../bilattice/content/four-bilattice/content/chu-space-over-four/chu-space-over-four.md`
reads the smallest non-trivial interlaced bilattice **FOUR** as the *alphabet* of
a category of **Chu spaces valued in FOUR**. A Chu space `C = ⟨pts, sts, r⟩` is a
pair of carriers together with a FOUR-valued matrix `r : pts → sts → Charge`
(a relation that records, for each point/state pair, one of the four charges
⊥ₖ / t / f / ⊤ₖ). The category `Chu(FOUR)` is **\*-autonomous**: it carries an
involutive dual built by *transposing and negating* the matrix, and its morphisms
(Chu transforms) are adjoint pairs whose adjointness is an *equality in FOUR*.

The substructural↔algebraic correspondence (Lambek; here commutative since the
alphabet's fusion `⊙` is commutative) is that the alphabet FOUR is itself
\*-autonomous as a residuated lattice: its own tensor `⊗ = ⊙` (fusion) is left
adjoint to its hom `⊸ = ⇒` (residual), and the negation `negate` is a De Morgan
linear involution. This module adds the **Chu-SPACE layer** on top of the alphabet
already built in `TwistProductResiduation` — it does NOT re-derive the alphabet's
residuation; it reuses `TwistProduct.fuse_leT_iff` and `Charge.negate_negate`.

Headlines:

* **`RelMath.Chu.dual_involution`** — `dual (dual C) = C`. The dual transposes the
  matrix (`pts ↔ sts`) and negates each entry; doing it twice transposes back
  (structure eta) and double-negates each charge (`Charge.negate_negate`), giving
  back `C` exactly. Proven as propositional equality of the `ChuSpace` structures.
* **`RelMath.four_star_autonomous`** — FOUR is \*-autonomous: bundle the tensor/hom
  adjunction `⊙ a b ≤ₜ c ↔ a ≤ₜ (b ⇒ c)` (reused verbatim from
  `TwistProduct.fuse_leT_iff` on the alphabet) with the De Morgan linear
  involution `negate (negate x) = x` (`Charge.negate_negate`) and the alphabet's
  own dual-of-dual identity. Avron's four-valued substructural logic: the
  residuated adjunction *is* the `⊗ ⊣ ⊸` of the Lambek/linear calculus, and the
  involution makes the alphabet a Chu/\*-autonomous object over itself.

Supporting structure: Chu transforms (`ChuMap`) with adjointness as a FOUR-equality,
their identity and (contravariant) composition preserving adjointness, and the dual
of a transform `(f,g) ↦ (g,f) : dual D → dual C`.
-/
import RelMath.TwistProductResiduation
import RelMath.ResiduatedLatticeStandalone

namespace RelMath

open RelMath.Order

/-! ## Chu spaces valued in FOUR

A Chu space over the alphabet FOUR is two carriers and a `Charge`-valued matrix.
We keep the carriers fully general `Type`s; the matrix `r : pts → sts → Charge`
*is* the FOUR-valued relation. -/

/-- A **Chu space valued in FOUR** `⟨pts, sts, r⟩`: a set of points, a set of
states, and a FOUR-valued matrix `r : pts → sts → Charge` recording one of the
four charges ⊥ₖ / t / f / ⊤ₖ for each point/state pair. -/
structure ChuSpace where
  /-- The points (rows of the FOUR-valued matrix). -/
  pts : Type
  /-- The states (columns of the FOUR-valued matrix). -/
  sts : Type
  /-- The FOUR-valued relation matrix. -/
  r : pts → sts → Charge

namespace ChuSpace

/-- The **dual** of a Chu space: transpose the matrix (`pts ↔ sts`) and **negate**
each FOUR entry. `dual C = ⟨C.sts, C.pts, fun x a => negate (C.r a x)⟩`. This is
the linear-logic dual `(–)^⊥` of `Chu(FOUR)`. -/
def dual (C : ChuSpace) : ChuSpace where
  pts := C.sts
  sts := C.pts
  r := fun x a => Charge.negate (C.r a x)

/-- **The dual is an involution.** `dual (dual C) = C`. Transposing
twice returns the original orientation (structure eta) and negating twice is the
identity on charges (`Charge.negate_negate`). Proven as propositional equality of
the `ChuSpace` structures: the `pts`/`sts` components are definitionally equal and
the matrix is equal by `funext`. -/
theorem dual_involution (C : ChuSpace) : dual (dual C) = C := by
  -- `dual (dual C)` has pts = C.pts, sts = C.sts, and matrix
  -- `fun a x => negate (negate (C.r a x))`. Rewrite the matrix to `C.r`.
  cases C with
  | mk pts sts r =>
    show dual (dual (mk pts sts r)) = mk pts sts r
    -- The only nontrivial component is the matrix; reduce it pointwise.
    have hr : (fun a x => Charge.negate (Charge.negate (r a x))) = r := by
      funext a x
      exact Charge.negate_negate (r a x)
    -- `dual (dual …)` unfolds to `mk pts sts (fun a x => negate (negate (r a x)))`.
    show ChuSpace.mk pts sts (fun a x => Charge.negate (Charge.negate (r a x)))
        = ChuSpace.mk pts sts r
    rw [hr]

/-- Pointwise form of the involution (useful when one only needs the matrix
identity): `(dual (dual C)).r a x = C.r a x`. -/
theorem dual_dual_r (C : ChuSpace) (a : C.pts) (x : C.sts) :
    (dual (dual C)).r a x = C.r a x :=
  Charge.negate_negate (C.r a x)

end ChuSpace

/-! The `Chu` namespace re-exports the Chu-space dual and its involution at the
spec'd headline path `RelMath.Chu.dual_involution`. -/
namespace Chu

/-- **The Chu dual is an involution** (`RelMath.Chu.dual_involution`).
`dual (dual C) = C`, restated at the `Chu` namespace from `ChuSpace.dual_involution`. -/
theorem dual_involution (C : ChuSpace) : ChuSpace.dual (ChuSpace.dual C) = C :=
  ChuSpace.dual_involution C

end Chu

/-! ## Chu transforms

A morphism of Chu spaces `C → D` is a **forward** map on points together with a
**backward** map on states (contravariant), satisfying the adjointness condition
that the two ways of evaluating the matrix agree *as charges in FOUR*. -/

/-- A **Chu transform** `C → D`: a forward map `fwd : C.pts → D.pts`, a backward
map `bwd : D.sts → C.sts`, and the **adjointness equality in FOUR**
`D.r (fwd a) y = C.r a (bwd y)` for every point `a` and state `y`. -/
structure ChuMap (C D : ChuSpace) where
  /-- Forward map on points. -/
  fwd : C.pts → D.pts
  /-- Backward map on states (contravariant). -/
  bwd : D.sts → C.sts
  /-- Adjointness as an equality of charges in FOUR. -/
  adj : ∀ (a : C.pts) (y : D.sts), D.r (fwd a) y = C.r a (bwd y)

namespace ChuMap

/-- The **identity** Chu transform. Adjointness is `rfl`. -/
def id (C : ChuSpace) : ChuMap C C where
  fwd := fun a => a
  bwd := fun x => x
  adj := fun _ _ => rfl

/-- **Composition** of Chu transforms. Forward maps compose forward; backward maps
compose *backward* (contravariant). Adjointness chains the two equalities. -/
def comp {C D E : ChuSpace} (f : ChuMap C D) (g : ChuMap D E) : ChuMap C E where
  fwd := fun a => g.fwd (f.fwd a)
  bwd := fun z => f.bwd (g.bwd z)
  adj := fun a z => by
    -- E.r (g.fwd (f.fwd a)) z = D.r (f.fwd a) (g.bwd z) = C.r a (f.bwd (g.bwd z))
    rw [g.adj (f.fwd a) z, f.adj a (g.bwd z)]

/-- The **dual** of a Chu transform `(f,g) ↦ (g,f) : dual D → dual C`: forward and
backward swap roles, and adjointness in the dual is the original adjointness with
both sides negated. -/
def dualMap {C D : ChuSpace} (f : ChuMap C D) : ChuMap (ChuSpace.dual D) (ChuSpace.dual C) where
  fwd := f.bwd
  bwd := f.fwd
  adj := fun y a => by
    -- (dual C).r (f.bwd y) a = negate (C.r a (f.bwd y))
    -- (dual D).r y (f.fwd a) = negate (D.r (f.fwd a) y)
    show Charge.negate (C.r a (f.bwd y)) = Charge.negate (D.r (f.fwd a) y)
    rw [f.adj a y]

end ChuMap

/-! ## FOUR is \*-autonomous (the substructural↔algebraic correspondence)

The alphabet FOUR — the twist product `Two^⊲`, carrier `Bool × Bool`, identified
with `Charge` by `FOUR.toCharge` in `TwistProductResiduation` — is itself a
\*-autonomous object: a commutative residuated lattice whose negation is a De
Morgan linear involution. We do NOT re-derive the residuation; we lift it.

* The **tensor/hom adjunction** `⊗ ⊣ ⊸` is `TwistProduct.fuse_leT_iff` on the
  alphabet: `fuse a b ≤ₜ c ↔ a ≤ₜ (imp b c)`, the `⊗ ⊣ ⊸` of the Lambek/linear
  calculus (commutative because `⊙` is commutative).
* The **linear involution** is `Charge.negate` (the bilattice negation = twist
  coordinate swap), self-inverse by `Charge.negate_negate`, matching the Chu
  dual's double-negation. -/

namespace Order
namespace TwistProduct

/-- The alphabet tensor `⊗ := ⊙` (fusion) on FOUR — the multiplicative conjunction
of Avron's four-valued linear logic. -/
abbrev fourTensor (a b : Carrier Two) : Carrier Two := fuse a b
/-- The alphabet hom `⊸ := ⇒` (residual) on FOUR — the linear implication. -/
abbrev fourHom (a b : Carrier Two) : Carrier Two := imp a b

/-- **The `⊗ ⊣ ⊸` adjunction on the alphabet FOUR.** This *is* `fuse_leT_iff`
specialized to `Two`: `a ⊗ b ≤ₜ c ↔ a ≤ₜ (b ⊸ c)`. The residuated adjunction is
the tensor/hom adjunction of the linear/Lambek calculus. -/
theorem fourTensor_leT_iff (a b c : Carrier Two) :
    leT (fourTensor a b) c ↔ leT a (fourHom b c) :=
  fuse_leT_iff a b c

end TwistProduct
end Order

/-- The De Morgan **linear involution** of the alphabet, transported to `Charge`:
`negate (negate x) = x` (`Charge.negate_negate`). This is the same involution the
Chu dual applies entrywise, witnessing the \*-autonomous duality `(–)^⊥⊥ = (–)`. -/
theorem four_negate_involution (x : Charge) : Charge.negate (Charge.negate x) = x :=
  Charge.negate_negate x

/-- **FOUR is \*-autonomous.** The alphabet FOUR bundles, as one object:

1. the **tensor/hom adjunction** `⊗ a b ≤ₜ c ↔ a ≤ₜ (b ⊸ c)` (reused verbatim from
   `TwistProduct.fuse_leT_iff` — the `⊗ ⊣ ⊸` of the substructural/linear calculus,
   commutative because `⊙` is commutative);
2. the **De Morgan linear involution** `negate (negate x) = x` (the bilattice
   negation, self-inverse), the same involution the Chu dual applies entrywise.

Together these are Avron's four-valued substructural logic seen \*-autonomously:
the residuated adjunction is the linear `⊗ ⊣ ⊸`, and the involution makes the
alphabet a self-dual Chu object. No law is re-postulated — both conjuncts are
dependency lemmas. -/
theorem four_star_autonomous :
    (∀ a b c : Order.TwistProduct.Carrier Order.Two,
        Order.TwistProduct.leT (Order.TwistProduct.fuse a b) c
          ↔ Order.TwistProduct.leT a (Order.TwistProduct.imp b c))
      ∧ (∀ x : Charge, Charge.negate (Charge.negate x) = x) :=
  ⟨Order.TwistProduct.fuse_leT_iff, four_negate_involution⟩

end RelMath
