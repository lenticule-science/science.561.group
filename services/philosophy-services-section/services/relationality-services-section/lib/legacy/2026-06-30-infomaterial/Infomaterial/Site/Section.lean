import Infomaterial.Site.Basic
import Infomaterial.Site.Sheaf
import Infomaterial.Language.Positing.BigradedCohomology

/-!
# The settling-associated sheaf `F_U` and its designated short exact sequence

This module formalizes the **settling-associated sheaf** on the bitopological
settling site, together with its **paraconsistent (Belnap-designated) parallel** and
the **designated short exact sequence** that connects them. The corpus nodes:

* `…/settling/content/sheaf/sheaf.md` — the fixed-point sheaf `{base, section}`,
  where local settlements glue with no obstruction (`H¹ = 0`);
* `…/sheaf/content/paraconsistent-settling-associated-sheaf/paraconsistent-settling-associated-sheaf.md`
  — `F_U^{(k)}(q,τ,U) = ℤ^{Δ⁺,Belnap_τ(q) ∩ U}`, the free ℤ-module on the
  newly-added **Belnap-designated** cells `{t, ⊤}` lying in the clopen `U`, with the
  inclusion `ι : F_U → F_U^{(k)}`, the cokernel `F_U^{(⊤)} = F_U^{(k)}/F_U` tracking
  the `⊤` ("told both") increments, and the SES `0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0`;
* `…/sheaf/content/settling-cohomology/settling-cohomology.md` — the cohomology of
  these sheaves on the site `(T*, J)`.

## The model

`F_U(q,τ,U) = ℤ^{Δ⁺*_τ(q) ∩ U}` is the **free ℤ-module on the newly-added designated
cells lying in the clopen `U`**. We model the free ℤ-module on a `Bool`-masked finite
cell support as **ℤ-valued cochains** `Cochain := PredicationCell → Int`, carrying a
support **mask** `m : PredicationCell → Bool` (a cochain *over* `m` vanishes off `m`).
Restriction along a clopen inclusion `U' ⊆ U` restricts the mask (zeroes cells outside
`U'`); on cochains it is `restrict m c φ = if m φ then c φ else 0`.

The **three designation masks** come from `BigradedCohomology`'s disjoint split
`Δ⁺ = Δ⁺ᵗ ⊔ Δ⁺ᵀ`:

* `dT v φ` — designated = `{t}` (the truth-side sheaf `F_U = ℤ^{dT}`);
* `dK v φ` — designated = `{t, ⊤}` (the paraconsistent sheaf `F_U^{(k)} = ℤ^{dK}`);
* `dTop v φ` — designated = `{⊤}` (the cokernel `F_U^{(⊤)} = ℤ^{dTop}`).

`dT` and `dTop` are **disjoint** (`tTop ≠ kTop`), and `dK = dT ∨ dTop` pointwise, so the
SES `0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0` **splits**: a `dK`-cochain decomposes uniquely
as (its `dT`-part, its `dTop`-part), giving `F_U^{(k)} ≅ F_U ⊕ F_U^{(⊤)}`.

The sheaf gluing reuses `Sheaf`'s `H¹ = 0` / `joinList_congr` in the strict regime — we
do not re-derive vanishing cohomology; we tie the masked-cochain sheaf to the existing
`Sheaf` object (`Sheaf.Cover`, `Sheaf.separated`) and to the site's covering relation.
-/

namespace Infomaterial
namespace AssocSheaf

open Infomaterial.Charge

/-! ## Cochains — the free ℤ-module on the cell base

A section of the settling-associated sheaf is a ℤ-valued cochain on the predication
base: an integer coefficient at each cell. The free ℤ-module on a masked cell support
sits inside this as the cochains vanishing off the mask. -/

/-- A **ℤ-cochain** on the predication base: an integer coefficient at each cell. The
free ℤ-module on the full cell base; masked subsets are cut out by `Vanishes`. -/
def Cochain : Type := PredicationCell → Int

