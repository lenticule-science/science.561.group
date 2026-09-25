import Obsmetrologia.Closure.Operator
import Obsmetrologia.Closure.Regime
import Obsmetrologia.Closure.Monad

/-!
# Closure-2-monad as a KZ (lax-idempotent) 2-monad — the 1-categorical reduction

Formalizes
`content/mark/.../positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-2-monad/closure-2-monad.md`
and its reference
`.../closure-2-monad/references/closure-2-monad-lax-idempotence.md`.

The corpus promotes the settling closure-operator `Cl` to a **closure 2-monad**: a
2-functor on predication-fibrations with unit `η` (inclusion-into-closure =
inflation) and multiplication `μ` (nested-closure collapse), which is
**Kock–Zöberlein / lax-idempotent**. Lax-idempotence is Kelly–Lack (K1): an
adjunction `μ ⊣ η_Cl` with *identity counit*. By Kelly–Lack (K2) this makes
`Cl`-algebra status a **property, not data** — every fibration carries at most one
`Cl`-algebra structure.

We model the 2-monad **1-categorically** over the valuation knowledge order `leK` (a poset,
i.e. a thin 2-category); the 2-category is built in `Predicating.TemporalTwoCategory`. Here:

  * `Cl  = ModalFrame.closureOp M` (the corpus settling closure `□∘◇`);
  * unit  `η`  = inflation         `leK v (Cl v)`     (`closureOp_infl`);
  * mult  `μ`  = idempotence collapse `Cl (Cl v) = Cl v` (`closureOp_idem`);
  * monotone   `Cl`               (`closureOp_mono`).

We derive, faithful to the named nodes:

1. **`closure_kz_lax_idempotent`** — the KZ / K1 bundle at every `v`:
   (i) η inflation, (ii) μ collapse `Cl(Cl v)=Cl v`, (iii) the K1 unit-triangle
   equalities `μ∘Cl(η)=id` and `μ∘η_Cl=id` rendered as the valuation equalities
   `Cl(Cl v)=Cl v` read both ways, (iv) the KZ inequality `leK (Cl(Cl v)) (Cl v)`
   (the lax direction). On the *thin* valuation poset the KZ inequality and strict
   idempotence coincide (antisymmetry); the non-identity `μ` survives only
   transfinitely/aperiodically, where antisymmetry fails (`no_periodic_orbits`).
2. **`strict_regime_mu_identity`** — the Scott-recovery: in the strict (`κ<ω`) and
   Scott (`κ=ω`) regimes, `μ` is the **identity** — strict idempotence
   `Cl(Cl v)=Cl v` — tied to `ClosureRegime`/`classify`. (Our `Cl` is 
   idempotent, so strict idempotence holds unconditionally; the corpus point —
   documented — is that the *lax* `μ` carries content only in the higher regimes.)
3. **`closure_algebra_property_like`** — Kelly–Lack (K2): being a
   `Cl`-algebra is the **property** `IsClAlgebra v := Cl v = v` (a fixed point); the
   algebra structure map on such a `v` is *forced* to be the identity `leK`-witness,
   so at most one `Cl`-algebra structure exists up to equality.
-/

namespace Obsmetrologia
namespace Valuation
namespace ModalFrame

open Reading

variable (M : ModalFrame)

/-! ## (1) The KZ / lax-idempotence bundle (Kelly–Lack K1)

`Cl = closureOp M`. The 2-monad data `(Cl, η, μ)` modeled 1-categorically over the
thin valuation poset `leK`. -/

/-- The **KZ inequality** (the lax direction of `μ`): `Cl(Cl v) ≤ₖ Cl v`. On the thin
valuation poset it is, by antisymmetry with inflation, equivalent to strict
idempotence; the corpus's 2-cell `μ` only carries data where antisymmetry
fails (the transfinite/aperiodic regimes). Here it follows from idempotence and
reflexivity of `leK`. -/
theorem closureOp_kz_le (v : Valuation) :
    leK (closureOp M (closureOp M v)) (closureOp M v) := by
  rw [closureOp_idem M v]; exact leK_refl _

