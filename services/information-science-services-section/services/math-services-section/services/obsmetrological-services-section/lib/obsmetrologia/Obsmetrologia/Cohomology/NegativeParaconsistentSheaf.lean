import Obsmetrologia.Site.Section
import Obsmetrologia.Cohomology.InconsistencySheaf
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Site.DFrame

/-!
# The negative-paraconsistent settling-associated sheaf `F_U^{(k,−)}` — the bilattice-negation mirror

This module formalizes the **negative-paraconsistent settling-associated sheaf**
`F_U^{(k,−)}`, the bilattice-**negation mirror** of the paraconsistent sheaf
`F_U^{(k)}` of `SettlingAssociatedSheaf`. The corpus node:

* `…/settling/content/sheaf/content/negative-paraconsistent-settling-sheaf/negative-paraconsistent-settling-sheaf.md`
  — where `F_U^{(k)}(q,τ,U) = ℤ^{Δ⁺,Belnap_τ(q) ∩ U}` tracks the Belnap-**designated
  POSITIVE-evidence** increments (cells gaining a truth-component, settled value in
  `{t, ⊤}`, the mask `dK`), the negative sheaf
  `F_U^{(k,−)}(q,τ,U) := ℤ^{Δ⁻,Belnap_τ(q) ∩ U}` tracks the **symmetric
  NEGATIVE-evidence** increments (cells gaining a falsity-component, settled value in
  `{f, ⊤}`, the mask `dNeg`). The bilattice negation involution `∼` (`Reading.negate`,
  `BigradedCohomology.negateVal` pointwise) carries the positive sheaf to the negative
  sheaf: it sends a `t`-cell to an `f`-cell and an `f`-cell to a `t`-cell, while
  **fixing** the `⊤` ("told both") cells (and the `⊥` empty cells). So `Δ⁻` is `negate`
  applied to `Δ⁺`, and the two sides share the negation-fixed `⊤`-seam — the
  cohomological seam of paraconsistency.

## The model — reuse, never re-postulate

`F_U^{(k,−)}` is the falsity-side of the same wave-3 machinery already built in
`SettlingAssociatedSheaf`. A section is an `AssocSheaf.Cochain = PredicationCell → Int`
(Lean-core `Int` = ℤ) that **vanishes off the `dNeg` mask**. The `dNeg` mask is the
`f`-or-`⊤` mask; it is exactly `DFrame.dF` (the falsehood mask `Δ⁻` already defined in
`DFrame` as `decide (v φ = tBot ∨ v φ = kTop)`), so we **reuse** it rather than define a
fresh mask — `dNeg := DFrame.dF`, with `dNeg_eq` certifying the `f`-or-`⊤` reading.
Restriction is `AssocSheaf.restrict (dNeg v)`, inherited verbatim, so the presheaf laws
are the inherited `restrict_id`/`restrict_comp`/`restrict_vanishes`.

* **`negative_sheaf_is_negation_mirror`** — the negative sheaf is the
  NEGATION MIRROR of the positive paraconsistent sheaf. Bilattice negation
  (`AssocSheaf` ... `Reading.negate`) swaps the truth-designation and the
  falsity-designation: `negate` sends a `t`-cell to an `f`-cell and fixes `⊤`, so the
  `dNeg` mask of `v` equals the **positive** Belnap mask `dK` of `negate ∘ v`
  (`negateVal v`), cell by cell — `dNeg v φ = dK (negateVal v) φ`. The `⊤`-component is
  negation-fixed (`dTop (negateVal v) = dTop v`), the `f`-cells of `v` are the `t`-cells
  of `negate v`, and the involution `negate_negate` makes the mirror an involution on
  the sheaves. Reuses `Reading.negate_negate` and the `negate_tTop/tBot/kTop/kBot` facts.

