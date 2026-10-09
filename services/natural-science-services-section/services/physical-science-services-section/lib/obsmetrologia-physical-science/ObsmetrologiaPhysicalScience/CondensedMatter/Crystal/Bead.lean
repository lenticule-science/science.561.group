import ObsmetrologiaPhysicalScience.CondensedMatter.Crystal.Tile
import Obsmetrologia.AperiodicOrder.Tiling.PortGraph
import ObsmetrologiaPhysicalScience.CondensedMatter.Percolation
import Obsmetrologia.AperiodicOrder.Tiling.LenticleIdentification

/-!
# Beads: the lenticular ported-thread layer

`Beads` insert the lenticular ported-thread layer between tiles and crystals:
a rigid lenticule carrier, a routed thread walk proven legal against the
hole-transition rule, four named adjacency readings, a finite site-level
material realization, and a contact placement/topology.

## Main definitions
* `BeadAdjacency`, `BeadMaterialRealization`, `BeadPassCount`, `Beads`.

## Main results
* `BeadAdjacency` records the four named bead adjacency graphs before any
  pairwise-distinctness or visible-factor theorem is claimed.
* `BeadMaterialRealization` records the finite site-level lenticle as the
  overlap of two clopen material patches.
* `Beads.thread_pass_ports_distinct` exposes the port-routing law carried by
  beads before crystals read them.

## References
Corpus glass line; the beadwork-mathematics survey.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Crystal

open Obsmetrologia.Discrete (Graph)

/-- The four finite adjacency readings carried by one bead layer.  They share
the same lenticule carrier; proving that they are pairwise distinct, or that the
visible graph is a sofic factor of the thread graph, is a separate frontier
claim. -/
structure BeadAdjacency (Lenticule : Type) where
  /-- Thread-neighbour relation induced by routed passes. -/
  thread : Graph Lenticule
  /-- Physical contact-neighbour relation induced by placed bead contacts. -/
  contact : Graph Lenticule
  /-- Cell-neighbour relation used by local beadwork cells. -/
  cell : Graph Lenticule
  /-- Visible-surface neighbour relation after the finished surface is read. -/
  visible : Graph Lenticule

namespace BeadAdjacency

/-- The four adjacency graphs as one ordered tuple. -/
def tuple {Lenticule : Type} (A : BeadAdjacency Lenticule) :
    Graph Lenticule × Graph Lenticule × Graph Lenticule × Graph Lenticule :=
  (A.thread, A.contact, A.cell, A.visible)

/-- The tuple projection contains exactly the four named adjacency graphs. -/
theorem tuple_eq {Lenticule : Type} (A : BeadAdjacency Lenticule) :
    A.tuple = (A.thread, A.contact, A.cell, A.visible) :=
  rfl

end BeadAdjacency

/-- A finite site-level realization of a bead/lenticle: two clopen material
patches covering an ambient patch, with the lenticle identified as their
overlap.  This is geometric in the finite site sense; it is not an analytic
embedding or continuum mechanics theorem. -/
structure BeadMaterialRealization where
  /-- The ambient material patch covered by the two bead-side patches. -/
  ambientPatch : Site.Clopen
  /-- The left clopen patch. -/
  leftPatch : Site.Clopen
  /-- The right clopen patch. -/
  rightPatch : Site.Clopen
  /-- The two patches cover the ambient patch. -/
  twoPatchCover : Site.Covers ambientPatch [leftPatch, rightPatch]

namespace BeadMaterialRealization

/-- The realized lenticle is the overlap of the two clopen patches. -/
def lenticle (R : BeadMaterialRealization) : Site.Clopen :=
  Lenticle R.leftPatch R.rightPatch

/-- The realized lenticle is exactly the clopen overlap. -/
theorem lenticle_eq_overlap (R : BeadMaterialRealization) :
    R.lenticle = Site.meet R.leftPatch R.rightPatch :=
  Obsmetrologia.lenticle_eq_overlap R.leftPatch R.rightPatch

