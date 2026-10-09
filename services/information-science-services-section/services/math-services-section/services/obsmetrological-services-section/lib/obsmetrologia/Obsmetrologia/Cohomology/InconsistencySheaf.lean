import Obsmetrologia.Site.Section
import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.Language.Positing.BigradedCohomology

/-!
# The inconsistency sheaf `F_U^{(⊤)}` — cokernel of `ι : F_U ↪ F_U^{(k)}`

This module formalizes the **inconsistency sheaf**, the corpus node

* `…/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md` —
  the cokernel of the inclusion `ι : F_U ↪ F_U^{(k)}`, tracking newly-added `⊤`-valued
  ("told both") cells **alone** — the paraconsistent-evidence content of a knowledge
  settling. The corpus model:

  $$\mathcal{F}_U^{(\top)}(q,\tau,U) := \mathbb{Z}^{\Delta^{+,\top}_\tau(q)\,\cap\,U},$$

  the free abelian group on the newly-added `⊤`-valued cells lying in the clopen `U`,
  with restriction maps as in `F_U`. The newly-designated set splits **disjointly**
  `Δ⁺ = Δ⁺ᵗ ⊔ Δ⁺ᵀ`; correspondingly `F_U^{(k)} ≅ F_U^{(t)} ⊕ F_U^{(⊤)}`, where
  `F_U^{(t)} = F_U` is the truth side. The SES `0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0`
  exhibits `F_U^{(⊤)}` as the cokernel of `ι` and is the input to the bigraded settling
  cohomology. The corpus reading: `F_U^{(⊤)} = 0` for a consistent settling (no `⊤`-cells),
  and for an inconsistent one its cohomology measures the paraconsistent-evidence structure
  *independently* of the `t`-only classical content.

## The model — reuse, never re-postulate

`F_U^{(⊤)}` is the `dTop`-side of the wave-3 split already built in
`SettlingAssociatedSheaf`: a section is an `AssocSheaf.Cochain = PredicationCell → Int`
(Lean-core `Int` = ℤ) that **vanishes off the `dTop` mask** (`AssocSheaf.dTop`, designated
= `{⊤}`, agreeing with `Reading.isInconsistency`). We do **not** introduce a new cochain
type or a new mask — `F_top := AssocSheaf.Cochain supported on dTop`. Restriction is
`AssocSheaf.restrict (dTop v)` (= the projection `AssocSheaf.pi v`), inherited verbatim, so
the presheaf laws are the inherited `restrict_id`/`restrict_comp`.

* **`inconsistency_sheaf_is_cokernel`** — `F_U^{(⊤)}` is the **cokernel** of
  `ι : F_U ↪ F_U^{(k)}`. We reuse the wave-3
  `AssocSheaf.designated_short_exact_sequence`: `π = AssocSheaf.pi` is surjective onto the
  `dTop`-supported cochains, and its kernel is exactly `im ι` (the vanishing-on-`⊤`
  characterization `pi v c = 0 ↔ VanishesOnTop v c`, and `im ι` is characterized by the
  same condition). So `F_U^{(k)}/im(ι) ≅ F_U^{(⊤)}`. We bundle this with the direct-sum
  decomposition `F_U^{(k)} ≅ F_U^{(t)} ⊕ F_U^{(⊤)}` (the split `combine (projT) (projTop)`),
  reusing the disjointness `dT ∩ dTop = ∅`.

* **`inconsistency_cohomology`** — the inconsistency sheaf's `H⁰`/`H¹`. `H⁰` is a **count
  of settled `⊤`-cells** (`countP (dTop v)`, the `dTop`-analogue of `Cohomology.H0`'s
  `dT`-count), positive iff there is `inconsistencyContent`. The inconsistency `H¹`
  **vanishes in the strict regime** — we reuse `Cohomology.h1_vanishes` (the gluing is the
  same `Sheaf` `H¹ = 0`, the `dTop`-sections being a sub-bundle of the `F_U` cochains) and
  the regime gate `cohomologyVanishes_iff`. So the `⊤`-content is the cohomological measure
  of paraconsistency, and it is unobstructed exactly when the cascade settles.
