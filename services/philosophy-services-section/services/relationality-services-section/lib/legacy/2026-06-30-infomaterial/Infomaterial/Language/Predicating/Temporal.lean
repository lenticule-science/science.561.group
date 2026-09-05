import Infomaterial.Language.Predicating.Cell
import Infomaterial.Calculus.Order.OrderInfra
import Infomaterial.Language.Predicating.HyperdoctrineDual

/-!
# Temporal 2-category — `T(C, λ)` packaging predicate-axis and settling-axis

This module formalizes the **temporal 2-category** `T(C, λ)`, the categorical home of
temporal Beck–Chevalley and the settling-endofunctor's 2-categorical structure. It
formalizes

* `settling/.../temporal-2-category/temporal-2-category.md`
* `settling/.../temporal-2-category/references/temporal-beck-chevalley.md`

(read in-tree under `content/.../knowledge-least-valuation/settling/content/temporal-2-category/`).

## The math

`T(C, λ)` packages the predicate-category `C` with the settling-bound `λ` into ONE
temporal structure carrying two axes:

* **0-cells** are pairs `(τ, A)` with `τ ∈ λ` a settling-step ordinal and `A ∈ Cat/C` a
  category over `C` — modeled here as an **object** of a small category `C` (the
  Cat/C-object reading; the predicate-category `C` is `Predicating`'s category of
  predication cells, reused as the canonical instance, but the development is generic
  over any small `Category`).
* **1-cells** `(f, h): (τ', A') → (τ, A)` carry TWO components: `f : A' → A` a
  `C`-morphism (the **predicate axis**) and `h : τ ≤ τ'` a `λ^op`-morphism (the
  **settling axis** — settling advances forward, so `τ' ≥ τ` and morphisms run in
  `λ^op`). `λ` is modeled as `Nat` with its `≤`, the settling-bound ordinal as an order.
* **2-cells** are pseudo-morphisms compatible with both axes: a `C`-natural
  transformation `α_f` on the predicate side plus `h`-compatibility, which — since the
  settling leg is a `Prop` (`τ ≤ τ'`) and ordinals are comparable — is automatic
  coherence (proof irrelevance).
* **Composition** is componentwise: `f`'s compose in `C`, `h`'s compose in `λ^op` by
  `Nat.le` transitivity.
* **Dual** `T*(C^op, λ^op)` reverses both axes; it is the home of temporal Beck–Chevalley
  and the dual hyperdoctrine's reindexings.

## Honest 2-categorical scoping

`T(C, λ)` is genuinely a 2-category, but we model it FAITHFULLY as a **strict 1-category
equipped with 2-cells**, which is exactly what the proof-irrelevant settling leg licenses:

* The **1-category laws on 1-cells** are proved in full (`temporal_two_category`): identity
  1-cell `(id_C, le_refl)`, associativity (`C`-assoc on the predicate leg × `Nat.le`
  proof-irrelevance on the settling leg), and left/right identity. Because the settling
  leg `τ ≤ τ'` is a `Prop`, the two `OneCell`s are equal as soon as their `C`-legs are,
  so the settling-axis coherence is *definitional*, not an extra obligation.
* The **2-cells** are defined as `C`-2-cells (here, equality of the predicate-leg
  morphism, the discrete/coherence reading the corpus's *strict-regime* simplification
  predicts — "2-cells trivialize; `T(C,λ)` collapses to `λ` as a 1-category") plus the
  automatic ordinal coherence. We prove they form a category (vertical composition
  associative, with identities). The corpus's full pseudo-natural-transformation 2-cells
  over a non-strict `Cat/C` are documented as the aperiodic-regime refinement, not built
  here; what is built is the strict/Scott-regime 2-cell structure, proved.
* **Temporal Beck–Chevalley** (`temporal_beck_chevalley`) is proved by REUSING the
  1-categorical `Valuation.beck_chevalley` (`Hyperdoctrine`) and its σ-dual
  `Valuation.beck_chevalley_dual` (`PredicationHyperdoctrineDual`), lifted to a temporal
  1-cell square: reindexing along the predicate axis commutes with settling-advance along
  the temporal axis, and the canonical comparison is the identity (an equality of
  valuations, hence order-free and invertible). This is the strict-regime instance the
  corpus's Step-2 cellwise BC reduces to.
