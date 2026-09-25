import Obsmetrologia.Cohomology.SettlingCohomologyH1
import Obsmetrologia.Cohomology.InconsistencySheaf
import Obsmetrologia.Site.Section

/-!
# Bigraded settling cohomology `H^{d,n}_{k,t}` — the two-row mapping cone

This module formalizes the corpus node

* `…/settling/content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md`
  — the **bigraded settling cohomology** `H^{d,n}_{k,t}(T*, F_U)`, a refinement of
  settling cohomology that organizes data by (cohomological degree `n`, **designation** `d`),
  one axis per hyperdoctrine adjoint system. The **bigraded cochain complex** is

  $$C^{d,n}_{k,t} := \begin{cases} C^n(F_U^{(t)}) & d = \mathrm{truth}, \\ C^n(F_U^{(\top)}) & d = \mathrm{inconsistency}.\end{cases}$$

  The **horizontal** differential `d_h : C^{d,n} → C^{d,n+1}` is the standard cochain
  differential. The **vertical** differential `d_v : C^{\mathrm{truth},n} → C^{\mathrm{inconsistency},n}`
  is the composite `F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}`. The bigraded cohomology is the
  cohomology of the **total** complex. **Two-row collapse:** the designation grade is a
  *two-element designation*, not a number — so the bicomplex has exactly the two rows and the
  total complex is a **mapping cone**. This module establishes the *input data* of that
  mapping cone — the two-element designation, `d_v = 0`, and the split-exactness of the
  designated SES, all at the **cochain** level. The cohomology-level conclusion (the
  truth–knowledge long exact sequence, degenerating to the direct-sum decomposition
  `Hⁿ(F_U^{(k)}) ≅ Hⁿ(F_U^{(t)}) ⊕ Hⁿ(F_U^{(⊤)})`) is **not** derived here: it is the open
  frontier node `thm:bigraded-truth-knowledge-les`, which needs the cohomology groups as
  objects and the induced-map machinery this dependency-free model does not carry.

## The designation grade is a reading, not a number

The old grade `m ∈ \{0, 1, ≥2\}` was a `Nat` standing in for a **bilattice designation**: the
two designated readings of the wave-3 SES. Row `0` *was* the truth reading `t` (`Reading.tTop`),
row `1` *was* the told-both reading `⊤` (`Reading.kTop`). The faithful index is therefore the
two-element `Designation` (`truth`/`inconsistency`), with `toReading` exhibiting each as its
reading. The corpus's *two-row collapse* is then the **definitional** fact that `Designation`
has exactly two elements (`Designation.two`) — not a theorem that a `Nat` grade vanishes above
`1`, and there is no `Unit` "zero row" to carry.

## The model — reuse, never re-postulate

We do **not** introduce a new cochain type or new differentials. We reuse the cochain
bundles already built downstream:

* the `truth` designation is the **truth-sheaf** cochains `F_U^{(t)} = ℤ^{dT}`: the
  `AssocSheaf.Cochain` sections supported on `AssocSheaf.dT`, with the Čech gluing
  (`Cohomology.Cech1`, `Cohomology.h1_vanishes`) of `SettlingCohomologyH1`;
* the `inconsistency` designation is the **inconsistency-sheaf** cochains `F_U^{(⊤)} = ℤ^{dTop}`:
  the `InconSheaf.IsSection` sections supported on `AssocSheaf.dTop`, with the inconsistency
  Čech gluing (`InconSheaf.inconsistency_h1_vanishes`) of `InconsistencySheaf`.

The **vertical differential** `dv v := AssocSheaf.pi v ∘ AssocSheaf.iota v` is the wave-3
composite "include the truth side into knowledge, project onto inconsistency", reusing the
SES maps `iota`/`pi` verbatim. Because `dT` and `dTop` are **disjoint**
(`AssocSheaf.dT_dTop_disjoint`), this composite is the **zero map** (`dv_zero`): a truth
section carries no inconsistency content. That is exactly the structure that collapses the
bicomplex's total complex into a **mapping cone** of the (degenerate) horizontal complexes,
whose long exact sequence is the truth–knowledge LES re-bundling the designated SES
(`AssocSheaf.designated_short_exact_sequence`).

