import Infomaterial.Dynamics.Flow.LawvereLaplacianSpectralGap
import Infomaterial.Dynamics.Flow.Laplacianizability
import Infomaterial.Cohomology.SettlingCohomologyH1

/-!
# The Lawvere-harmonic section is the cohomologically-trivial global section

`Flow.LawvereLaplacianSpectralGap` builds the Lawvere/Tarski order Laplacian `L = □∘◇`
and its harmonic kernel `IsHarmonic M v ↔ L v = v`; `Cohomology.SettlingCohomologyH1`
builds the **independent** Čech cohomology of the settling-associated sheaf `F_U` — the
degree-0 count `H0`, the gluing obstruction `H¹`, and the classifying invariant
`cl-inv = [1_{F_U}] ∈ H¹`. The two were developed apart: `LawvereLaplacianSpectralGap`
notes that identifying its harmonic kernel with the *independent* `SettlingCohomologyH1.H0`
is "an open in-core target" — it does not import the cohomology module. This module is that
import, and proves the two notions cohere on the settled section.

## Main result

`lawvere_harmonic_section_classifying_invariant_zero` bundles, for the settled valuation
`M.settle seed` in a cohomology-vanishing regime `r` (`strict` or `scott`):

* **(harmonic)** `M.settle seed` is in the Lawvere-Laplacian kernel
  (`LawvereLaplacian.settle_isHarmonic`) — it is a coherent global section of the closure;
* **(classifying invariant zero)** its identity Čech class `[1_{F_U}]` is a 1-cocycle that
  is a coboundary, uniquely — i.e. `cl-inv = 0` in `H¹`
  (`classifying_invariant_zero_strict`), the cohomological reading of "it glues";
* **(extent)** `H0 (M.settle seed)` is exactly the count of its truth-firing
  (`Charge.isTruthFiring`) cells (`h0_is_designated_count`) — the degree-0 extent of that
  harmonic section.

So the Lawvere-harmonic global section is the one whose settling cohomology is unobstructed,
and `H⁰` measures it: the order-Laplacian kernel and the Čech invariants name the **same**
settled global section. This is the dependency-free, inner-product-free projection of the Hodge
identification `ker Δ ≅ H⁰` (`concepts/laplacianizability.md`), realized against the Čech
`H⁰` rather than the Laplacianizer's own `settledSections` (where `η` is the identity).

## Scope and frontier

What is **not** here, and why. The corpus's `main-theorem-synthesis` states the full
**moduli of Laplacianizations** as a real-analytic orbifold stratified by spectral
multipartition (codim `∑_{|B|≥2}(|B|−1)`, the EDD/Pataki strata), with the cellular sheaf
Laplacian of Hansen–Ghrist as one case; that theory is **over ℝ** with a cochain inner
product, the continuous moduli `Aut(X) \ 𝓗(X)` an orbifold quotient. Infomaterial derives ℝ
internally (`Infomaterial.Real.Internal`, the constructive Bishop reals, with
multiplication/`IVT`/`Logarithm` on top), so the reals are present; what it
still needs is the finite-dimensional inner-product (Hilbert) structure on cochains and
the orbifold quotient — to build, not impossible. The finite-tile Rayleigh quotient is
reachable on the reals already in tree. Symmetrically, the *nonzero* classifying invariant — `cl-inv ≠ 0`
localized to the `⊤`-seam, the paraconsistent obstruction of the **aperiodic** regime — lives
in `Infomaterial.Persistence.Aperiodic.*` (the Čech model here glues unconditionally, so it can only carry the
vanishing side). Both are stated where they are generated; neither is overclaimed here.
-/

namespace Infomaterial
namespace Cohomology

open Infomaterial.Valuation
open Infomaterial.AssocSheaf

/-- **The Lawvere-harmonic settled section is the cohomologically-trivial global section.**
For the settled valuation `M.settle seed` in a cohomology-vanishing regime `r`
(`Infomaterial.cohomologyVanishes r = true`, i.e. `strict` or `scott`), over any cover `c` and
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
    (r : ClosureRegime) (hr : Infomaterial.cohomologyVanishes r = true)
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
end Infomaterial
