import Obsmetrologia.CausalSets.Operator.DAlembertian

/-!
# The discrete Einstein–Hilbert action of a causal settling

The **Einstein–Hilbert action** of a causal settling is `S = ∑_x □1(x)` — the
[causal d'Alembertian](CausalSets.Operator.DAlembertian.lean) applied to the unit field, summed over events. With
the exact incidence operator, `□1(x) = ∑_{y ≼ x} μ(y,x)` is the **column Möbius sum** at `x` — the
integer discrete local curvature — and `S` is its total: the Benincasa–Dowker action of causal-set
quantum gravity, here a settling invariant.

The incidence reading is exact and green: the column Möbius sum is the dual orthogonality, the
minimality (initial-boundary) indicator. The curvature reading — `⟨S⟩ → −¼∫R√g` in the continuum —
uses the layer-grouped BD coefficients and is the analytic frontier (see the corpus node).

## Main definitions

* `localCurvature` — the column Möbius sum `∑_{y ≼ x} μ(y,x)`, the discrete local curvature.
* `bdAction` — the discrete Einstein–Hilbert action `∑_x localCurvature x`.

## Main results

* `diamond_localCurvature` / `diamond_bdAction` — the diamond's curvature profile `(1,0,0,0)` and
  action `S = 1` (its single minimal event).

## References

`content/.../lorentzian-causal-settling/content/einstein-hilbert-action`; reads the Möbius function
and operator of `CausalSets.Incidence.Mobius` / `CausalSets.Operator.DAlembertian`.

## Tags

Einstein–Hilbert action, Benincasa–Dowker action, discrete curvature, causal set, Möbius
-/

namespace Obsmetrologia
namespace CausalSets.Action.EinsteinHilbertAction

open Obsmetrologia.CausalSets.Incidence.Mobius
open Obsmetrologia.CausalSets.Dimension.OrderingFraction

variable {E : Type}

/-- The **discrete local curvature** at `x`: the column Möbius sum `∑_{y ≼ x} μ(y,x)` — the integer
the incidence d'Alembertian carries on the unit field, `□1(x)`. -/
def localCurvature [DecidableEq E] (es : List E) (prec : E → E → Bool) (x : E) : Int :=
  (es.filter (fun y => leqB prec y x)).foldr (fun y acc => mobius es prec y x + acc) 0

/-- The **discrete Einstein–Hilbert (Benincasa–Dowker) action** `S = ∑_x □1(x)`: the total local
curvature over the events. -/
def bdAction [DecidableEq E] (es : List E) (prec : E → E → Bool) : Int :=
  es.foldr (fun x acc => localCurvature es prec x + acc) 0

/-- **The diamond's local-curvature profile** `(1, 0, 0, 0)`: the column Möbius sum is `1` at the
minimal event `0` and `0` elsewhere — the curvature is the boundary (minimality) indicator. -/
theorem diamond_localCurvature :
    localCurvature fourEvents diamondPrec 0 = 1
    ∧ localCurvature fourEvents diamondPrec 1 = 0
    ∧ localCurvature fourEvents diamondPrec 2 = 0
    ∧ localCurvature fourEvents diamondPrec 3 = 0 := by
  refine ⟨by decide, by decide, by decide, by decide⟩

/-- **The diamond's discrete Einstein–Hilbert action is `1`** — its single minimal (initial
boundary) event. The action of the incidence d'Alembertian on the unit field counts the causal
boundary. -/
theorem diamond_bdAction : bdAction fourEvents diamondPrec = 1 := by decide

end CausalSets.Action.EinsteinHilbertAction
end Obsmetrologia