-/

namespace Obsmetrologia
namespace InconSheaf

open Obsmetrologia.AssocSheaf

/-! ## The inconsistency sheaf `F_top` — `dTop`-supported cochains

A section of `F_U^{(⊤)}` over a valuation `v` is an `AssocSheaf.Cochain` that **vanishes
off the `⊤`-mask** `dTop v` (designated = `{⊤}`). We do not introduce a new carrier: the
inconsistency sheaf *is* the `dTop`-side of the wave-3 split, so we reuse `Cochain`, the
`dTop` mask, and `restrict`. -/

/-- A cochain is a **section of the inconsistency sheaf** `F_U^{(⊤)}` at `v` when it vanishes
off the `⊤`-mask `dTop v` — i.e. it is supported on the newly-added `⊤`-cells. (`F_top` is
the `dTop`-supported sub-bundle of `AssocSheaf.Cochain = ℤ^{cells}`.) -/
def IsSection (v : Valuation) (c : Cochain) : Prop := Vanishes (dTop v) c

/-- **Restriction of the inconsistency sheaf** at `v` — the `⊤`-side restriction map,
inherited from `AssocSheaf` as `restrict (dTop v)` (`= AssocSheaf.pi v`). This is the
projection `π : F_U^{(k)} → F_U^{(⊤)}` followed by the sheaf restriction. -/
def restrictTop (v : Valuation) (c : Cochain) : Cochain := restrict (dTop v) c

/-- `restrictTop v` lands in `F_top`: it vanishes off `dTop v`. -/
theorem restrictTop_isSection (v : Valuation) (c : Cochain) :
    IsSection v (restrictTop v c) :=
  restrict_vanishes (dTop v) c

/-- `restrictTop v` is exactly the wave-3 projection `AssocSheaf.pi v` — we reuse, not
re-derive, the `⊤`-projection. -/
theorem restrictTop_eq_pi (v : Valuation) (c : Cochain) : restrictTop v c = pi v c := rfl

/-! ### Presheaf laws — inherited verbatim from `AssocSheaf.restrict`

The inconsistency sheaf is a sub-presheaf of `AssocSheaf`, so its restriction is functorial
by the inherited `restrict_id`/`restrict_comp`. We re-state the laws at the masked level. -/

/-- **Presheaf identity** for `F_top`: restricting by the full mask (the maximal clopen)
changes nothing — inherited from `AssocSheaf.restrict_id`. -/
theorem restrict_top_id (c : Cochain) : restrict (fun _ => true) c = c := restrict_id c

/-- **Presheaf composition** for `F_top`: restricting along `U₂ ⊆ U₁ ⊆ U` composes to the
meet mask — inherited from `AssocSheaf.restrict_comp`. -/
theorem restrict_top_comp (m₁ m₂ : PredicationCell → Bool) (c : Cochain) :
    restrict m₂ (restrict m₁ c) = restrict (fun φ => m₂ φ && m₁ φ) c :=
  restrict_comp m₁ m₂ c

/-- **`F_top` restriction is functorial along a sub-mask.** Restricting a `dTop`-section
along a tighter `⊤`-mask stays a section — the presheaf restriction `ρ : F_top → F_top(U')`.
-/
theorem restrictTop_of_section (m' : PredicationCell → Bool) (_v : Valuation) (c : Cochain) :
    Vanishes m' (restrict m' c) :=
  restrict_vanishes m' c

/-! ## Consistency — `F_top = 0` iff no `⊤`-cells (the corpus reading)

For a *consistent* settling that never produces a `⊤`-cell, `F_U^{(⊤)} = 0` identically:
every section is the zero cochain. We make this the `dTop`-mask emptiness condition. -/