-/

namespace Infomaterial
namespace Temporal

/-! ## The predicate category `C` — a minimal small `Category` bundle

A small category bundle (objects a `Type`, hom a family of `Type`s, identity and
composition with the three category laws). We keep this generic; `predCat` instantiates it
at `Predicating`'s predication-cell arrows so nothing new is postulated. -/

/-- A small category: the predicate-axis carrier `C`. Objects `Obj`, morphisms
`Hom A B`, identity, composition, and the three laws (left/right identity, associativity).
-/
structure Category where
  /-- Objects of `C`. -/
  Obj : Type
  /-- Morphisms `A → B` of `C`. -/
  Hom : Obj → Obj → Type
  /-- The identity morphism. -/
  id : ∀ A, Hom A A
  /-- Composition `g ∘ f`. -/
  comp : ∀ {A B D}, Hom B D → Hom A B → Hom A D
  /-- Left identity. -/
  id_comp : ∀ {A B} (f : Hom A B), comp (id B) f = f
  /-- Right identity. -/
  comp_id : ∀ {A B} (f : Hom A B), comp f (id A) = f
  /-- Associativity. -/
  comp_assoc : ∀ {A B D E} (h : Hom D E) (g : Hom B D) (f : Hom A B),
    comp (comp h g) f = comp h (comp g f)

/-- **The canonical predicate category** `C`: one object, with `Predicate → Predicate`
moves as endomorphisms — exactly `Predicating`'s `specialize` arrows on the typed middle
coordinate, whose composition is function composition (`PredicationCell.specialize_comp`)
with identities (`PredicationCell.specialize_id`). No new object data: the arrows ARE
`Predicating`'s predicate-specialization generators. -/
def predCat : Category where
  Obj := Unit
  Hom := fun _ _ => Predicate → Predicate
  id := fun _ => id
  comp := fun g f => g ∘ f
  id_comp := fun _ => rfl
  comp_id := fun _ => rfl
  comp_assoc := fun _ _ _ => rfl

/-! ## 0-cells, 1-cells, identity and composition

`λ = Nat` (the settling-bound ordinal as an order). A **0-cell** is `(τ, A)` with `τ : Nat`
and `A : C.Obj`. A **1-cell** `(τ',A') → (τ,A)` is `(f, h)` with `f : Hom A' A` (predicate
axis) and `h : τ ≤ τ'` (settling axis, `λ^op`). -/

variable (C : Category)

/-- A **0-cell** `(τ, A)`: a settling step `τ : Nat` together with an object `A` of the
predicate category `C`. -/
structure ZeroCell where
  /-- The settling-step ordinal `τ ∈ λ` (`λ = Nat`). -/
  tau : Nat
  /-- The `Cat/C`-object `A`. -/
  obj : C.Obj

/-- A **1-cell** `(τ', A') → (τ, A)`: the two-axis morphism `(f, h)`. `f : A' → A` moves
along the predicate axis; `h : τ ≤ τ'` advances along the settling axis (`λ^op` — `τ'
≥ τ`, settling runs forward). The settling leg is a `Prop`, so it carries no proof-relevant
content beyond its existence: ordinal coherence is automatic. -/
structure OneCell (src dst : ZeroCell C) where
  /-- The predicate-axis morphism `f : A' → A`. -/
  f : C.Hom src.obj dst.obj
  /-- The settling-axis morphism `h : τ ≤ τ'` (`λ^op`: `dst.tau ≤ src.tau`). -/
  h : dst.tau ≤ src.tau

/-- The **identity 1-cell** `(id_C, le_refl)`: identity on the predicate axis,
reflexivity on the settling axis. -/
def OneCell.idCell (X : ZeroCell C) : OneCell C X X where
  f := C.id X.obj
  h := Nat.le_refl X.tau

