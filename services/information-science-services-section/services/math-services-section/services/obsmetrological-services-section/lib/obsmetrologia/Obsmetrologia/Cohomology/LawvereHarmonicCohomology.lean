import Obsmetrologia.Dynamics.Flow.LawvereLaplacianSpectralGap
import Obsmetrologia.Dynamics.Flow.Laplacianizability
import Obsmetrologia.Cohomology.SettlingCohomologyH1

/-!
# The Lawvere-harmonic section is the cohomologically-trivial global section

`Flow.LawvereLaplacianSpectralGap` builds the order Laplacian `L = □∘◇` and its harmonic
kernel `IsHarmonic M v ↔ L v = v`, independently of `Cohomology.SettlingCohomologyH1`'s
Čech cohomology of `F_U` (`H0`, `H¹`, `cl-inv = [1_{F_U}] ∈ H¹`). This module connects
them: `lawvere_harmonic_section_classifying_invariant_zero` proves, for the settled
valuation `M.settle seed` in a cohomology-vanishing regime (`strict`/`scott`):

* `M.settle seed` is in the Lawvere-Laplacian kernel (`LawvereLaplacian.settle_isHarmonic`);
* its identity Čech class is a coboundary, so `cl-inv = 0` in `H¹`
  (`classifying_invariant_zero_strict`);
* `H0 (M.settle seed)` is the count of its truth-firing cells (`h0_is_designated_count`).

The order-Laplacian kernel and the Čech invariants name the same settled global section —
the dependency-free, inner-product-free projection of `ker Δ ≅ H⁰`
(`concepts/laplacianizability.md`), against the Čech `H⁰` rather than the Laplacianizer's
own `settledSections`.

**Scope.** The corpus's `main-theorem-synthesis` states the full moduli of Laplacianizations
as a real-analytic orbifold stratified by spectral multipartition, over ℝ with a cochain
inner product — Obsmetrologia derives ℝ internally (`Obsmetrologia.Real.Internal`), but still
needs the finite-dimensional Hilbert structure on cochains and the orbifold quotient to
build that. The nonzero classifying invariant (`cl-inv ≠ 0`, the paraconsistent obstruction
of the aperiodic regime) lives in `Obsmetrologia.AperiodicOrder.Tiling.*`; the Čech model
here glues unconditionally, so it only carries the vanishing side.
-/

namespace Obsmetrologia
namespace Cohomology

open Obsmetrologia.Valuation
open Obsmetrologia.AssocSheaf

/-- **The Lawvere-harmonic settled section is the cohomologically-trivial global section.**
For the settled valuation `M.settle seed` in a cohomology-vanishing regime `r`
(`Obsmetrologia.cohomologyVanishes r = true`, i.e. `strict` or `scott`), over any cover `c` and
cell support `cells`:

* **(harmonic)** `M.settle seed` is in the Lawvere-Laplacian kernel — a coherent global
  section (`LawvereLaplacian.settle_isHarmonic`);
* **(regime)** `r` is `strict` or `scott`, so `H¹ = 0`;
* **(cocycle)** the identity class `[1_{F_U}]` of `M.settle seed` is a 1-cocycle;
* **(coboundary)** it is a coboundary witnessed by the identity cochain — `cl-inv = 0` in `H¹`;
* **(unique)** the coboundary witness (the glued global section) is unique;
* **(extent)** `H0 (M.settle seed) cells` is the count of its truth-firing cells.

The Lawvere/Tarski order-Laplacian kernel and the independent Čech invariants name the same
settled global section — the inner-product-free projection of `ker Δ ≅ H⁰`. -/
theorem lawvere_harmonic_section_classifying_invariant_zero
    (M : ModalFrame) (seed : Valuation)
    (r : ClosureRegime) (hr : Obsmetrologia.cohomologyVanishes r = true)
    (c : Sheaf.Cover) (cells : List PredicationCell) :
    -- (harmonic) the settled section is in the Lawvere-Laplacian kernel
    LawvereLaplacian.IsHarmonic M (M.settle seed)
    -- (regime) strict or scott, so H¹ = 0
    ∧ (r = ClosureRegime.strict ∨ r = ClosureRegime.scott)
    -- (cocycle) the identity class is an agreeing family
    ∧ Cocycle (clInvDatum (M.settle seed) c)
    -- (coboundary) it is a coboundary — cl-inv = 0 in H¹
    ∧ Coboundary (clInvDatum (M.settle seed) c) (identityCochain (M.settle seed))
    -- (unique) the coboundary witness / glued global section is unique
    ∧ (∀ g g' : Cochain,
        Coboundary (clInvDatum (M.settle seed) c) g →
        Coboundary (clInvDatum (M.settle seed) c) g' → g = g')
    -- (extent) H⁰ counts the truth-firing cells of the settled section
    ∧ H0 (M.settle seed) cells
        = cells.countP (fun φ => Charge.isTruthFiring ((M.settle seed) φ)) := by
  obtain ⟨hregime, hcocycle, hcoboundary, hunique⟩ :=
    classifying_invariant_zero_strict r hr (M.settle seed) c
  exact ⟨LawvereLaplacian.settle_isHarmonic M seed,
    hregime, hcocycle, hcoboundary, hunique,
    (h0_is_designated_count (M.settle seed) cells).1⟩

end Cohomology
end Obsmetrologia