/-- The zero cochain. -/
def zeroCochain : Cochain := fun _ => 0

/-! ## The designation masks (from the disjoint split `Δ⁺ = Δ⁺ᵗ ⊔ Δ⁺ᵀ`)

A **mask** picks, per valuation, the cells whose settled charge is designated. The three
masks are the truth side `{t}`, the paraconsistent side `{t, ⊤}`, and the `⊤`-only
cokernel side. -/

/-- A **designation mask**: per valuation, the `Bool` support of designated cells. -/
def Mask : Type := Valuation → PredicationCell → Bool

/-- **Truth-side mask** `dT` — designated = `{t}`. `F_U = ℤ^{dT}` is the
settling-associated sheaf. (Agrees with `Charge.isTruthFiring` and `Sheaf.designated`.) -/
def dT : Mask := fun v φ => decide (v φ = tTop)

/-- **Paraconsistent (knowledge-side) mask** `dK` — designated = `{t, ⊤}`. `F_U^{(k)} =
ℤ^{dK}` is the Belnap-designated sheaf. -/
def dK : Mask := fun v φ => decide (v φ = tTop ∨ v φ = kTop)

/-- **`⊤`-only mask** `dTop` — designated = `{⊤}`. `F_U^{(⊤)} = ℤ^{dTop}` is the
cokernel, the "told both" inconsistency increments. (Agrees with
`Charge.isInconsistency`.) -/
def dTop : Mask := fun v φ => decide (v φ = kTop)

/-! ### Disjointness and union of the masks (the `Δ⁺ = Δ⁺ᵗ ⊔ Δ⁺ᵀ` split) -/

/-- **Disjointness of the split.** No charge is both a `t`-designation and a `⊤`-
designation (`tTop ≠ kTop`): `dT` and `dTop` are pointwise disjoint. -/
theorem dT_dTop_disjoint (v : Valuation) (φ : PredicationCell) :
    ¬(dT v φ = true ∧ dTop v φ = true) := by
  simp only [dT, dTop]
  cases h : v φ <;> decide

/-- **Union of the split.** `dK = dT ∨ dTop` pointwise: a cell is Belnap-designated iff
it is a `t`-cell or a `⊤`-cell. This is `Δ⁺,Belnap = Δ⁺ᵗ ⊔ Δ⁺ᵀ`. -/
theorem dK_eq_dT_or_dTop (v : Valuation) (φ : PredicationCell) :
    dK v φ = (dT v φ || dTop v φ) := by
  simp only [dK, dT, dTop]
  cases h : v φ <;> decide

/-- `dT ⊆ dK`: every truth-designation is Belnap-designated (the inclusion
`{t} ↪ {t, ⊤}`). -/
theorem dT_le_dK (v : Valuation) (φ : PredicationCell) (h : dT v φ = true) :
    dK v φ = true := by
  rw [dK_eq_dT_or_dTop, h]; rfl

/-- `dTop ⊆ dK`: every `⊤`-designation is Belnap-designated. -/
theorem dTop_le_dK (v : Valuation) (φ : PredicationCell) (h : dTop v φ = true) :
    dK v φ = true := by
  rw [dK_eq_dT_or_dTop, h]; simp

/-- A `dK`-cell is `dT` or `dTop` (the elimination form of the union). -/
theorem dK_cases (v : Valuation) (φ : PredicationCell) (h : dK v φ = true) :
    dT v φ = true ∨ dTop v φ = true := by
  rw [dK_eq_dT_or_dTop] at h; exact Bool.or_eq_true _ _ ▸ h

/-! ## The sheaf `F_U` over a mask — masked cochains and restriction

A section of `F_U` over a mask `m` is a cochain that **vanishes off `m`**. Restriction
along a clopen inclusion `U' ⊆ U` (a tighter mask `m'`) zeroes the cells outside `m'`. -/