/-- **Composition** of 1-cells, componentwise: compose the `f`'s in `C`, compose the
`h`'s in `λ^op` by `Nat.le` transitivity. `g ∘ f : (τ'', A'') → (τ, A)` from
`f : (τ'', A'') → (τ', A')` and `g : (τ', A') → (τ, A)`. -/
def OneCell.comp {X Y Z : ZeroCell C} (g : OneCell C Y Z) (f : OneCell C X Y) :
    OneCell C X Z where
  f := C.comp g.f f.f
  h := Nat.le_trans g.h f.h

/-! ## `temporal_two_category`: the 1-category laws on 1-cells

`T(C, λ)` IS a (2-)category. We prove the four 1-category laws on 1-cells. The settling
leg `h : τ ≤ τ'` is a `Prop`, so two 1-cells are equal exactly when their predicate legs
are (this is where `λ^op`-coherence becomes definitional); the laws therefore follow from
the `C`-laws on the predicate leg. -/

/-- Two 1-cells are equal iff their predicate legs are equal — the settling leg is a `Prop`
(proof irrelevance). This is the formal content of "the settling-axis coherence is
automatic". -/
theorem OneCell.ext {X Y : ZeroCell C} {p q : OneCell C X Y} (hf : p.f = q.f) : p = q := by
  cases p; cases q; cases hf; rfl

/-- **`temporal_two_category`.** `T(C, λ)` satisfies the category laws on 1-cells:
left identity, right identity, and associativity of 1-cell composition. The predicate axis
contributes the `C`-laws; the settling axis (`λ^op`, a `Prop`) contributes nothing beyond
proof irrelevance, so the two-axis structure assembles into a strict 1-category. The
bundled statement records all three laws together. -/
theorem temporal_two_category :
    -- left identity:  idCell ∘ f = f
    (∀ {X Y : ZeroCell C} (f : OneCell C X Y),
        OneCell.comp C (OneCell.idCell C Y) f = f)
    -- right identity:  f ∘ idCell = f
    ∧ (∀ {X Y : ZeroCell C} (f : OneCell C X Y),
        OneCell.comp C f (OneCell.idCell C X) = f)
    -- associativity:  (h ∘ g) ∘ f = h ∘ (g ∘ f)
    ∧ (∀ {W X Y Z : ZeroCell C}
        (k : OneCell C Y Z) (g : OneCell C X Y) (f : OneCell C W X),
        OneCell.comp C (OneCell.comp C k g) f
          = OneCell.comp C k (OneCell.comp C g f)) := by
  refine ⟨?_, ?_, ?_⟩
  · intro X Y f
    apply OneCell.ext
    show C.comp (C.id Y.obj) f.f = f.f
    exact C.id_comp f.f
  · intro X Y f
    apply OneCell.ext
    show C.comp f.f (C.id X.obj) = f.f
    exact C.comp_id f.f
  · intro W X Y Z k g f
    apply OneCell.ext
    show C.comp (C.comp k.f g.f) f.f = C.comp k.f (C.comp g.f f.f)
    exact C.comp_assoc k.f g.f f.f

/-! ## 2-cells — the strict/Scott-regime 2-cell structure

A **2-cell** `α : (f₁,h₁) ⇒ (f₂,h₂)` between parallel 1-cells is a `C`-2-cell `α_f : f₁ ⇒
f₂` plus `h`-compatibility. In the strict/Scott regime the corpus's BC reduction predicts
("2-cells trivialize; `T(C,λ)` collapses to `λ` as a 1-category"), the `C`-2-cells are the
discrete ones — equalities of the predicate leg — and the `h`-compatibility is the
automatic ordinal coherence (`Prop`). We model a 2-cell as `α.eq : f₁.f = f₂.f`, and prove
the 2-cells form a category under vertical composition. -/

/-- A **2-cell** between parallel 1-cells `p, q : X → Y`: the (discrete/strict-regime)
`C`-2-cell `α_f`, an equality of predicate legs, together with the automatic settling-axis
coherence (the `h`-legs are `Prop`s, hence compatible by proof irrelevance). -/
structure TwoCell {X Y : ZeroCell C} (p q : OneCell C X Y) where
  /-- The predicate-axis 2-cell `α_f : f₁ ⇒ f₂` (strict regime: an equality of legs). -/
  eq : p.f = q.f

