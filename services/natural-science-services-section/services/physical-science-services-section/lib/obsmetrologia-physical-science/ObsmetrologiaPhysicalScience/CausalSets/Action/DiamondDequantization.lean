import Obsmetrologia.Calculus.Probability.MagnitudeWitness
import ObsmetrologiaPhysicalScience.CausalSets.Action.EinsteinHilbertAction

/-!
# The causal diamond under dequantization

The four-event causal diamond read through `Probability.Dequantization`: its apex count
(a `p = 1` magnitude) dequantizes to existence, and its local curvature fires the
non-divisibility `witness` exactly where it is nonzero.

## Main results

* `supp_apexCount_diamond` — `|Apex| = 5` dequantizes to `true`.
* `diamond_boundary_witness` / `diamond_interior_no_witness` — curvature `≠ 0` iff the witness fires.
-/

namespace Obsmetrologia
namespace Probability.Dequantization

open Obsmetrologia.CausalSets.Action.EinsteinHilbertAction

/-! ## (D) The arc tie — magnitude dequantizes to shape

The curvature arc lives on the `p = 1` (counting) face — the action, the curvature, the apex count are
`ℕ`/`ℤ` magnitudes. Dequantizing sends each to its `p = ∞` existence projection: the green order/shape the
settling machinery computes. -/

open Obsmetrologia.CausalSets.Dimension.OrderingFraction

/-- **The diamond's apex magnitude dequantizes to its existence projection.** `|Apex| = 5` (a `p = 1`
magnitude) maps under `supp` to `true` (the `p = ∞` projection: the diamond *has* causal order). The
magnitude `5` is the data the dequantization discards; `true` is the order-shape it keeps. -/
theorem supp_apexCount_diamond :
    supp (apexCount fourEvents diamondPrec) = true := by decide

/-! ## (C) The curvature witness — `≠ 0` iff the witness fires

The diamond's local curvature is `1` at the minimal (past-boundary) event and `0` in the interior
(`diamond_localCurvature`). Reading its magnitude through `witness` shows the witness fires exactly
where the curvature is nonzero — the discrete Ricci witness as a non-divisibility. -/

/-- **The diamond's boundary curvature carries the witness.** The magnitude `|□1(0)| = 1` gives
`witness D = true` for every `D ≥ 2`: the past-boundary curvature is an always-on non-divisibility. -/
theorem diamond_boundary_witness (D : Nat) (hD : 2 ≤ D) :
    witness D (Int.natAbs (localCurvature fourEvents diamondPrec 0)) = true := by
  rw [show localCurvature fourEvents diamondPrec 0 = 1 from diamond_localCurvature.1]
  exact witness_one D hD

/-- **The diamond's interior carries no witness.** The magnitude `|□1(3)| = 0` gives `witness D =
false`: the flat interior has `D ∣ 0`, no non-divisibility. So curvature `≠ 0 ↔` the witness fires. -/
theorem diamond_interior_no_witness (D : Nat) :
    witness D (Int.natAbs (localCurvature fourEvents diamondPrec 3)) = false := by
  rw [show localCurvature fourEvents diamondPrec 3 = 0 from diamond_localCurvature.2.2.2]
  exact witness_zero D

end Probability.Dequantization
end Obsmetrologia
