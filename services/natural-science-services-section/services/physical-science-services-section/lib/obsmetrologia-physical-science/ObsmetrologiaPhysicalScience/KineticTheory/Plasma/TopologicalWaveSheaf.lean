import Obsmetrologia.Site.Enriched
import Obsmetrologia.Dynamics.Flow.CurvatureRegime

/-!
# TopologicalWaveSheaf — plasma: topological plasma waves as Laplacian sheaf criteria (DERIVED)

The plasma frontier (`…/obsmetrologia_gases_liquids_plasmas_proof_frontier.md`, §3.3.5 / Batch E) asks for
topological plasma-wave structure — spectral bundles, edge modes, bulk-edge correspondence — as
**quantale-enriched sheaf / Lawvere-Laplacian** projections: a finite spectral-band cover is a `Q`-enriched
sheaf, its degree-0 Laplacian modes are the global (bulk) sections, `q`-fuzzy equivalence of overlapping
local band data composes, and a bulk-edge obstruction is an `H¹ ≠ 0` projection.

The three frontier theorems land on proven machinery. **Bulk modes** are the fixed points of the
degree-0 Lawvere–Laplacian `L x = x ·ₖ s` on the charge quantale (`QEnriched.laplacian`); they are
idempotent-closed and `∨ₖ`-closed, hence a global-section subobject (`laplacian_H0_modes_are_global_sections`,
from `h0_laplacian_fixed_points`). **Approximate band equivalence** is a `QFuzzyEquiv` graded by a charge,
and overlapping band patches compose with their grades multiplying in the quantale
(`fuzzy_band_equivalence_composes`, from `QFuzzyEquiv.compose`). A **topologically protected edge mode**
is a band whose settling flow is curved (non-Scott), which forces non-vanishing cohomology
(`edge_obstruction_implies_H1_nonzero`); a trivial (flat) bulk admits no protected edge — the
bulk-edge correspondence projection (`flat_band_forbids_edge_obstruction`).

The `H¹ ≠ 0` here is the **regime-level curvature**: the settling sheaf's own Čech `H¹` always vanishes
(`SettlingCohomologyH1.h1_vanishes`, the CALM/CRDT convergence), so a topological band's protected mode
is the transfinite/aperiodic curvature obstruction (`cohomologyVanishes = false`), exactly the
`CurvatureRegime` dichotomy applied to a band sheaf. The continuum content — Berry curvature, Chern
numbers, non-Hermitian spectra, PDE wave dispersion — is not visible here.

## Main definitions
* `IsBulkMode` — a degree-0 Lawvere-Laplacian fixed mode (an `H⁰` global band section).
* `BandSheaf`, `EdgeObstruction` — a spectral band (Laplacian weight + settling regime) and its
  topologically-protected (curved) edge mode.

## Main results
* `laplacian_H0_modes_are_global_sections` — the bulk modes are idempotent- and `∨ₖ`-closed (a global
  section subobject).
* `fuzzy_band_equivalence_composes` — `q`-fuzzy equivalence of local band data composes (grades multiply).
* `edge_obstruction_implies_H1_nonzero` — a protected edge mode forces `H¹ ≠ 0`
  (`cohomologyVanishes = false`); `flat_band_forbids_edge_obstruction` is the bulk-edge correspondence.
* `canonicalEdgeBand_has_obstruction` — an aperiodic band carries a protected edge mode.

## References
`content/.../obsmetrologia_gases_liquids_plasmas_proof_frontier.md` §3.3.5, Batch E. Built on
`Obsmetrologia.Site.Enriched` (`QEnriched.h0_laplacian_fixed_points`, `QFuzzyEquiv.compose`) and
`Obsmetrologia.Flow.CurvatureRegime`. Companion to `KineticTheory.Plasma.ReconnectionCurvature`.

## Tags
topological plasma waves, edge modes, bulk-edge correspondence, Lawvere Laplacian, quantale-enriched
sheaf, q-fuzzy equivalence, H¹
-/

namespace Obsmetrologia
namespace KineticTheory.Plasma

open Obsmetrologia.QEnriched
open Obsmetrologia.Flow.CurvatureRegime

/-! ## (1) Bulk modes — the degree-0 Lawvere-Laplacian global sections -/

/-- A **bulk mode** at Laplacian weight `s`: a fixed point of the degree-0 Lawvere–Laplacian
`L x = x ·ₖ s` — a degree-0 (`H⁰`) global band section. -/
def IsBulkMode (s x : Reading) : Prop := laplacian s x = x

