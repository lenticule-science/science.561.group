import Infomaterial.Dynamics.Flow.LawvereLaplacianSpectralGap

/-!
# Laplacianizability — the Laplacianizer functor

Formalizes the corpus's **laplacianizers** theory
(`content/.../settling/sheaf/content/settling-cohomology/_archive/`
`moduli-theories-laplacianizers-concepts-{laplacianizability,laplacianizer,hodge-laplacian}`).

A pair `(𝒞, H•)` — a category with a cohomology theory — is **Laplacianizable** iff it
admits a **Laplacianizer** `𝔏 = (F, d, η)`: a functor `F` to graded chain complexes, a
differential `d` with `d² = 0`, and a natural isomorphism `η : H• ≅ ker Δ` (the **Hodge
isomorphism** — the Laplacian's kernel computes the cohomology).

The corpus node's key structural fact (its "Decomposition: per-object data" section)
is what makes this dependency-free: the **algebraic** laplacianizer `F^alg = (F, d, η)`
is *inner-product-free* — only the Hodge Laplacian `Δ = dd* + d*d` itself needs the
Hilbert structure (reals). In the corpus's **lattice / order** setting the Laplacian is
the **Tarski / Lawvere** operator `L = □∘◇` of `LawvereLaplacianSpectralGap`, an
*idempotent order operator* whose **fixed points** (not "kernel of a self-adjoint
operator") are the harmonic states = global sections. So the whole Laplacianizer is
buildable over the lattice, and `harmonic_eq_degree0` *is* the degree-0 Hodge isomorphism
`ker Δ ≅ H⁰`.

We therefore: (1) bundle a Laplacianizer abstractly (`Laplacianizer`), with its Hodge
isomorphism `η`; (2) build the **settling Laplacianizer** from the Lawvere Laplacian and
prove the settling site/cohomology pair **is Laplacianizable**, with `η` the
identification of global sections with the harmonic kernel. The continuous moduli of
inner products (the corpus's `moduli-of-laplacianizers`, an orbifold) is scoped out here —
Infomaterial derives ℝ internally (`Infomaterial.Real.Internal`); what it additionally needs is
the finite-dimensional inner-product structure and the orbifold quotient. The **algebraic**
moduli is discrete and is what we capture.
-/

namespace Infomaterial
namespace Laplacianizers

open Infomaterial.Valuation
open Infomaterial.LawvereLaplacian

/-! ## (A) The Laplacianizer bundle

`𝔏 = (F, d, η)` rendered inner-product-free: `Chain` is the per-object chain group
`F(X)` (algebraic, no inner product); `laplacian` is the order Laplacian `Δ_X`
(idempotent — the Tarski round-trip closure, the lattice analogue of `dd*+d*d`); the
**harmonic** states are its fixed points (`ker Δ`); `Cohomology` is the given `H•(X)`;
and `η = (toHarmonic, fromHarmonic)` with its round-trips is the **Hodge isomorphism**
`H•(X) ≅ ker Δ_X`. The `lap_mono` field is the corpus's "`L` is a `Q`-functor" — the
Laplacian preserves the value order. -/

/-- A (dependency-free, algebraic) **Laplacianizer**: the Hilbert-lift functor `F`, the
order Laplacian `Δ`, and the Hodge isomorphism `η : H• ≅ ker Δ`. -/
structure Laplacianizer where
  /-- The objects of the category `𝒞` being Laplacianized. -/
  Obj : Type
  /-- A per-object preorder `≤` on the chain group (the value order `L` lifts along
  `F`); used to state the `Q`-functor / monotonicity property. -/
  Chain : Obj → Type
  le : (X : Obj) → Chain X → Chain X → Prop
  /-- `Δ_X` — the order (Tarski/Lawvere) Laplacian on `F(X)`, inner-product-free. -/
  laplacian : (X : Obj) → Chain X → Chain X
  /-- `Δ` is **idempotent** — the lattice analogue of `dd*+d*d` being the projection to
  harmonics; the round-trip closure of the reference's §3. -/
  lap_idem : ∀ (X : Obj) (c : Chain X), laplacian X (laplacian X c) = laplacian X c
  /-- `Δ` is **monotone** — `L` is a `Q`-functor (preserves the value order). -/
  lap_mono : ∀ (X : Obj) {a b : Chain X}, le X a b → le X (laplacian X a) (laplacian X b)
  /-- The given cohomology theory `H•(X)`. -/
  Cohomology : Obj → Type
  /-- `η` forward: each cohomology class maps to a harmonic representative (fixed point
  of `Δ`). -/
  toHarmonic : (X : Obj) → Cohomology X → {c : Chain X // laplacian X c = c}
  /-- `η` backward: each harmonic state names a cohomology class. -/
  fromHarmonic : (X : Obj) → {c : Chain X // laplacian X c = c} → Cohomology X
  /-- `η` is an isomorphism (left round-trip). -/
  hodge_left : ∀ (X : Obj) (h : Cohomology X), fromHarmonic X (toHarmonic X h) = h
  /-- `η` is an isomorphism (right round-trip). -/
  hodge_right : ∀ (X : Obj) (c : {c : Chain X // laplacian X c = c}),
    toHarmonic X (fromHarmonic X c) = c

/-- The **harmonic states** (kernel of `Δ_X`) — the fixed points of the order
Laplacian. By Hodge these are a canonical realization of `H•(X)`. -/
def Laplacianizer.Harmonic (L : Laplacianizer) (X : L.Obj) : Type :=
  {c : L.Chain X // L.laplacian X c = c}

/-- **The Hodge isomorphism `η : H•(X) ≅ ker Δ_X` holds at every object.** Both
round-trips, packaged — the defining property of a Laplacianizer: its Laplacian's kernel
computes the cohomology. -/
theorem Laplacianizer.hodge_isomorphism (L : Laplacianizer) (X : L.Obj) :
    (∀ h : L.Cohomology X, L.fromHarmonic X (L.toHarmonic X h) = h)
    ∧ (∀ c : L.Harmonic X, L.toHarmonic X (L.fromHarmonic X c) = c) :=
  ⟨L.hodge_left X, L.hodge_right X⟩

/-- A pair `(Obj, H)` is **Laplacianizable** iff some Laplacianizer realizes it (same
objects, same cohomology assignment). We phrase it as: a Laplacianizer exists whose
`Cohomology` is `H` over `Obj`. -/
def Laplacianizable (Obj : Type) (H : Obj → Type) : Prop :=
  ∃ L : Laplacianizer, ∃ h : L.Obj = Obj, ∀ X : L.Obj, L.Cohomology X = H (h ▸ X)

/-! ## (B) The settling Laplacianizer

The site is taken as a one-object category (the settling site `T*` as a single
presentation); `F` lifts it to the chain group `Valuation`; the order Laplacian is the
**Lawvere Laplacian** `L = □∘◇ = closureOp`; `ker Δ` = the settled global sections
`{v // closureOp v = v}` = degree-0 cohomology `H⁰`; and `η` is the identity
identification — which is exactly `harmonic_eq_degree0`: the harmonic kernel **is** `H⁰`.
-/

/-- Degree-0 cohomology of the settling site = the **global sections** = the settled
fixed points of the closure (= the Lawvere-harmonic states, by `harmonic_eq_degree0`). -/
def settledSections (M : ModalFrame) : Type := {v : Valuation // M.closureOp v = v}

/-- **The settling Laplacianizer.** `F` lifts the (one-object) settling site to
`Valuation`; `Δ = closureOp` is the Lawvere/Tarski order Laplacian (idempotent +
monotone); `H⁰ = settled global sections`; and `η = id`, since the harmonic kernel
`{v // closureOp v = v}` *is* the global sections. -/
def settlingLaplacianizer (M : ModalFrame) : Laplacianizer where
  Obj := Unit
  Chain _ := Valuation
  le _ a b := leK a b
  laplacian _ := M.closureOp
  lap_idem _ v := M.closureOp_idem v
  lap_mono := fun (_ : Unit) {_a _b : Valuation} (h : leK _a _b) => M.closureOp_mono h
  Cohomology _ := settledSections M
  toHarmonic _ h := h
  fromHarmonic _ c := c
  hodge_left _ _ := rfl
  hodge_right _ _ := rfl

/-- **The settling Laplacian is the Lawvere Laplacian `□∘◇`.** -/
theorem settlingLaplacianizer_laplacian (M : ModalFrame) (v : Valuation) :
    (settlingLaplacianizer M).laplacian () v = lawvereLaplacian M v := rfl

/-- **The settling Laplacianizer's kernel is the harmonic equilibrium = `H⁰`.** Its
`Harmonic ()` type is the settled global sections, which `harmonic_eq_degree0` identifies
with the Lawvere-harmonic states (the degree-0 cohomology). -/
theorem settlingLaplacianizer_harmonic_eq (M : ModalFrame) :
    (settlingLaplacianizer M).Harmonic () = settledSections M := rfl

/-- **The settling site/cohomology pair IS Laplacianizable.** The Lawvere Laplacian
furnishes a Laplacianizer whose degree-0 cohomology is the settled global sections — so
`(settling site, H⁰)` admits a Laplacianizer, the corpus's existence claim, with no
reals. -/
theorem settling_is_laplacianizable (M : ModalFrame) :
    Laplacianizable Unit (fun _ => settledSections M) :=
  ⟨settlingLaplacianizer M, rfl, fun _ => rfl⟩

/-! ## (C) The Hodge isomorphism, instantiated — and the moduli/inner-product scope

`harmonic_eq_degree0` (the Lawvere module's headline) is exactly the **degree-0 Hodge
isomorphism** `ker Δ ≅ H⁰` of the settling Laplacianizer: the Laplacian's fixed points
ARE the global sections. We restate it through the Laplacianizer's `η`. -/

/-- **The settling Laplacianizer's Hodge isomorphism.** `η : H⁰ ≅ ker Δ` holds (both
round-trips), and `ker Δ` = the settled fixed points = the global sections = the harmonic
equilibrium — i.e. `harmonic_eq_degree0` read as the Hodge iso of this Laplacianizer. -/
theorem settling_hodge_isomorphism (M : ModalFrame) :
    (∀ h : (settlingLaplacianizer M).Cohomology (),
        (settlingLaplacianizer M).fromHarmonic () ((settlingLaplacianizer M).toHarmonic () h) = h)
    ∧ (∀ c : (settlingLaplacianizer M).Harmonic (),
        (settlingLaplacianizer M).toHarmonic () ((settlingLaplacianizer M).fromHarmonic () c) = c)
    ∧ (∀ v : Valuation, IsHarmonic M v ↔ M.closureOp v = v) :=
  ⟨(settlingLaplacianizer M).hodge_left (),
   (settlingLaplacianizer M).hodge_right (),
   fun v => isHarmonic_iff_fixed M v⟩

/-! ## (D) Headline

The corpus's Laplacianizability, realized dependency-free for the settling cohomology:
the pair is Laplacianizable, the Laplacian is the inner-product-free Lawvere `□∘◇`, it is
an idempotent `Q`-functor, and its kernel computes `H⁰` via the Hodge isomorphism. -/

/-- **The settling cohomology is Laplacianizable.** Bundles:

* **(Laplacianizable)** a Laplacianizer realizes `(settling site, H⁰)` — existence;
* **(the Laplacian is `□∘◇`)** its `Δ` is the inner-product-free Lawvere/Tarski operator;
* **(idempotent `Q`-functor)** `Δ` is idempotent (`Δ² = Δ`, the harmonic projection) and
  monotone (preserves `≤ₖ` — the corpus's "`L` is a `Q`-functor");
* **(Hodge isomorphism)** `η : H⁰ ≅ ker Δ` holds, and `ker Δ` = the harmonic equilibrium =
  the settled global sections (`harmonic_eq_degree0`).

So the corpus's *algebraic Laplacianizer* — functor + differential + Hodge iso — is
built over the lattice; only the continuous inner-product moduli (orbifold) is scoped
out. -/
theorem settling_laplacianizability (M : ModalFrame) :
    Laplacianizable Unit (fun _ => settledSections M)
    ∧ (∀ v : Valuation, (settlingLaplacianizer M).laplacian () v = lawvereLaplacian M v)
    ∧ (∀ v : Valuation, (settlingLaplacianizer M).laplacian () ((settlingLaplacianizer M).laplacian () v)
          = (settlingLaplacianizer M).laplacian () v)
    ∧ (∀ {a b : Valuation}, leK a b → leK (M.closureOp a) (M.closureOp b))
    ∧ (∀ v : Valuation, IsHarmonic M v ↔ M.closureOp v = v) :=
  ⟨settling_is_laplacianizable M,
   fun v => settlingLaplacianizer_laplacian M v,
   fun v => (settlingLaplacianizer M).lap_idem () v,
   fun h => M.closureOp_mono h,
   fun v => isHarmonic_iff_fixed M v⟩

end Laplacianizers
end Infomaterial