/-- The **identity 2-cell**. -/
def TwoCell.id {X Y : ZeroCell C} (p : OneCell C X Y) : TwoCell C p p := ⟨rfl⟩

/-- **Vertical composition** of 2-cells: `β ⊙ α : p ⇒ r` from `α : p ⇒ q` and
`β : q ⇒ r`, by transitivity of the predicate-leg equality. -/
def TwoCell.vcomp {X Y : ZeroCell C} {p q r : OneCell C X Y}
    (β : TwoCell C q r) (α : TwoCell C p q) : TwoCell C p r :=
  ⟨α.eq.trans β.eq⟩

/-- **The 2-cells compose into a category.** Vertical composition is associative with the
identity 2-cell as unit — the (strict/Scott-regime) 2-cell structure of `T(C, λ)`. Because
a `TwoCell` is a `Prop`-valued equality (`p.f = q.f` is an `Eq`, proof-irrelevant), all
three laws hold definitionally. -/
theorem twocell_category {X Y : ZeroCell C} :
    -- left identity
    (∀ {p q : OneCell C X Y} (α : TwoCell C p q),
        TwoCell.vcomp C (TwoCell.id C q) α = α)
    -- right identity
    ∧ (∀ {p q : OneCell C X Y} (α : TwoCell C p q),
        TwoCell.vcomp C α (TwoCell.id C p) = α)
    -- associativity
    ∧ (∀ {p q r s : OneCell C X Y}
        (γ : TwoCell C r s) (β : TwoCell C q r) (α : TwoCell C p q),
        TwoCell.vcomp C (TwoCell.vcomp C γ β) α
          = TwoCell.vcomp C γ (TwoCell.vcomp C β α)) :=
  ⟨fun _ => rfl, fun _ => rfl, fun _ _ _ => rfl⟩

/-! ## The dual `T*(C^op, λ^op)`

The dualized temporal 2-category reverses both axes: `C ↦ C^op` (predicate axis) and
`λ^op ↦ λ` (settling axis re-reversed). We build `C^op` honestly from `C` (the three laws
transport by swapping the composition order) so the dual's 1-cells are
`(C^op)`-morphisms × the re-reversed settling leg. -/

/-- The **opposite predicate category** `C^op`: same objects, hom reversed, composition
in the other order. The three laws transport. -/
def Category.op (C : Category) : Category where
  Obj := C.Obj
  Hom := fun A B => C.Hom B A
  id := C.id
  comp := fun g f => C.comp f g
  id_comp := fun f => C.comp_id f
  comp_id := fun f => C.id_comp f
  comp_assoc := fun h g f => (C.comp_assoc f g h).symm

/-- The **dual temporal 2-category** `T*(C^op, λ^op)`: the temporal 2-category over the
opposite predicate category. The settling axis re-reverses (`λ^op ↦ λ`); concretely a dual
1-cell `(τ', A') → (τ, A)` is a `C^op`-morphism `A' → A` (= a `C`-morphism `A → A'`) paired
with the re-reversed settling leg. We expose it as `OneCell C.op`, whose category laws are
the same `temporal_two_category` instantiated at `C.op`. -/
abbrev DualOneCell (src dst : ZeroCell C.op) := OneCell C.op src dst

/-! ## `temporal_beck_chevalley`

Temporal Beck–Chevalley: in the dual temporal 2-category, reindexing along the predicate
axis commutes with settling-advance along the temporal axis. We REUSE the 1-categorical
`Valuation.beck_chevalley` (`Hyperdoctrine`) — reindexings along commuting base maps
commute — and lift it to a temporal 1-cell square.

The square has a **predicate-axis** pair (reindex along two commuting base maps `r`, `s`)
and a **settling-axis** pair (two settling advances `τ ≤ τ'`, `τ' ≤ τ''`). The canonical BC
comparison on valuations is the *identity* (an equality of valuations), hence order-free and
trivially invertible — the strict-regime instance the corpus's Step-2 cellwise BC reduces
to. We also give the σ-dual via `Valuation.beck_chevalley_dual`, exhibiting BC in
`T*(C^op, λ^op)`. -/

