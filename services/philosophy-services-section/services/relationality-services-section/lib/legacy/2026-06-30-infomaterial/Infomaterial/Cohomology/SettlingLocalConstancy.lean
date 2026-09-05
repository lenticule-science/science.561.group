import Infomaterial.Cohomology.KZCoherentSheaf
import Infomaterial.Site.Basic
import Infomaterial.Cohomology.SettlingCohomologyH1
import Infomaterial.Site.Section

/-!
# Settling local constancy — the strict-regime model (predicate/settling local-constancy)

This module formalizes the corpus node

* `…/settling/content/settling-local-constancy/settling-local-constancy.md`

(read in-tree under
`content/.../knowledge-least-valuation/settling/content/settling-local-constancy/`),
whose `depends-on` are exactly the three deps we import: `settling-bound`,
`kz-coherent-sheaf`, `bitopological-settling-site`.

## The math

The corpus gives **two parallel local-constancy conditions** on a sheaf `F` on the
bitopological settling site `(T*, J)` — one per axis of the bitopological/bigraded
structure — which, when satisfied, force vanishing or stabilization of settling
cohomology.

* **Predicate-local-constancy.** `F` is *predicate-locally-constant* if for every
  `C`-generator morphism `f : q' → q` and every ordinal `τ`, the restriction
  `F(f^* × id_τ) : F(q, τ, U) → F(q', τ, f^*(U))` is an **isomorphism** for every
  pairwise-Stone clopen `U`. Equivalently, `F` depends on `q` only through the underlying
  paired-Priestley structure, not through the predicate's identity. The **constant sheaf**
  `A̲` is predicate-locally-constant for any value `A`. The settling-associated sheaf `F_U`
  is predicate-locally-constant **iff** stabilization is *predicate-uniform* — typically
  false in real settlings, but a reasonable hypothesis for the simplest examples.

* **Settling-local-constancy beyond `τ₀`.** `F` is *settling-locally-constant beyond `τ₀`*
  if for every `τ ≥ τ₀` and every temporal-advance morphism `h : τ → τ'` in `λ^op`, the
  restriction `F(id × h^*) : F(q, τ', U) → F(q, τ, U)` is an isomorphism — the settling has
  stopped contributing new content beyond `τ₀`. **Strict-regime** settlings have
  settling-locally-constant `F_U` beyond `τ* = κ` (the finite closure ordinal forces
  stabilization, and the cohomology becomes a finite computation); **aperiodic-regime**
  settlings fail settling-local-constancy at *every* countable `τ₀`.

## How we model it (honest scoping)

