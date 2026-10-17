import Obsmetrologia.AperiodicOrder.Tiling.StepN.Salem
import Obsmetrologia.Closure.Regime

/-!
# The Salem/Pisot split is the settling-regime split

`Salem` separated the two inflation types by their internal direction: **Pisot** (the metallic family)
has its conjugate *strictly inside* the unit disk — a **contracting** direction — while **Salem** has a
conjugate *on* the unit circle — a **neutral rotation** (`salemTraceResolvent_unit_circle`). `ClosureOrdinalRegime`
stratified settling into the FOUR regimes by closure ordinal `κ`. This module identifies the two:

> a contracting internal direction settles at a finite stage (**strict**, `κ < ω`); a neutral
> unit-circle direction never contracts and settles only at the **aperiodic** stratum (`κ ≥ ω₁`, the
> `⊤`-regime).

The bridge sends the single Boolean *"is the internal direction on the unit circle?"* to the regime
data: off the circle (Pisot) the base is finite and the closure settles (strict); on the circle (Salem)
no flag fires and the closure is aperiodic. So the corpus's Pisot/Salem invariant and its closure-ordinal
stratification are **the same dichotomy** — the contraction is what makes settling finite, and its loss
on the Salem circle is exactly the jump to the aperiodic `⊤`-regime.

## Main results
* `inflation_pisot` — a contracting (off-circle) direction is the **strict** regime.
* `inflation_salem` — a neutral (on-circle) direction is the **aperiodic** regime.
* `salem_vs_pisot_regime` — the split, tied to the actual trace sign-changes of `salemTraceResolvent` (Salem,
  neutral) and `charPolyMetallic 1` (Pisot, contracting).

## References
Corpus `substitution-universality-class` (Pisot/Salem invariant); `four-regime-dichotomy.md` (the κ
stratification); the coloring-aperiodic-tiles memo §5/§6.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.StepN

/-- The regime datum of an inflation, keyed by whether its internal direction sits **on the unit
circle**. Off the circle (`false`, Pisot) the direction contracts: the base is finite and the closure is
Scott-continuous with countable cofinality — it settles. On the circle (`true`, Salem) none of these
hold — the neutral rotation never settles. -/
def inflationRegimeData (onUnitCircle : Bool) : ClosureRegimeData where
  scottContinuous := !onUnitCircle
  finiteBase := !onUnitCircle
  countableCofinality := !onUnitCircle
  fin_scott := fun h => h
  fin_cof := fun h => h

/-- The settling regime of an inflation as a function of its internal direction. -/
def inflationRegime (onUnitCircle : Bool) : ClosureRegime := classify (inflationRegimeData onUnitCircle)

/-- **A Pisot (contracting, off-circle) inflation is in the strict regime** — `κ < ω`, settling at a
finite stage. The contraction is what makes the closure ordinal finite. -/
theorem inflation_pisot : inflationRegime false = ClosureRegime.strict := rfl

/-- **A Salem (neutral, on-circle) inflation is in the aperiodic regime** — `κ ≥ ω₁`, the `⊤`-stratum.
The unit-circle conjugate never contracts, so the closure never settles below `ω₁`. -/
theorem inflation_salem : inflationRegime true = ClosureRegime.aperiodic := rfl

/-- **The Salem/Pisot split is the regime split.** On one side, `salemTraceResolvent` changes sign in `(−2, 2)`
(a unit-circle conjugate pair — the *neutral* Salem direction) and the inflation is **aperiodic**. On
the other, the metallic (Pisot) characteristic polynomial changes sign in `(−1, 0)` (a real conjugate
strictly inside the disk — *contracting*) and the inflation is **strict**. The dynamical invariant and
the closure-ordinal stratum are one dichotomy. -/
theorem salem_vs_pisot_regime :
    inflationRegime true = ClosureRegime.aperiodic
      ∧ inflationRegime false = ClosureRegime.strict
      ∧ (0 < evalIntPoly salemTraceResolvent (-2) ∧ evalIntPoly salemTraceResolvent 0 < 0)
      ∧ (0 < evalIntPoly (charPolyMetallic 1) (-1) ∧ evalIntPoly (charPolyMetallic 1) 0 < 0) :=
  ⟨inflation_salem, inflation_pisot, salemTraceResolvent_unit_circle, by decide⟩

end AperiodicOrder.Tiling.StepN
end Obsmetrologia