* **`negative_paraconsistent_split`** — the negative side has the analogous
  direct-sum / disjointness structure: `dNeg = dFonly ⊔ dTop`, the falsity-component
  splitting as `f`-only (`dFonly v φ := decide (v φ = tBot)`) plus the **shared** `⊤`
  (`AssocSheaf.dTop`), exactly mirroring the positive `dK = dT ⊔ dTop`. The `f`-only and
  `⊤`-only cells are disjoint; `⊤` is shared with the positive side (`dTop` is the same
  mask on both) — the cohomological seam of paraconsistency. A `dNeg`-cochain decomposes
  uniquely as its `f`-only-part plus its `⊤`-part.
-/

namespace Obsmetrologia
namespace NegSheaf

open Obsmetrologia.AssocSheaf
open Obsmetrologia.Reading

/-! ## The negative-designation mask `dNeg` — the `f`-or-`⊤` mask `Δ⁻`

The Belnap-**negative-designated** cells are those gaining a falsity component: settled
value in `{f, ⊤}` (`tBot` or `kTop`). This is exactly `DFrame.dF`, already defined as
the falsehood mask `Δ⁻`; we reuse it as `dNeg` and certify the reading. -/

/-- **The negative-paraconsistent mask** `dNeg` — designated = `{f, ⊤}` = `Δ⁻`, the
newly-falsity-designated cells. Reuses `DFrame.dF` (the falsehood mask), the exact
mirror of `AssocSheaf.dK` on the negative side. `F_U^{(k,−)} = ℤ^{dNeg}`. -/
def dNeg : Mask := DFrame.dF

/-- `dNeg` is the `f`-or-`⊤` mask: a cell is negative-designated iff its settled reading
is `f` (`tBot`) or `⊤` (`kTop`). -/
theorem dNeg_eq (v : Valuation) (φ : PredicationCell) :
    dNeg v φ = decide (v φ = tBot ∨ v φ = kTop) := rfl

/-- `dNeg` membership unfolds to the `f`-or-`⊤` disjunction. -/
theorem dNeg_iff (v : Valuation) (φ : PredicationCell) :
    dNeg v φ = true ↔ (v φ = tBot ∨ v φ = kTop) := by
  rw [dNeg_eq]; exact decide_eq_true_iff

/-! ## The `f`-only mask `dFonly` (the negative analogue of `dT`)

The truth side splits `dK = dT ⊔ dTop` with `dT` the `t`-only mask. The negative side
splits `dNeg = dFonly ⊔ dTop` with `dFonly` the `f`-only mask — the mirror of `dT`. -/

/-- **The `f`-only mask** `dFonly` — designated = `{f}`. The negative mirror of
`AssocSheaf.dT` (the `t`-only mask): `negate` sends a `t`-cell to an `f`-cell, so
`dFonly` is `dT` read through negation. -/
def dFonly : Mask := fun v φ => decide (v φ = tBot)

/-- `dFonly` membership unfolds to "settled value is `f`". -/
theorem dFonly_iff (v : Valuation) (φ : PredicationCell) :
    dFonly v φ = true ↔ v φ = tBot := by
  simp only [dFonly]; exact decide_eq_true_iff

/-! ### Disjointness and union of the negative split (mirroring `dK = dT ⊔ dTop`) -/

/-- **Disjointness of the negative split.** No reading is both `f` and `⊤` (`tBot ≠
kTop`): `dFonly` and `dTop` are pointwise disjoint — the negative mirror of
`AssocSheaf.dT_dTop_disjoint`. -/
theorem dFonly_dTop_disjoint (v : Valuation) (φ : PredicationCell) :
    ¬(dFonly v φ = true ∧ dTop v φ = true) := by
  simp only [dFonly, dTop]
  cases h : v φ <;> decide

/-- **Union of the negative split.** `dNeg = dFonly ∨ dTop` pointwise: a cell is
negative-Belnap-designated iff it is an `f`-cell or a `⊤`-cell. This is `Δ⁻,Belnap =
Δ⁻ᶠ ⊔ Δ⁺ᵀ`, the exact mirror of `dK_eq_dT_or_dTop`. -/
theorem dNeg_eq_dFonly_or_dTop (v : Valuation) (φ : PredicationCell) :
    dNeg v φ = (dFonly v φ || dTop v φ) := by
  simp only [dNeg, DFrame.dF, dFonly, dTop]
  cases h : v φ <;> decide

