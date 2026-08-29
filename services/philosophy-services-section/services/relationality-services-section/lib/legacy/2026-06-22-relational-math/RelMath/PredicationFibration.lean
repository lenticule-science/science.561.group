/-
# PredicationFibration — the cloven Grothendieck fibration of valuation fibers

This module formalizes the corpus node

  content/.../positing/.../predication-fiber-algebra/content/predication-fibration/predication-fibration.md

A **predication fibration** over base parameters `(L, C, E)` — `L` an integral
commutative residuated lattice, `C` the small predicate category with finite limits,
`E` the entity set — is a cloven Grothendieck fibration `p : E ↠ C` satisfying:

* **(A1) Fiber uniformity.** Each fiber `E_q := p⁻¹(q)` is canonically the
  predication fiber algebra `A_q = L^{⋈ E×E}`, i.e. **the valuation fiber**
  `Valuation = PredicationCell → Charge`, viewed as a thin category by its `≤ₖ` poset.
* **(A2) Generator action.** For each of the four predicate-category generators —
  *specialization*, *converse*, *subject-projection*, *object-projection* — the
  reindexing `f* : E_p → E_q` acts by the specified **cellwise reindexing**.
* **(A3) Fiber-structure preservation.** Every reindexing `f*` is a
  **bilattice-residuated homomorphism**: it preserves `∧ₜ, ∨ₜ, ∧ₖ, ∨ₖ`, negation `∼`,
  twist-product fusion `⊙`, and the right residual `⇒`, *pointwise*.

In RelMath the base maps `f` of the predicate category are realized as the cellwise
reindexings `r : PredicationCell → PredicationCell` of `Predicating` (the four
generators are exactly `converse`, `subjProj`, `objProj`, and `specialize f`). The
reindexing functor is `Valuation.reindex` of `Hyperdoctrine`, **precomposition**
`f* v = v ∘ f`. Because every bilattice-residuated operation on `Valuation` is the
*pointwise* lift of the `Charge` operation, precomposition commutes with each one by a
single `rfl` (under `funext`): **reindexing is a strict homomorphism**, the sharp form
of (A3). This is the no-free-data shadow of the fact that a presheaf of bilattice
algebras has bilattice-homomorphism reindexings.

By the Emmenegger fibration-2-comonad result a cloven fibration over `C` is exactly a
**pseudo-N-coalgebra** for the lax-idempotent 2-comonad `N` on `Cat/C`; the **Grothendieck
transpose** of the fibration is the predication fiber functor `F : C^op → DBiLat(L)`,
i.e. cloven fibrations correspond to pseudo-functors `C^op → Cat`. Here `C` is realized
*strictly* (cellwise reindexings compose on the nose, `reindex_comp`), so the transpose
is a genuine **contravariant functor** `C^op → (fiber algebras)`: `reindex_id` and the
contravariant `reindex_comp` are functoriality, and (A1) identifies the value algebra.
We scope this honestly: ours is the **strict** coalgebra / strict presheaf; the pseudo
layer is the lax composition of *named* generators in the abstract predicate category,
which our concrete cellwise model does not need.
-/
import RelMath.Predicating
import RelMath.Hyperdoctrine
import RelMath.Positing

namespace RelMath
namespace Fibration

open RelMath.Valuation

/-! ## 0. The bilattice-residuated operations on the valuation fiber