/-- **The bulk modes are an `H⁰` global-section subobject.** The degree-0 Lawvere-Laplacian modes are
idempotent-closed (`L (L x) = L x`, so every `L x` is a bulk mode) and `∨ₖ`-closed (the join of two
bulk modes is a bulk mode) — the harmonic kernel `ker L = H⁰` of the band sheaf. -/
theorem laplacian_H0_modes_are_global_sections (s : Reading) :
    (∀ x : Reading, IsBulkMode s (laplacian s x)) ∧
      (∀ x y : Reading, IsBulkMode s x → IsBulkMode s y → IsBulkMode s (x.joinK y)) :=
  h0_laplacian_fixed_points s

/-! ## (2) Approximate band equivalence composes -/

/-- **`q`-fuzzy equivalence of local band data composes.** Two overlapping spectral-band patches that are
`p`- and `q`-approximately equivalent compose to a `(p ·ₖ q)`-approximate equivalence — the grades
multiply in the charge quantale (approximate equivalence degrades under transit, exactly the Lawvere
quantale-enriched composition). -/
def fuzzy_band_equivalence_composes {p q : readingQuantale.carrier}
    {C D E : QCat readingQuantale} (e₁ : QFuzzyEquiv p C D) (e₂ : QFuzzyEquiv q D E) :
    QFuzzyEquiv (readingQuantale.mul p q) C E :=
  e₁.compose e₂

/-! ## (3) The bulk-edge correspondence: a protected edge mode is an `H¹ ≠ 0` projection -/

/-- A **spectral band**: a Lawvere-Laplacian weight (the band's self-coupling) together with the regime
datum of its settling flow. The finite projection of a spectral band bundle. -/
structure BandSheaf where
  /-- The degree-0 Lawvere–Laplacian weight (band self-coupling). -/
  coupling : Reading
  /-- The regime of the band's settling flow. -/
  regime : ClosureRegimeData

/-- A **topologically protected edge mode**: the band's settling flow is curved (non-Scott) — a curvature obstruction, the finite projection of a protected edge mode that cannot be deformed into the bulk. -/
def EdgeObstruction (B : BandSheaf) : Prop := IsCurved (classify B.regime)

/-- **A protected edge mode forces `H¹ ≠ 0`.** A topologically protected (curved) band has non-vanishing
settling cohomology, `cohomologyVanishes (classify B.regime) = false` — the bulk-edge correspondence
read off `nonvanishes_iff_curved`. -/
theorem edge_obstruction_implies_H1_nonzero (B : BandSheaf) (h : EdgeObstruction B) :
    cohomologyVanishes (classify B.regime) = false :=
  (nonvanishes_iff_curved (classify B.regime)).mpr h

/-- **A trivial (flat) bulk admits no protected edge mode.** If the band's settling regime is flat
(`H¹ = 0`, the topologically trivial bulk), there is no protected edge mode — the bulk-edge
correspondence prohibition. -/
theorem flat_band_forbids_edge_obstruction (B : BandSheaf) (h : IsFlat (classify B.regime)) :
    ¬ EdgeObstruction B :=
  fun hc => not_flat_and_curved (classify B.regime) ⟨h, hc⟩

/-- An **aperiodic spectral band**: its settling flow is non-Scott-continuous with uncountable closure
ordinal — the regime classifies as `aperiodic`. Witnesses that a protected edge mode occurs. -/
def canonicalEdgeBand : BandSheaf where
  coupling := Reading.kBot
  regime :=
    { scottContinuous := false
      finiteBase := false
      countableCofinality := false
      fin_scott := fun h => absurd h (by decide)
      fin_cof := fun h => absurd h (by decide) }

/-- **The aperiodic band carries a protected edge mode** — the obstruction has teeth. -/
theorem canonicalEdgeBand_has_obstruction : EdgeObstruction canonicalEdgeBand :=
  Or.inr rfl

/-- **Hence the aperiodic band has `H¹ ≠ 0`.** -/
theorem canonicalEdgeBand_H1_nonzero :
    cohomologyVanishes (classify canonicalEdgeBand.regime) = false :=
  edge_obstruction_implies_H1_nonzero canonicalEdgeBand canonicalEdgeBand_has_obstruction

end KineticTheory.Plasma
end Obsmetrologia