/-- `dFonly ⊆ dNeg`: every `f`-designation is negative-Belnap-designated. -/
theorem dFonly_le_dNeg (v : Valuation) (φ : PredicationCell) (h : dFonly v φ = true) :
    dNeg v φ = true := by
  rw [dNeg_eq_dFonly_or_dTop, h]; rfl

/-- `dTop ⊆ dNeg`: every `⊤`-designation is negative-Belnap-designated (the `⊤`-seam
is shared with the positive side). -/
theorem dTop_le_dNeg (v : Valuation) (φ : PredicationCell) (h : dTop v φ = true) :
    dNeg v φ = true := by
  rw [dNeg_eq_dFonly_or_dTop, h]; simp

/-! ## The negative sheaf `F_neg` — `dNeg`-supported cochains and restriction

A section of `F_U^{(k,−)}` over a valuation `v` is an `AssocSheaf.Cochain` that
**vanishes off** `dNeg v`. We reuse `Vanishes` and `restrict` verbatim. -/

/-- A cochain is a **section of the negative-paraconsistent sheaf** `F_U^{(k,−)}` at `v`
when it vanishes off the `dNeg` mask — supported on the newly-falsity-designated cells
`{f, ⊤}`. (`F_neg` is the `dNeg`-supported sub-bundle of `AssocSheaf.Cochain = ℤ^cells`.) -/
def IsSection (v : Valuation) (c : Cochain) : Prop := Vanishes (dNeg v) c

/-- **Restriction of the negative sheaf** at `v` — the falsity-side restriction map,
inherited from `AssocSheaf` as `restrict (dNeg v)`. -/
def restrictNeg (v : Valuation) (c : Cochain) : Cochain := restrict (dNeg v) c

/-- `restrictNeg v` lands in `F_neg`: it vanishes off `dNeg v`. -/
theorem restrictNeg_isSection (v : Valuation) (c : Cochain) :
    IsSection v (restrictNeg v c) :=
  restrict_vanishes (dNeg v) c

/-! ### Presheaf laws — inherited verbatim from `AssocSheaf.restrict` -/

/-- **Presheaf identity** for `F_neg`: restricting by the full mask changes nothing —
inherited from `AssocSheaf.restrict_id`. -/
theorem restrict_neg_id (c : Cochain) : restrict (fun _ => true) c = c := restrict_id c

/-- **Presheaf composition** for `F_neg`: restricting along `U₂ ⊆ U₁ ⊆ U` composes to
the meet mask — inherited from `AssocSheaf.restrict_comp`. -/
theorem restrict_neg_comp (m₁ m₂ : PredicationCell → Bool) (c : Cochain) :
    restrict m₂ (restrict m₁ c) = restrict (fun φ => m₂ φ && m₁ φ) c :=
  restrict_comp m₁ m₂ c

/-- **`F_neg` restriction is functorial along a sub-mask.** Restricting a `dNeg`-section
along a tighter falsity-mask stays a section. -/
theorem restrictNeg_of_section (m' : PredicationCell → Bool) (_v : Valuation) (c : Cochain) :
    Vanishes m' (restrict m' c) :=
  restrict_vanishes m' c

/-! ## The negation mirror — the heart of `negative_sheaf_is_negation_mirror`

Bilattice negation `negate` (`negateVal` pointwise) swaps `t ↔ f` and fixes `⊤`/`⊥`.
Hence the negative mask `dNeg` of `v` is the **positive** Belnap mask `dK` of `negate ∘
v`, and likewise `dFonly v = dT (negateVal v)`, while the `⊤`-side is negation-fixed. -/

