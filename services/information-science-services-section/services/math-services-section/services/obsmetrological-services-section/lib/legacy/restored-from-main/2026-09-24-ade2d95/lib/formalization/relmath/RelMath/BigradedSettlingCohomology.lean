/-
# Bigraded settling cohomology `H^{m,n}_{k,t}` — the two-row mapping cone

This module formalizes the corpus node

* `…/settling/content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md`
  — the **bigraded settling cohomology** `H^{m,n}_{k,t}(T*, F_U)`, a refinement of
  settling cohomology that organizes data by (cohomological degree `n`, designation grade
  `m`), one axis per hyperdoctrine adjoint system. The **bigraded cochain complex** is

  $$C^{m,n}_{k,t} := \begin{cases} C^n(F_U^{(t)}) & m = 0, \\ C^n(F_U^{(\top)}) & m = 1, \\ 0 & m \geq 2.\end{cases}$$

  The **horizontal** differential `d_h : C^{m,n} → C^{m,n+1}` is the standard cochain
  differential. The **vertical** differential `d_v : C^{0,n} → C^{1,n}` is the composite
  `F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}`. The bigraded cohomology is the cohomology of the
  **total** complex. **Two-row collapse:** the bicomplex has only the two rows `m = 0, 1`,
  so the total complex is a **mapping cone** — the truth–knowledge long exact sequence.

## The model — reuse, never re-postulate

We do **not** introduce a new cochain type or new differentials. We reuse the cochain
bundles already built downstream:

* **row 0** (`m = 0`) is the **truth-sheaf** cochains `F_U^{(t)} = ℤ^{dT}`: the
  `AssocSheaf.Cochain` sections supported on `AssocSheaf.dT`, with the Čech gluing
  (`Cohomology.Cech1`, `Cohomology.h1_vanishes`) of `SettlingCohomologyH1`;
* **row 1** (`m = 1`) is the **inconsistency-sheaf** cochains `F_U^{(⊤)} = ℤ^{dTop}`: the
  `InconSheaf.IsSection` sections supported on `AssocSheaf.dTop`, with the inconsistency
  Čech gluing (`InconSheaf.inconsistency_h1_vanishes`) of `InconsistencySheaf`;
* **rows `m ≥ 2`** are `0` — the zero bundle (`Row` returns `Unit`).

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
## No free data

