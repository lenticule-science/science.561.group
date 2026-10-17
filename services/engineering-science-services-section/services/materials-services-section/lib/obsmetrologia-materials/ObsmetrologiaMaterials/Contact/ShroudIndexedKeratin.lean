import ObsmetrologiaMaterials.Contact.Keratin
import ObsmetrologiaPhysicalScience.CausalSets.BlackHoles.Hole

/-!
# Shroud-indexed keratin

This module supplies the first carrier that welds a hole shroud to the
keratin material layer.  It does not assert a disc, area law, entropy law, or
black coloring theorem.  It packages the common index those later claims need:
keratin vertices are addressed by shroud events, and lock histories live over
those vertices.

The carrier is intentionally narrow:

* `hole` supplies the causal no-readout interior and shroud;
* `complex` supplies the directed keratin contact complex;
* `address` maps keratin vertices into proof-carrying causal events;
* `address_shrouded` proves every addressed event point lies on the shroud;
* `history` assigns irreversible lock histories to the indexed stalks.

The basic theorem `lockedSeed_infl` exposes the material law after indexing:
locking still only grows stalk state.
-/

namespace Obsmetrologia
namespace AperiodicOrder.MaterialSectors.Contact

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.BlackHoles

variable {E : Type} {S : Order.CompleteLattice}

/-- A keratin complex indexed by the shroud of a hole. -/
structure ShroudIndexedKeratin (S : Order.CompleteLattice) (E : Type) where
  /-- The hole whose shroud indexes the keratin complex. -/
  hole : Hole E
  /-- The directed keratin contact complex being indexed. -/
  complex : KeratinComplex S
  /-- The proof-carrying causal event address of each keratin vertex. -/
  address : complex.Vertex → Event hole.C
  /-- Every vertex address lies on the hole shroud. -/
  address_shrouded : ∀ v, hole.shroud ((address v).point)
  /-- The irreversible lock history attached to each indexed vertex. -/
  history : complex.Vertex → History S

namespace ShroudIndexedKeratin

variable (K : ShroudIndexedKeratin S E)

/-- The shroud event assigned to a keratin vertex. -/
def shroudEvent (v : K.complex.Vertex) : Event K.hole.C := K.address v

/-- The underlying point of the shroud event assigned to a keratin vertex. -/
def shroudPoint (v : K.complex.Vertex) : E := (K.shroudEvent v).point

/-- Every keratin vertex is addressed by an event on the hole shroud. -/
theorem shroudEvent_on_shroud (v : K.complex.Vertex) :
    K.hole.shroud (K.shroudPoint v) :=
  K.address_shrouded v

/-- Every indexed keratin vertex lies inside the hole interior. -/
theorem shroudEvent_in_hole (v : K.complex.Vertex) :
    K.hole.interior (K.shroudPoint v) :=
  K.hole.shroud_in_interior (K.address_shrouded v)

/-- Apply the shroud-indexed lock history to a seed section. -/
def lockedSeed (seed : Obsmetrologia.Tarski.Assign K.complex) :
    Obsmetrologia.Tarski.Assign K.complex :=
  lockSeed K.complex K.history seed

/-- Shroud-indexed locking is inflationary at every vertex. -/
theorem lockedSeed_infl (seed : Obsmetrologia.Tarski.Assign K.complex) :
    ∀ v, S.le (seed v) (K.lockedSeed seed v) :=
  seed_le_lockSeed K.complex K.history seed

/-- Settling a shroud-indexed locked seed is least among compatible states above it. -/
theorem settle_locked_least_compatible
    (seed x : Obsmetrologia.Tarski.Assign K.complex)
    (hcomp : Obsmetrologia.Tarski.IsCompatible K.complex x)
    (hx : ∀ v, S.le (K.lockedSeed seed v) (x v)) :
    (Obsmetrologia.Tarski.AssignCL S K.complex.Vertex).le
      (Obsmetrologia.Tarski.settle K.complex (K.lockedSeed seed)) x :=
  settle_lock_is_least_compatible K.complex K.history seed x hcomp hx

end ShroudIndexedKeratin

end AperiodicOrder.MaterialSectors.Contact
end Obsmetrologia