/-- **Reading-level mirror facts** (the pure `Reading` exhaustion the mask correspondences
run on): for every reading `a`, the `f`-or-`⊤` test of `a` matches the `t`-or-`⊤` test of
`negate a`, the `f` test of `a` matches the `t` test of `negate a`, and the `⊤` test is
negation-fixed. Proved by finite exhaustion over `Reading`. -/
theorem negate_mask_facts (a : Reading) :
    (decide (a = tBot ∨ a = kTop) = decide (negate a = tTop ∨ negate a = kTop))
      ∧ (decide (a = tBot) = decide (negate a = tTop))
      ∧ (decide (negate a = kTop) = decide (a = kTop)) := by
  cases a <;> exact ⟨by decide, by decide, by decide⟩

/-- **The negative mask is the positive mask under negation.** `dNeg v φ = dK (negateVal
v) φ`: the `f`-or-`⊤` cells of `v` are exactly the `t`-or-`⊤` cells of `negate v`,
because `negate` sends `f → t` and fixes `⊤`. The core mirror correspondence. -/
theorem dNeg_eq_dK_negateVal (v : Valuation) (φ : PredicationCell) :
    dNeg v φ = dK (negateVal v) φ := by
  simp only [dNeg, DFrame.dF, dK, negateVal]
  exact (negate_mask_facts (v φ)).1

/-- **The `f`-only mask is the `t`-only mask under negation.** `dFonly v φ = dT
(negateVal v) φ`: an `f`-cell of `v` is a `t`-cell of `negate v`. -/
theorem dFonly_eq_dT_negateVal (v : Valuation) (φ : PredicationCell) :
    dFonly v φ = dT (negateVal v) φ := by
  simp only [dFonly, dT, negateVal]
  exact (negate_mask_facts (v φ)).2.1

/-- **The `⊤`-component is negation-fixed.** `dTop (negateVal v) φ = dTop v φ`: negation
fixes `⊤`, so the `⊤`-mask is invariant — the negation-fixed cohomological seam shared
by the positive and negative sheaves. -/
theorem dTop_negateVal_eq (v : Valuation) (φ : PredicationCell) :
    dTop (negateVal v) φ = dTop v φ := by
  simp only [dTop, negateVal]
  exact (negate_mask_facts (v φ)).2.2

/-- **The mirror is an involution.** Applying the negation twice returns the positive
mask: `dK v φ = dK (negateVal (negateVal v)) φ`. This is `Reading.negate_negate` lifted
through the mask — the negation involution carries the sheaves back and forth. -/
theorem dK_negateVal_negateVal (v : Valuation) (φ : PredicationCell) :
    dK (negateVal (negateVal v)) φ = dK v φ := by
  simp only [dK, negateVal, negate_negate]

/-- **`negate` sends `t`-cells to `f`-cells and back, fixing `⊤`.** The pointwise reading
facts the mirror runs on, restated on the valuation: a `t`-cell of `v` is an `f`-cell of
`negate v` and vice versa, and `⊤`/`⊥` are fixed. -/
theorem negateVal_swaps_t_f (v : Valuation) (φ : PredicationCell) :
    (v φ = tTop → negateVal v φ = tBot)
      ∧ (v φ = tBot → negateVal v φ = tTop)
      ∧ (v φ = kTop → negateVal v φ = kTop)
      ∧ (v φ = kBot → negateVal v φ = kBot) := by
  simp only [negateVal]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> · intro h; rw [h]; rfl

/-! ## The negative sheaf is the negation mirror of the positive sheaf -/

/-- **The negative-paraconsistent sheaf is the negation mirror of the positive
paraconsistent sheaf.** With `F_U^{(k)} = ℤ^{dK}` the positive (`{t,⊤}`)
sheaf and `F_U^{(k,−)} = ℤ^{dNeg}` the negative (`{f,⊤}`) sheaf, bilattice negation
`negate` (`negateVal` pointwise) carries one to the other:

* (the negative mask = the positive mask under negation) `dNeg v φ = dK (negateVal v) φ`
  — the `f`-or-`⊤` cells of `v` are the `t`-or-`⊤` cells of `negate v`, since `negate`
  sends `f → t` and fixes `⊤`;
