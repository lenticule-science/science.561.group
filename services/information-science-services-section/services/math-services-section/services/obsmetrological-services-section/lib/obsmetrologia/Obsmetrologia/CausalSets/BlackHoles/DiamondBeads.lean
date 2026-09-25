import Obsmetrologia.AperiodicOrder.Crystal.Glass
import Obsmetrologia.CausalSets.BlackHoles.ArticulationDiamond
import Obsmetrologia.CausalSets.BlackHoles.HoleDiamondCausalSet

/-!
# Diamond beads

This module isolates the proved part of the "dish = beads over diamonds"
reading.  The bead adjacency on causal diamonds is not supplied as loose graph
data: its thread graph is the existing diamond sequencing relation.  The other
material inputs of a `Glass.Beads` layer remain material payloads.
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles

open Obsmetrologia.Discrete
open Obsmetrologia.CausalSets.Causal.Order

variable {E : Type} (C : CausalSet E)

/-- The canonical bead adjacency on diamond points, with thread adjacency given
by the already-proved sequencing relation on causal diamonds.

The four readings are intentionally not claimed to be separated here; this is
the minimal diamond-bead adjacency that fixes the thread graph to sequencing. -/
def sequencingBeadAdjacency [CausalLeDecision C] :
    AperiodicOrder.Crystal.BeadAdjacency (DiamondPoint C) where
  thread := sequencingPrec0 C
  contact := sequencingPrec0 C
  cell := sequencingPrec0 C
  visible := sequencingPrec0 C

/-- The canonical diamond-bead thread graph is exactly diamond sequencing. -/
@[simp] theorem sequencingBeadAdjacency_thread [CausalLeDecision C] :
    (sequencingBeadAdjacency C).thread = sequencingPrec0 C :=
  rfl

/-- The canonical diamond-bead adjacency tuple is four readings of sequencing.
No pairwise-separation theorem is claimed here. -/
theorem sequencingBeadAdjacency_tuple [CausalLeDecision C] :
    (sequencingBeadAdjacency C).tuple =
      (sequencingPrec0 C, sequencingPrec0 C, sequencingPrec0 C, sequencingPrec0 C) :=
  rfl

/-- The canonical diamond-bead thread graph has the strict-order closure already
proved for diamond sequencing. -/
def sequencingBeadAdjacencyThreadClosure [CausalLeDecision C] :
    Graph.StrictOrderClosure (sequencingBeadAdjacency C).thread := by
  simpa [sequencingBeadAdjacency] using sequencingStrictOrderClosure C

/-- The derived legal bead thread over the listed diamond points: each diamond
is passed through the fixed port transition `false -> true`. -/
def diamondThread [DecidableRel C.reaches] :
    AperiodicOrder.Tiling.Thread (DiamondPoint C) :=
  (DiamondPoint.events C).map fun p => (p, false, true)

/-- The derived diamond thread is legal because every generated pass uses
distinct ports. -/
theorem diamondThread_legal [DecidableRel C.reaches] :
    AperiodicOrder.Tiling.ThreadLegal (diamondThread C) := by
  intro pass hp
  simp [diamondThread] at hp
  obtain ⟨p, _hp, hpass⟩ := hp
  subst pass
  exact (AperiodicOrder.Tiling.legal_iff_distinct p false true).2 (by decide)

/-- Material payload needed to promote the canonical diamond thread and
sequencing adjacency to a `Glass.Beads` layer.  The causal thread and adjacency
are derived; the remaining fields are the non-causal material realization data
that `Glass.Beads` also requires. -/
structure SequencingDiamondBeadPayload [CausalLeDecision C] [DecidableRel C.reaches] where
  /-- Tile data carried by the material layer. -/
  tiles : AperiodicOrder.Crystal.Tiles
  /-- The finite site-level material realization. -/
  realization : AperiodicOrder.Crystal.BeadMaterialRealization
  /-- The finite placement/contact topology. -/
  placement : AperiodicOrder.Tiling.PlacementGraph