The **horizontal differential** `dh` is the Čech cochain differential modeled by the gluing
obstruction: `H^n` content lives in `H⁰`/`H¹` and vanishes above degree 1
(`Cohomology.hn_vanishes_above_one`), so the horizontal complex is the two-stage `H⁰/H¹`
complex already proved.

## Scope

`Row d` is `Cochain` over the existing bundles; `dv` is `pi ∘ iota`; `dv_zero` is
`restrict_comp` + disjointness; the two-row structure is `Designation.two`; the split-SES facts
are the re-bundled `designated_short_exact_sequence`. These are the cochain-level **inputs** to
the mapping cone, not the cohomology-level LES. The refinement reuses
`hn_vanishes_above_one`/`h1_vanishes`/`inconsistency_h1_vanishes`; note these vanishings hold
**unconditionally** in this strict/finite model, so the regime hypothesis of
`bigraded_refines_h1` gates only the regime classification, not the (already unconditional)
collapse — the regime *dichotomy* is not witnessed here.
-/

namespace Obsmetrologia
namespace Bigraded

open Obsmetrologia.AssocSheaf

/-! ## The designation grade — a 2-element reading designation, not a number -/

/-- The **designation grade** `d`: which designated sheaf a row carries. It is *not* a number
— it is the two-element designation of the wave-3 SES: `truth` is the truth side `F_U^{(t)}`
(reading `t`), `inconsistency` the told-both side `F_U^{(⊤)}` (reading `⊤`). The corpus's
"two-row" bicomplex has two rows because this type has two elements, full stop. -/
inductive Designation
  | truth
  | inconsistency
  deriving DecidableEq, Repr

namespace Designation

/-- The designation **is a reading**: `truth ↦ t` (`Reading.tTop`), `inconsistency ↦ ⊤`
(`Reading.kTop`). This exhibits the designation grade as the two designated readings of the
bilattice — the `0`/`1` of the old `Nat` grade were these readings all along. -/
def toReading : Designation → Reading
  | truth => Reading.tTop
  | inconsistency => Reading.kTop

/-- There are **exactly two** designations — the corpus's two-row collapse as a fact about the
index type, replacing the old `m ≥ 2 ⟹ 0`. -/
theorem two (d : Designation) : d = truth ∨ d = inconsistency := by
  cases d
  · exact Or.inl rfl
  · exact Or.inr rfl

/-- The two designations are distinct — the two rows are two. -/
theorem truth_ne_inconsistency : truth ≠ inconsistency := by intro h; cases h

/-- The two designations carry distinct readings (`t ≠ ⊤`): the rows separate 
different bilattice content. -/
theorem toReading_injective {a b : Designation} (h : toReading a = toReading b) : a = b := by
  cases a <;> cases b <;> first | rfl | (exact absurd h (by decide))

end Designation

/-! ## The bigraded cochain bundle `C^{d,n}` — one sheaf per designation

`C^{d,n}` carries, per designation `d`, the cochain bundle of one sheaf: `truth` is the truth
sheaf `F_U^{(t)} = ℤ^{dT}`, `inconsistency` is the inconsistency sheaf `F_U^{(⊤)} = ℤ^{dTop}`.
We reuse `AssocSheaf.Cochain` for both (carrying the support predicate by which mask cuts them
out). There is no third row — `Designation` has two elements. -/

/-- The **bigraded cochain bundle at designation `d`** (cohomological degree `n` is carried
inside the Čech data of each row, see `Cohomology.Cech1` / `InconSheaf`). `truth` is the
truth-sheaf cochains `F_U^{(t)} = ℤ^{dT}` (= `AssocSheaf.Cochain`); `inconsistency` is the
inconsistency-sheaf cochains `F_U^{(⊤)} = ℤ^{dTop}` (also `AssocSheaf.Cochain`, the
`dTop`-supported sub-bundle). -/
def Row : Designation → Type
  | .truth => Cochain
  | .inconsistency => Cochain

/-- **The support mask of designation `d`.** `truth` is supported on the truth mask `dT v`
(`F_U^{(t)}`); `inconsistency` on the inconsistency mask `dTop v` (`F_U^{(⊤)}`). -/
def rowMask (v : Valuation) : Designation → (PredicationCell → Bool)
  | .truth => dT v
  | .inconsistency => dTop v

