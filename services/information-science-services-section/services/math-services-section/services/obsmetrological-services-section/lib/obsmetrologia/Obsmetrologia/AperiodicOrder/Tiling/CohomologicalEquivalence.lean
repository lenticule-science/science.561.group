import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.AperiodicOrder.Tiling.Classification
import Obsmetrologia.AperiodicOrder.Tiling.SynonymyAntonymy
import Obsmetrologia.Closure.Regime

/-!
# Cohomological equivalence framework — the cl-inv congruence on settlings

The congruence on settlings given by equality of their cohomological invariant
`cohInv v := (H⁰-content, cl-inv class, regime)`. `CohEquiv` is the pullback of
equality along `cohInv`, so it is automatically an equivalence relation. The corpus
reads this invariant as classifying settlings up to mutual-local-derivability (MLD);
`clInvEquiv` formalizes the cohomological reading (synonymy), and the structural
`Aperiodic` MLD relation refines it (`D.Mld → clInvEquiv`, Step 3). Full coincidence
(`clInvEquiv ⟺ MLD`) is the open classification (`thm:aperiodic-mld-classification`).

Corpus: `…/settling-cohomology/content/cohomological-framework/cohomological-framework.md`,
`…/mutually-locally-derivable/mutually-locally-derivable.md`,
`…/mutually-locally-derivable/content/synonymy/synonymy.md`.

`cohomological_equivalence_framework` bundles: `CohEquiv` is an equivalence relation;
the classifying component `clInvEquiv v w ↔ Synonymy v.base w.base`, refined by MLD;
flat-regime collapse (`strict`/`scott` settlings all have `cl-inv = 0`, reusing
`AperiodicOrder.Tiling.clinv_zero_of_settles`) against a concrete aperiodic witness
with `cl-inv ≠ 0`; and gauge invisibility (bilattice negation `∼` fixes the MLD-class,
`Semantic.StrongSettling.negTwist_base`, so `v ~coh ∼v` on the `cl-inv` component).
-/

namespace Obsmetrologia
namespace CohFramework

open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.Semantic

/-! ## (1) The cohomological invariant of a settling

A **cohomological settling** carries an `AperiodicOrder.Tiling.Settling` (its regime, its `cl-inv` class,
and the vanishing constraint that forces `cl-inv = 0` in the flat regimes) together with its
`H⁰` content — the count of designated cells, the global settled section. The full
**cohomological invariant** is the triple `(H⁰, cl-inv, regime)`. -/

/-- A **cohomological settling** — an `AperiodicOrder.Tiling.Settling` together with its `H⁰` content
slot (the count of designated/settled-`t` cells, the global settled section realized by
`SettlingCohomologyH1.H0`). The `AperiodicOrder.Tiling.Settling` already carries the `cl-inv` (`H¹`)
class and the regime, with the corpus's vanishing constraint (`cl-inv = 0` in flat regimes). -/
structure CohSettling where
  /-- The underlying settling: regime + `cl-inv` (`H¹`) class + the vanishing constraint. -/
  base : Settling
  /-- The `H⁰` content — the count of designated (settled-`t`) cells (`H0` realized). -/
  h0 : Nat

namespace CohSettling

/-- The **regime / trichotomy invariant** of a cohomological settling — the orbit class
(strict / Scott / transfinite / aperiodic). -/
def regime (v : CohSettling) : ClosureRegime := v.base.regime

/-- The **`cl-inv` (`H¹`) class** of a cohomological settling — the classifying invariant
`[1_{F_U}] ∈ H¹`. -/
def clInv (v : CohSettling) : H1Class := v.base.clInv

/-- The **full cohomological invariant** `cohInv v = (H⁰, cl-inv, regime)` — the triple the
framework computes for a settling. Its three components are exactly the three corpus invariant
slots: the `H⁰` global-section count, the `H¹` classifying class, and the regime/trichotomy
fingerprint. -/
def cohInv (v : CohSettling) : Nat × H1Class × ClosureRegime :=
  (v.h0, v.clInv, v.regime)