/-- A cochain is **`m`-supported** (a section of `ℤ^m`) when it vanishes off the mask. -/
def Vanishes (m : PredicationCell → Bool) (c : Cochain) : Prop :=
  ∀ φ, m φ = false → c φ = 0

/-- **Restriction along a tighter mask** `m`: zero out every cell outside `m`. This is
the sheaf restriction map along a clopen inclusion `U' ⊆ U` (the mask shrinks). -/
def restrict (m : PredicationCell → Bool) (c : Cochain) : Cochain :=
  fun φ => if m φ then c φ else 0

/-- Restriction lands in the masked submodule: `restrict m c` vanishes off `m`. -/
theorem restrict_vanishes (m : PredicationCell → Bool) (c : Cochain) :
    Vanishes m (restrict m c) := by
  intro φ hφ; simp [restrict, hφ]

/-! ### Presheaf laws — restriction is functorial -/

/-- **Restriction by the full mask is the identity** (`id` restriction). The mask
`fun _ => true` corresponds to the maximal clopen `U`; restricting to it changes
nothing. -/
theorem restrict_id (c : Cochain) : restrict (fun _ => true) c = c := by
  funext φ; simp [restrict]

/-- **Restriction composes.** Restricting to `m₁` then to `m₂` equals restricting once
to the pointwise meet `m₁ ∧ m₂` — the functoriality of restriction along composed
clopen inclusions `U₂ ⊆ U₁ ⊆ U`. -/
theorem restrict_comp (m₁ m₂ : PredicationCell → Bool) (c : Cochain) :
    restrict m₂ (restrict m₁ c) = restrict (fun φ => m₂ φ && m₁ φ) c := by
  funext φ
  simp only [restrict, Bool.and_eq_true]
  cases m₂ φ <;> cases m₁ φ <;> rfl