/-- The realized lenticle lies under the left material patch. -/
theorem lenticle_sub_left (R : BeadMaterialRealization) :
    Site.sub R.lenticle R.leftPatch :=
  Obsmetrologia.lenticle_sub_left R.leftPatch R.rightPatch

/-- The realized lenticle lies under the right material patch. -/
theorem lenticle_sub_right (R : BeadMaterialRealization) :
    Site.sub R.lenticle R.rightPatch :=
  Obsmetrologia.lenticle_sub_right R.leftPatch R.rightPatch

/-- Pulling the two-patch material cover back to the lenticle gives the
duplicated overlap cover. -/
theorem covers_lenticle_pair (R : BeadMaterialRealization) :
    Site.Covers R.lenticle [R.lenticle, R.lenticle] :=
  Obsmetrologia.covers_lenticle_pair R.twoPatchCover

end BeadMaterialRealization

/-- The finite pass count carried by a bead thread. -/
structure BeadPassCount where
  /-- The underlying finite number of retained thread passes. -/
  count : Nat

namespace BeadPassCount

/-- Build a bead pass-count carrier from a finite count. -/
def ofNat (n : Nat) : BeadPassCount := ⟨n⟩

@[simp] theorem ofNat_count (n : Nat) : (ofNat n).count = n := rfl

end BeadPassCount

/-- `Beads` insert the lenticular ported-thread layer between tiles and
crystals. -/
structure Beads where
  /-- The tile layer carried by the beadwork. -/
  tiles : Tiles
  /-- The rigid lenticule carrier. -/
  Lenticule : Type
  /-- The routed thread walk through lenticules. -/
  thread : AperiodicOrder.Tiling.Thread Lenticule
  /-- Every thread pass is legal for the lenticular hole rule. -/
  threadLegal : AperiodicOrder.Tiling.ThreadLegal thread
  /-- The four adjacency readings on the same lenticule carrier. -/
  adjacency : BeadAdjacency Lenticule
  /-- The finite site-level material realization of the bead lenticle. -/
  realization : BeadMaterialRealization
  /-- The finite contact placement/topology induced by condensed lenticules. -/
  placement : AperiodicOrder.Tiling.PlacementGraph

namespace Beads

/-- The finite pass-count carrier of a bead layer. -/
def passCount (B : Beads) : BeadPassCount :=
  BeadPassCount.ofNat B.thread.length

/-- The condensate reading carried by the bead layer's thread occupation. -/
def condensate (B : Beads) : Reading :=
  AperiodicOrder.Tiling.condensate B.passCount.count

/-- The number of condensed contacts supplied by the bead placement. -/
def condensedContacts (B : Beads) : Nat :=
  B.placement.condensedContacts

/-- The site-level lenticle realized by the bead layer. -/
def geometricLenticle (B : Beads) : Site.Clopen :=
  B.realization.lenticle

/-- The bead layer's site-level lenticle is the overlap of its two material
patches. -/
theorem geometricLenticle_eq_overlap (B : Beads) :
    B.geometricLenticle =
      Site.meet B.realization.leftPatch B.realization.rightPatch :=
  B.realization.lenticle_eq_overlap

/-- The bead layer's site-level lenticle lies under the left material patch. -/
theorem geometricLenticle_sub_left (B : Beads) :
    Site.sub B.geometricLenticle B.realization.leftPatch :=
  B.realization.lenticle_sub_left

/-- The bead layer's site-level lenticle lies under the right material patch. -/
theorem geometricLenticle_sub_right (B : Beads) :
    Site.sub B.geometricLenticle B.realization.rightPatch :=
  B.realization.lenticle_sub_right

/-- Pulling the bead layer's two-patch material cover back to its site-level
lenticle gives the duplicated overlap cover. -/
theorem covers_geometricLenticle_pair (B : Beads) :
    Site.Covers B.geometricLenticle [B.geometricLenticle, B.geometricLenticle] :=
  B.realization.covers_lenticle_pair