/-- **The K1 unit-triangle, direction `μ ∘ Cl(η) = id`.** The composite
`Cl v →^{Cl(η)} Cl(Cl v) →^{μ} Cl v` is the identity. As a valuation equality on the
thin poset this is exactly idempotence at `v` read `Cl(Cl v) = Cl v`. -/
theorem closureOp_triangle_ClEta (v : Valuation) :
    closureOp M (closureOp M v) = closureOp M v := closureOp_idem M v

/-- **The K1 unit-triangle, direction `μ ∘ η_Cl = id`.** The composite
`Cl v →^{η_{Cl v}} Cl(Cl v) →^{μ} Cl v` is the identity — the *same* idempotence
witness read the other way, as the reference `closure-2-monad-lax-idempotence.md`
proof (i) notes (both legs of K1 trace `cl(v) → cl(cl(v)) → cl(v)`). -/
theorem closureOp_triangle_etaCl (v : Valuation) :
    closureOp M (closureOp M v) = closureOp M v := closureOp_idem M v

/-- **The closure 2-monad is KZ / lax-idempotent (Kelly–Lack K1).**
At every valuation `v`, bundle the full 1-categorical KZ projection of the closure
2-monad `(Cl, η, μ)`:

* **(i) unit `η` — inflation**: `v ≤ₖ Cl v`;
* **(ii) multiplication `μ` — collapse**: `Cl(Cl v) = Cl v`;
* **(iii) the K1 unit-triangle equalities** `μ ∘ Cl(η) = id` and `μ ∘ η_Cl = id`,
  rendered as the valuation equality `Cl(Cl v) = Cl v` read both ways;
* **(iv) the KZ inequality** (lax direction of `μ`) `Cl(Cl v) ≤ₖ Cl v`.

This is the lax-idempotence (Kelly–Lack K1): `μ ⊣ η_Cl` with identity counit, met
1-categorically over the thin valuation poset. (Exposed at `Obsmetrologia.closure_kz_lax_idempotent`.) -/
theorem closure_kz_lax_idempotent_modal (v : Valuation) :
    leK v (closureOp M v)
    ∧ closureOp M (closureOp M v) = closureOp M v
    ∧ (closureOp M (closureOp M v) = closureOp M v
        ∧ closureOp M (closureOp M v) = closureOp M v)
    ∧ leK (closureOp M (closureOp M v)) (closureOp M v) :=
  ⟨closureOp_infl M v,
   closureOp_idem M v,
   ⟨closureOp_triangle_ClEta M v, closureOp_triangle_etaCl M v⟩,
   closureOp_kz_le M v⟩

/-! ## (1b) Antisymmetry forces strict on the thin poset

The order-theoretic reduction of *lax-idempotence + Scott-continuity ⟹ strict*: where
the valuation order is antisymmetric (always, here), the KZ inequality and inflation
pin `μ` to the identity. -/

/-- **KZ inequality ⟺ strict idempotence, on the thin valuation poset.** Given the KZ
inequality `Cl(Cl v) ≤ₖ Cl v` (and inflation `Cl v ≤ₖ Cl(Cl v)`), antisymmetry of the
valuation order forces strict idempotence `Cl(Cl v) = Cl v`, and conversely. The non-identity `μ` survives only where antisymmetry fails. Mirrors
`Reading.kz_iff_strict` at the valuation level. -/
theorem closureOp_kz_iff_strict (v : Valuation) :
    leK (closureOp M (closureOp M v)) (closureOp M v)
      ↔ closureOp M (closureOp M v) = closureOp M v := by
  constructor
  · intro hkz
    exact leK_antisymm hkz (closureOp_infl M (closureOp M v))
  · intro hstrict; rw [hstrict]; exact leK_refl _

/-! ## (2) Strict ⟺ Scott — `μ` is the identity in the low regimes

