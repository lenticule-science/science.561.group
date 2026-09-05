import Infomaterial.Language.Predicating.Temporal
import Infomaterial.Site.Basic
import Infomaterial.Closure.Monad.KZ

/-!
# KZ-coherent sheaf — the descent condition that handles aperiodic 2-cells at sheaf level

This module formalizes the corpus node

* `settling/.../sheaf/content/kz-coherent-sheaf/kz-coherent-sheaf.md`

(read in-tree under
`content/.../knowledge-least-valuation/settling/content/sheaf/content/kz-coherent-sheaf/`),
together with its references `emmenegger-fibration-comonad.md`,
`gray-street-fibration-monad.md`, `kz-coherent-sheaves-reflective.md`.

## The math

The bitopological settling site `(T*, J)` is **1-truncated** (`BitopologicalSettlingSite`:
covers live entirely in the fixed-`(q,τ)` clopen fiber; `no_temporal_covers`). But the
ambient **temporal 2-category** `T(C, λ)` (`TemporalTwoCategory`) carries non-trivial
**2-cells** — in the aperiodic regime, *throughout*. Rather than build 2-site machinery into
the site, the corpus pushes the 2-cell content up to the **sheaf level** as a *descent
condition*:

> A sheaf `F` on `(T*, J)` is **KZ-coherent** iff for every pair of PARALLEL 1-cells
> `f, f' : (q', τ', U') → (q, τ, U)` connected by an INVERTIBLE 2-cell `α : f ⇒ f'`
> arising from the KZ-lax-idempotent coherence (of the closure-2-monad `Cl`, or of the
> fibration comonad `M ⊣ N`, on the temporal 2-category), the induced section maps agree:
> `F(f) = F(f') : F(q,τ,U) → F(q',τ',U')`.
> The full subcategory `Sh^KZ(T*, J)`.

We model this faithfully, reusing the existing structures and **deriving** every law:

* **A presheaf `F` on the site** is a section-map assignment: to each 1-cell `f : X → Y`
  of the temporal 2-category it assigns a restriction/section map `F(f) : Cochain`, with
  identity and composition functorialities. We bundle it as a `Sheaf` over the temporal
  2-category's `OneCell` (the section maps along 1-cells), reusing `Temporal.OneCell` as
  the indexing 1-cells whose source/target site data are `Temporal.ZeroCell`. (The
  fixed-`(q,τ)` fiber and the join-gluing of `Site.Covers` are the *site* layer, already
  built in `BitopologicalSettlingSite`/`Sheaf`; KZ-coherence is the *2-cell* layer above
  it, which is what this module adds.)

* **A KZ 2-cell** `KZ2Cell f f'` connecting parallel 1-cells `f, f' : X → Y` is *exactly*
  the temporal 2-category's invertible 2-cell `Temporal.TwoCell` arising from the KZ
  coherence. In the strict/Scott regime — where `Closure2MonadKZ`'s `μ` is the identity
  (`closureOp_idem`) and the temporal 2-cells trivialize to predicate-leg equalities
  (`TemporalTwoCategory`'s discrete/strict-regime `TwoCell`) — such a 2-cell forces
  `f.f = f'.f`, hence (by `OneCell.ext`) `f = f'`: the KZ 2-cells are the
  trivial/identity 2-cells, and parallel KZ-connected 1-cells are *equal*.

* **`KZCoherent F`** := for all parallel `f, f'` with a `KZ2Cell f f'`, `F(f) = F(f')`.
  This is the descent condition.

## Honest 2-categorical scoping

The site is 1-truncated; the genuine non-identity aperiodic 2-cells of `T(C, λ)` live where
the valuation poset's antisymmetry fails (`Closure2MonadKZ`: the lax `μ` carries data only
transfinitely/aperiodically). What is *built* here is the **strict/Scott-regime instance**,
where every KZ 2-cell is an identity-2-cell (`Temporal.TwoCell` = predicate-leg equality,
`Closure2MonadKZ.strict_regime_mu_identity`), so KZ-coherence holds **automatically** —
every sheaf is KZ-coherent and the subcategory `Sh^KZ` is the whole category. The aperiodic
content (non-trivial 2-cells throughout, where the condition is a genuine restriction) is
documented in prose: in that regime a KZ 2-cell `α : f ⇒ f'` need *not* force `f = f'`, and
`KZCoherent` selects the sheaves that nonetheless equate the two section maps.
-/