/-- **`F_top = 0` for a consistent settling.** If `v` has no `⊤`-cell (`dTop v φ = false`
everywhere), then every section of `F_top` is the zero cochain — the sheaf vanishes
identically. (Corpus: a consistent knowledge presheaf has `F_U^{(⊤)} = 0`.) -/
theorem section_zero_of_consistent (v : Valuation) (c : Cochain)
    (hcons : ∀ φ, dTop v φ = false) (hc : IsSection v c) : c = zeroCochain := by
  funext φ; exact hc φ (hcons φ)

/-! ## `⊤`-void valuations

The inconsistency sheaf supplies a second, cohomological sense of void. A
valuation is `⊤`-void when it has no `⊤`-supported cells. In that case the
inconsistency sheaf has no nonzero sections, and every finite `H0top` census is
zero. -/

/-- A valuation is **`⊤`-void** when no predication cell carries the
inconsistency mask. This names the mathematically empty side of the
inconsistency sheaf. -/
def TopVoid (v : Valuation) : Prop := ∀ φ, dTop v φ = false

/-- A valuation is **section-void** for the inconsistency sheaf when every
`F_top` section is the zero cochain. -/
def SectionVoid (v : Valuation) : Prop := ∀ c, IsSection v c → c = zeroCochain

/-- A `⊤`-void valuation is section-void for the inconsistency sheaf. -/
theorem topVoid_sectionVoid (v : Valuation) (h : TopVoid v) : SectionVoid v := by
  intro c hc
  exact section_zero_of_consistent v c h hc

/-! ## The inconsistency sheaf is the cokernel of `ι`

`F_U^{(⊤)} = F_U^{(k)}/im(ι)`: the projection `π = AssocSheaf.pi` is surjective onto the
`dTop`-sections, its kernel is exactly `im ι` (vanishing-on-`⊤`), and `F_U^{(k)} ≅ F_U^{(t)}
⊕ F_U^{(⊤)}` splits. We bundle the cokernel identification with the direct-sum
decomposition, reusing the wave-3 `designated_short_exact_sequence`. -/

/-- **The inconsistency sheaf is the cokernel of `ι : F_U ↪ F_U^{(k)}`.**
With `F_U = ℤ^{dT}` (truth), `F_U^{(k)} = ℤ^{dK}` (paraconsistent), `F_U^{(⊤)} = ℤ^{dTop}`
(inconsistency), `ι = AssocSheaf.iota = restrict dT`, `π = AssocSheaf.pi = restrict dTop`:

* (the split is disjoint) `dT`/`dTop` never co-fire (`tTop ≠ kTop`) — `Δ⁺ᵗ ⊔ Δ⁺ᵀ`;
* (`π` surjective) every `dTop`-supported target `d` is hit (`π d = d`) — `π` is onto
  `F_U^{(⊤)}`;
* (`ker π = im ι`) `π c = 0 ⟺ c` vanishes on the `⊤`-cells, and anything `ι a` vanishes on
  the `⊤`-cells, while a `dK`-cochain vanishing on `⊤` *is* `ι c` — so the kernel of `π` is
  exactly the image of the inclusion. Hence `F_U^{(k)}/im(ι) ≅ F_U^{(⊤)}` (`π` factors
  through an isomorphism on the quotient): **`F_U^{(⊤)}` is the cokernel of `ι`**;
* (direct-sum decomposition) `F_U^{(k)} ≅ F_U^{(t)} ⊕ F_U^{(⊤)}`: a `dK`-cochain
  reconstructs from its truth-part and `⊤`-part (`combine (projT c) (projTop c) = c`) and
  the decomposition is unique — the SES splits, with `F_U^{(t)} = F_U` the truth side and
  `F_U^{(⊤)}` the inconsistency side. -/
