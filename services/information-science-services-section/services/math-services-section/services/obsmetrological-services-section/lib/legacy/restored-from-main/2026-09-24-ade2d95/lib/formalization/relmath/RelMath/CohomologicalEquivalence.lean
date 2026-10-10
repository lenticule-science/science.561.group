/-
# Cohomological equivalence framework — settlings up to MLD (DERIVED)

This module is the standalone **cohomological equivalence framework**: the invariant that
classifies settlings up to **mutual-local-derivability (MLD)**. It generalizes
`SynonymyAntonymy`'s identification *synonymy = MLD = cohomological equivalence* into the
framework whose object is the **cohomological invariant of a settling** and whose congruence
is *equality of that invariant*.

Corpus node:
`…/settling/content/sheaf/content/settling-cohomology/content/cohomological-framework/cohomological-framework.md`
— a cohomological framework is a choice of (i) which fiber object, (ii) which cohomology
theory, (iii) which value category, computing an invariant of a settling. The four corpus
frameworks compute different invariants but agree where they overlap on the load-bearing
content: in the **strict / Scott-continuous** (flat) regimes the settling cohomology
*vanishes* (`H¹ = 0`), so every flat settling has the trivial cohomological invariant; in the
**transfinite-bounded / aperiodic** regimes the invariant stratifies settlings by their
`cl-inv` rank, and *this* invariant is **complete up to MLD**. We also read the corpus's
sibling node
`…/settling/content/mutually-locally-derivable/mutually-locally-derivable.md`
— two settlings are MLD iff their classifying invariants in `H¹(T*_{≤ω₁}, F_U)` agree — and
`…/mutually-locally-derivable/content/synonymy/synonymy.md` — synonymy *is* MLD *is*
cohomological equivalence.

## How the cohomological invariant is modeled

The **full cohomological invariant** of a settling is the triple
`cohInv v := (H⁰-content, cl-inv class, regime/trichotomy)`:

* the **`H⁰`** datum — the count of designated (settled-`t`) cells, the global settled
  section (`SettlingCohomologyH1.H0` realized; here carried as a `Nat` content slot on the
  settling);
* the **`H¹` / `cl-inv`** class — `Aperiodic.H1Class`, the classifying invariant
  `[1_{F_U}] ∈ H¹`, which is `0` in the flat regimes and stratifies the aperiodic ones;
* the **regime / trichotomy** invariant — the `ClosureRegime` (strict / Scott / transfinite /
  aperiodic), the orbit-class fingerprint.

Two settlings are **cohomologically equivalent** iff this whole triple agrees. Because the
invariant is a *function of the settling*, `CohEquiv` is the **pullback of equality** along
`cohInv`, so it is automatically an **equivalence relation** (the framework makes cohomology a
congruence). We carry a `CohSettling` = `Aperiodic.Settling` (regime + `cl-inv` + the vanishing
constraint) together with its `H⁰` content slot, so all three invariant components live on one
object and reuse the already-proven `Aperiodic` / `Semantic` machinery.

## The framework theorems (each reuses existing results — no re-derivation)

* **Flat-regime collapse** — every flat settling (`strict`/`scott`, `H¹ = 0`) has
  `cl-inv = 0`, reusing `Aperiodic.clinv_zero_of_settles` (which packages
  `SettlingCohomologyH1.classifying_invariant_zero_strict`). Two flat settlings with equal
  `H⁰` and equal regime-or-both-flat are cohomologically equivalent in their `H¹`-component to
  the trivial settling: the flat class is the single `cl-inv = 0` class. This is the corpus's
  "flat settlings collapse to the single trivial class".