namespace Infomaterial
namespace KZSheaf

open Infomaterial.Temporal

/-! ## Section-map codomain — the cochain values a sheaf assigns

A presheaf on the site assigns to each 1-cell a section/restriction map landing in a value
type. We keep the value type a parameter `V` (the cochain/section type — instantiated by the
cohomological development at `Cochain`, a `Valuation`, etc.); the KZ-coherence content is
purely about *equality of the assigned maps*, so it is generic over `V`. -/

variable (C : Category)

/-! ## The presheaf / sheaf on the temporal 2-category's 1-cells

A `Sheaf C V` is a section-map assignment `sec : ∀ {X Y}, OneCell C X Y → V` (the induced
map `F(f)` along each 1-cell `f`), together with the presheaf functorialities written over
the 1-cell structure. We bundle the section map plus the two functoriality laws (identity and
composition) — the standard contravariant-restriction pattern, reusing
`Temporal.OneCell.idCell`/`OneCell.comp`. The site-layer gluing/separation is `Sheaf`'s
job (`Sheaf.lean`); here the carrier of interest is precisely the **section map along
1-cells**, because KZ-coherence is a statement about those maps. -/

/-- A **presheaf bundle over the temporal site** with section/cochain values in `V`: it
assigns to each 1-cell `f : X → Y` an induced section map `sec f : V`, functorially.
`compat_id`/`compat_comp` are the presheaf functorialities (restriction along the identity is
the identity assignment; restriction along a composite is determined by the legs). They are
*stated*, never postulated as new data beyond the assignment `sec`; concrete sheaves supply
them. The KZ-coherence condition below concerns `sec` alone. -/
structure Sheaf (V : Type) where
  /-- The induced **section map** `F(f) : V` along a 1-cell `f : X → Y` (the restriction). -/
  sec : ∀ {X Y : ZeroCell C}, OneCell C X Y → V
  /-- Restriction along the identity 1-cell is a fixed "identity value" `restId X` — the
  presheaf identity law `F(id) = id`, recorded as the assignment being pinned on identity
  cells. -/
  restId : ZeroCell C → V
  /-- Presheaf identity functoriality: `F(id_X) = restId X`. -/
  compat_id : ∀ X : ZeroCell C, sec (OneCell.idCell C X) = restId X
  /-- Presheaf composition functoriality witness: the section map along a composite is a
  function `restComp` of the section maps along the legs — `F(g ∘ f)` is determined by
  `F(g)`, `F(f)` (contravariance recorded abstractly so no transport data is postulated). -/
  restComp : V → V → V
  /-- The composition law `F(g ∘ f) = restComp (F g) (F f)`. -/
  compat_comp : ∀ {X Y Z : ZeroCell C} (g : OneCell C Y Z) (f : OneCell C X Y),
    sec (OneCell.comp C g f) = restComp (sec g) (sec f)

/-! ## KZ 2-cells — the invertible coherence 2-cells connecting parallel 1-cells

A **KZ 2-cell** `KZ2Cell f f'` between PARALLEL 1-cells `f, f' : X → Y` is the temporal
2-category's invertible 2-cell `Temporal.TwoCell` arising from the KZ-lax-idempotent
coherence. In the strict/Scott regime `Temporal.TwoCell` is the discrete/strict 2-cell —
an equality of predicate legs `f.f = f'.f` — which is exactly the KZ comparison's identity
counit projection (`Closure2MonadKZ`: `μ` is the identity, the K1 unit-triangle holds). -/