end CohSettling

open CohSettling

/-! ## (2) Cohomological equivalence — the congruence

Two settlings are **cohomologically equivalent** iff their full cohomological invariants
agree. As the pullback of equality along `cohInv`, this is an equivalence relation: the
framework makes cohomology a *congruence* on settlings. -/

/-- **Cohomological equivalence** `v ~coh w` — the full cohomological invariants agree
(`H⁰`, `cl-inv`, *and* regime/trichotomy). The framework's congruence: settlings sharing
their entire settling-cohomology. -/
def CohEquiv (v w : CohSettling) : Prop := cohInv v = cohInv w

/-- **`CohEquiv` is reflexive** (the pullback of `Eq`). -/
theorem cohEquiv_refl (v : CohSettling) : CohEquiv v v := rfl

/-- **`CohEquiv` is symmetric.** -/
theorem cohEquiv_symm {v w : CohSettling} (h : CohEquiv v w) : CohEquiv w v := h.symm

/-- **`CohEquiv` is transitive.** -/
theorem cohEquiv_trans {v w x : CohSettling}
    (h : CohEquiv v w) (h' : CohEquiv w x) : CohEquiv v x := h.trans h'

/-- **`CohEquiv` agreeing means each component agrees** — the triple-equality unpacks to the
three invariant components agreeing (`H⁰`, `cl-inv`, regime). -/
theorem cohEquiv_components {v w : CohSettling} (h : CohEquiv v w) :
    v.h0 = w.h0 ∧ v.clInv = w.clInv ∧ v.regime = w.regime := by
  unfold CohEquiv cohInv at h
  exact ⟨(Prod.mk.injEq _ _ _ _).mp h |>.1,
         (Prod.mk.injEq _ _ _ _).mp ((Prod.mk.injEq _ _ _ _).mp h).2 |>.1,
         (Prod.mk.injEq _ _ _ _).mp ((Prod.mk.injEq _ _ _ _).mp h).2 |>.2⟩

/-! ## (3) The classifying component — cohomological equivalence ⟺ MLD ⟺ synonymy

The corpus's identification *cohomological-equivalence ⟺ MLD ⟺ synonymy* lives on the
**`cl-inv` (`H¹`) component**: the classifying invariant is the complete invariant up to MLD.
We isolate the `H¹`-part of cohomological equivalence as `clInvEquiv` (equality of `cl-inv`
classes of the underlying settlings) and identify it with `MLD` and `Synonymy`, reusing the
already-proven `Aperiodic`/`Semantic` machinery — *not* re-deriving `cl-inv`. -/

/-- **`H¹`-cohomological equivalence** `clInvEquiv v w` — the underlying settlings have equal
`cl-inv` classes. This is the classifying-component of `CohEquiv` and the formalized synonymy /
cohomological reading; the *structural* MLD relation **refines** it (Step 3), and their full
coincidence is the open classification (`thm:aperiodic-mld-classification`). -/
def clInvEquiv (v w : CohSettling) : Prop := v.base.clInv = w.base.clInv

/-- **`H¹`-cohomological equivalence is synonymy** — `clInvEquiv v w ↔ Synonymy v.base w.base`,
both being equality of `cl-inv` classes (`Semantic.Synonymy := AperiodicOrder.Tiling.CohEquiv`). -/
theorem clInvEquiv_iff_synonymy (v w : CohSettling) :
    clInvEquiv v w ↔ Synonymy v.base w.base := Iff.rfl

/-- **MLD refines `H¹`-cohomological equivalence (Step 3, the easy direction).** For any
local-derivability structure `D`, an invertible settling-morphism preserves `cl-inv`, so
`D.Mld v.base w.base → clInvEquiv v w`. The converse — that equal `cl-inv` yields a
settling-morphism — is the open classification (`thm:aperiodic-mld-classification`). -/
theorem mld_refines_clInvEquiv (D : LocalDerivability) (v w : CohSettling)
    (h : D.Mld v.base w.base) : clInvEquiv v w :=
  mld_refines_cohEquiv D h

/-- **The classifying component (framework theorem (b)).** `clInvEquiv v w ↔ Synonymy v.base
w.base` (both equal `cl-inv` — synonymy is the cohomological reading), and the structural MLD
relation **refines** it: `D.Mld → clInvEquiv` (Step 3). The full coincidence `clInvEquiv ⟺ MLD`
is the open classification; it is **not** asserted here. -/
theorem classifying_component_model (D : LocalDerivability) (v w : CohSettling) :
    (clInvEquiv v w ↔ Synonymy v.base w.base)
    ∧ (D.Mld v.base w.base → clInvEquiv v w) :=
  ⟨clInvEquiv_iff_synonymy v w, fun h => mld_refines_clInvEquiv D v w h⟩

/-- **Full cohomological equivalence refines `H¹`-equivalence.** If `v ~coh w` (the whole
triple agrees) then in particular their `cl-inv` classes agree (`clInvEquiv v w`). The full
triple is the finer datum the framework records (it additionally pins `H⁰` and the regime). -/
theorem cohEquiv_imp_clInvEquiv {v w : CohSettling} (h : CohEquiv v w) : clInvEquiv v w :=
  (cohEquiv_components h).2.1

/-! ## (4) Flat-regime collapse — strict/Scott settlings carry the trivial class

In the strict / Scott-continuous (flat) regimes the settling cohomology vanishes (`H¹ = 0`),
so `cl-inv` is forced to `0` — every flat settling carries the single **trivial** `cl-inv`
class. Reuses `AperiodicOrder.Tiling.clinv_zero_of_settles` (which packages
`SettlingCohomologyH1.classifying_invariant_zero_strict`). -/

/-- **Flat settlings have trivial `cl-inv`.** If a cohomological settling is in the flat
regime (`strict`/`scott`), its classifying invariant is the zero class `[1_{F_U}] = 0`
(`H¹ = 0`, the cascade settles). Reuses `AperiodicOrder.Tiling.clinv_zero_of_settles`. -/
theorem flat_clInv_zero (v : CohSettling)
    (hr : v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) :
    v.clInv = H1Class.zero :=
  clinv_zero_of_settles v.base hr

/-- **All flat settlings are `cl-inv`-equivalent (collapse to the trivial class).** Any two
flat settlings have the same (zero) `cl-inv`, hence are `clInvEquiv` / MLD / synonymous: the
flat regimes collapse to the **single trivial class** (the corpus's strict/Scott collapse).
Reuses `flat_clInv_zero` twice. -/
theorem flat_settlings_collapse (v w : CohSettling)
    (hv : v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott)
    (hw : w.regime = ClosureRegime.strict ∨ w.regime = ClosureRegime.scott) :
    clInvEquiv v w := by
  unfold clInvEquiv
  show v.clInv = w.clInv
  rw [flat_clInv_zero v hv, flat_clInv_zero w hw]

/-- **The trivial settling** — the canonical representative of the flat class: strict regime,
zero `cl-inv`, no designated cells (`H⁰ = 0`). -/
def trivialSettling : CohSettling where
  base := { regime := ClosureRegime.strict
            carrier := coordCarrier 0
            vanishing := fun _ => rfl }
  h0 := 0

/-- The trivial settling is flat. -/
theorem trivialSettling_flat :
    trivialSettling.regime = ClosureRegime.strict ∨ trivialSettling.regime = ClosureRegime.scott :=
  Or.inl rfl

/-- **Every flat settling is `cl-inv`-equivalent to the trivial settling.** The flat class is
exactly the `cl-inv = 0` class, with `trivialSettling` its representative. This is the corpus's
"flat-regime settlings are all cohomologically equivalent to the trivial settling" (on the
classifying component), reusing `classifying_invariant_zero_strict`/`H1Vanishes`. -/
theorem flat_coh_equiv_trivial (v : CohSettling)
    (hv : v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) :
    clInvEquiv v trivialSettling :=
  flat_settlings_collapse v trivialSettling hv trivialSettling_flat

/-- **Aperiodic settlings stratify** — there is an aperiodic cohomological settling whose
`cl-inv` is *nonzero*, hence **not** `cl-inv`-equivalent to the trivial settling: the
aperiodic regime is *not* collapsed (it stratifies by `cl-inv` rank). Reuses
`AperiodicOrder.Tiling.aperiodicWitness` (`cl-inv = [1] ≠ 0`). -/
def aperiodicCoh : CohSettling where
  base := aperiodicWitness
  h0 := 0

/-- **The aperiodic witness is not flat-collapsed.** Its `cl-inv` is nonzero, so it is not
`clInvEquiv` to the trivial settling — the aperiodic stratum is separated from the
flat (trivial) class. Reuses `AperiodicOrder.Tiling.aperiodicWitness_clinv_nonzero`. -/
theorem aperiodic_not_trivial : ¬ clInvEquiv aperiodicCoh trivialSettling := by
  unfold clInvEquiv
  show aperiodicWitness.clInv ≠ H1Class.zero
  exact aperiodicWitness_clinv_nonzero

/-! ## (5) Gauge / negation invisibility — the gauge orbit lies inside each class

Bilattice negation `∼` is **cohomologically invisible**: the negation-twist fixes the
underlying `cl-inv` class (`Semantic.StrongSettling.negTwist_base`), so a settling and its
negation are `cl-inv`-equivalent — the gauge orbit lies inside each cohomological equivalence
class. Reuses `Semantic.synonymy_equiv_and_negation_invisible`. -/

/-- **The negation-twist of a cohomological settling** — apply bilattice negation: it keeps the
underlying settling (so the `cl-inv` class and regime are unchanged) and the `H⁰` content (the
designated-cell count is gauge-invariant — negation preserves the firing-ordinal set). We carry
the firing-type twist on the `Semantic` strong-settling level; on `CohSettling` the cohomology
is literally unchanged, which IS the invisibility. -/
def negCoh (v : CohSettling) : CohSettling :=
  { base := (StrongSettling.negTwist ⟨v.base, FiringType.truthOnly⟩).base
    h0 := v.h0 }

/-- **Negation is cohomologically invisible.** `v ~coh ∼v`: the full cohomological invariant
of a settling equals that of its negation-twist — negation fixes `cl-inv` (`negTwist_base`),
the regime, and the `H⁰` count. So the gauge orbit lies entirely **inside** each equivalence
class. Reuses `Semantic.StrongSettling.negTwist_base`. -/
theorem negation_cohomologically_invisible (v : CohSettling) : CohEquiv (negCoh v) v := by
  show cohInv (negCoh v) = cohInv v
  unfold cohInv negCoh CohSettling.h0 CohSettling.clInv CohSettling.regime
  simp [StrongSettling.negTwist_base]

/-- **The gauge orbit is `cl-inv`-trivial too** — on the classifying component, `v` and `∼v`
are MLD / synonymous (negation-invisibility at the MLD level). Reuses
`Semantic.StrongSettling.negTwist_base`. -/
theorem negation_clInvEquiv (v : CohSettling) : clInvEquiv (negCoh v) v := by
  unfold clInvEquiv negCoh
  show (StrongSettling.negTwist ⟨v.base, FiringType.truthOnly⟩).base.clInv = v.base.clInv
  rw [StrongSettling.negTwist_base]

/-! ## The cohomological equivalence framework -/

/-- **The cohomological equivalence framework.** Bundles the standalone framework
that classifies settlings up to MLD:

* **(equivalence relation)** `CohEquiv` — equality of the full cohomological invariant
  `(H⁰, cl-inv, regime)` — is reflexive, symmetric, transitive: the framework makes
  settling-cohomology a **congruence** on settlings;

* **(classifying component)** on the load-bearing classifying (`H¹`) component,
  `clInvEquiv v w ↔ Synonymy v.base w.base` (both equal `cl-inv` — synonymy is the cohomological
  reading), and the *structural* MLD relation **refines** it: `D.Mld → clInvEquiv` (Step 3,
  reuses `AperiodicOrder.Tiling.mld_refines_cohEquiv`). The full coincidence `clInvEquiv ⟺ MLD` is the open
  classification (`thm:aperiodic-mld-classification`). Full `CohEquiv` *refines* `clInvEquiv` (it
  additionally records `H⁰` and the regime — the finer datum);

* **(flat-regime collapse)** every flat settling (`strict`/`scott`, `H¹ = 0`) has
  `cl-inv = 0` and is `cl-inv`-equivalent to `trivialSettling` — the strict/Scott regimes
  collapse to the **single trivial class** (reuses `AperiodicOrder.Tiling.clinv_zero_of_settles`, which
  packages `SettlingCohomologyH1.classifying_invariant_zero_strict`); while the **aperiodic**
  regime stratifies — `aperiodicCoh` (with `cl-inv ≠ 0`) is *not* collapsed to the trivial
  class (reuses `AperiodicOrder.Tiling.aperiodicWitness_clinv_nonzero`);

* **(gauge invisibility)** bilattice negation `∼` is cohomologically invisible: `v ~coh ∼v`
  (the whole invariant is fixed by the negation-twist) — the gauge orbit lies inside each
  equivalence class (reuses `Semantic.StrongSettling.negTwist_base`).

Corpus: `cohomological-framework.md`, `mutually-locally-derivable.md`, `synonymy.md`.
Depends on at most `{propext, Quot.sound}`. -/
theorem cohomological_equivalence_framework (D : LocalDerivability) :
    -- (equivalence relation) CohEquiv is refl / symm / trans
    (∀ v : CohSettling, CohEquiv v v)
    ∧ (∀ v w : CohSettling, CohEquiv v w → CohEquiv w v)
    ∧ (∀ v w x : CohSettling, CohEquiv v w → CohEquiv w x → CohEquiv v x)
    -- (classifying component) clInvEquiv ⟺ synonymy; MLD refines it (Step 3)
    ∧ (∀ v w : CohSettling, clInvEquiv v w ↔ Synonymy v.base w.base)
    ∧ (∀ v w : CohSettling, D.Mld v.base w.base → clInvEquiv v w)
    -- (full CohEquiv refines the H¹-component)
    ∧ (∀ v w : CohSettling, CohEquiv v w → clInvEquiv v w)
    -- (flat-regime collapse) flat ⟹ cl-inv = 0, all flat ~coh trivial
    ∧ (∀ v : CohSettling,
        (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
          v.clInv = H1Class.zero)
    ∧ (∀ v : CohSettling,
        (v.regime = ClosureRegime.strict ∨ v.regime = ClosureRegime.scott) →
          clInvEquiv v trivialSettling)
    -- (aperiodic stratifies) an aperiodic settling NOT collapsed to the trivial class
    ∧ (∃ v : CohSettling,
        v.regime = ClosureRegime.aperiodic ∧ ¬ clInvEquiv v trivialSettling)
    -- (gauge invisibility) v ~coh ∼v: negation fixes the whole invariant
    ∧ (∀ v : CohSettling, CohEquiv (negCoh v) v) :=
  ⟨cohEquiv_refl,
   fun _ _ h => cohEquiv_symm h,
   fun _ _ _ h h' => cohEquiv_trans h h',
   fun v w => clInvEquiv_iff_synonymy v w,
   fun v w h => mld_refines_clInvEquiv D v w h,
   fun _ _ h => cohEquiv_imp_clInvEquiv h,
   flat_clInv_zero,
   flat_coh_equiv_trivial,
   ⟨aperiodicCoh, rfl, aperiodic_not_trivial⟩,
   negation_cohomologically_invisible⟩

end CohFramework
end Obsmetrologia