namespace SequencingDiamondBeadPayload

/-- The canonical `Glass.Beads` layer over causal diamonds generated from the
derived diamond thread and sequencing adjacency. -/
def toBeads [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) : AperiodicOrder.Crystal.Beads where
  tiles := P.tiles
  Lenticule := DiamondPoint C
  thread := diamondThread C
  threadLegal := diamondThread_legal C
  adjacency := sequencingBeadAdjacency C
  realization := P.realization
  placement := P.placement

/-- The bead layer's carrier is the diamond-point carrier. -/
@[simp] theorem toBeads_lenticule [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.Lenticule = DiamondPoint C :=
  rfl

/-- The bead layer's thread is the derived diamond thread. -/
@[simp] theorem toBeads_thread [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.thread = diamondThread C :=
  rfl

/-- The bead layer's thread adjacency is the already-proved sequencing relation. -/
@[simp] theorem toBeads_threadAdjacency [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.threadAdjacency = sequencingPrec0 C :=
  rfl

/-- Therefore the promoted bead layer's thread adjacency has the sequencing
strict-order closure. -/
def toBeads_threadAdjacencyClosure [CausalLeDecision C] [DecidableRel C.reaches]
    (_P : SequencingDiamondBeadPayload C) :
    Graph.StrictOrderClosure (sequencingPrec0 C) :=
  sequencingStrictOrderClosure C

/-- The promoted bead layer's own thread-adjacency field satisfies the acyclicity
condition required by `CausalSet`. -/
def toBeads_threadAdjacencyStrictOrderClosure
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    Graph.StrictOrderClosure P.toBeads.threadAdjacency := by
  simpa [toBeads_threadAdjacency] using sequencingStrictOrderClosure C

/-- The causal set rebuilt from the promoted bead layer's thread adjacency. -/
def toBeadsThreadCausalSet [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) : CausalSet (DiamondPoint C) where
  events := DiamondPoint.events C
  events_nodup := DiamondPoint.events_nodup C C.events_nodup
  prec0 := P.toBeads.threadAdjacency
  acyclic := P.toBeads_threadAdjacencyStrictOrderClosure

/-- The rebuilt causal set uses the bead layer's own thread-adjacency field as
its direct edge relation. -/
@[simp] theorem toBeadsThreadCausalSet_prec0
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeadsThreadCausalSet.prec0 = P.toBeads.threadAdjacency :=
  rfl

/-- The rebuilt causal set is presented by the sequencing edge relation on
diamond points. -/
@[simp] theorem toBeadsThreadCausalSet_prec0_eq_sequencing
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeadsThreadCausalSet.prec0 = sequencingPrec0 C :=
  rfl

/-- Reachability in the causal set rebuilt from the bead thread collapses back
to one sequencing edge.  The bead-thread transitive closure is therefore not a
new order beside sequencing. -/
theorem toBeadsThreadCausalSet_reaches_to_sequencing
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) {p q : DiamondPoint C}
    (h : P.toBeadsThreadCausalSet.reaches p q) :
    sequencingPrec0 C p q = true := by
  simpa [toBeadsThreadCausalSet] using
    sequencing_reaches_to_prec0 (C := C) (p := p) (q := q) h

/-- The same collapse stated against the promoted bead layer's own
`threadAdjacency` projection. -/
theorem toBeadsThreadCausalSet_reaches_to_threadAdjacency
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) {p q : DiamondPoint C}
    (h : P.toBeadsThreadCausalSet.reaches p q) :
    P.toBeads.threadAdjacency p q = true := by
  simpa [toBeads_threadAdjacency] using
    toBeadsThreadCausalSet_reaches_to_sequencing (C := C) P h

/-- The promoted bead layer's four adjacency readings are the canonical
sequencing readings on diamond points. -/
theorem toBeads_adjacencyTuple_eq_sequencing
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.adjacencyTuple =
      (sequencingPrec0 C, sequencingPrec0 C, sequencingPrec0 C, sequencingPrec0 C) :=
  rfl

/-- Existing bead legality applies to the derived diamond thread. -/
theorem toBeads_thread_pass_legal [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C)
    {p : AperiodicOrder.Tiling.ThreadPass (DiamondPoint C)}
    (hp : p ∈ P.toBeads.thread) : AperiodicOrder.Tiling.Legal p :=
  P.toBeads.thread_pass_legal hp

/-- Existing bead port-distinctness applies to the derived diamond thread. -/
theorem toBeads_thread_pass_ports_distinct
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C)
    {p : AperiodicOrder.Tiling.ThreadPass (DiamondPoint C)}
    (hp : p ∈ P.toBeads.thread) : p.2.1 ≠ p.2.2 :=
  P.toBeads.thread_pass_ports_distinct hp

