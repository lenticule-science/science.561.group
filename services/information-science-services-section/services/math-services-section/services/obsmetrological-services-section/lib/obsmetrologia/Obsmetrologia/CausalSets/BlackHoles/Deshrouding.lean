import Obsmetrologia.CausalSets.BlackHoles.HoleDiamondCausalSet

/-!
# Deshrouding — a shroud event read as a diamond's upper endpoint

A `DiamondPoint C` needs a genuine upper endpoint: a listed event the lower
endpoint strictly reaches. Before that endpoint is settled, the currently
furthest-witnessed event standing in for it is on the `Shroud` — inside the
hole region, adjacent to the readout exterior, but not itself exterior. This
module names the move of reading such a shroud event directly as a diamond's
`upper`, without waiting for the readout to be reached, and proves the two
facts that make the move sound: the produced diamond's upper endpoint is
honestly not-yet-exterior, and diamonds built this way only grow — nesting
the earlier proxy — as the witnessed shroud event advances.

## Main definitions

* `deshroudedDiamondPoint` — a `DiamondPoint` whose upper endpoint is a
  witnessed shroud event rather than a settled readout member.

## Main results

* `deshroudedDiamondPoint_upper_not_exterior` — a deshrouded diamond's upper
  endpoint is never in the readout exterior.
* `deshroudedDiamondPoint_nested_of_causalLe` — deshrouding a later-reached
  shroud event nests the earlier deshrouded diamond under the same lower
  endpoint.

## References

`Obsmetrologia.CausalSets.BlackHoles` (`Shroud`, `shroud_not_exterior`,
`HoleRegion`, `ReadoutExterior`); `Obsmetrologia.CausalSets.BlackHoles.HoleDiamondCausalSet`
(`DiamondPoint`, `nestingPrec0`).

## Tags

shroud, causal diamond, hole region, kinematic space, deshrouding
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone

variable {E : Type} (C : CausalSet E) [CausalLeDecision C]

/-- A diamond point whose upper endpoint is a currently witnessed shroud event: the
proxy diamond of a run that has not yet reached its true, settled readout. -/
def deshroudedDiamondPoint (readout : Region E) (lower upper : Event C)
    (_hshroud : Shroud C readout upper.point = true)
    (hreaches : C.reaches lower.point upper.point) : DiamondPoint C where
  lower := lower
  upper := upper
  reaches_upper := hreaches

/-- A deshrouded diamond's upper endpoint is not in the readout exterior: the
proxy stands for a run that has not yet reached its readout. -/
theorem deshroudedDiamondPoint_upper_not_exterior (readout : Region E) (lower upper : Event C)
    (hshroud : Shroud C readout upper.point = true)
    (hreaches : C.reaches lower.point upper.point) :
    ReadoutExterior C readout
        (deshroudedDiamondPoint C readout lower upper hshroud hreaches).upper.point = false :=
  shroud_not_exterior C readout hshroud

/-- Deshrouding a later-reached shroud event nests the earlier deshrouded diamond:
the lower endpoint is unchanged, and the upper endpoint only advances. A live
run's proxy diamond only ever grows as more of it is witnessed. -/
theorem deshroudedDiamondPoint_nested_of_causalLe (readout : Region E) (lower upper upper' : Event C)
    (hshroud : Shroud C readout upper.point = true)
    (hshroud' : Shroud C readout upper'.point = true)
    (hreaches : C.reaches lower.point upper.point)
    (hreaches' : C.reaches lower.point upper'.point)
    (hstep : CausalLe C upper.point upper'.point) :
    nestingPrec0 C
        (deshroudedDiamondPoint C readout lower upper hshroud hreaches)
        (deshroudedDiamondPoint C readout lower upper' hshroud' hreaches') = true := by
  simp only [nestingPrec0, deshroudedDiamondPoint, Bool.and_eq_true]
  exact ⟨(causalLeBool_eq_true_iff C lower.point lower.point).2 (causalLe_refl C lower.point),
    (causalLeBool_eq_true_iff C upper.point upper'.point).2 hstep⟩

end CausalSets.BlackHoles
end Obsmetrologia