The fiber `Valuation = PredicationCell → Charge` carries the **pointwise** lift of each
bilattice-residuated operation on `Charge`. `meetK` (from `Hyperdoctrine`) and `joinK`
(from `Positing`) already exist; we add the truth meet/join, negation, fusion `⊙`, and
the right residual `⇒`. Fusion is the integral commutative residuated `⊗`, realized on
the truth order as `meetT` (the integral fusion of the bilattice's truth lattice); the
right residual `⇒` is the truth-order Heyting implication adjoint to it. -/

/-- Pointwise truth-meet `∧ₜ` of valuations. -/
def meetT (v w : Valuation) : Valuation := fun φ => Charge.meetT (v φ) (w φ)

/-- Pointwise truth-join `∨ₜ` of valuations. -/
def joinT (v w : Valuation) : Valuation := fun φ => Charge.joinT (v φ) (w φ)

/-- Pointwise negation `∼` of valuations — swap the two charge slots. -/
def negate (v : Valuation) : Valuation := fun φ => Charge.negate (v φ)

/-- The **twist-product fusion** `⊙` on the fiber: the integral commutative fusion,
realized as the truth-order meet `∧ₜ` (the integral `⊗` of the truth lattice). -/
def fusion (v w : Valuation) : Valuation := fun φ => Charge.meetT (v φ) (w φ)

/-- The **right residual** `⇒` on the fiber: the truth-order Heyting implication
adjoint to fusion, `a ⇒ c = ofSlots ((¬aₚ)∨cₚ) ((¬aₙ)∧cₙ)`, lifted pointwise. -/
def residual (v w : Valuation) : Valuation :=
  fun φ => Charge.ofSlots ((! (v φ).pos) || (w φ).pos) ((! (v φ).neg) && (w φ).neg)

/-! ## 1. The `Fibration` structure — total-space/fiber data with cleavage

The cloven Grothendieck fibration is given by its **cleavage**: the reindexing functor
on fibers for each base map. Over `C` realized as cellwise reindexings, the cleavage is
`Valuation.reindex` (precomposition). The fibers are `Valuation` (A1), thin via `leK`. -/

/-- A **predication fibration** datum over the predicate base `C` (realized as cellwise
reindexings `PredicationCell → PredicationCell`): the fiber type, its thin `≤ₖ` order,
and the cleavage `reindex`. The fibers ARE the valuation fiber algebra `A_q` (A1); the
cleavage IS precomposition. Our own bundle — *not* an abstract `Fibration` class. -/
structure Fibration where
  /-- The fiber over each base object — the predication fiber algebra `A_q` (A1). -/
  Fiber : Type
  /-- The fiber's thin-category order `≤ₖ`. -/
  fibLeK : Fiber → Fiber → Prop
  /-- The cleavage: reindexing along a base map `f : q → p` (a cellwise reindexing). -/
  reindex : (PredicationCell → PredicationCell) → Fiber → Fiber
  /-- Reindexing is monotone — functoriality on the thin fibers. -/
  reindex_mono : ∀ (r : PredicationCell → PredicationCell) {v w : Fiber},
    fibLeK v w → fibLeK (reindex r v) (reindex r w)
  /-- Reindexing along the identity is the identity — `reindex_id`. -/
  reindex_id : ∀ v : Fiber, reindex id v = v
  /-- Reindexing is contravariantly functorial — `reindex_comp`. -/
  reindex_comp : ∀ (r s : PredicationCell → PredicationCell) (v : Fiber),
    reindex r (reindex s v) = reindex (s ∘ r) v

/-- **The predication fibration** — the canonical datum: fibers are the valuation fiber
algebra (A1), the order is the pointwise `leK`, the cleavage is `Valuation.reindex`. All
functoriality fields are `Hyperdoctrine`'s proven `reindex_mono`/`reindex_id`/
`reindex_comp`. -/
def predicationFibration : Fibration where
  Fiber := Valuation
  fibLeK := Valuation.leK
  reindex := Valuation.reindex
  reindex_mono := fun r {_ _} h => Valuation.reindex_mono r h
  reindex_id := Valuation.reindex_id
  reindex_comp := Valuation.reindex_comp

/-! ## 2. (A2) Generator action — the four generators reindex cellwise

The four predicate-category generators act by their cellwise reindexings: `converse`,
`subjProj`, `objProj`, `specialize f`. Reindexing the fiber along each is precisely
precomposition with that cellwise map. These are definitional (`reindex r v = v ∘ r`). -/

/-- **(A2)** Reindexing along the **converse** generator is precomposition with
`PredicationCell.converse`. -/
theorem generator_converse (v : Valuation) :
    Valuation.reindex PredicationCell.converse v
      = fun φ => v (PredicationCell.converse φ) := rfl

/-- **(A2)** Reindexing along the **subject-projection** generator. -/
theorem generator_subjProj (v : Valuation) :
    Valuation.reindex PredicationCell.subjProj v
      = fun φ => v (PredicationCell.subjProj φ) := rfl

/-- **(A2)** Reindexing along the **object-projection** generator. -/
theorem generator_objProj (v : Valuation) :
    Valuation.reindex PredicationCell.objProj v
      = fun φ => v (PredicationCell.objProj φ) := rfl

/-- **(A2)** Reindexing along a **specialization** generator `specialize f`. -/
theorem generator_specialize (f : Predicate → Predicate) (v : Valuation) :
    Valuation.reindex (PredicationCell.specialize f) v
      = fun φ => v (PredicationCell.specialize f φ) := rfl

/-! ## 3. (A3) — reindexing is a bilattice-residuated homomorphism

Each reindexing `f* = reindex r` is precomposition, and each bilattice-residuated
operation is the pointwise lift of the corresponding `Charge` operation. Hence `f*`
distributes over every operation **pointwise**: `reindex r (op v w) = op (reindex r v)
(reindex r w)`, and `reindex r (negate v) = negate (reindex r v)`. Each is `funext` +
`rfl`. We prove the seven distribution laws, then bundle them. -/

/-- `f*` preserves the **knowledge meet** `∧ₖ`. -/
theorem reindex_meetK (r : PredicationCell → PredicationCell) (v w : Valuation) :
    Valuation.reindex r (Valuation.meetK v w)
      = Valuation.meetK (Valuation.reindex r v) (Valuation.reindex r w) := rfl

/-- `f*` preserves the **knowledge join** `∨ₖ`. -/
theorem reindex_joinK (r : PredicationCell → PredicationCell) (v w : Valuation) :
    Valuation.reindex r (Valuation.joinK v w)
      = Valuation.joinK (Valuation.reindex r v) (Valuation.reindex r w) := rfl

/-- `f*` preserves the **truth meet** `∧ₜ`. -/
theorem reindex_meetT (r : PredicationCell → PredicationCell) (v w : Valuation) :
    Valuation.reindex r (meetT v w)
      = meetT (Valuation.reindex r v) (Valuation.reindex r w) := rfl

/-- `f*` preserves the **truth join** `∨ₜ`. -/
theorem reindex_joinT (r : PredicationCell → PredicationCell) (v w : Valuation) :
    Valuation.reindex r (joinT v w)
      = joinT (Valuation.reindex r v) (Valuation.reindex r w) := rfl

/-- `f*` preserves **negation** `∼`. -/
theorem reindex_negate (r : PredicationCell → PredicationCell) (v : Valuation) :
    Valuation.reindex r (negate v) = negate (Valuation.reindex r v) := rfl

/-- `f*` preserves the **twist-product fusion** `⊙`. -/
theorem reindex_fusion (r : PredicationCell → PredicationCell) (v w : Valuation) :
    Valuation.reindex r (fusion v w)
      = fusion (Valuation.reindex r v) (Valuation.reindex r w) := rfl

/-- `f*` preserves the **right residual** `⇒`. -/
theorem reindex_residual (r : PredicationCell → PredicationCell) (v w : Valuation) :
    Valuation.reindex r (residual v w)
      = residual (Valuation.reindex r v) (Valuation.reindex r w) := rfl

/-- A proof-carrying bundle of the bilattice-residuated homomorphism laws for one
reindexing `f* = reindex r`. -/
structure IsBilatticeHom (r : PredicationCell → PredicationCell) : Prop where
  /-- Preserves `∧ₖ`. -/
  meetK : ∀ v w, Valuation.reindex r (Valuation.meetK v w)
      = Valuation.meetK (Valuation.reindex r v) (Valuation.reindex r w)
  /-- Preserves `∨ₖ`. -/
  joinK : ∀ v w, Valuation.reindex r (Valuation.joinK v w)
      = Valuation.joinK (Valuation.reindex r v) (Valuation.reindex r w)
  /-- Preserves `∧ₜ`. -/
  meetT : ∀ v w, Valuation.reindex r (meetT v w)
      = meetT (Valuation.reindex r v) (Valuation.reindex r w)
  /-- Preserves `∨ₜ`. -/
  joinT : ∀ v w, Valuation.reindex r (joinT v w)
      = joinT (Valuation.reindex r v) (Valuation.reindex r w)
  /-- Preserves negation `∼`. -/
  negate : ∀ v, Valuation.reindex r (negate v) = negate (Valuation.reindex r v)
  /-- Preserves fusion `⊙`. -/
  fusion : ∀ v w, Valuation.reindex r (fusion v w)
      = fusion (Valuation.reindex r v) (Valuation.reindex r w)
  /-- Preserves the right residual `⇒`. -/
  residual : ∀ v w, Valuation.reindex r (residual v w)
      = residual (Valuation.reindex r v) (Valuation.reindex r w)

/-- **A3.** Every reindexing `f* = reindex r` is a
**bilattice-residuated homomorphism**: it preserves `∧ₖ, ∨ₖ, ∧ₜ, ∨ₜ`, negation `∼`,
fusion `⊙`, and the right residual `⇒`, pointwise. Each law holds because reindexing is
precomposition and every operation is a pointwise lift, so `funext`+`rfl` discharges it.
This is (A3) in its sharp **strict** form (the corpus's "preserves … pointwise"). -/
theorem reindex_is_bilattice_homomorphism (r : PredicationCell → PredicationCell) :
    IsBilatticeHom r where
  meetK := reindex_meetK r
  joinK := reindex_joinK r
  meetT := reindex_meetT r
  joinT := reindex_joinT r
  negate := reindex_negate r
  fusion := reindex_fusion r
  residual := reindex_residual r

/-! ## 4. The Grothendieck transpose

A cloven fibration corresponds to a pseudo-functor `C^op → Cat`; for the predication
fibration this is the **predication fiber functor** `F : C^op → DBiLat(L)`. In our
strict cellwise model the correspondence is a genuine **contravariant functor**: the
object map sends every base object to the one fiber algebra `Valuation` (A1, fiber
uniformity — the value category is the bilattice fiber algebra, the same at each object),
and the morphism map sends each base map `r` to the reindexing `reindex r`, which is

* **functorial on identities**: `reindex id = id` (`reindex_id`), and
* **contravariantly functorial on composites**: `reindex r ∘ reindex s = reindex (s ∘ r)`
  (`reindex_comp`),

and lands in the bilattice fiber algebras because each `reindex r` is a bilattice
homomorphism (`reindex_is_bilattice_homomorphism`, A3). We bundle: functoriality +
fiber uniformity (A1) + the homomorphism-valued transpose. -/

/-- A proof-carrying bundle witnessing the **Grothendieck transpose**: the predication
fibration *is* a contravariant functor `C^op → (bilattice fiber algebras)`. -/
structure GrothendieckTranspose where
  /-- (A1) Fiber uniformity: the value category is the valuation fiber algebra at every
  base object — the canonical fiber `A_q = Valuation`. The object map of `F` is constant
  at this algebra (the same `DBiLat(L)` object at each `q`). -/
  fiberUniform : predicationFibration.Fiber = Valuation
  /-- Functoriality on identities: `F(id) = id`. -/
  transpose_id : ∀ v : Valuation, Valuation.reindex id v = v
  /-- Contravariant functoriality on composites: `F(s) ∘ F(r) = F(r ∘ s)`, i.e.
  `reindex r ∘ reindex s = reindex (s ∘ r)` (the `C^op` direction). -/
  transpose_comp : ∀ (r s : PredicationCell → PredicationCell) (v : Valuation),
    Valuation.reindex r (Valuation.reindex s v) = Valuation.reindex (s ∘ r) v
  /-- The transpose lands in bilattice fiber algebras: each `F(r) = reindex r` is a
  bilattice-residuated homomorphism (A3). -/
  transpose_hom : ∀ r : PredicationCell → PredicationCell, IsBilatticeHom r

/-- The predication fibration corresponds to the **predication fiber
functor** `F : C^op → DBiLat(L)` — the Grothendieck transpose. In the strict cellwise
model `F` is the contravariant functor `r ↦ reindex r`: functorial (`reindex_id`,
contravariant `reindex_comp`), constant on objects at the uniform fiber algebra
`Valuation` (A1), and bilattice-homomorphism-valued (A3). The pseudo-layer of the
abstract Emmenegger statement is the lax composition of *named* generators in the
abstract predicate category; the concrete cellwise base composes strictly, so here the
transpose is a strict presheaf into the bilattice fiber algebras. -/
theorem fibration_grothendieck_transpose : GrothendieckTranspose where
  fiberUniform := rfl
  transpose_id := Valuation.reindex_id
  transpose_comp := Valuation.reindex_comp
  transpose_hom := reindex_is_bilattice_homomorphism

end Fibration
end RelMath