/-- A **temporal pseudo-pullback square** in `T(C, λ)` on the valuation fibration: a pair of
commuting predicate-axis reindexings `r, s` (the predicate legs `pₐ`, `p_B`, `f`, `g` of the
square, reduced to their reindex base maps) together with a chain of settling advances
witnessing the temporal axis (`τ_P ≤ τ_A`, `τ_P ≤ τ_B`, with both ≤ `τ_C` cofinal). -/
structure TemporalBCSquare where
  /-- Predicate-axis base map along one edge (e.g. `f`/`g`). -/
  r : PredicationCell → PredicationCell
  /-- Predicate-axis base map along the other edge (e.g. `pₐ`/`p_B`). -/
  s : PredicationCell → PredicationCell
  /-- The square commutes on the predicate axis (pseudo-pullback ⇒ commuting base). -/
  comm : s ∘ r = r ∘ s
  /-- Settling levels of the four corners `(τ_P, τ_A, τ_B, τ_C)`. -/
  tauP : Nat
  tauA : Nat
  tauB : Nat
  tauC : Nat
  /-- Settling advances along the two top edges (`λ^op`: corners advance to `τ_C`). -/
  advA : tauA ≤ tauC
  advB : tauB ≤ tauC
  /-- The pseudo-pullback corner sits at-or-before both projections (`τ_P` least). -/
  advPA : tauP ≤ tauA
  advPB : tauP ≤ tauB

/-- **`temporal_beck_chevalley`.** The temporal Beck–Chevalley square commutes in
`T(C, λ)`: along a temporal pseudo-pullback square, reindexing along the predicate axis
commutes with settling-advance along the temporal axis. Concretely the canonical BC
comparison of valuations is the identity (`Valuation.beck_chevalley`, lifted), AND the
composite settling advance `τ_P ≤ τ_C` exists (the temporal axis closes the square in
`λ^op`). Both legs of the square — the predicate-axis commutation and the settling-axis
advance — are exhibited, and the dual square commutes by `Valuation.beck_chevalley_dual`. -/
theorem temporal_beck_chevalley (sq : TemporalBCSquare) (v : Valuation) :
    -- predicate axis: the BC reindex square commutes (canonical comparison = identity)
    (Valuation.reindex sq.r (Valuation.reindex sq.s v)
      = Valuation.reindex sq.s (Valuation.reindex sq.r v))
    -- settling axis: the temporal pseudo-pullback closes, τ_P ≤ τ_C through both routes
    ∧ (sq.tauP ≤ sq.tauC)
    -- dual square (T*(C^op, λ^op)): σ-conjugate reindexings commute too
    ∧ (Valuation.conj (Valuation.reindex sq.r) (Valuation.conj (Valuation.reindex sq.s) v)
        = Valuation.conj (Valuation.reindex sq.s) (Valuation.conj (Valuation.reindex sq.r) v)) := by
  refine ⟨?_, ?_, ?_⟩
  · -- 1-categorical Beck–Chevalley on the predicate axis, reused verbatim
    exact Valuation.beck_chevalley sq.r sq.s sq.comm v
  · -- settling axis: τ_P ≤ τ_A ≤ τ_C closes the square in λ^op
    exact Nat.le_trans sq.advPA sq.advA
  · -- dual temporal square: σ-conjugate Beck–Chevalley from PredicationHyperdoctrineDual
    exact Valuation.beck_chevalley_dual sq.r sq.s sq.comm v

/-- The canonical temporal BC comparison is **invertible** (it is the identity equality of
valuations, hence its own inverse) — the strict-regime statement that `BC_φ` is an
isomorphism, not merely a 2-cell, exhibited as the symmetric equality. -/
theorem temporal_beck_chevalley_invertible (sq : TemporalBCSquare) (v : Valuation) :
    Valuation.reindex sq.s (Valuation.reindex sq.r v)
      = Valuation.reindex sq.r (Valuation.reindex sq.s v) :=
  (Valuation.beck_chevalley sq.r sq.s sq.comm v).symm

end Temporal
end Infomaterial