* (`f`-only ↔ `t`-only under negation) `dFonly v φ = dT (negateVal v) φ` — an `f`-cell
  of `v` is a `t`-cell of `negate v` (the `dT`/`dFonly` correspondence);
* (the `⊤`-component is negation-fixed) `dTop (negateVal v) φ = dTop v φ` — `negate`
  fixes `⊤`, so the `⊤`-seam is shared and invariant;
* (`negate` swaps the truth poles, fixes the knowledge poles) `t ↦ f`, `f ↦ t`, `⊤ ↦
  ⊤`, `⊥ ↦ ⊥` on the valuation (the four-point geometry);
* (the mirror is an involution) `dK (negateVal (negateVal v)) φ = dK v φ` — negating
  twice returns the positive sheaf (`negate_negate`), so the mirror is a self-inverse
  carrying `F_U^{(k)} ↔ F_U^{(k,−)}`. -/
theorem negative_sheaf_is_negation_mirror :
    -- (negative mask = positive mask under negation)
    (∀ (v : Valuation) (φ : PredicationCell), dNeg v φ = dK (negateVal v) φ)
    -- (f-only ↔ t-only under negation)
    ∧ (∀ (v : Valuation) (φ : PredicationCell), dFonly v φ = dT (negateVal v) φ)
    -- (the ⊤-component is negation-fixed — the shared seam)
    ∧ (∀ (v : Valuation) (φ : PredicationCell), dTop (negateVal v) φ = dTop v φ)
    -- (negate swaps truth poles t/f, fixes knowledge poles ⊤/⊥)
    ∧ (∀ (v : Valuation) (φ : PredicationCell),
        (v φ = tTop → negateVal v φ = tBot)
          ∧ (v φ = tBot → negateVal v φ = tTop)
          ∧ (v φ = kTop → negateVal v φ = kTop)
          ∧ (v φ = kBot → negateVal v φ = kBot))
    -- (the mirror is an involution: negating twice returns the positive sheaf)
    ∧ (∀ (v : Valuation) (φ : PredicationCell),
        dK (negateVal (negateVal v)) φ = dK v φ) :=
  ⟨dNeg_eq_dK_negateVal, dFonly_eq_dT_negateVal, dTop_negateVal_eq,
    negateVal_swaps_t_f, dK_negateVal_negateVal⟩

/-! ## The negative direct-sum split `F_U^{(k,−)} ≅ F_U^{(f)} ⊕ F_U^{(⊤)}`

Mirroring the positive `combine (projT) (projTop)`: a `dNeg`-cochain decomposes uniquely
as its `f`-only-part plus its `⊤`-part, the supports being disjoint and unioning to
`dNeg`. -/

/-- The **`f`-part** of a `dNeg`-cochain: restrict to `dFonly`. (The `F_U^{(f)}`
summand.) -/
def projF (v : Valuation) (c : Cochain) : Cochain := restrict (dFonly v) c
/-- The **`⊤`-part** of a `dNeg`-cochain: restrict to `dTop`. (The `F_U^{(⊤)}` summand,
shared with the positive side.) -/
def projTopNeg (v : Valuation) (c : Cochain) : Cochain := restrict (dTop v) c

/-- **The negative splitting reconstructs.** For a `dNeg`-supported cochain `c`,
combining its `f`-only-part and its `⊤`-part recovers `c` — the negative mirror of
`AssocSheaf.combine_split`. -/
theorem combine_split_neg (v : Valuation) (c : Cochain) (hc : Vanishes (dNeg v) c) :
    combine (projF v c) (projTopNeg v c) = c := by
  funext φ
  simp only [combine, projF, projTopNeg, restrict]
  cases hF : dFonly v φ with
  | true =>
    have hTop : dTop v φ = false := by
      cases hd : dTop v φ
      · rfl
      · exact absurd ⟨hF, hd⟩ (dFonly_dTop_disjoint v φ)
    simp [hTop]
  | false =>
    cases hTop : dTop v φ with
    | true => simp
    | false =>
      have : dNeg v φ = false := by rw [dNeg_eq_dFonly_or_dTop, hF, hTop]; rfl
      simp [hc φ this]