theorem inconsistency_sheaf_is_cokernel :
    -- (disjoint split Δ⁺ᵗ ⊔ Δ⁺ᵀ)
    (∀ (v : Valuation) (φ : PredicationCell), ¬(dT v φ = true ∧ dTop v φ = true))
    -- (π surjective onto F_U^{(⊤)})
    ∧ (∀ (v : Valuation) (d : Cochain), Vanishes (dTop v) d → pi v d = d)
    -- (ker π = im ι, via the vanishing-on-⊤ characterization — both directions)
    ∧ (∀ (v : Valuation) (c : Cochain), pi v c = zeroCochain ↔ VanishesOnTop v c)
    ∧ (∀ (v : Valuation) (a : Cochain), VanishesOnTop v (iota v a))
    ∧ (∀ (v : Valuation) (c : Cochain),
        Vanishes (dK v) c → VanishesOnTop v c → iota v c = c)
    -- (direct-sum decomposition F_U^{(k)} ≅ F_U^{(t)} ⊕ F_U^{(⊤)}: reconstruct + unique)
    ∧ (∀ (v : Valuation) (c : Cochain),
        Vanishes (dK v) c → combine (projT v c) (projTop v c) = c)
    ∧ (∀ (v : Valuation) (c c' : Cochain),
        Vanishes (dK v) c → Vanishes (dK v) c' →
        projT v c = projT v c' → projTop v c = projTop v c' → c = c') := by
  obtain ⟨hdisj, _hunion, _hinj, hsurj, himv, hvim, hker, hsplit, huniq⟩ :=
    designated_short_exact_sequence
  exact ⟨hdisj, hsurj, hker, himv, hvim, hsplit, huniq⟩

/-! ## H⁰ of the inconsistency sheaf — the count of settled `⊤`-cells

`H⁰(T*, F_U^{(⊤)})` is a *count* of the `dTop`-designated (`⊤`-valued) cells of `v` in the
clopen's support — the `dTop`-analogue of `Cohomology.H0`'s `dT`-count. It measures the
extent of the accumulated contradictory evidence. -/

/-- **`H⁰` of the inconsistency sheaf — the count of settled `⊤`-cells.** `H0top v cells`
is the number of `dTop`-designated (`⊤`-valued, "told both") cells of `v` among the clopen's
support `cells` (`List.countP (dTop v)`). This is the realized global section of `F_top`:
the extent of accumulated contradictory evidence. -/
def H0top (v : Valuation) (cells : List PredicationCell) : Nat :=
  cells.countP (fun φ => dTop v φ)

/-- The `H⁰`-count of the empty support is `0`. -/
@[simp] theorem H0top_nil (v : Valuation) : H0top v [] = 0 := rfl

/-- A `⊤`-void valuation has zero degree-zero inconsistency census on every
finite support. -/
theorem topVoid_h0top_zero (v : Valuation) (cells : List PredicationCell)
    (h : TopVoid v) : H0top v cells = 0 := by
  unfold H0top
  induction cells with
  | nil => rfl
  | cons φ cells ih => simp [h φ, ih]

/-- `H0top` counts exactly the `Reading.isInconsistency` cells, and is **positive iff** there
is inconsistency-content (`BigradedCohomology.inconsistencyContent`) — `H⁰ = 0 ⟺ no ⊤-cell`,
i.e. the consistent case where `F_top = 0`. -/
theorem h0top_is_inconsistency_count (v : Valuation) (cells : List PredicationCell) :
    -- the count is by the ⊤-mask, which is exactly isInconsistency
    H0top v cells = cells.countP (fun φ => Reading.isInconsistency (v φ))
    -- and it is positive iff there is some ⊤-cell in the support
    ∧ (0 < H0top v cells ↔ inconsistencyContent cells v = true) := by
  refine ⟨rfl, ?_⟩
  unfold H0top inconsistencyContent
  rw [List.countP_pos_iff, List.any_eq_true]
  exact Iff.rfl

/-! ## H¹ of the inconsistency sheaf — vanishes in the strict regime (reuse)

The inconsistency `H¹` is the Čech gluing obstruction of `F_top` over a cover. Since the
`dTop`-sections are a sub-bundle of the `F_U`-cochains, the gluing is the *same* `Sheaf`
`H¹ = 0` already proved in `SettlingCohomologyH1` — we reuse `Cohomology.h1_vanishes`
(existence by pointwise glue, uniqueness by `Sheaf` separation) and the regime gate. -/

/-- **The inconsistency `H¹` vanishes for any Čech datum (reused).** Every agreeing family
of local `F_top`-sections glues to a *unique* global section — existence + separation. This
is `Cohomology.h1_vanishes` applied to `F_top`-sections (a `dTop`-supported sub-bundle of
the `F_U` cochains): the gluing is the same unobstructed `Sheaf` `H¹ = 0`. -/
theorem inconsistency_h1_vanishes (D : Cohomology.Cech1) : Cohomology.H1Vanishes D :=
  Cohomology.h1_vanishes D

/-! ## The inconsistency cohomology

`H⁰` counts settled `⊤`-cells; the inconsistency `H¹` vanishes in the strict (and Scott)
regime; so the `⊤`-content is the cohomological measure of paraconsistency, unobstructed
exactly when the cascade settles. -/

/-- **The inconsistency sheaf's cohomology `H⁰`/`H¹`.** For a closure-ordinal
regime `r` with vanishing cohomology (`cohomologyVanishes r = true`):

* (`H⁰` counts settled `⊤`-cells) `H0top v cells = countP (isInconsistency ∘ v) cells`, the
  count of `⊤`-valued ("told both") cells — and it is **positive iff** there is
  inconsistency-content (`H⁰ = 0 ⟺ no ⊤-cell ⟺ F_top = 0`, the consistent case);
* (regime gate) `cohomologyVanishes r = true ⟺ r ∈ {strict, scott}`, the regimes in which
  the cascade settles (`ClosureOrdinalRegime.cohomologyVanishes_iff`); the regime here is
  strict or scott;
* (inconsistency `H¹ = 0`) every Čech datum's agreeing family of local `F_top`-sections
  glues to a **unique** global section — existence by pointwise gluing, uniqueness by
  `Sheaf` separation (`Cohomology.h1_vanishes`) — so the inconsistency `H¹` vanishes in the
  strict regime. The `⊤`-content is the cohomological measure of paraconsistency,
  unobstructed exactly when the cascade settles. -/
theorem inconsistency_cohomology (r : ClosureRegime)
    (hr : Obsmetrologia.cohomologyVanishes r = true) (v : Valuation)
    (cells : List PredicationCell) :
    -- (H⁰ counts settled ⊤-cells, = isInconsistency count, positive iff inconsistency-content)
    (H0top v cells = cells.countP (fun φ => Reading.isInconsistency (v φ))
      ∧ (0 < H0top v cells ↔ inconsistencyContent cells v = true))
    -- (regime gate) cohomology vanishes ⟺ strict or scott
    ∧ (Obsmetrologia.cohomologyVanishes r = true ↔
        (r = ClosureRegime.strict ∨ r = ClosureRegime.scott))
    -- (the regime is strict or scott — this settling settles)
    ∧ (r = ClosureRegime.strict ∨ r = ClosureRegime.scott)
    -- (inconsistency H¹ = 0) every Čech datum's agreeing family glues to a unique global section
    ∧ (∀ D : Cohomology.Cech1, Cohomology.Cocycle D →
        (∃ g : Cochain, Cohomology.Coboundary D g)
          ∧ (∀ g g' : Cochain,
              Cohomology.Coboundary D g → Cohomology.Coboundary D g' → g = g')) :=
  ⟨h0top_is_inconsistency_count v cells,
    Obsmetrologia.cohomologyVanishes_iff r,
    (Obsmetrologia.cohomologyVanishes_iff r).mp hr,
    fun D hcoc => inconsistency_h1_vanishes D hcoc⟩

end InconSheaf
end Obsmetrologia