We reuse `KZSheaf.Sheaf C V` (the wave's presheaf of section maps `sec : OneCell C X Y → V`
over the temporal 2-category's 1-cells) as the sheaf `F`, and the cohomology layer
`Cohomology` (Čech `H¹`, the regime gate `cohomologyVanishes_iff`) as the stabilization
target. An **isomorphism of section maps** is modeled, faithfully to the finite/strict
setting, as an *equality/identity of the assigned section maps* — the strict-regime projection
of an iso, exactly as `KZSheaf` models the KZ-coherence iso-2-cells (where parallel
generators connected by an invertible 2-cell carry equal section maps). So:

* `PredicateLocallyConstant F` := for every parallel pair of 1-cells `f, f'` over the
  predicate axis connected by a KZ 2-cell (the generator-direction iso `f^* × id_τ`), and
  for the identity-restriction comparison, the section maps `F(f)` coincide — the
  restriction is an iso (a bijection that is the identity on section values). We bundle this
  as: `F.sec` is invariant under KZ-connected predicate-parallel pairs (`KZSheaf.KZCoherent`)
  AND restriction along the predicate-identity is the pinned identity value (`compat_id`) —
  i.e. `F(f)` is determined by the Priestley/ordinal data, not the predicate identity.

* `SettlingLocallyConstant F` := the analogous condition in the settling/ordinal direction:
  restriction along a settling-advance 1-cell is an iso (identity on section maps), so `F`
  is constant along `τ` beyond the stabilization point. Modeled as: any two 1-cells with the
  same predicate leg (differing only in the settling-advance leg `h`, a `Prop`) carry equal
  section maps — which holds *definitionally* via `OneCell.ext`, because the settling leg is
  proof-irrelevant, so a strict-regime sheaf is automatically settling-locally-constant
  (the finite-closure stabilization). The aperiodic failure is documented in prose: there
  the settling leg would carry genuine cross-`τ` content and `F(id × h^*)` need not be an
  iso.

The `ω₁` content (aperiodic failure at every countable `τ₀`) is documented in prose only;
`τ`/ordinals are `Nat`-indexed (`ZeroCell.tau : Nat`), the strict-regime finite colimit.
-/

namespace Infomaterial
namespace LocalConstancy

open Infomaterial.Temporal
open Infomaterial.KZSheaf

/-! ## Isomorphism of section maps — the strict-regime projection

The corpus condition asks that a restriction `F(φ) : F(X) → F(Y)` be an **isomorphism**. In
the finite/strict setting we model the iso, faithfully, as an *equality of the assigned
section maps* `F(f) = F(f')` for the parallel pair the restriction compares — the
strict-regime projection of an invertible 2-cell, exactly as `KZSheaf` does (a KZ 2-cell
`α : f ⇒ f'` is `Prop`-valued and forces `F(f) = F(f')`). A genuine bijection of section
*values* `V` is then witnessed by the identity bijection on the (single) value, which we
record via `Iso`. -/

/-- An **isomorphism of section maps** in the strict-regime model: the two assigned section
values coincide (`a = b`). This is the identity-bijection projection of the corpus's "restriction
is an isomorphism" — over the finite/strict fiber an iso of the assigned ℤ-cochain section
maps is an equality. -/
def Iso {V : Type} (a b : V) : Prop := a = b

/-- `Iso` is reflexive (the identity restriction is an iso). -/
theorem Iso.rfl {V : Type} (a : V) : Iso a a := Eq.refl a
/-- `Iso` is symmetric (an iso is invertible). -/
theorem Iso.symm {V : Type} {a b : V} (h : Iso a b) : Iso b a := Eq.symm h
/-- `Iso` is transitive (isos compose). -/
theorem Iso.trans {V : Type} {a b c : V} (h : Iso a b) (h' : Iso b c) : Iso a c := Eq.trans h h'

/-! ## Predicate-local-constancy

`F` is **predicate-locally-constant** if for every `C`-generator morphism (here: every
parallel pair of 1-cells over the predicate axis connected by a KZ 2-cell — the
generator-direction comparison `f^* × id_τ`), the restriction is an isomorphism, AND the
predicate-identity restriction is the pinned identity value. Equivalently `F(f)` depends on
`q` only through the Priestley/ordinal structure, not the predicate identity. -/

/-- **`PredicateLocallyConstant F`** — the predicate-direction local-constancy condition.
For every pair of parallel 1-cells `f, f'` connected by a KZ 2-cell (the generator
comparison `f^* × id_τ`, an invertible 2-cell), the restriction section maps are isomorphic
(`Iso (F.sec f) (F.sec f')`), AND restriction along the predicate-identity 1-cell is the
pinned identity value (`F(id) = restId`). So `F` depends on the predicate only through the
underlying paired-Priestley structure. -/
def PredicateLocallyConstant {C : Category} {V : Type} (F : KZSheaf.Sheaf C V) : Prop :=
  (∀ {X Y : ZeroCell C} (f f' : OneCell C X Y), KZ2Cell C f f' → Iso (F.sec f) (F.sec f'))
    ∧ (∀ X : ZeroCell C, Iso (F.sec (OneCell.idCell C X)) (F.restId X))

/-- **Predicate-local-constancy is exactly KZ-coherence + the presheaf identity law.** A
sheaf is predicate-locally-constant iff it is `KZCoherent` (its section maps are invariant
under the generator-direction iso 2-cells) and its identity restriction is the pinned value.
This re-expresses the corpus condition "`F` depends on `q` only through the Priestley
structure" in the wave's vocabulary. -/
theorem predicateLocallyConstant_iff {C : Category} {V : Type} (F : KZSheaf.Sheaf C V) :
    PredicateLocallyConstant F ↔
      (KZCoherent C F ∧ ∀ X : ZeroCell C, F.sec (OneCell.idCell C X) = F.restId X) := by
  unfold PredicateLocallyConstant KZCoherent Iso
  constructor
  · intro ⟨h1, h2⟩; exact ⟨fun f f' α => h1 f f' α, fun X => h2 X⟩
  · intro ⟨h1, h2⟩; exact ⟨fun f f' α => h1 f f' α, fun X => h2 X⟩

/-! ## Settling-local-constancy

`F` is **settling-locally-constant** if restriction along a settling-advance 1-cell (one
differing only in the temporal leg `h : τ ≤ τ'`, a `Prop`) is an isomorphism — `F` is
constant along `τ`. Because the settling leg is proof-irrelevant (`OneCell.ext`: two 1-cells
are equal iff their predicate legs are), two 1-cells with the same predicate leg are the
*same* 1-cell, so their section maps coincide definitionally: a strict-regime sheaf is
automatically settling-locally-constant (finite closure forces stabilization). -/

/-- **`SettlingLocallyConstant F`** — the settling-direction local-constancy condition. For
every pair of 1-cells `f, f'` with the **same predicate leg** (`f.f = f'.f`) — i.e. differing
only in the settling-advance leg `h` — the restriction section maps are isomorphic
(`Iso (F.sec f) (F.sec f')`). So `F` is constant along the settling axis `τ`: advancing `τ`
contributes no new content (the corpus's "the settling has stopped contributing beyond
`τ₀`"). -/
def SettlingLocallyConstant {C : Category} {V : Type} (F : KZSheaf.Sheaf C V) : Prop :=
  ∀ {X Y : ZeroCell C} (f f' : OneCell C X Y), f.f = f'.f → Iso (F.sec f) (F.sec f')

/-- **Every sheaf is settling-locally-constant** in this strict-regime model. Two 1-cells
with the same predicate leg are *equal* (`OneCell.ext`, the settling leg `h` being a `Prop`),
so their section maps coincide. This is the finite-closure stabilization: in the strict
regime the settling stops contributing new content, so restriction along a settling-advance
is the identity iso. (Aperiodic regime, prose: there the settling leg carries genuine
cross-`τ` content at every countable `τ₀`, and this fails.) -/
theorem every_sheaf_settlingLocallyConstant {C : Category} {V : Type} (F : KZSheaf.Sheaf C V) :
    SettlingLocallyConstant F := by
  intro X Y f f' hff
  show F.sec f = F.sec f'
  rw [OneCell.ext C hff]

/-! ## The strict-regime model's local-constancy and vanishing facts

⚠ **Scope.** In this Nat-indexed, proof-irrelevant-settling-leg model the settling axis is
degenerate: `every_sheaf_settlingLocallyConstant` holds for *every* sheaf unconditionally, and
`Cohomology.h1_vanishes` glues *every* cocycle unconditionally — neither uses the regime. So the
theorem below records the strict-side facts but does **not** witness the regime *dichotomy*. The
genuine corpus content — that local constancy / H¹-vanishing **holds** in strict/Scott and
**fails** in the aperiodic regime (forcing the direct-limit construction at every countable
`τ₀`) — cannot be stated in this model and is the open frontier (cf. the analogous
`thm:husainov-cech-derived`). Below, `cohomologyVanishes r = true` gates only the first two
conjuncts (the regime classification); the H¹ and settling-constancy conjuncts are unconditional.

In the strict/Scott regime (where `cohomologyVanishes r = true`):

* the regime gate fires (`cohomologyVanishes_iff`: `r ∈ {strict, scott}`), so settling
  cohomology `H¹` vanishes — every Čech 1-cocycle glues to a unique global section
  (`Cohomology.h1_vanishes`), the cohomology is *constant* (zero obstruction) across the
  relevant axis;
* a **predicate-locally-constant** `F` has its section maps invariant under the
  generator-direction iso 2-cells (KZ-coherence), so the predicate axis contributes no new
  cohomology — it is constant in `q`;
* a **settling-locally-constant** `F` has its section maps invariant under settling-advance,
  so the settling axis contributes no new cohomology — it is constant in `τ` (stabilization
  at the closure ordinal).

We prove the implication faithfully: from local constancy (either flavour) together with the
vanishing regime, settling `H¹` vanishes and the cohomology is locally constant along the
corresponding axis. -/

/-- **Strict-regime model: the regime gate, with the model's unconditional H¹/constancy facts.**
Let `r` be a regime with `cohomologyVanishes r = true`, `F` a sheaf.

* (regime gate, **regime-gated**) `cohomologyVanishes r = true ⟺ r ∈ {strict, scott}`
  (`cohomologyVanishes_iff`), and so `r ∈ {strict, scott}`;
* (`H¹ = 0`, **unconditional in this model**) every Čech datum's agreeing family glues to a
  **unique** global section (`Cohomology.h1_vanishes`) — note this holds for every cocycle
  regardless of `r`; the model has no aperiodic non-vanishing to witness;
* (predicate constancy ⇒ KZ-coherence) if `F` is predicate-locally-constant then its section
  maps are KZ-coherent (`F` is constant in `q`);
* (settling constancy, **unconditional in this model**) same-predicate-leg 1-cells carry equal
  section maps (`every_sheaf_settlingLocallyConstant`) — true of every sheaf because the
  settling leg is proof-irrelevant, *not* a strict-regime stabilization the model could fail.

So this records the strict side without witnessing the dichotomy: that local constancy /
H¹-vanishing FAILS in the aperiodic regime (forcing the direct limit at every countable `τ₀`)
is the open frontier, not provable in this Nat-indexed model. -/
theorem vanishing_regime_local_constancy_model {C : Category} {V : Type}
    (r : ClosureRegime) (hr : Infomaterial.cohomologyVanishes r = true) (F : KZSheaf.Sheaf C V) :
    -- (regime gate) cohomology vanishes ⟺ strict or scott
    (Infomaterial.cohomologyVanishes r = true ↔
        (r = ClosureRegime.strict ∨ r = ClosureRegime.scott))
    -- (the regime is strict or scott, discharged from hr — this settling DOES stabilize)
    ∧ (r = ClosureRegime.strict ∨ r = ClosureRegime.scott)
    -- (H¹ = 0) settling cohomology vanishes: every agreeing family glues uniquely
    ∧ (∀ D : Cohomology.Cech1, Cohomology.Cocycle D →
        (∃ g : AssocSheaf.Cochain, Cohomology.Coboundary D g)
          ∧ (∀ g g' : AssocSheaf.Cochain,
              Cohomology.Coboundary D g → Cohomology.Coboundary D g' → g = g'))
    -- (predicate constancy forces predicate-axis stabilization: F constant in q)
    ∧ (PredicateLocallyConstant F →
        ∀ {X Y : ZeroCell C} (f f' : OneCell C X Y), KZ2Cell C f f' → F.sec f = F.sec f')
    -- (settling constancy is forced: F constant in τ — stabilization at the closure ordinal)
    ∧ (∀ {X Y : ZeroCell C} (f f' : OneCell C X Y), f.f = f'.f → F.sec f = F.sec f') := by
  refine ⟨Infomaterial.cohomologyVanishes_iff r, (Infomaterial.cohomologyVanishes_iff r).mp hr, ?_, ?_, ?_⟩
  · intro D hcoc
    exact Cohomology.h1_vanishes D hcoc
  · intro hplc X Y f f' α
    exact hplc.1 f f' α
  · intro X Y f f' hff
    exact every_sheaf_settlingLocallyConstant F f f' hff

/-! ## `constant_sheaf_locally_constant`

The **constant sheaf** `A̲` — constant value on every object, identity restrictions — is
predicate-locally-constant (its restrictions are identities, hence isomorphisms). And we
characterize when the **settling-associated sheaf** `F_U` is predicate-locally-constant: iff
its stabilization is *predicate-uniform* (the corpus hypothesis), i.e. iff its section maps
are already KZ-coherent + identity-pinned. -/

/-- **The constant sheaf `A̲`** with value `a : V`: every section map is `a`, the identity
restriction is `a`, and the composition law is "take the first leg" (`fun x _ => x`) — a
constant presheaf. Its restrictions are all the identity on the single value `a`. -/
def constantSheaf {C : Category} {V : Type} (a : V) : KZSheaf.Sheaf C V where
  sec := fun _ => a
  restId := fun _ => a
  compat_id := fun _ => rfl
  restComp := fun x _ => x
  compat_comp := fun _ _ => rfl

/-- **The constant sheaf is predicate-locally-constant.** Every section map is the single
value `a`, so any two section maps are equal (`Iso`), in particular for KZ-connected
parallels; and the identity restriction is `a = restId`. Hence the constant sheaf's
restrictions are all identities, which are isomorphisms — `A̲` is predicate-locally-constant
for any value `a`. -/
theorem constantSheaf_predicateLocallyConstant {C : Category} {V : Type} (a : V) :
    PredicateLocallyConstant (constantSheaf (C := C) a) := by
  refine ⟨?_, ?_⟩
  · intro X Y f f' _; exact Iso.rfl a
  · intro X; exact Iso.rfl a

/-- **Characterization of predicate-local-constancy for the settling-associated sheaf.** A
sheaf `F` (in particular the settling-associated `F_U`, modeled as a `KZSheaf.Sheaf`) is
predicate-locally-constant **iff** its stabilization is *predicate-uniform*, which we make
precise as: its section maps are invariant under generator-direction iso 2-cells (KZ-coherent)
and the predicate-identity restriction is pinned. (`F_U` satisfies this exactly when
settling stabilization does not depend on the predicate identity — typically false in real
settlings, a hypothesis for the simplest examples.) -/
def PredicateUniform {C : Category} {V : Type} (F : KZSheaf.Sheaf C V) : Prop :=
  KZCoherent C F ∧ ∀ X : ZeroCell C, F.sec (OneCell.idCell C X) = F.restId X

/-- **`F_U` is predicate-locally-constant iff stabilization is predicate-uniform.** The
characterization: predicate-local-constancy of the settling-associated sheaf is *equivalent*
to predicate-uniformity of its stabilization (`predicateLocallyConstant_iff`, repackaged as
the named `PredicateUniform` condition). -/
theorem assocSheaf_predicateLocallyConstant_iff {C : Category} {V : Type} (F : KZSheaf.Sheaf C V) :
    PredicateLocallyConstant F ↔ PredicateUniform F :=
  predicateLocallyConstant_iff F

/-- **`constant_sheaf_locally_constant`.** Bundles the constant-sheaf case and the
settling-associated-sheaf characterization:

* (constant sheaf) the constant sheaf `A̲` (constant value `a`, identity restrictions) is
  **predicate-locally-constant** for any value `a` — its restrictions are identities, hence
  isomorphisms (`constantSheaf_predicateLocallyConstant`);
* (characterization) a sheaf `F` (the settling-associated `F_U`) is predicate-locally-constant
  **iff** its stabilization is *predicate-uniform* (`PredicateUniform`: KZ-coherent +
  identity-pinned) — `assocSheaf_predicateLocallyConstant_iff`. Typically false in real
  settlings (predicate-dependent stabilization), but a reasonable hypothesis for the simplest
  examples.

(Corpus: the constant sheaf is predicate-locally-constant for any `A`; `F_U` is iff settling
stabilization is predicate-uniform.) -/
theorem constant_sheaf_locally_constant {C : Category} {V : Type} (a : V) (F : KZSheaf.Sheaf C V) :
    -- the constant sheaf is predicate-locally-constant
    PredicateLocallyConstant (constantSheaf (C := C) a)
    -- and F_U is predicate-locally-constant iff its stabilization is predicate-uniform
    ∧ (PredicateLocallyConstant F ↔ PredicateUniform F) :=
  ⟨constantSheaf_predicateLocallyConstant a, assocSheaf_predicateLocallyConstant_iff F⟩

/-! ## Canonical instance over the predicate category `predCat`

Instantiating the headlines at the canonical predicate category `predCat` exhibits the
local-constancy conditions on the actual settling site's temporal 2-category — no new object
data, the constant sheaf and the forced settling-stabilization on `predCat`. -/

/-- The constant-sheaf local-constancy headline at the **canonical** predicate category
`predCat`: the constant sheaf over `predCat` is predicate-locally-constant, and the
predicate-local-constancy characterization holds. -/
theorem constant_sheaf_locally_constant_predCat {V : Type} (a : V) (F : KZSheaf.Sheaf predCat V) :
    PredicateLocallyConstant (constantSheaf (C := predCat) a)
      ∧ (PredicateLocallyConstant F ↔ PredicateUniform F) :=
  constant_sheaf_locally_constant a F

end LocalConstancy
end Infomaterial