* **Complete up to MLD** — on the `cl-inv` component, `CohEquiv`'s `H¹`-part is exactly
  `Aperiodic.MLD`: `clInvEquiv v w ↔ MLD v w`, reusing `Aperiodic.clInv_sound`/`clInv_complete`
  (the corpus's *complete invariant up to MLD*).
* **Gauge / negation invisibility** — bilattice negation `∼` is cohomologically *invisible*:
  the negation-twist fixes the underlying MLD-class (`Semantic.StrongSettling.negTwist_base`),
  so `v ~coh ∼v` on the `cl-inv` component — the gauge orbit lies inside each equivalence
  class (reusing `Semantic.synonymy_equiv_and_negation_invisible`).

## The framework theorem — three notions coincide

`cohomological_equivalence_framework` bundles: (1) `CohEquiv` is an equivalence relation;
(2) the **three-notions identification** on the classifying component —
`clInvEquiv v w ↔ MLD v w ↔ Synonymy v w` — cohomological-equivalence ⟺ MLD ⟺ synonymy;
(3) **flat-regime collapse** — flat settlings all carry `cl-inv = 0` (the single trivial
class), while aperiodic settlings stratify by `cl-inv` (a concrete aperiodic witness with
`cl-inv ≠ 0`); (4) gauge invisibility.

`CohInv` is a triple of `Nat × H1Class × ClosureRegime` (all concrete, `DecidableEq`);
`CohEquiv`/`clInvEquiv` are pullbacks of `Eq`; the framework theorems reuse
`Aperiodic.{MLD, clInv_sound, clInv_complete, clinv_zero_of_settles, aperiodicWitness}`,
`Semantic.{Synonymy, negTwist_base}`, and `cohomologyVanishes_iff`.
-/
import RelMath.SettlingCohomologyH1
import RelMath.AperiodicClassification
import RelMath.SynonymyAntonymy
import RelMath.ClosureOrdinalRegime

namespace RelMath
namespace CohFramework

open RelMath.Aperiodic
open RelMath.Semantic

/-! ## (1) The cohomological invariant of a settling

A **cohomological settling** carries an `Aperiodic.Settling` (its regime, its `cl-inv` class,
and the vanishing constraint that forces `cl-inv = 0` in the flat regimes) together with its
`H⁰` content — the count of designated cells, the global settled section. The full
**cohomological invariant** is the triple `(H⁰, cl-inv, regime)`. -/

/-- A **cohomological settling** — an `Aperiodic.Settling` together with its `H⁰` content
slot (the count of designated/settled-`t` cells, the global settled section realized by
`SettlingCohomologyH1.H0`). The `Aperiodic.Settling` already carries the `cl-inv` (`H¹`)
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
`cl-inv` classes. This is the classifying-component of `CohEquiv` and, by the corpus's
complete-invariant theorem, exactly `MLD`. -/
def clInvEquiv (v w : CohSettling) : Prop := v.base.clInv = w.base.clInv

/-- **`H¹`-cohomological equivalence is `MLD`.** The classifying-component of cohomological
equivalence is *exactly* mutual-local-derivability: `clInvEquiv v w ↔ MLD v.base w.base`,
reusing `Aperiodic.clInv_sound`/`clInv_complete` (the corpus's complete invariant up to MLD).
This is the *cohomological-equivalence ⟺ MLD* half of the identification. -/
theorem clInvEquiv_iff_mld (v w : CohSettling) :
    clInvEquiv v w ↔ MLD v.base w.base :=
  ⟨fun h => clInv_complete h, fun h => clInv_sound h⟩

/-- **`MLD` is synonymy** (reuse of `Semantic.Synonymy` = `Aperiodic.MLD` by definition). The
*MLD ⟺ synonymy* half of the identification. -/
theorem mld_iff_synonymy (v w : CohSettling) :
    MLD v.base w.base ↔ Synonymy v.base w.base := Iff.rfl

/-- **The three notions coincide on the classifying component (framework theorem (b)).**
`clInvEquiv v w ↔ MLD v.base w.base ↔ Synonymy v.base w.base`: cohomological-equivalence
(restricted to the load-bearing `H¹` component) ⟺ MLD ⟺ synonymy. The classifying invariant
is the **complete invariant up to MLD**; reuses `clInv_sound`/`clInv_complete` and the
`Synonymy := MLD` definition. -/
theorem three_notions (v w : CohSettling) :
    (clInvEquiv v w ↔ MLD v.base w.base) ∧ (MLD v.base w.base ↔ Synonymy v.base w.base) :=
  ⟨clInvEquiv_iff_mld v w, mld_iff_synonymy v w⟩

/-- **Full cohomological equivalence refines `MLD`.** If `v ~coh w` (the whole triple agrees)
then in particular their `cl-inv` classes agree, so they are MLD. (The converse needs equal
`H⁰` and regime — the `H¹` invariant is complete *up to MLD*, but the full triple is the
finer datum the framework records, exactly the corpus's "richer value category / finer
classification" remark.) -/
theorem cohEquiv_imp_mld {v w : CohSettling} (h : CohEquiv v w) : MLD v.base w.base :=
  (cohEquiv_components h).2.1

/-! ## (4) Flat-regime collapse — strict/Scott settlings carry the trivial class

In the strict / Scott-continuous (flat) regimes the settling cohomology vanishes (`H¹ = 0`),
so `cl-inv` is forced to `0` — every flat settling carries the single **trivial** `cl-inv`
class. Reuses `Aperiodic.clinv_zero_of_settles` (which packages
`SettlingCohomologyH1.classifying_invariant_zero_strict`). -/

/-- **Flat settlings have trivial `cl-inv`.** If a cohomological settling is in the flat
regime (`strict`/`scott`), its classifying invariant is the zero class `[1_{F_U}] = 0`
(`H¹ = 0`, the cascade settles). Reuses `Aperiodic.clinv_zero_of_settles`. -/
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
            clInv := H1Class.zero
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
`Aperiodic.aperiodicWitness` (`cl-inv = [1] ≠ 0`). -/
def aperiodicCoh : CohSettling where
  base := aperiodicWitness
  h0 := 0

/-- **The aperiodic witness is not flat-collapsed.** Its `cl-inv` is nonzero, so it is not
`clInvEquiv` to the trivial settling — the aperiodic stratum is genuinely separated from the
flat (trivial) class. Reuses `Aperiodic.aperiodicWitness_clinv_nonzero`. -/
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

* **(three notions coincide)** on the load-bearing classifying (`H¹`) component,
  `clInvEquiv v w ↔ MLD v.base w.base ↔ Synonymy v.base w.base` —
  *cohomological-equivalence ⟺ MLD ⟺ synonymy*; the classifying invariant `cl-inv` is the
  **complete invariant up to MLD** (reuses `Aperiodic.clInv_sound`/`clInv_complete`,
  `Semantic.Synonymy := MLD`). Full `CohEquiv` *refines* MLD (it additionally records `H⁰`
  and the regime — the finer datum);

* **(flat-regime collapse)** every flat settling (`strict`/`scott`, `H¹ = 0`) has
  `cl-inv = 0` and is `cl-inv`-equivalent to `trivialSettling` — the strict/Scott regimes
  collapse to the **single trivial class** (reuses `Aperiodic.clinv_zero_of_settles`, which
  packages `SettlingCohomologyH1.classifying_invariant_zero_strict`); while the **aperiodic**
  regime stratifies — `aperiodicCoh` (with `cl-inv ≠ 0`) is *not* collapsed to the trivial
  class (reuses `Aperiodic.aperiodicWitness_clinv_nonzero`);

* **(gauge invisibility)** bilattice negation `∼` is cohomologically invisible: `v ~coh ∼v`
  (the whole invariant is fixed by the negation-twist) — the gauge orbit lies inside each
  equivalence class (reuses `Semantic.StrongSettling.negTwist_base`).

Corpus: `cohomological-framework.md`, `mutually-locally-derivable.md`, `synonymy.md`.
Depends on at most `{propext, Quot.sound}`. -/
theorem cohomological_equivalence_framework :
    -- (equivalence relation) CohEquiv is refl / symm / trans
    (∀ v : CohSettling, CohEquiv v v)
    ∧ (∀ v w : CohSettling, CohEquiv v w → CohEquiv w v)
    ∧ (∀ v w x : CohSettling, CohEquiv v w → CohEquiv w x → CohEquiv v x)
    -- (three notions) clInvEquiv ⟺ MLD ⟺ synonymy on the classifying component
    ∧ (∀ v w : CohSettling, clInvEquiv v w ↔ MLD v.base w.base)
    ∧ (∀ v w : CohSettling, MLD v.base w.base ↔ Synonymy v.base w.base)
    -- (full CohEquiv refines MLD)
    ∧ (∀ v w : CohSettling, CohEquiv v w → MLD v.base w.base)
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
   fun v w => clInvEquiv_iff_mld v w,
   fun v w => mld_iff_synonymy v w,
   fun _ _ h => cohEquiv_imp_mld h,
   flat_clInv_zero,
   flat_coh_equiv_trivial,
   ⟨aperiodicCoh, rfl, aperiodic_not_trivial⟩,
   negation_cohomologically_invisible⟩

end CohFramework
end RelMath