/-- **Restriction along a sub-mask of an already-`m`-supported cochain.** If `c` is
`m`-supported and `m' ≤ m` pointwise on its `true`-cells, restricting along `m'`
preserves agreement off `m'`. (The presheaf restriction `ρ : F_U → F_U(U')`.) -/
theorem restrict_of_vanishes (m m' : PredicationCell → Bool) (c : Cochain)
    (_hsub : ∀ φ, m' φ = true → m φ = true) (_hc : Vanishes m c) :
    Vanishes m' (restrict m' c) :=
  restrict_vanishes m' c

/-! ## Sheaf gluing — tie to `Sheaf`'s `H¹ = 0` (REUSE, do not re-derive)

The settling-associated sheaf's gluing/separation is inherited from the underlying
settling `Sheaf` (the `{base, section}` sheaf with `H¹ = 0` in the strict regime). We
reuse `Sheaf.separated`: a masked cochain that is determined on a cover is determined
globally; and `Charge.joinList_congr` (the `H¹ = 0` CRDT form) for the section merge. -/

/-- **Cochain separation (sheaf condition, injectivity half) — reuses the cover from
`Sheaf`.** Two `m`-supported cochains that agree on every patch of a cover (wherever the
patch holds) are equal. This is the masked-cochain instance of `Sheaf.separated`: gluing
is unobstructed (`H¹ = 0`), so a section is fixed by its restrictions. -/
theorem cochain_separated (c : Sheaf.Cover) (a b : Cochain)
    (h : ∀ p, p ∈ c.patches → ∀ φ, p φ = true → a φ = b φ) : a = b := by
  funext φ
  obtain ⟨p, hp, hpφ⟩ := c.covers φ
  exact h p hp φ hpφ

/-- **Gluing reuses `Sheaf`'s `H¹ = 0`.** The settling-associated sheaf's section merge
is order/multiplicity-independent — exactly `Charge.joinList_congr` (`H¹ = 0`, the
CRDT/CALM form) — so we re-export it rather than re-deriving vanishing cohomology. -/
theorem gluing_h1_zero (l l' : List Charge) (h : ∀ a, a ∈ l ↔ a ∈ l') :
    Charge.joinList l = Charge.joinList l' :=
  Charge.joinList_congr l l' h

/-! ## The settling-associated sheaf `F_U`

Bundles `F_U` as a presheaf on the site that lands in ℤ-cochains over the designated
cells in the clopen `U`, and glues by reusing `Sheaf`'s `H¹ = 0`. -/

/-- **The settling-associated sheaf `F_U`.** `F_U(q,τ,U) = ℤ^{dT_τ(q) ∩ U}`,
the free ℤ-module on the newly-designated truth cells in `U`, modeled as ℤ-cochains over
the mask `dT`. It is a **presheaf** on the bitopological settling site:

* (restriction lands in the masked submodule) `restrict m c` vanishes off `m`;
* (presheaf identity) restriction by the full mask `U` is the identity;
* (presheaf composition) restriction along `U₂ ⊆ U₁ ⊆ U` composes to the meet mask;
* (designated support) the support is exactly the truth-designated cells `dT v`, which
  is `Charge.isTruthFiring ∘ v` and agrees with `Sheaf.designated`;
* (sheaf / gluing) it **glues** — sections are determined on a cover (`cochain_separated`)
  and the merge is unobstructed, reusing `Sheaf`'s `H¹ = 0` (`Charge.joinList_congr`). -/
theorem settling_associated_sheaf :
    -- (restriction lands in the masked free module)
    (∀ (m : PredicationCell → Bool) (c : Cochain), Vanishes m (restrict m c))
    -- (presheaf identity)
    ∧ (∀ c : Cochain, restrict (fun _ => true) c = c)
    -- (presheaf composition)
    ∧ (∀ (m₁ m₂ : PredicationCell → Bool) (c : Cochain),
        restrict m₂ (restrict m₁ c) = restrict (fun φ => m₂ φ && m₁ φ) c)
    -- (the support is the truth-designated cells, = isTruthFiring, = Sheaf.designated)
    ∧ (∀ (v : Valuation) (φ : PredicationCell),
        dT v φ = Charge.isTruthFiring (v φ)
          ∧ (dT v φ = true ↔ Sheaf.designated ⟨v⟩ φ))
    -- (sheaf separation — gluing is determined on a cover, reusing H¹ = 0)
    ∧ (∀ (c : Sheaf.Cover) (a b : Cochain),
        (∀ p, p ∈ c.patches → ∀ φ, p φ = true → a φ = b φ) → a = b)
    -- (H¹ = 0 reused from Sheaf — the unobstructed section merge)
    ∧ (∀ (l l' : List Charge), (∀ a, a ∈ l ↔ a ∈ l') →
        Charge.joinList l = Charge.joinList l') :=
  ⟨restrict_vanishes, restrict_id, restrict_comp,
    fun v φ => ⟨rfl, by
      show decide (v φ = tTop) = true ↔ ((⟨v⟩ : Sheaf).section_ φ = Charge.tTop)
      rw [decide_eq_true_iff]⟩,
    cochain_separated, gluing_h1_zero⟩

/-! ## The three sheaves and the maps `ι`, `π` of the short exact sequence

`F_U = ℤ^{dT}` (truth), `F_U^{(k)} = ℤ^{dK}` (paraconsistent), `F_U^{(⊤)} = ℤ^{dTop}`
(cokernel). We model ℤ-linear maps as functions on `Cochain`.

* `ι` includes a `dT`-cochain into `dK` by **extending by 0 on the `⊤`-cells** —
  well-defined since `dT ⊆ dK`; on `Cochain` it is the identity restricted to `dT`.
* `π` projects a `dK`-cochain onto the `dTop`-cells by **restriction** (`restrict (dTop v)`).

`ι` is the masked restriction to `dT`; `π` is the masked restriction to `dTop`. -/

/-- **The inclusion `ι : F_U → F_U^{(k)}`** at valuation `v`. A `dT`-cochain includes
into `dK`-cochains by extending by 0 off the `dT`-cells. Modeled as restriction to the
`dT` mask (the included image is the `dT`-supported part). -/
def iota (v : Valuation) (c : Cochain) : Cochain := restrict (dT v) c

/-- **The projection `π : F_U^{(k)} → F_U^{(⊤)}`** at valuation `v`. A `dK`-cochain
projects to its `dTop`-cells by restriction — the cokernel `F_U^{(⊤)} = F_U^{(k)}/F_U`
tracking the `⊤` increments. -/
def pi (v : Valuation) (c : Cochain) : Cochain := restrict (dTop v) c

/-! ### `ι` is injective on the truth submodule -/

/-- **`ι` is injective** on `dT`-supported cochains: if `a`, `b` vanish off `dT` and
`ι a = ι b`, then `a = b`. (Injectivity of the SES's left map.) -/
theorem iota_injective (v : Valuation) (a b : Cochain)
    (ha : Vanishes (dT v) a) (hb : Vanishes (dT v) b) (h : iota v a = iota v b) :
    a = b := by
  funext φ
  cases hφ : dT v φ with
  | true =>
    have := congrFun h φ
    simp only [iota, restrict, hφ] at this
    exact this
  | false => rw [ha φ hφ, hb φ hφ]

/-! ### `π` is surjective onto the cokernel -/

/-- **`π` is surjective** onto `dTop`-supported cochains: every `dTop`-supported target
`d` is hit — `π (restrict (dTop v) d) = d`. (Surjectivity of the SES's right map; the
preimage is `d` itself viewed as a `dK`-cochain, since `dTop ⊆ dK`.) -/
theorem pi_surjective (v : Valuation) (d : Cochain) (hd : Vanishes (dTop v) d) :
    pi v d = d := by
  funext φ
  cases hφ : dTop v φ with
  | true => simp [pi, restrict, hφ]
  | false => simp [pi, restrict, hφ, hd φ hφ]

/-! ### Exactness: `im ι = ker π`

A `dK`-cochain `c` is in `im ι` iff it vanishes on the `⊤`-cells iff it is in `ker π`
(`π c = 0`). We characterize all three by the pointwise vanishing-on-`⊤` condition. -/

/-- A `dK`-cochain **vanishes on the `⊤`-cells** (`dTop`) — the membership condition for
both `im ι` and `ker π`. -/
def VanishesOnTop (v : Valuation) (c : Cochain) : Prop :=
  ∀ φ, dTop v φ = true → c φ = 0

/-- **`ker π` ⟹ vanishes-on-`⊤`.** `π c = 0` means `c` is zero on every `⊤`-cell. -/
theorem ker_pi_vanishesOnTop (v : Valuation) (c : Cochain)
    (h : pi v c = zeroCochain) : VanishesOnTop v c := by
  intro φ hφ
  have := congrFun h φ
  simp only [pi, restrict, hφ] at this
  exact this

/-- **Vanishes-on-`⊤` ⟹ `ker π`.** If `c` is zero on the `⊤`-cells, then `π c = 0`. -/
theorem vanishesOnTop_ker_pi (v : Valuation) (c : Cochain)
    (h : VanishesOnTop v c) : pi v c = zeroCochain := by
  funext φ
  cases hφ : dTop v φ with
  | true => simp only [pi, restrict, hφ, if_true]; exact h φ hφ
  | false => simp [pi, restrict, hφ, zeroCochain]

/-- **`im ι` ⟹ vanishes-on-`⊤`.** Anything of the form `ι a` is zero on the `⊤`-cells,
because `ι` zeroes everything off `dT`, and `dT`/`dTop` are disjoint. -/
theorem im_iota_vanishesOnTop (v : Valuation) (a : Cochain) :
    VanishesOnTop v (iota v a) := by
  intro φ hφ
  have hdisj := dT_dTop_disjoint v φ
  have hdT : dT v φ = false := by
    cases hd : dT v φ
    · rfl
    · exact absurd ⟨hd, hφ⟩ hdisj
  simp [iota, restrict, hdT]

/-- **Vanishes-on-`⊤` ⟹ `im ι`** (on `dK`-supported cochains). A `dK`-cochain `c` that
vanishes on the `⊤`-cells equals `ι c` (it is in the image of the inclusion): off `dT`
it is forced to 0 (it is `dK`-supported and not `dTop`, hence not `dT`/`dTop`, so off
`dK`), and on `dT` it agrees. -/
theorem vanishesOnTop_im_iota (v : Valuation) (c : Cochain)
    (hc : Vanishes (dK v) c) (h : VanishesOnTop v c) : iota v c = c := by
  funext φ
  cases hφ : dT v φ with
  | true => simp [iota, restrict, hφ]
  | false =>
    simp only [iota, restrict, hφ]
    cases hψ : dTop v φ with
    | true => exact (h φ hψ).symm
    | false =>
      have : dK v φ = false := by rw [dK_eq_dT_or_dTop, hφ, hψ]; rfl
      exact (hc φ this).symm

/-! ## The splitting `F_U^{(k)} ≅ F_U ⊕ F_U^{(⊤)}`

Because `dT` and `dTop` are disjoint and `dK = dT ⊔ dTop`, a `dK`-cochain decomposes
**uniquely** as the pair of its `dT`-part and its `dTop`-part, and recombines by adding
them (the supports are disjoint, so the sum reconstructs the original). This is the
direct-sum splitting of the short exact sequence. -/

/-- The **truth-part** of a `dK`-cochain: restrict to `dT`. (The `F_U` summand.) -/
def projT (v : Valuation) (c : Cochain) : Cochain := restrict (dT v) c
/-- The **`⊤`-part** of a `dK`-cochain: restrict to `dTop`. (The `F_U^{(⊤)}` summand.) -/
def projTop (v : Valuation) (c : Cochain) : Cochain := restrict (dTop v) c
/-- **Recombine** a truth-part and a `⊤`-part by addition — the inverse of the
decomposition (the disjoint supports add without overlap). -/
def combine (a b : Cochain) : Cochain := fun φ => a φ + b φ

/-- **The splitting reconstructs.** For a `dK`-supported cochain `c`, combining its
`dT`-part and its `dTop`-part recovers `c`: `combine (projT v c) (projTop v c) = c`. The
disjointness `dT ∩ dTop = ∅` and `dK = dT ⊔ dTop` make the sum exact with no overlap. -/
theorem combine_split (v : Valuation) (c : Cochain) (hc : Vanishes (dK v) c) :
    combine (projT v c) (projTop v c) = c := by
  funext φ
  simp only [combine, projT, projTop, restrict]
  cases hT : dT v φ with
  | true =>
    -- dT true ⟹ dTop false (disjoint)
    have hTop : dTop v φ = false := by
      cases hd : dTop v φ
      · rfl
      · exact absurd ⟨hT, hd⟩ (dT_dTop_disjoint v φ)
    simp [hTop]
  | false =>
    cases hTop : dTop v φ with
    | true => simp
    | false =>
      have : dK v φ = false := by rw [dK_eq_dT_or_dTop, hT, hTop]; rfl
      simp [hc φ this]

/-- **The decomposition is unique.** A `dK`-cochain is determined by its two parts: if
two `dK`-cochains have the same `dT`-part and the same `dTop`-part, they are equal.
(Injectivity of `c ↦ (projT v c, projTop v c)` on `dK`-supported cochains.) -/
theorem split_unique (v : Valuation) (c c' : Cochain)
    (hc : Vanishes (dK v) c) (hc' : Vanishes (dK v) c')
    (hT : projT v c = projT v c') (hTop : projTop v c = projTop v c') : c = c' := by
  rw [← combine_split v c hc, ← combine_split v c' hc', hT, hTop]

/-- **The two summands are disjoint** (independent): the `dT`-part and `dTop`-part never
overlap — at every cell at most one is nonzero, since `dT`/`dTop` are disjoint. Stated as:
their pointwise product of supports is empty. -/
theorem projT_projTop_disjoint_support (v : Valuation) (φ : PredicationCell) :
    ¬(dT v φ = true ∧ dTop v φ = true) :=
  dT_dTop_disjoint v φ

/-! ## The designated short exact sequence and its splitting

`0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0`: `ι` injective, `π` surjective, `im ι = ker π`
(the vanishing-on-`⊤` characterization), and the disjoint split `dT ⊔ dTop` gives the
direct-sum splitting `F_U^{(k)} ≅ F_U ⊕ F_U^{(⊤)}`. -/

/-- **The designated short exact sequence `0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0`
.** With `F_U = ℤ^{dT}`, `F_U^{(k)} = ℤ^{dK}`, `F_U^{(⊤)} = ℤ^{dTop}`,
`ι = restrict dT`, `π = restrict dTop`:

* (the split is disjoint) `dT`/`dTop` never co-fire (`tTop ≠ kTop`);
* (the split is a union) `dK = dT ∨ dTop` pointwise (`Δ⁺,Belnap = Δ⁺ᵗ ⊔ Δ⁺ᵀ`);
* (`ι` injective) `ι a = ι b → a = b` on `dT`-supported cochains;
* (`π` surjective) every `dTop`-supported `d` is hit (`π d = d`);
* (`im ι = ker π`, ⊇) a `dK`-cochain vanishing on `⊤` is in `im ι` (`ι c = c`), and
  (⊆) `π c = 0` iff `c` vanishes on the `⊤`-cells — the kernel of `π` is exactly the
  image of `ι`;
* (the SES SPLITS) `F_U^{(k)} ≅ F_U ⊕ F_U^{(⊤)}`: `combine (projT c) (projTop c) = c`
  reconstructs (existence) and the decomposition is unique. -/
theorem designated_short_exact_sequence :
    -- disjoint split dT ⊔ dTop, and dK = dT ∨ dTop
    (∀ (v : Valuation) (φ : PredicationCell), ¬(dT v φ = true ∧ dTop v φ = true))
    ∧ (∀ (v : Valuation) (φ : PredicationCell), dK v φ = (dT v φ || dTop v φ))
    -- ι injective
    ∧ (∀ (v : Valuation) (a b : Cochain),
        Vanishes (dT v) a → Vanishes (dT v) b → iota v a = iota v b → a = b)
    -- π surjective
    ∧ (∀ (v : Valuation) (d : Cochain), Vanishes (dTop v) d → pi v d = d)
    -- im ι = ker π : the vanishing-on-⊤ characterization, both directions
    ∧ (∀ (v : Valuation) (a : Cochain), VanishesOnTop v (iota v a))
    ∧ (∀ (v : Valuation) (c : Cochain),
        Vanishes (dK v) c → VanishesOnTop v c → iota v c = c)
    ∧ (∀ (v : Valuation) (c : Cochain), pi v c = zeroCochain ↔ VanishesOnTop v c)
    -- the SES splits: F_U^{(k)} ≅ F_U ⊕ F_U^{(⊤)} (reconstruct + unique)
    ∧ (∀ (v : Valuation) (c : Cochain),
        Vanishes (dK v) c → combine (projT v c) (projTop v c) = c)
    ∧ (∀ (v : Valuation) (c c' : Cochain),
        Vanishes (dK v) c → Vanishes (dK v) c' →
        projT v c = projT v c' → projTop v c = projTop v c' → c = c') :=
  ⟨dT_dTop_disjoint, dK_eq_dT_or_dTop,
    iota_injective, pi_surjective,
    im_iota_vanishesOnTop, vanishesOnTop_im_iota,
    fun v c => ⟨ker_pi_vanishesOnTop v c, vanishesOnTop_ker_pi v c⟩,
    combine_split, split_unique⟩

end AssocSheaf
end Infomaterial
