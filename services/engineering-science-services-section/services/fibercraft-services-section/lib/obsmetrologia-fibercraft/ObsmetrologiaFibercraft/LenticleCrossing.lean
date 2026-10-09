import Obsmetrologia.AperiodicOrder.Tiling.LenticleIdentification
import Obsmetrologia.AperiodicOrder.Tiling.PortGraph
import ObsmetrologiaFibercraft.WeaveDraft

/-!
# Lenticle crossings: the weave at a lenticle and at a bead

The plain-weave crossing read at the two places the pure tiling carriers meet it:

* a lenticle of two clopen patches carries the weave's crossing reading at the overlap, and is
  inconsistent exactly at a mis-crossing (`lenticleCrossingReading_inconsistency_iff_both_over`);
* a lenticule's hole transition is the plain-weave warp rule (`holeTransition_eq_warpAlt`): a bead
  is a crossing on a rigid body.
-/

namespace Obsmetrologia

/-- A lenticle-local crossing reading is the existing crossing reading read at the overlap. -/
def lenticleCrossingReading (_U₁ _U₂ : Site.Clopen) (warpOver weftOver : Bool) : Reading :=
  AperiodicOrder.Tiling.crossingReading warpOver weftOver

/-- The lenticle-local crossing reading is definitionally the existing crossing reading;
the clopen parameters only record the overlap locus where it is read. -/
@[simp] theorem lenticleCrossingReading_eq_crossingReading
    (U₁ U₂ : Site.Clopen) (warpOver weftOver : Bool) :
    lenticleCrossingReading U₁ U₂ warpOver weftOver =
      AperiodicOrder.Tiling.crossingReading warpOver weftOver := rfl

/-- The lenticle-local mis-crossing is the existing mis-crossing theorem at the overlap. -/
theorem lenticle_miscrossing_isInconsistency (U₁ U₂ : Site.Clopen) :
    Reading.isInconsistency (lenticleCrossingReading U₁ U₂ true true) = true :=
  by simpa using AperiodicOrder.Tiling.miscrossing_isInconsistency

/-- The lenticle-local crossing reading is inconsistent exactly in the
mis-crossing case: both strands assert the over-crossing. -/
theorem lenticleCrossingReading_inconsistency_iff_both_over
    (U₁ U₂ : Site.Clopen) (warpOver weftOver : Bool) :
  Reading.isInconsistency (lenticleCrossingReading U₁ U₂ warpOver weftOver) = true ↔
      warpOver = true ∧ weftOver = true := by
  cases warpOver <;> cases weftOver
  · simp [lenticleCrossingReading, AperiodicOrder.Tiling.hole_is_kBot, Reading.isInconsistency,
      Reading.kBot, Reading.kTop]
  · simp [lenticleCrossingReading, AperiodicOrder.Tiling.crossingReading, Reading.isInconsistency,
      Reading.kTop, Articulating.FourCorner.toCorner, Articulating.Corner.ofStatus]
  · simp [lenticleCrossingReading, AperiodicOrder.Tiling.crossingReading, Reading.isInconsistency,
      Reading.kTop, Articulating.FourCorner.toCorner, Articulating.Corner.ofStatus]
  · simpa using lenticle_miscrossing_isInconsistency U₁ U₂

/-- A defect-free lenticle-local crossing carries no inconsistency. -/
theorem lenticle_defectFree_consistent (U₁ U₂ : Site.Clopen) (b : Bool) :
    Reading.isInconsistency (lenticleCrossingReading U₁ U₂ b (!b)) = false := by
  simpa [lenticleCrossingReading] using AperiodicOrder.Tiling.defectFree_consistent b

namespace AperiodicOrder.Tiling

/-- **A lenticule's hole transition is the plain-weave crossing rule.** Beadwork's local routing
law and weaving's crossing law are one object; a bead is a crossing on a rigid body. -/
theorem holeTransition_eq_warpAlt : holeTransition = warpAlt := rfl

end AperiodicOrder.Tiling
end Obsmetrologia