/-- **The negative decomposition is unique.** A `dNeg`-cochain is determined by its
`f`-only-part and `⊤`-part — the negative mirror of `AssocSheaf.split_unique`. -/
theorem split_unique_neg (v : Valuation) (c c' : Cochain)
    (hc : Vanishes (dNeg v) c) (hc' : Vanishes (dNeg v) c')
    (hF : projF v c = projF v c') (hTop : projTopNeg v c = projTopNeg v c') : c = c' := by
  rw [← combine_split_neg v c hc, ← combine_split_neg v c' hc', hF, hTop]

/-! ## The negative-paraconsistent direct-sum / disjointness split -/

/-- **The negative-paraconsistent split `dNeg = dFonly ⊔ dTop`.** The
falsity-component splits as `f`-only plus the shared `⊤`, exactly mirroring the positive
`dK = dT ⊔ dTop`:

* (disjoint split) `dFonly`/`dTop` never co-fire (`tBot ≠ kTop`) — `Δ⁻ᶠ ⊔ Δ⁺ᵀ`, the
  mirror of `dT`/`dTop` disjointness;
* (union split) `dNeg = dFonly ∨ dTop` pointwise (`Δ⁻,Belnap = Δ⁻ᶠ ⊔ Δ⁺ᵀ`);
* (`⊤` is the SHARED seam) every `⊤`-cell is in BOTH `dNeg` and the positive `dK`
  (`dTop ⊆ dNeg` and `dTop ⊆ dK`) — the negation-fixed cohomological seam of
  paraconsistency, common to the positive and negative sheaves;
* (`f`-only lies in `dNeg`) `dFonly ⊆ dNeg` — the strictly-negative classical content;
* (the negative SES splits) `F_U^{(k,−)} ≅ F_U^{(f)} ⊕ F_U^{(⊤)}`: a `dNeg`-cochain
  reconstructs from its `f`-only-part and `⊤`-part (`combine (projF c) (projTopNeg c) =
  c`) and the decomposition is unique. -/
theorem negative_paraconsistent_split :
    -- (disjoint split Δ⁻ᶠ ⊔ Δ⁺ᵀ: f-only and ⊤ never co-fire)
    (∀ (v : Valuation) (φ : PredicationCell), ¬(dFonly v φ = true ∧ dTop v φ = true))
    -- (union split dNeg = dFonly ∨ dTop)
    ∧ (∀ (v : Valuation) (φ : PredicationCell), dNeg v φ = (dFonly v φ || dTop v φ))
    -- (⊤ is the shared seam: every ⊤-cell is in BOTH dNeg and dK)
    ∧ (∀ (v : Valuation) (φ : PredicationCell),
        dTop v φ = true → (dNeg v φ = true ∧ dK v φ = true))
    -- (f-only lies in dNeg)
    ∧ (∀ (v : Valuation) (φ : PredicationCell), dFonly v φ = true → dNeg v φ = true)
    -- (the negative SES splits: reconstruct + unique)
    ∧ (∀ (v : Valuation) (c : Cochain),
        Vanishes (dNeg v) c → combine (projF v c) (projTopNeg v c) = c)
    ∧ (∀ (v : Valuation) (c c' : Cochain),
        Vanishes (dNeg v) c → Vanishes (dNeg v) c' →
        projF v c = projF v c' → projTopNeg v c = projTopNeg v c' → c = c') :=
  ⟨dFonly_dTop_disjoint, dNeg_eq_dFonly_or_dTop,
    fun v φ h => ⟨dTop_le_dNeg v φ h, dTop_le_dK v φ h⟩,
    dFonly_le_dNeg,
    combine_split_neg, split_unique_neg⟩

end NegSheaf
end Obsmetrologia