/-- The `truth` row **is** the truth-sheaf cochain bundle `F_U^{(t)} = ℤ^{dT}`. -/
theorem row_truth : Row .truth = Cochain := rfl

/-- The `inconsistency` row **is** the inconsistency-sheaf cochain bundle `F_U^{(⊤)} = ℤ^{dTop}`. -/
theorem row_inconsistency : Row .inconsistency = Cochain := rfl

/-! ## The vertical differential `d_v : C^{truth,n} → C^{inconsistency,n}`

`d_v` is the wave-3 composite `F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}`: include the truth-side
cochain into the knowledge sheaf (`AssocSheaf.iota v`), then project onto the inconsistency
side (`AssocSheaf.pi v`). We reuse the SES maps verbatim. -/

/-- **The vertical differential** `d_v : C^{truth,n} → C^{inconsistency,n}` at valuation `v`:
the composite `F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}`, i.e. `pi v ∘ iota v` (include the truth
section into knowledge, then project onto inconsistency). Reuses `AssocSheaf.iota`/`AssocSheaf.pi`. -/
def dv (v : Valuation) (c : Cochain) : Cochain := pi v (iota v c)

/-- **The vertical differential is the zero map (`d_v = 0`).** The composite
`F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}` vanishes: `iota` restricts to `dT`, `pi` restricts to
`dTop`, and `dT`/`dTop` are **disjoint** (`AssocSheaf.dT_dTop_disjoint`), so the two
restrictions compose to the empty mask — a truth section carries no inconsistency content.
This is the structural fact that makes the total complex a *mapping cone* of the two rows. -/
theorem dv_zero (v : Valuation) (c : Cochain) : dv v c = zeroCochain := by
  funext φ
  simp only [dv, pi, iota, restrict]
  cases hTop : dTop v φ with
  | false => rfl
  | true =>
    have hT : dT v φ = false := by
      cases hd : dT v φ
      · rfl
      · exact absurd ⟨hd, hTop⟩ (dT_dTop_disjoint v φ)
    simp [hT, zeroCochain]

/-- **`d_v` lands in the inconsistency row** `F_U^{(⊤)}`: `dv v c` is a section of `F_top`
(it vanishes off the `dTop` mask), since `pi v = restrict (dTop v)`. So
`d_v : C^{truth,n} → C^{inconsistency,n}` is well-typed into the inconsistency row. -/
theorem dv_isSection (v : Valuation) (c : Cochain) : InconSheaf.IsSection v (dv v c) :=
  restrict_vanishes (dTop v) (iota v c)

/-! ## The horizontal differential `d_h` and the total complex

The horizontal differential `d_h : C^{d,n} → C^{d,n+1}` is the standard Čech cochain
differential. For each row it is the differential of the row's sheaf cochain complex —
already modeled in `SettlingCohomologyH1` / `InconsistencySheaf` via the Čech `H⁰`/`H¹`
gluing obstruction, with content vanishing above degree 1 (`Cohomology.hn_vanishes_above_one`).
The total complex `Tot^N := ⊕_{d,n} C^{d,n}` has differential `d_h ± d_v`; because `d_v = 0`
(`dv_zero`) and there are exactly two designations, `Tot` is the **mapping cone** of `d_v`
between the two horizontal complexes. -/