/-- The promoted diamond-bead layer reuses the existing bead lenticle-overlap
theorem. -/
theorem toBeads_geometricLenticle_eq_overlap
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.geometricLenticle =
      Site.meet P.toBeads.realization.leftPatch P.toBeads.realization.rightPatch :=
  P.toBeads.geometricLenticle_eq_overlap

/-- The promoted diamond-bead layer reuses the existing bead cover theorem. -/
theorem toBeads_covers_geometricLenticle_pair
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    Site.Covers P.toBeads.geometricLenticle
      [P.toBeads.geometricLenticle, P.toBeads.geometricLenticle] :=
  P.toBeads.covers_geometricLenticle_pair

/-- The promoted diamond-bead layer reuses the existing empty-thread condensate
law. -/
theorem toBeads_condensate_empty_of_thread_nil
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.thread = [] → P.toBeads.condensate = Charge.kBot :=
  P.toBeads.condensate_empty_of_thread_nil

/-- The promoted diamond-bead layer reuses the existing single-pass condensate
law. -/
theorem toBeads_condensate_single_of_passCount_eq_one
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.passCount.count = 1 → P.toBeads.condensate = Charge.tTop :=
  P.toBeads.condensate_single_of_passCount_eq_one

/-- The promoted diamond-bead layer reuses the existing over-occupation
inconsistency law. -/
theorem toBeads_over_occupation_inconsistency
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) (n : Nat) :
    P.toBeads.passCount.count = n + 2 →
      P.toBeads.condensate.isInconsistency = true :=
  P.toBeads.over_occupation_inconsistency n

/-- The promoted diamond-bead layer reuses the existing mirror-invariance law for
condensate inconsistency. -/
theorem toBeads_mirror_preserves_condensate_inconsistency
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.condensate.negate.isInconsistency =
      P.toBeads.condensate.isInconsistency :=
  P.toBeads.mirror_preserves_condensate_inconsistency

/-- The promoted diamond-bead layer reuses the existing bead load-bearing
threshold theorem. -/
theorem toBeads_loadBearing_of_condensed_crosses_threshold
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    AperiodicOrder.Tiling.percolationThreshold P.toBeads.placement.nerve + 1 ≤
        P.toBeads.condensedContacts →
      AperiodicOrder.Tiling.loadBearing P.toBeads.placement.nerve :=
  P.toBeads.loadBearing_of_condensed_crosses_threshold

/-- The two gap checks packaged together: the promoted layer is a bead layer over
diamond points, its thread adjacency is sequencing, and the existing finite bead
lenticle cover machinery applies unchanged. -/
theorem toBeads_gap_spine
    [CausalLeDecision C] [DecidableRel C.reaches]
    (P : SequencingDiamondBeadPayload C) :
    P.toBeads.Lenticule = DiamondPoint C ∧
      P.toBeads.threadAdjacency = sequencingPrec0 C ∧
        P.toBeads.adjacencyTuple =
          (sequencingPrec0 C, sequencingPrec0 C, sequencingPrec0 C,
            sequencingPrec0 C) ∧
          P.toBeads.geometricLenticle =
            Site.meet P.toBeads.realization.leftPatch
              P.toBeads.realization.rightPatch ∧
            Site.Covers P.toBeads.geometricLenticle
              [P.toBeads.geometricLenticle, P.toBeads.geometricLenticle] := by
  exact ⟨rfl, rfl, rfl, P.toBeads.geometricLenticle_eq_overlap,
    P.toBeads.covers_geometricLenticle_pair⟩