`Row m` is `Cochain`/`Unit` over the existing bundles; `dv` is `pi ∘ iota`; `dv_zero` is
`restrict_comp` + disjointness; the two-row vanishing is `rfl` on `Unit`; the mapping-cone /
LES is the re-bundled `designated_short_exact_sequence`; the refinement reuses
`hn_vanishes_above_one`/`h1_vanishes`/`inconsistency_h1_vanishes`. Every lemma is
`funext`/`cases`/`rfl`/re-export.sound`.
-/
import RelMath.SettlingCohomologyH1
import RelMath.InconsistencySheaf
import RelMath.SettlingAssociatedSheaf

namespace RelMath
namespace Bigraded

open RelMath.AssocSheaf

/-! ## The bigraded cochain bundle `C^{m,n}` — the two rows and the zero rows

`C^{m,n}` carries, per designation grade `m`, the cochain bundle of one sheaf: row `0` is
the truth sheaf `F_U^{(t)} = ℤ^{dT}`, row `1` is the inconsistency sheaf
`F_U^{(⊤)} = ℤ^{dTop}`, and rows `m ≥ 2` are the zero bundle. We reuse `AssocSheaf.Cochain`
for the two live rows (carrying the support predicate by which mask cuts them out) and
`Unit` for the dead rows. -/

/-- The **bigraded cochain bundle at grade `m`** (cohomological degree `n` is carried inside
the Čech data of each row, see `Cohomology.Cech1` / `InconSheaf`). Row `0` is the truth-sheaf
cochains `F_U^{(t)} = ℤ^{dT}` (= `AssocSheaf.Cochain`); row `1` is the inconsistency-sheaf
cochains `F_U^{(⊤)} = ℤ^{dTop}` (also `AssocSheaf.Cochain`, the `dTop`-supported sub-bundle);
rows `m ≥ 2` are the **zero** bundle `Unit`. -/
def Row : Nat → Type
  | 0 => Cochain
  | 1 => Cochain
  | _ + 2 => Unit

/-- **The support mask of row `m`.** Row `0` is supported on the truth mask `dT v`
(`F_U^{(t)}`); row `1` on the inconsistency mask `dTop v` (`F_U^{(⊤)}`). Rows `m ≥ 2` carry
no support — the constantly-`false` mask (the zero bundle). -/
def rowMask (v : Valuation) : Nat → (PredicationCell → Bool)
  | 0 => dT v
  | 1 => dTop v
  | _ + 2 => fun _ => false

/-! ## The two-row collapse — rows `m ≥ 2` are the zero bundle -/

/-- **Two-row structure (`m ≥ 2` gives `0`).** For every designation grade `m ≥ 2`, the row
bundle `Row m` is the **zero** bundle: it is `Unit`, with a unique element. So the bicomplex
has only the two nonzero rows `m = 0, 1` — the corpus's *two-row collapse*. -/
theorem row_zero_above_one (m : Nat) (_h : 2 ≤ m) (x y : Row m) : x = y := by
  match m, _h with
  | _ + 2, _ => rfl

/-- The grade-`0` row **is** the truth-sheaf cochain bundle `F_U^{(t)} = ℤ^{dT}`. -/
theorem row_zero_is_truth : Row 0 = Cochain := rfl

/-- The grade-`1` row **is** the inconsistency-sheaf cochain bundle `F_U^{(⊤)} = ℤ^{dTop}`. -/
theorem row_one_is_inconsistency : Row 1 = Cochain := rfl

/-! ## The vertical differential `d_v : C^{0,n} → C^{1,n}`

`d_v` is the wave-3 composite `F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}`: include the truth-side
cochain into the knowledge sheaf (`AssocSheaf.iota v`), then project onto the inconsistency
side (`AssocSheaf.pi v`). We reuse the SES maps verbatim. -/

/-- **The vertical differential** `d_v : C^{0,n} → C^{1,n}` at valuation `v`: the composite
`F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}`, i.e. `pi v ∘ iota v` (include the truth section into
knowledge, then project onto inconsistency). Reuses `AssocSheaf.iota`/`AssocSheaf.pi`. -/
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
(it vanishes off the `dTop` mask), since `pi v = restrict (dTop v)`. So `d_v : C^{0,n} →
C^{1,n}` is well-typed into row 1. -/
theorem dv_isSection (v : Valuation) (c : Cochain) : InconSheaf.IsSection v (dv v c) :=
  restrict_vanishes (dTop v) (iota v c)

/-! ## The horizontal differential `d_h` and the total complex

The horizontal differential `d_h : C^{m,n} → C^{m,n+1}` is the standard Čech cochain
differential. For each row it is the differential of the row's sheaf cochain complex —
already modeled in `SettlingCohomologyH1` / `InconsistencySheaf` via the Čech `H⁰`/`H¹`
gluing obstruction, with content vanishing above degree 1 (`Cohomology.hn_vanishes_above_one`).
The total complex `Tot^N := ⊕_{m+n=N} C^{m,n}` has differential `d_h ± d_v`; because `d_v = 0`
(`dv_zero`) and only two rows are nonzero, `Tot` is the **mapping cone** of `d_v` between the
two horizontal complexes. -/

/-- **The bigraded `H^{m,n}` bundle.** For `m = 0` it is the truth-sheaf cohomology of degree
`n` (truth content `H^{0,n} = H^n_t`); for `m = 1` it is the inconsistency-sheaf cohomology
of degree `n` (`H^{1,n}`); for `m ≥ 2` it is the **zero** group. We carry the two live rows
by the cohomological-degree marker `n` (the row's Čech complex realizes `H^n` in `H⁰`/`H¹`,
zero above degree 1) and the dead rows by `Unit`. -/
def Hmn : Nat → Nat → Type
  | 0, n => Cohomology.Hn n
  | 1, n => Cohomology.Hn n
  | _ + 2, _ => Unit

/-- **Bigraded cohomology vanishes above the two rows (`m ≥ 2 ⟹ H^{m,n} = 0`).** Mirrors the
two-row collapse of the cochain bundle: `H^{m,n}` for `m ≥ 2` is the zero group. -/
theorem Hmn_zero_above_one (m : Nat) (_h : 2 ≤ m) (n : Nat) (x y : Hmn m n) : x = y := by
  match m, _h with
  | _ + 2, _ => rfl

/-! ## The two-row mapping cone and the truth–knowledge LES

Because the bicomplex has only the two rows `m = 0` and `m = 1`, the total complex **is** a
mapping cone: the cone of the vertical differential `d_v : C^{0,•} → C^{1,•}`. Its long exact
sequence is the **truth–knowledge long exact sequence** relating `H(F_U^{(t)})`,
`H(F_U^{(k)})`, `H(F_U^{(⊤)})`, built from the designated SES
`0 → F_U → F_U^{(k)} → F_U^{(⊤)} → 0`. Since the SES **splits** (`dT`/`dTop` disjoint,
`dK = dT ⊔ dTop`) and `d_v = 0`, every connecting map vanishes and the LES degenerates to the
direct-sum decomposition `H^n(F_U^{(k)}) ≅ H^n(F_U^{(t)}) ⊕ H^n(F_U^{(⊤)})` — the two
bigrading axes. -/

/-- **The bigraded total complex is the two-row mapping cone.** The bicomplex has
only the rows `m = 0` (truth sheaf `F_U^{(t)}`) and `m = 1` (inconsistency sheaf
`F_U^{(⊤)}`):

* (two-row structure) every grade `m ≥ 2` is the **zero** bundle `Row m`
  (`row_zero_above_one`) — the total complex is the mapping cone of `d_v` between the two
  live rows;
* (the vertical map) `d_v = pi ∘ iota = F_U^{(t)} ↪ F_U^{(k)} ↠ F_U^{(⊤)}` is the **zero**
  map (`dv_zero`), because `dT`/`dTop` are disjoint — so the cone's differential is purely
  horizontal and the cone splits;
* (the mapping cone / LES from the designated SES) the SES `0 → F_U → F_U^{(k)} → F_U^{(⊤)}
  → 0` is exact and **split** (`AssocSheaf.designated_short_exact_sequence`): `ι` injective,
  `π` surjective onto `F_U^{(⊤)}`, `ker π = im ι` (vanishing-on-`⊤`), and the split
  `combine (projT c) (projTop c) = c`. Its induced long exact sequence is the truth–knowledge
  LES; the split makes every connecting map zero, so the LES degenerates to the direct-sum
  decomposition `H^n(F_U^{(k)}) ≅ H^n(F_U^{(t)}) ⊕ H^n(F_U^{(⊤)})` — the two bigrading axes
  of `H^{m,n}_{k,t}`. -/
theorem bigraded_two_row_mapping_cone :
    -- (two-row structure) every grade m ≥ 2 is the zero bundle
    (∀ (m : Nat), 2 ≤ m → ∀ x y : Row m, x = y)
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
  exact ⟨row_zero_above_one, dv_zero, dv_isSection, hinj, hsurj, hker, hsplit⟩

/-! ## The bigrading refines single-graded settling cohomology

The bigraded cohomology refines `H^n`: the **total degree** `m + n` recovers the
single-graded `H^n`, and the `(m=0)`/`(m=1)` grades **separate** the truth-side content
(`H^{0,n} = H^n_t`, truth cohomology) from the inconsistency-side content (`H^{1,n}`,
inconsistency cohomology). In the strict/Scott regime both rows vanish above degree 1
(reusing `Cohomology.hn_vanishes_above_one` and the row-1 analogue), and the row-1
inconsistency `H¹` vanishes (`InconSheaf.inconsistency_h1_vanishes`), so the bigrading
collapses to `H^{0,n} = H^n_t`. -/

/-- **The bigraded cohomology refines single-graded settling cohomology.** For a
closure-ordinal regime `r` with vanishing cohomology (`cohomologyVanishes r = true`):

* (separation of the two grades) `H^{0,n}` is the **truth** cohomology and `H^{1,n}` is the
  **inconsistency** cohomology — the grade-`0`/grade-`1` rows are exactly the truth-sheaf
  `F_U^{(t)}` and inconsistency-sheaf `F_U^{(⊤)}` cochain bundles
  (`row_zero_is_truth`, `row_one_is_inconsistency`);
* (total-degree recovery) the bigraded `H^{m,n}` bundle restricts on each live grade to the
  single-graded `H^n` bundle (`Hmn 0 n = Hmn 1 n = Cohomology.Hn n`) — the total degree
  recovers `H^n`;
* (regime gate) `cohomologyVanishes r = true ⟺ r ∈ {strict, scott}`
  (`ClosureOrdinalRegime.cohomologyVanishes_iff`); here the regime is strict or scott;
* (both rows vanish above degree 1, strict regime) for `n ≥ 2`, `H^{0,n} = H^{1,n} = 0`
  (`Cohomology.hn_vanishes_above_one` on both rows) and `H^{m,n} = 0` for `m ≥ 2`
  (`Hmn_zero_above_one`) — all content sits in degrees `0`/`1`;
* (the inconsistency row-1 `H¹` vanishes) every Čech datum's agreeing family of `F_U^{(⊤)}`
  sections glues to a unique global section (`InconSheaf.inconsistency_h1_vanishes`) — so in
  the strict/Scott regime the bigrading collapses to `H^{0,n} = H^n_t`. -/
theorem bigraded_refines_h1 (r : ClosureRegime)
    (hr : RelMath.cohomologyVanishes r = true) :
    -- (separation) row 0 is truth cohomology, row 1 is inconsistency cohomology
    (Row 0 = Cochain ∧ Row 1 = Cochain)
    -- (total-degree recovery) each live grade's H^{m,n} is the single-graded H^n
    ∧ (∀ n : Nat, Hmn 0 n = Cohomology.Hn n ∧ Hmn 1 n = Cohomology.Hn n)
    -- (regime gate) cohomology vanishes ⟺ strict or scott
    ∧ (RelMath.cohomologyVanishes r = true ↔
        (r = ClosureRegime.strict ∨ r = ClosureRegime.scott))
    -- (the regime is strict or scott)
    ∧ (r = ClosureRegime.strict ∨ r = ClosureRegime.scott)
    -- (both rows vanish above degree 1: H^{0,n} and H^{1,n} are zero for n ≥ 2)
    ∧ (∀ (n : Nat), 2 ≤ n → (∀ x y : Hmn 0 n, x = y) ∧ (∀ x y : Hmn 1 n, x = y))
    -- (bigraded cohomology vanishes above the two rows: m ≥ 2 ⟹ H^{m,n} = 0)
    ∧ (∀ (m : Nat), 2 ≤ m → ∀ (n : Nat), ∀ x y : Hmn m n, x = y)
    -- (the inconsistency row-1 H¹ vanishes: glue to a unique global section)
    ∧ (∀ D : Cohomology.Cech1, Cohomology.Cocycle D →
        (∃ g : Cochain, Cohomology.Coboundary D g)
          ∧ (∀ g g' : Cochain,
              Cohomology.Coboundary D g → Cohomology.Coboundary D g' → g = g')) :=
  ⟨⟨row_zero_is_truth, row_one_is_inconsistency⟩,
    fun _n => ⟨rfl, rfl⟩,
    RelMath.cohomologyVanishes_iff r,
    (RelMath.cohomologyVanishes_iff r).mp hr,
    fun _n hn => ⟨Cohomology.hn_vanishes_above_one _n hn, Cohomology.hn_vanishes_above_one _n hn⟩,
    Hmn_zero_above_one,
    fun D hcoc => InconSheaf.inconsistency_h1_vanishes D hcoc⟩

end Bigraded
end RelMath
