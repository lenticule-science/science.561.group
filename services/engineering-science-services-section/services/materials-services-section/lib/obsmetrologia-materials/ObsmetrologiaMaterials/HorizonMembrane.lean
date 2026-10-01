import ObsmetrologiaPhysicalScience.CausalSets.BlackHoles.Horizon
import ObsmetrologiaMaterials.Contact.ShroudIndexedKeratin

/-!
# Horizon membrane

The finite membrane carrier of a readout horizon is the shroud-indexed keratin object: a
material contact complex whose vertices are indexed by shroud events. Its lock histories are
inflationary and settle to the least compatible state.
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles.Horizon

open AperiodicOrder.MaterialSectors.Contact

variable {E : Type}

/-- The finite membrane carrier is the already defined shroud-indexed keratin
object: a material contact complex indexed by shroud events. -/
abbrev HorizonMembrane (S : Order.CompleteLattice) (E : Type) : Type 1 :=
  ShroudIndexedKeratin S E

/-- A membrane vertex is indexed by a shroud event. -/
theorem HorizonMembrane.vertex_on_shroud {S : Order.CompleteLattice}
    (M : HorizonMembrane S E) (v : M.complex.Vertex) :
    M.hole.shroud (M.shroudPoint v) = true :=
  M.shroudEvent_on_shroud v

/-- A membrane vertex indexed by the shroud is inside the represented hole. -/
theorem HorizonMembrane.vertex_in_interior {S : Order.CompleteLattice}
    (M : HorizonMembrane S E) (v : M.complex.Vertex) :
    M.hole.interior (M.shroudPoint v) = true :=
  M.shroudEvent_in_hole v

/-- Horizon-membrane lock histories inflate every seed stalk. -/
theorem HorizonMembrane.lockedSeed_infl {S : Order.CompleteLattice}
    (M : HorizonMembrane S E) (seed : Obsmetrologia.Tarski.Assign M.complex) :
    ∀ v, S.le (seed v) (M.lockedSeed seed v) :=
  ShroudIndexedKeratin.lockedSeed_infl M seed

/-- Settling a locked horizon-membrane seed is least among compatible states
above it. -/
theorem HorizonMembrane.settle_locked_least_compatible
    {S : Order.CompleteLattice}
    (M : HorizonMembrane S E)
    (seed x : Obsmetrologia.Tarski.Assign M.complex)
    (hcomp : Obsmetrologia.Tarski.IsCompatible M.complex x)
    (hx : ∀ v, S.le (M.lockedSeed seed v) (x v)) :
    (Obsmetrologia.Tarski.AssignCL S M.complex.Vertex).le
      (Obsmetrologia.Tarski.settle M.complex (M.lockedSeed seed)) x :=
  ShroudIndexedKeratin.settle_locked_least_compatible M seed x hcomp hx

end CausalSets.BlackHoles.Horizon
end Obsmetrologia