end SequencingDiamondBeadPayload

/-! Mark-threaded specialization of the diamond-bead construction.  These
definitions do not introduce a separate dish carrier: the carrier is
`DiamondPoint` over the causal set generated by one mark-built articulation
step. -/
namespace MarkStepDiamondBeads

/-- The remaining material payload over the mark-generated diamond carrier. -/
abbrev Payload (token claim : Mark) (tail : Articulating) : Type 1 :=
  @SequencingDiamondBeadPayload Articulating
    (markStepCausalSet token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepCausalLeDecision token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepReachesDecidable token claim tail)

/-- The mark-threaded bead adjacency generated by one mark-built articulation
step. -/
def adjacency (token claim : Mark) (tail : Articulating) :
    AperiodicOrder.Crystal.BeadAdjacency
      (DiamondPoint (markStepCausalSet token claim tail)) :=
  @sequencingBeadAdjacency Articulating
    (markStepCausalSet token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepCausalLeDecision token claim tail)

/-- The mark-threaded diamond thread generated by one mark-built articulation
step. -/
def thread (token claim : Mark) (tail : Articulating) :
    AperiodicOrder.Tiling.Thread
      (DiamondPoint (markStepCausalSet token claim tail)) :=
  @diamondThread Articulating
    (markStepCausalSet token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepReachesDecidable token claim tail)

/-- Promote material payload on the mark-generated diamond carrier to beads.
The causal carrier, thread, and adjacency are generated from the two marks and
the articulation tail; the payload supplies only the remaining material fields
required by `Glass.Beads`. -/
def toBeads (token claim : Mark) (tail : Articulating)
    (P : Payload token claim tail) :
    AperiodicOrder.Crystal.Beads :=
  @SequencingDiamondBeadPayload.toBeads Articulating
    (markStepCausalSet token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepCausalLeDecision token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepReachesDecidable token claim tail)
    P

/-- The mark-threaded bead layer's carrier is the diamond-point carrier over
the mark-generated articulation causal set. -/
@[simp] theorem toBeads_lenticule (token claim : Mark) (tail : Articulating)
    (P : Payload token claim tail) :
    (toBeads token claim tail P).Lenticule =
      DiamondPoint (markStepCausalSet token claim tail) :=
  rfl

/-- The mark-threaded bead layer's thread adjacency is diamond sequencing on
the mark-generated articulation causal set. -/
@[simp] theorem toBeads_threadAdjacency
    (token claim : Mark) (tail : Articulating)
    (P : Payload token claim tail) :
    (toBeads token claim tail P).threadAdjacency =
      sequencingPrec0 (markStepCausalSet token claim tail) :=
  rfl

/-- The causal set rebuilt from the mark-threaded bead layer's thread
adjacency. -/
def threadCausalSet (token claim : Mark) (tail : Articulating)
    (P : Payload token claim tail) :
    CausalSet (DiamondPoint (markStepCausalSet token claim tail)) :=
  @SequencingDiamondBeadPayload.toBeadsThreadCausalSet Articulating
    (markStepCausalSet token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepCausalLeDecision token claim tail)
    (Obsmetrologia.CausalSets.BlackHoles.markStepReachesDecidable token claim tail)
    P

/-- The rebuilt mark-threaded bead causal set is presented by diamond
sequencing. -/
@[simp] theorem threadCausalSet_prec0
    (token claim : Mark) (tail : Articulating)
    (P : Payload token claim tail) :
    (threadCausalSet token claim tail P).prec0 =
      sequencingPrec0 (markStepCausalSet token claim tail) :=
  rfl

end MarkStepDiamondBeads

end CausalSets.BlackHoles
end Obsmetrologia
