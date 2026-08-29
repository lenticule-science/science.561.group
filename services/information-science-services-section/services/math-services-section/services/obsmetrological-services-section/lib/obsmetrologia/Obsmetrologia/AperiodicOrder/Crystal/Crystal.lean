import Obsmetrologia.AperiodicOrder.Crystal.Bead

/-!
# Crystals: bead-supported finite occupation patterns

`Crystals` are bead-supported finite occupation patterns: a bead layer
carrying a finite cyclic size parameter and an occupation pattern on its
sites.

## Main definitions
* `Crystals`

## Main results
* `Crystals.bead_phase_spine` — a crystal whose bead layer is over-occupied
  and whose bead placement crosses the finite percolation threshold retains
  the finite bead spine.

## References
Corpus glass line.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Crystal

open Obsmetrologia.Discrete (Graph)

/-- `Crystals` are bead-supported finite occupation patterns. -/
structure Crystals where
  /-- The bead layer below the crystal pattern. -/
  beads : Beads
  /-- The finite cyclic size parameter. -/
  period : Nat
  /-- The finite occupation pattern on `period + 1` sites. -/
  occupation : Fin (period + 1) → Bool

namespace Crystals

/-- The bead-thread pass-count carrier carried upward into a crystal. -/
def beadPassCount (X : Crystals) : BeadPassCount :=
  X.beads.passCount

/-- The bead condensate charge carried upward into a crystal. -/
def beadCondensate (X : Crystals) : Charge :=
  X.beads.condensate

/-- The four bead adjacency graphs carried upward into a crystal. -/
def beadAdjacency (X : Crystals) : BeadAdjacency X.beads.Lenticule :=
  X.beads.adjacency

/-- The bead material realization carried upward into a crystal. -/
def beadRealization (X : Crystals) : BeadMaterialRealization :=
  X.beads.realization

/-- The site-level bead lenticle carried upward into a crystal. -/
def beadGeometricLenticle (X : Crystals) : Site.Clopen :=
  X.beads.geometricLenticle

/-- The bead placement carried upward into a crystal. -/
def beadPlacement (X : Crystals) : AperiodicOrder.Tiling.PlacementGraph :=
  X.beads.placement

/-- The condensed contact count carried upward into a crystal. -/
def beadCondensedContacts (X : Crystals) : Nat :=
  X.beads.condensedContacts

/-- A crystal carries the same four bead adjacency graphs as its bead layer. -/
theorem beadAdjacency_tuple_eq (X : Crystals) :
    X.beadAdjacency.tuple = X.beads.adjacencyTuple :=
  rfl

/-- A crystal's site-level bead lenticle is the overlap of its two material
patches. -/
theorem beadGeometricLenticle_eq_overlap (X : Crystals) :
    X.beadGeometricLenticle =
      Site.meet X.beadRealization.leftPatch X.beadRealization.rightPatch :=
  X.beads.geometricLenticle_eq_overlap

/-- Pulling a crystal's carried bead cover back to the bead lenticle gives the
duplicated overlap cover. -/
theorem covers_beadGeometricLenticle_pair (X : Crystals) :
    Site.Covers X.beadGeometricLenticle
      [X.beadGeometricLenticle, X.beadGeometricLenticle] :=
  X.beads.covers_geometricLenticle_pair

/-- A crystal retains the legal bead thread that supports it. -/
theorem beadThreadLegal (X : Crystals) :
    AperiodicOrder.Tiling.ThreadLegal X.beads.thread :=
  X.beads.threadLegal

/-- Every bead-thread pass retained by a crystal routes through distinct ports. -/
theorem bead_pass_ports_distinct (X : Crystals)
    {p : AperiodicOrder.Tiling.ThreadPass X.beads.Lenticule}
    (hp : p ∈ X.beads.thread) : p.2.1 ≠ p.2.2 :=
  X.beads.thread_pass_ports_distinct hp

/-- A crystal whose bead support is occupied at least twice carries the held
contradiction pole inherited from its bead layer. -/
theorem bead_over_occupation_inconsistency (X : Crystals) (n : Nat)
    (h : X.beadPassCount.count = n + 2) :
    X.beadCondensate.isInconsistency = true :=
  X.beads.over_occupation_inconsistency n h

/-- Mirroring the bead condensate carried by a crystal preserves contradiction
content. -/
theorem mirror_preserves_beadCondensate_inconsistency (X : Crystals) :
    (Charge.negate X.beadCondensate).isInconsistency =
      X.beadCondensate.isInconsistency :=
  X.beads.mirror_preserves_condensate_inconsistency

/-- A crystal's bead placement bears load once its condensed contacts cross the
finite percolation threshold. -/
theorem bead_loadBearing_of_condensed_crosses_threshold (X : Crystals)
    (h : AperiodicOrder.Tiling.percolationThreshold X.beadPlacement.nerve + 1 ≤
      X.beadCondensedContacts) :
    AperiodicOrder.Tiling.loadBearing X.beadPlacement.nerve :=
  X.beads.loadBearing_of_condensed_crosses_threshold h

/-- A crystal whose bead layer is over-occupied and whose bead placement
crosses the finite percolation threshold retains the finite bead spine: legal
thread, contradiction-bearing condensate, mirror-stable contradiction,
multi-adjacency, site-level lenticle realization, and load-bearing placement. -/
theorem bead_phase_spine (X : Crystals) (n : Nat)
    (hocc : X.beadPassCount.count = n + 2)
    (hload :
      AperiodicOrder.Tiling.percolationThreshold X.beadPlacement.nerve + 1 ≤
        X.beadCondensedContacts) :
    AperiodicOrder.Tiling.ThreadLegal X.beads.thread ∧
      X.beadCondensate.isInconsistency = true ∧
        (Charge.negate X.beadCondensate).isInconsistency =
          X.beadCondensate.isInconsistency ∧
          X.beadAdjacency.tuple = X.beads.adjacencyTuple ∧
            X.beadGeometricLenticle =
              Site.meet X.beadRealization.leftPatch
                X.beadRealization.rightPatch ∧
              Site.Covers X.beadGeometricLenticle
                [X.beadGeometricLenticle, X.beadGeometricLenticle] ∧
                AperiodicOrder.Tiling.loadBearing X.beadPlacement.nerve :=
  ⟨X.beadThreadLegal,
    X.bead_over_occupation_inconsistency n hocc,
    X.mirror_preserves_beadCondensate_inconsistency,
    X.beadAdjacency_tuple_eq,
    X.beadGeometricLenticle_eq_overlap,
    X.covers_beadGeometricLenticle_pair,
    X.bead_loadBearing_of_condensed_crosses_threshold hload⟩

end Crystals

end AperiodicOrder.Crystal
end Obsmetrologia