/-- A **KZ 2-cell** `α : f ⇒ f'` between parallel 1-cells `f, f' : X → Y`: the temporal
2-category's invertible 2-cell, reused. In the strict/Scott regime this is the discrete
2-cell `f.f = f'.f`; it is the projection of the KZ-lax-idempotent invertible comparison (whose
counit is the identity, `Closure2MonadKZ.closureOp_triangle_etaCl`). It is `Prop`-valued — the
strict-regime 2-cell is the (proof-irrelevant) predicate-leg equality, so being KZ-connected is
a *property* of the parallel pair, the property-likeness of the KZ comparison's identity counit
(`Closure2MonadKZ`'s Kelly–Lack K2). -/
abbrev KZ2Cell {X Y : ZeroCell C} (f f' : OneCell C X Y) : Prop := TwoCell C f f'

/-- The **identity KZ 2-cell** `f ⇒ f` — every 1-cell is KZ-connected to itself
(reflexivity of the relation), reusing `Temporal.TwoCell.id`. -/
def KZ2Cell.id {X Y : ZeroCell C} (f : OneCell C X Y) : KZ2Cell C f f := TwoCell.id C f

/-- **A KZ 2-cell is invertible.** The temporal 2-cell is a (proof-irrelevant) predicate-leg
equality, hence symmetric: from `α : f ⇒ f'` we get `α⁻¹ : f' ⇒ f`. This is the "invertible
2-cell" of the corpus condition, made concrete. -/
def KZ2Cell.inv {X Y : ZeroCell C} {f f' : OneCell C X Y} (α : KZ2Cell C f f') :
    KZ2Cell C f' f := ⟨α.eq.symm⟩

/-- **Strict/Scott regime: a KZ 2-cell forces the parallel 1-cells to be EQUAL.** Because
`Temporal.TwoCell` is the predicate-leg equality `f.f = f'.f` (the strict-regime discrete
2-cell, where `Closure2MonadKZ`'s `μ` collapses to the identity), `OneCell.ext` lifts it to
`f = f'`. This is the regime-dependent collapse: the KZ 2-cells trivialize to identities. -/
theorem kz2cell_forces_eq {X Y : ZeroCell C} {f f' : OneCell C X Y}
    (α : KZ2Cell C f f') : f = f' :=
  OneCell.ext C α.eq

/-! ## The descent condition `KZCoherent` -/

/-- **`KZCoherent F`** — the KZ-coherence descent condition: for every pair of PARALLEL
1-cells `f, f'` connected by a KZ 2-cell, the induced section maps agree, `F(f) = F(f')`.
The full subcategory `Sh^KZ(T*, J)` is `{ F | KZCoherent F }`. -/
def KZCoherent {V : Type} (F : Sheaf C V) : Prop :=
  ∀ {X Y : ZeroCell C} (f f' : OneCell C X Y), KZ2Cell C f f' → F.sec f = F.sec f'

/-! ## `kz_coherent_identifies_parallel`

The defining coherence: a KZ-coherent sheaf identifies the section maps of parallel 1-cells
connected by a KZ 2-cell. We prove it in two registers:

* **definitionally** for any `KZCoherent F` (the condition, unpacked);
* **unconditionally** in the strict/Scott regime, where a KZ 2-cell forces `f = f'`
  (`kz2cell_forces_eq`) so `F(f) = F(f')` holds for *every* sheaf — the canonical example /
  strict-regime instance.

The aperiodic content (non-trivial 2-cells throughout; `f ≠ f'` while `α : f ⇒ f'`) is
documented: there `KZCoherent` is a genuine restriction selecting the sheaves that equate the
two routes. -/

/-- **`kz_coherent_identifies_parallel`.** A KZ-coherent sheaf identifies the
section maps of any pair of parallel 1-cells `f, f'` connected by a KZ 2-cell:
`F(f) = F(f')`. This is the defining coherence of `Sh^KZ(T*, J)`.

The bundle records both registers:

* **(i) the condition unpacked**: for `KZCoherent F`, any KZ-connected parallel pair has
  `F(f) = F(f')` (this is `KZCoherent` itself, surfaced as the headline content);
* **(ii) the strict/Scott-regime instance**: there a KZ 2-cell `α : f ⇒ f'` forces `f = f'`
  (`kz2cell_forces_eq`), so `F(f) = F(f')` holds for **every** sheaf — the section maps of
  KZ-equivalent routes coincide because the routes themselves coincide.

(Aperiodic regime, documented: `T(C,λ)` carries non-trivial 2-cells throughout; there a KZ
2-cell need NOT force `f = f'`, and `KZCoherent` is the genuine descent restriction that still
demands `F(f) = F(f')`.) -/
theorem kz_coherent_identifies_parallel {V : Type} :
    -- (i) the descent condition, unpacked: KZ-coherence identifies parallel section maps
    (∀ (F : Sheaf C V), KZCoherent C F →
        ∀ {X Y : ZeroCell C} (f f' : OneCell C X Y), KZ2Cell C f f' → F.sec f = F.sec f')
    -- (ii) strict/Scott regime: a KZ 2-cell forces f = f', so EVERY sheaf identifies them
    ∧ (∀ (F : Sheaf C V) {X Y : ZeroCell C} (f f' : OneCell C X Y),
        KZ2Cell C f f' → F.sec f = F.sec f') := by
  refine ⟨?_, ?_⟩
  · intro F hF X Y f f' α
    exact hF f f' α
  · intro F X Y f f' α
    -- strict/Scott: the KZ 2-cell collapses the parallel pair to one 1-cell
    rw [kz2cell_forces_eq C α]

/-! ## `kz_coherent_descent`

KZ-coherence is a genuine *descent* condition cutting out the full subcategory
`Sh^KZ(T*, J)`. We establish:

* **the predicate** `KZCoherent` (above), defining the subcategory;
* **closure under restriction**: KZ-coherence is preserved when we restrict a sheaf's section
  map by post-composing with any value transformation `t : V → W` (the section maps still
  agree on KZ-connected parallels, because equal section values map to equal values) — so the
  subcategory is closed under the restriction maps of the ambient category;
* **strict-regime universality**: in the strict/Scott regime EVERY sheaf is KZ-coherent (the
  KZ 2-cells trivialize via `kz2cell_forces_eq` — the regime-dependent collapse reusing
  `Closure2MonadKZ`'s strict idempotence and `TemporalTwoCategory`'s strict-regime 2-cell
  triviality), so `Sh^KZ(T*, J) = Sh(T*, J)` and the condition is vacuous. -/

/-- Restricting a sheaf's section map by post-composing with a value transformation
`t : V → W`. Functoriality is recorded as `restComp` transported through `t` (the new
composition law `t (restComp a b)` — we keep `restComp` as the transported witness so no new
data is postulated). -/
def Sheaf.postcomp {V W : Type} (F : Sheaf C V) (t : V → W) (rc : W → W → W)
    (htid : ∀ X, t (F.sec (OneCell.idCell C X)) = t (F.restId X))
    (htcomp : ∀ {X Y Z : ZeroCell C} (g : OneCell C Y Z) (f : OneCell C X Y),
        t (F.sec (OneCell.comp C g f)) = rc (t (F.sec g)) (t (F.sec f))) :
    Sheaf C W where
  sec := fun f => t (F.sec f)
  restId := fun X => t (F.restId X)
  compat_id := htid
  restComp := rc
  compat_comp := htcomp

/-- **KZ-coherence is closed under restriction.** If `F` is KZ-coherent then so is any
post-composition `F.postcomp t …`: equal section values `F(f) = F(f')` are carried by `t` to
equal values `t (F f) = t (F f')`. So the KZ-coherent sheaves form a subcategory **closed
under the ambient restriction maps**. -/
theorem kzCoherent_postcomp {V W : Type} (F : Sheaf C V) (hF : KZCoherent C F)
    (t : V → W) (rc : W → W → W)
    (htid : ∀ X, t (F.sec (OneCell.idCell C X)) = t (F.restId X))
    (htcomp : ∀ {X Y Z : ZeroCell C} (g : OneCell C Y Z) (f : OneCell C X Y),
        t (F.sec (OneCell.comp C g f)) = rc (t (F.sec g)) (t (F.sec f))) :
    KZCoherent C (F.postcomp C t rc htid htcomp) := by
  intro X Y f f' α
  show t (F.sec f) = t (F.sec f')
  rw [hF f f' α]

/-- **Strict/Scott regime: every sheaf is KZ-coherent** — the universality / vacuity of the
condition. Because a KZ 2-cell `α : f ⇒ f'` forces `f = f'` (`kz2cell_forces_eq`, the
strict-regime collapse), `F(f) = F(f')` holds for every `F` and every KZ-connected parallel
pair. Hence `Sh^KZ(T*, J) = Sh(T*, J)` in the low regimes. -/
theorem every_sheaf_kzCoherent_strict {V : Type} (F : Sheaf C V) : KZCoherent C F := by
  intro X Y f f' α
  rw [kz2cell_forces_eq C α]

/-- **`kz_coherent_descent`.** KZ-coherence is a genuine descent condition: the
KZ-coherent sheaves form a full subcategory `Sh^KZ(T*, J)` of `Sh(T*, J)`, closed under
restriction; and in the strict/Scott regime the KZ 2-cells trivialize so EVERY sheaf is
KZ-coherent (`Sh^KZ = Sh`, the condition vacuous). The bundle records:

* **(1) the predicate** `KZCoherent` defining the subcategory, characterized: `F` is in
  `Sh^KZ` iff it identifies the section maps of every KZ-connected parallel pair;
* **(2) closure under restriction**: KZ-coherence is preserved by post-composition with any
  value transformation `t` (`kzCoherent_postcomp`) — the subcategory is closed under the
  ambient restriction maps;
* **(3) strict-regime universality**: every sheaf is KZ-coherent
  (`every_sheaf_kzCoherent_strict`), the regime-dependent collapse where the KZ 2-cells are
  identities (reusing `Closure2MonadKZ`'s strict idempotence + `TemporalTwoCategory`'s
  strict-regime 2-cell triviality).

(The aperiodic regime — `T(C,λ)`'s non-trivial 2-cells throughout — is where (3) fails and
(1)/(2) make `Sh^KZ` a proper, non-vacuous subcategory; documented in prose.) -/
theorem kz_coherent_descent {V W : Type} :
    -- (1) the subcategory predicate, characterized as identifying KZ-connected parallels
    (∀ (F : Sheaf C V), KZCoherent C F ↔
        ∀ {X Y : ZeroCell C} (f f' : OneCell C X Y), KZ2Cell C f f' → F.sec f = F.sec f')
    -- (2) closed under restriction (post-composition with any value transformation t)
    ∧ (∀ (F : Sheaf C V), KZCoherent C F →
        ∀ (t : V → W) (rc : W → W → W)
          (htid : ∀ X, t (F.sec (OneCell.idCell C X)) = t (F.restId X))
          (htcomp : ∀ {X Y Z : ZeroCell C} (g : OneCell C Y Z) (f : OneCell C X Y),
              t (F.sec (OneCell.comp C g f)) = rc (t (F.sec g)) (t (F.sec f))),
          KZCoherent C (F.postcomp C t rc htid htcomp))
    -- (3) strict/Scott-regime universality: every sheaf is KZ-coherent (Sh^KZ = Sh)
    ∧ (∀ (F : Sheaf C V), KZCoherent C F) := by
  refine ⟨?_, ?_, ?_⟩
  · intro F
    constructor
    · intro hF X Y f f' α; exact hF f f' α
    · intro h X Y f f' α; exact h f f' α
  · intro F hF t rc htid htcomp
    exact kzCoherent_postcomp C F hF t rc htid htcomp
  · intro F
    exact every_sheaf_kzCoherent_strict C F

/-! ## Canonical instance over the predicate category `predCat`

`predCat` (`TemporalTwoCategory`) is the canonical predicate category whose arrows are
`Predicating`'s `specialize` moves. Instantiating the headlines at `predCat` exhibits the
KZ-coherent-sheaf condition on the actual settling site's temporal 2-category, with no new
object data. -/

/-- The KZ-coherence descent headline at the **canonical** predicate category `predCat`: every
sheaf over the canonical temporal 2-category is KZ-coherent in the strict/Scott regime, the
condition is closed under restriction, and the subcategory is characterized. -/
theorem kz_coherent_descent_predCat {V W : Type} :
    (∀ (F : Sheaf predCat V), KZCoherent predCat F ↔
        ∀ {X Y : ZeroCell predCat} (f f' : OneCell predCat X Y),
          KZ2Cell predCat f f' → F.sec f = F.sec f')
    ∧ (∀ (F : Sheaf predCat V), KZCoherent predCat F) :=
  ⟨(kz_coherent_descent predCat (V := V) (W := W)).1,
   (kz_coherent_descent predCat (V := V) (W := W)).2.2⟩

end KZSheaf
end Infomaterial