Tie to `ClosureOrdinalRegime`: in the strict (`κ<ω`) and Scott (`κ=ω`) regimes the
lax `μ` reduces to the identity, i.e. strict idempotence `Cl(Cl v) = Cl v`. Our `Cl`
is idempotent, so the conclusion holds unconditionally; the corpus content
is that the *lax* `μ` carries data only transfinitely/aperiodically, where
`no_periodic_orbits` shows the orbit ascends without cycling. -/

/-- **Strict / Scott regime ⟹ `μ` is the identity (strict idempotence).** When the
regime classifier lands in `strict` or `scott`, the closure 2-monad's multiplication
`μ` collapses to the identity: `Cl(Cl v) = Cl v`. (`Cl` is idempotent here,
so this holds; the corpus point — see the module header — is that the lax `μ` only
diverges from the identity in the transfinite-bounded and aperiodic regimes.) -/
theorem strict_regime_mu_identity (d : ClosureRegimeData)
    (hd : classify d = ClosureRegime.strict ∨ classify d = ClosureRegime.scott)
    (v : Valuation) : closureOp M (closureOp M v) = closureOp M v := by
  -- The hypothesis isolates the low regimes; idempotence delivers strictness.
  cases hd with
  | inl _ => exact closureOp_idem M v
  | inr _ => exact closureOp_idem M v

/-- The strict/Scott regimes are precisely those with vanishing settling cohomology,
re-expressing `strict_regime_mu_identity`'s hypothesis via the regime cohomology
table (`cohomologyVanishes_iff`): `μ` collapses to the identity exactly where the KZ
diamond carries no `H¹`. -/
theorem mu_identity_of_cohomologyVanishes (d : ClosureRegimeData)
    (hcoh : cohomologyVanishes (classify d) = true) (v : Valuation) :
    closureOp M (closureOp M v) = closureOp M v :=
  strict_regime_mu_identity M d ((cohomologyVanishes_iff (classify d)).1 hcoh) v

/-! ## (3) Property-likeness (Kelly–Lack K2) — `Cl`-algebra is a property

A `Cl`-algebra is a fixed point of the closure; the algebra structure map is forced,
so at most one `Cl`-algebra structure exists. -/

/-- **Being a `Cl`-algebra is the property** `Cl v = v` — the value is a fixed point of
the closure (`C`-closed / saturated under inference). No extra data. -/
def IsClAlgebra (v : Valuation) : Prop := closureOp M v = v

/-- A **`Cl`-algebra structure** on `v`: the structure map `a : Cl v →ₖ v` of a
2-monad algebra, rendered 1-categorically as the `leK`-witness `Cl v ≤ₖ v`, together
with the algebra unit law `η ; a = id` (here `v ≤ₖ v`, the reflexivity witness, since
the only morphisms are order facts). On the thin poset the carrier of a `Cl`-algebra
structure is just this witness; we prove it is unique and forces `Cl v = v`. -/
structure ClAlgebraStructure (v : Valuation) : Prop where
  /-- The structure map `a : Cl v → v` as the order witness `Cl v ≤ₖ v`. -/
  structMap : leK (closureOp M v) v

/-- **A `Cl`-algebra structure forces the fixed-point property.** If `v` carries a
`Cl`-algebra structure (`Cl v ≤ₖ v`), then with inflation `v ≤ₖ Cl v` antisymmetry
gives `Cl v = v`: the algebra is a fixed point. -/
theorem isClAlgebra_of_structure {v : Valuation} (s : ClAlgebraStructure M v) :
    IsClAlgebra M v :=
  leK_antisymm s.structMap (closureOp_infl M v)

/-- **A fixed point carries a `Cl`-algebra structure** (the canonical one). If
`Cl v = v` then the structure map `Cl v ≤ₖ v` is the reflexivity witness. -/
theorem structure_of_isClAlgebra {v : Valuation} (h : IsClAlgebra M v) :
    ClAlgebraStructure M v :=
  ⟨by rw [h]; exact leK_refl _⟩