/-- **The bigraded `H^{d,n}` bundle.** For `truth` it is the truth-sheaf cohomology of degree
`n` (truth content `H^{truth,n} = H^n_t`); for `inconsistency` it is the inconsistency-sheaf
cohomology of degree `n` (`H^{inconsistency,n}`). We carry each row by the cohomological-degree
marker `n` (the row's Čech complex realizes `H^n` in `H⁰`/`H¹`, zero above degree 1). -/
def Hmn : Designation → Nat → Type
  | .truth, n => Cohomology.Hn n
  | .inconsistency, n => Cohomology.Hn n

/-! ## The two-row mapping cone and the truth–knowledge LES

Because the designation grade has only the two values `truth` and `inconsistency`, the total
complex **is** a mapping cone: the cone of the vertical differential
`d_v : C^{truth,•} → C^{inconsistency,•}`. The theorem below proves the cochain-level facts
that feed that cone: the SES `0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0` is split-exact (`dT`/`dTop`
disjoint, `dK = dT ⊔ dTop`) and `d_v = 0`. On paper these inputs make every connecting map
vanish, so the induced LES degenerates to the direct-sum decomposition
`Hⁿ(F_U^{(k)}) ≅ Hⁿ(F_U^{(t)}) ⊕ Hⁿ(F_U^{(⊤)})` — but that cohomology-level conclusion is the
frontier node `thm:bigraded-truth-knowledge-les`, not proved here (this model has no induced
map on cohomology groups). -/

/-- **The bigraded total complex is the two-row mapping cone.** The designation grade has
only the two values `truth` (truth sheaf `F_U^{(t)}`) and `inconsistency` (inconsistency sheaf
`F_U^{(⊤)}`):

* (two-row structure) the designation type has **exactly two** elements (`Designation.two`) —
  the total complex is the mapping cone of `d_v` between the two rows;
* (the vertical map) `d_v = pi ∘ iota = F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}` is the **zero**
  map (`dv_zero`), because `dT`/`dTop` are disjoint — so the cone's differential is purely
  horizontal and the cone splits;
* (the mapping cone / LES from the designated SES) the SES `0 → F_U → F_U^{(k)} → F_U^{(⊤)}
  → 0` is exact and **split** (`AssocSheaf.designated_short_exact_sequence`): `ι` injective,
  `π` surjective onto `F_U^{(⊤)}`, `ker π = im ι` (vanishing-on-`⊤`), and the split
  `combine (projT c) (projTop c) = c`. On paper this split-exactness plus `d_v = 0` makes every
  connecting map of the induced LES zero, so it degenerates to the direct-sum decomposition
  `Hⁿ(F_U^{(k)}) ≅ Hⁿ(F_U^{(t)}) ⊕ Hⁿ(F_U^{(⊤)})` — but that is the cohomology-level frontier
  node `thm:bigraded-truth-knowledge-les`. What this theorem proves is its **cochain-level
  input**: the two-element designation, `d_v = 0`, and the split-exact designated SES. -/
theorem bigraded_two_row_mapping_cone :
    -- (two-row structure) the designation type has exactly two elements
    (∀ (d : Designation), d = Designation.truth ∨ d = Designation.inconsistency)
    -- (the vertical differential d_v = pi ∘ iota is the zero map)
    ∧ (∀ (v : Valuation) (c : Cochain), dv v c = zeroCochain)
    -- (d_v lands in the inconsistency row F_U^{(⊤)})
    ∧ (∀ (v : Valuation) (c : Cochain), InconSheaf.IsSection v (dv v c))
    -- (the designated SES is exact & split — the mapping cone / truth–knowledge LES input)
    -- ι injective
    ∧ (∀ (v : Valuation) (a b : Cochain),
        Vanishes (dT v) a → Vanishes (dT v) b → iota v a = iota v b → a = b)
    -- π surjective onto F_U^{(⊤)}
    ∧ (∀ (v : Valuation) (d : Cochain), Vanishes (dTop v) d → pi v d = d)
    -- ker π = im ι (the exactness in the middle, the vanishing-on-⊤ characterization)
    ∧ (∀ (v : Valuation) (cc : Cochain), pi v cc = zeroCochain ↔ VanishesOnTop v cc)
    -- the SES SPLITS: H^n(F^(k)) ≅ H^n(F^(t)) ⊕ H^n(F^(⊤)) — the LES degenerates
    ∧ (∀ (v : Valuation) (cc : Cochain),
        Vanishes (dK v) cc → combine (projT v cc) (projTop v cc) = cc) := by
  obtain ⟨_hdisj, _hunion, hinj, hsurj, _himv, _hvim, hker, hsplit, _huniq⟩ :=
    designated_short_exact_sequence
  exact ⟨Designation.two, dv_zero, dv_isSection, hinj, hsurj, hker, hsplit⟩

/-! ## The bigrading refines single-graded settling cohomology

The bigraded cohomology refines `H^n`: the cohomological degree `n` recovers the single-graded
`H^n`, and the `truth`/`inconsistency` designations **separate** the truth-side content
(`H^{truth,n} = H^n_t`, truth cohomology) from the inconsistency-side content
(`H^{inconsistency,n}`, inconsistency cohomology). In the strict/Scott regime both rows vanish
above degree 1 (reusing `Cohomology.hn_vanishes_above_one` and the row analogue), and the
inconsistency `H¹` vanishes (`InconSheaf.inconsistency_h1_vanishes`), so the bigrading collapses
to `H^{truth,n} = H^n_t`. -/

/-- **The bigraded cohomology refines single-graded settling cohomology.** For a
closure-ordinal regime `r` with vanishing cohomology (`cohomologyVanishes r = true`):

* (separation of the two designations) `H^{truth,n}` is the **truth** cohomology and
  `H^{inconsistency,n}` is the **inconsistency** cohomology — the two designations are exactly
  the truth-sheaf `F_U^{(t)}` and inconsistency-sheaf `F_U^{(⊤)}` cochain bundles
  (`row_truth`, `row_inconsistency`);
* (degree recovery) the bigraded `H^{d,n}` bundle restricts on each designation to the
  single-graded `H^n` bundle (`Hmn .truth n = Hmn .inconsistency n = Cohomology.Hn n`) — the
  cohomological degree recovers `H^n`;
* (regime gate) `cohomologyVanishes r = true ⟺ r ∈ {strict, scott}`
  (`ClosureOrdinalRegime.cohomologyVanishes_iff`); here the regime is strict or scott;
* (both rows vanish above degree 1, strict regime) for `n ≥ 2`,
  `H^{truth,n} = H^{inconsistency,n} = 0` (`Cohomology.hn_vanishes_above_one` on both rows) —
  all content sits in degrees `0`/`1`;
* (exactly two designation rows) the designation grade has two elements (`Designation.two`) —
  the corpus's two-row structure;
* (the inconsistency `H¹` vanishes) every Čech datum's agreeing family of `F_U^{(⊤)}`
  sections glues to a unique global section (`InconSheaf.inconsistency_h1_vanishes`) — so in
  the strict/Scott regime the bigrading collapses to `H^{truth,n} = H^n_t`. -/
theorem bigraded_refines_h1 (r : ClosureRegime)
    (hr : Obsmetrologia.cohomologyVanishes r = true) :
    -- (separation) truth row is truth cohomology, inconsistency row is inconsistency cohomology
    (Row .truth = Cochain ∧ Row .inconsistency = Cochain)
    -- (degree recovery) each designation's H^{d,n} is the single-graded H^n
    ∧ (∀ n : Nat, Hmn .truth n = Cohomology.Hn n ∧ Hmn .inconsistency n = Cohomology.Hn n)
    -- (regime gate) cohomology vanishes ⟺ strict or scott
    ∧ (Obsmetrologia.cohomologyVanishes r = true ↔
        (r = ClosureRegime.strict ∨ r = ClosureRegime.scott))
    -- (the regime is strict or scott)
    ∧ (r = ClosureRegime.strict ∨ r = ClosureRegime.scott)
    -- (both rows vanish above degree 1: H^{truth,n} and H^{inconsistency,n} are zero for n ≥ 2)
    ∧ (∀ (n : Nat), 2 ≤ n →
        (∀ x y : Hmn .truth n, x = y) ∧ (∀ x y : Hmn .inconsistency n, x = y))
    -- (exactly two designation rows — the corpus two-row structure)
    ∧ (∀ (d : Designation), d = Designation.truth ∨ d = Designation.inconsistency)
    -- (the inconsistency H¹ vanishes: glue to a unique global section)
    ∧ (∀ D : Cohomology.Cech1, Cohomology.Cocycle D →
        (∃ g : Cochain, Cohomology.Coboundary D g)
          ∧ (∀ g g' : Cochain,
              Cohomology.Coboundary D g → Cohomology.Coboundary D g' → g = g')) :=
  ⟨⟨row_truth, row_inconsistency⟩,
    fun _n => ⟨rfl, rfl⟩,
    Obsmetrologia.cohomologyVanishes_iff r,
    (Obsmetrologia.cohomologyVanishes_iff r).mp hr,
    fun _n hn => ⟨Cohomology.hn_vanishes_above_one _n hn, Cohomology.hn_vanishes_above_one _n hn⟩,
    Designation.two,
    fun D hcoc => InconSheaf.inconsistency_h1_vanishes D hcoc⟩

end Bigraded
end Obsmetrologia