/-- The bead layer's routed-thread adjacency graph. -/
def threadAdjacency (B : Beads) : Graph B.Lenticule :=
  B.adjacency.thread

/-- The bead layer's physical contact adjacency graph. -/
def contactAdjacency (B : Beads) : Graph B.Lenticule :=
  B.adjacency.contact

/-- The bead layer's local cell adjacency graph. -/
def cellAdjacency (B : Beads) : Graph B.Lenticule :=
  B.adjacency.cell

/-- The bead layer's visible-surface adjacency graph. -/
def visibleAdjacency (B : Beads) : Graph B.Lenticule :=
  B.adjacency.visible

/-- The bead layer carries four named adjacency graphs on the same carrier. -/
def adjacencyTuple (B : Beads) :
    Graph B.Lenticule × Graph B.Lenticule × Graph B.Lenticule ×
      Graph B.Lenticule :=
  B.adjacency.tuple

/-- The bead adjacency tuple is exactly thread, contact, cell, and visible
adjacency in that order. -/
theorem adjacencyTuple_eq (B : Beads) :
    B.adjacencyTuple =
      (B.threadAdjacency, B.contactAdjacency, B.cellAdjacency,
        B.visibleAdjacency) :=
  rfl

/-- The bead placement's contact cells are exactly its condensed contacts. -/
theorem placement_cells_eq_condensed (B : Beads) :
    B.placement.nerve.cells = B.condensedContacts := by
  unfold condensedContacts
  exact B.placement.cells_eq_condensed

/-- Every retained thread pass of a bead layer is legal. -/
theorem thread_pass_legal (B : Beads)
    {p : AperiodicOrder.Tiling.ThreadPass B.Lenticule}
    (hp : p ∈ B.thread) : AperiodicOrder.Tiling.Legal p :=
  B.threadLegal p hp

/-- A retained bead-thread pass enters and exits through distinct ports. -/
theorem thread_pass_ports_distinct (B : Beads)
    {p : AperiodicOrder.Tiling.ThreadPass B.Lenticule}
    (hp : p ∈ B.thread) : p.2.1 ≠ p.2.2 :=
  (AperiodicOrder.Tiling.legal_iff_distinct p.1 p.2.1 p.2.2).mp
    (B.thread_pass_legal hp)

/-- An empty bead thread carries the empty condensate pole. -/
theorem condensate_empty_of_thread_nil (B : Beads)
    (h : B.thread = []) : B.condensate = Reading.kBot := by
  unfold condensate passCount
  rw [h]
  rfl

/-- A singly occupied bead thread carries the definite truth pole. -/
theorem condensate_single_of_passCount_eq_one (B : Beads)
    (h : B.passCount.count = 1) : B.condensate = Reading.tTop := by
  unfold condensate
  rw [h]
  rfl

/-- A bead layer occupied at least twice carries the held contradiction pole. -/
theorem over_occupation_inconsistency (B : Beads) (n : Nat)
    (h : B.passCount.count = n + 2) :
    B.condensate.isInconsistency = true := by
  unfold condensate
  rw [h]
  exact AperiodicOrder.Tiling.over_occupation_inconsistency n

/-- Mirroring a bead condensate preserves its contradiction content. -/
theorem mirror_preserves_condensate_inconsistency (B : Beads) :
    (Reading.negate B.condensate).isInconsistency =
      B.condensate.isInconsistency := by
  unfold condensate
  exact AperiodicOrder.Tiling.mirror_fixes_condensate B.passCount.count

/-- A bead placement bears load once its condensed contacts cross the finite
percolation threshold. -/
theorem loadBearing_of_condensed_crosses_threshold (B : Beads)
    (h : AperiodicOrder.Tiling.percolationThreshold B.placement.nerve + 1 ≤
      B.condensedContacts) :
    AperiodicOrder.Tiling.loadBearing B.placement.nerve :=
  B.placement.loadBearing_of_condensed_crosses_threshold h

end Beads

end AperiodicOrder.Crystal
end Obsmetrologia