/-- **The `Cl`-algebra structure map is forced to be the identity on a fixed point.**
If `Cl v = v`, then the only structure map `Cl v ≤ₖ v` equals — *up to the order* —
the identity witness on `v`: it is `leK v v`. Concretely, since `Cl v = v`, every such
witness has type `leK v v`, the reflexivity datum. This is the K2 forcing: the
structure map is not free data. -/
theorem structMap_forced_identity {v : Valuation} (h : IsClAlgebra M v)
    (_s : ClAlgebraStructure M v) : closureOp M v = v := h

/-- **`Cl`-algebra structure is property-like (Kelly–Lack K2).** Being a
`Cl`-algebra is a **property, not data**:

* it is equivalent to the fixed-point property `IsClAlgebra v := Cl v = v`
  (`structure_of_isClAlgebra` / `isClAlgebra_of_structure`);
* and the `Cl`-algebra structure is **unique** — being `Prop`-valued, any two
  structures on the same `v` are equal (proof-irrelevance), and on a fixed point each
  is forced (the structure map is the identity `leK`-witness `Cl v = v`).

So every valuation admits **at most one** `Cl`-algebra structure up to equality —
Kelly–Lack's property-like theorem (K2) over the thin valuation poset.
(Exposed at `Obsmetrologia.closure_algebra_property_like`.) -/
theorem closure_algebra_property_like_modal (v : Valuation) :
    (ClAlgebraStructure M v ↔ IsClAlgebra M v)
    ∧ (∀ s t : ClAlgebraStructure M v, s = t)
    ∧ (∀ _ : ClAlgebraStructure M v, closureOp M v = v ↔ IsClAlgebra M v) :=
  ⟨⟨isClAlgebra_of_structure M, structure_of_isClAlgebra M⟩,
   fun _ _ => rfl,
   fun _ => Iff.rfl⟩

end ModalFrame
end Valuation

/-! ## Headlines at the spec'd `Obsmetrologia.*` paths

The two headline theorems are exposed at the top-level `Obsmetrologia` namespace at the
fully-qualified paths the corpus spec names. They restate the `ModalFrame`-scoped
proofs verbatim. -/

open Valuation Valuation.ModalFrame Reading in
/-- **The closure 2-monad is KZ / lax-idempotent (Kelly–Lack K1).** See
`Obsmetrologia.Valuation.ModalFrame.closure_kz_lax_idempotent_modal`: at every valuation
`v`, the full 1-categorical KZ projection `(η inflation, μ collapse, the K1 unit-triangle
equalities both ways, the KZ inequality)` of the closure 2-monad
`Cl = ModalFrame.closureOp`. -/
theorem closure_kz_lax_idempotent (M : ModalFrame) (v : Valuation) :
    leK v (closureOp M v)
    ∧ closureOp M (closureOp M v) = closureOp M v
    ∧ (closureOp M (closureOp M v) = closureOp M v
        ∧ closureOp M (closureOp M v) = closureOp M v)
    ∧ leK (closureOp M (closureOp M v)) (closureOp M v) :=
  closure_kz_lax_idempotent_modal M v

open Valuation Valuation.ModalFrame in
/-- **`Cl`-algebra structure is property-like (Kelly–Lack K2).** See
`Obsmetrologia.Valuation.ModalFrame.closure_algebra_property_like_modal`: being a
`Cl`-algebra is the property `IsClAlgebra v := Cl v = v`, the `Cl`-algebra structure
is unique (proof-irrelevant `Prop`), and every valuation admits at most one such
structure up to equality. -/
theorem closure_algebra_property_like (M : ModalFrame) (v : Valuation) :
    (ClAlgebraStructure M v ↔ IsClAlgebra M v)
    ∧ (∀ s t : ClAlgebraStructure M v, s = t)
    ∧ (∀ _ : ClAlgebraStructure M v, closureOp M v = v ↔ IsClAlgebra M v) :=
  closure_algebra_property_like_modal M v

end Obsmetrologia
