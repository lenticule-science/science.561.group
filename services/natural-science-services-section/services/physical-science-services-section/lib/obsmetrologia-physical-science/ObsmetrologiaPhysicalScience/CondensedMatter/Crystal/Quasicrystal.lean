import ObsmetrologiaPhysicalScience.CondensedMatter.Crystal.Crystal
import Obsmetrologia.AperiodicOrder.Tiling.Diffraction
import Obsmetrologia.Dynamics.Flow.ChromaticK4Analytic

/-!
# Quasicrystals: the finite diffraction-event layer

`Quasicrystals` add the finite diffraction-event layer over a crystal
pattern: the intensity event read by finite diffraction mass.

## Main definitions
* `Quasicrystals`, `Quasicrystals.BeadPhaseSpine`

## Main results
* `Quasicrystals.bead_phase_spine` — a quasicrystal whose bead layer is
  over-occupied and whose bead placement crosses the finite percolation
  threshold retains the finite bead spine plus finite diffraction readout.
* `Quasicrystals.bead_phase_k4_analytic_spine` — pairs the bead/quasicrystal
  material readout with the chromatic Rayleigh/gap/diffraction spine.

## References
Corpus glass line.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Crystal

/-- `Quasicrystals` add the finite diffraction-event layer over a crystal
pattern. -/
structure Quasicrystals where
  /-- The crystal pattern below the quasicrystal diagnostic. -/
  crystals : Crystals
  /-- The intensity event read by finite diffraction mass. -/
  intensity : Obsmetrologia.Probability.Measure.Event Nat

namespace Quasicrystals

/-- The bead-thread pass-count carrier carried upward into a quasicrystal. -/
def beadPassCount (Q : Quasicrystals) : BeadPassCount :=
  Q.crystals.beadPassCount

/-- The bead condensate reading carried upward into a quasicrystal. -/
def beadCondensate (Q : Quasicrystals) : Reading :=
  Q.crystals.beadCondensate

/-- The four bead adjacency graphs carried upward into a quasicrystal. -/
def beadAdjacency (Q : Quasicrystals) :
    BeadAdjacency Q.crystals.beads.Lenticule :=
  Q.crystals.beadAdjacency

/-- The bead material realization carried upward into a quasicrystal. -/
def beadRealization (Q : Quasicrystals) : BeadMaterialRealization :=
  Q.crystals.beadRealization

/-- The site-level bead lenticle carried upward into a quasicrystal. -/
def beadGeometricLenticle (Q : Quasicrystals) : Site.Clopen :=
  Q.crystals.beadGeometricLenticle

/-- The bead placement carried upward into a quasicrystal. -/
def beadPlacement (Q : Quasicrystals) : AperiodicOrder.Tiling.PlacementGraph :=
  Q.crystals.beadPlacement

/-- The condensed contact count carried upward into a quasicrystal. -/
def beadCondensedContacts (Q : Quasicrystals) : Nat :=
  Q.crystals.beadCondensedContacts

/-- A quasicrystal carries the same four bead adjacency graphs as its bead
layer. -/
theorem beadAdjacency_tuple_eq (Q : Quasicrystals) :
    Q.beadAdjacency.tuple = Q.crystals.beads.adjacencyTuple :=
  rfl

/-- A quasicrystal's site-level bead lenticle is the overlap of its two material
patches. -/
theorem beadGeometricLenticle_eq_overlap (Q : Quasicrystals) :
    Q.beadGeometricLenticle =
      Site.meet Q.beadRealization.leftPatch Q.beadRealization.rightPatch :=
  Q.crystals.beadGeometricLenticle_eq_overlap

/-- Pulling a quasicrystal's carried bead cover back to the bead lenticle gives
the duplicated overlap cover. -/
theorem covers_beadGeometricLenticle_pair (Q : Quasicrystals) :
    Site.Covers Q.beadGeometricLenticle
      [Q.beadGeometricLenticle, Q.beadGeometricLenticle] :=
  Q.crystals.covers_beadGeometricLenticle_pair

/-- A quasicrystal retains the legal bead thread under its crystal pattern. -/
theorem beadThreadLegal (Q : Quasicrystals) :
    AperiodicOrder.Tiling.ThreadLegal Q.crystals.beads.thread :=
  Q.crystals.beadThreadLegal

/-- Every bead-thread pass retained by a quasicrystal routes through distinct
ports. -/
theorem bead_pass_ports_distinct (Q : Quasicrystals)
    {p : AperiodicOrder.Tiling.ThreadPass Q.crystals.beads.Lenticule}
    (hp : p ∈ Q.crystals.beads.thread) : p.2.1 ≠ p.2.2 :=
  Q.crystals.bead_pass_ports_distinct hp

/-- A quasicrystal whose bead support is occupied at least twice carries the
held contradiction pole inherited from its bead layer. -/
theorem bead_over_occupation_inconsistency (Q : Quasicrystals) (n : Nat)
    (h : Q.beadPassCount.count = n + 2) :
    Q.beadCondensate.isInconsistency = true :=
  Q.crystals.bead_over_occupation_inconsistency n h

/-- Mirroring the bead condensate carried by a quasicrystal preserves
contradiction content. -/
theorem mirror_preserves_beadCondensate_inconsistency (Q : Quasicrystals) :
    (Reading.negate Q.beadCondensate).isInconsistency =
      Q.beadCondensate.isInconsistency :=
  Q.crystals.mirror_preserves_beadCondensate_inconsistency

/-- A quasicrystal's bead placement bears load once its condensed contacts cross
the finite percolation threshold. -/
theorem bead_loadBearing_of_condensed_crosses_threshold (Q : Quasicrystals)
    (h : AperiodicOrder.Tiling.percolationThreshold Q.beadPlacement.nerve + 1 ≤
      Q.beadCondensedContacts) :
    AperiodicOrder.Tiling.loadBearing Q.beadPlacement.nerve :=
  Q.crystals.bead_loadBearing_of_condensed_crosses_threshold h

/-- The crystal occupation pattern under a quasicrystal has full finite
diffraction mass on the universal intensity event. -/
theorem finite_diffraction_mass_univ (Q : Quasicrystals) :
    AperiodicOrder.Tiling.finiteDiffractionMass Q.crystals.period Q.crystals.occupation
      Obsmetrologia.Discrete.Set.univ = Q.crystals.period + 1 :=
  AperiodicOrder.Tiling.finiteDiffractionMass_univ
    Q.crystals.period Q.crystals.occupation

/-- The finite bead/quasicrystal material spine: legal thread,
contradiction-bearing condensate, mirror-stable contradiction, multi-adjacency,
site-level lenticle realization, load-bearing placement, and finite diffraction
readout. -/
def BeadPhaseSpine (Q : Quasicrystals) : Prop :=
  AperiodicOrder.Tiling.ThreadLegal Q.crystals.beads.thread ∧
    Q.beadCondensate.isInconsistency = true ∧
      (Reading.negate Q.beadCondensate).isInconsistency =
        Q.beadCondensate.isInconsistency ∧
        Q.beadAdjacency.tuple = Q.crystals.beads.adjacencyTuple ∧
          Q.beadGeometricLenticle =
            Site.meet Q.beadRealization.leftPatch
              Q.beadRealization.rightPatch ∧
            Site.Covers Q.beadGeometricLenticle
              [Q.beadGeometricLenticle, Q.beadGeometricLenticle] ∧
              AperiodicOrder.Tiling.loadBearing Q.beadPlacement.nerve ∧
                AperiodicOrder.Tiling.finiteDiffractionMass
                    Q.crystals.period Q.crystals.occupation
                    Obsmetrologia.Discrete.Set.univ =
                  Q.crystals.period + 1

/-- A quasicrystal whose bead layer is over-occupied and whose bead placement
crosses the finite percolation threshold retains the finite bead spine: legal
thread, contradiction-bearing condensate, mirror-stable contradiction,
multi-adjacency, site-level lenticle realization, load-bearing placement, and
finite diffraction readout. -/
theorem bead_phase_spine (Q : Quasicrystals) (n : Nat)
    (hocc : Q.beadPassCount.count = n + 2)
    (hload :
      AperiodicOrder.Tiling.percolationThreshold Q.beadPlacement.nerve + 1 ≤
        Q.beadCondensedContacts) :
    BeadPhaseSpine Q := by
  unfold BeadPhaseSpine
  exact ⟨Q.beadThreadLegal,
    Q.bead_over_occupation_inconsistency n hocc,
    Q.mirror_preserves_beadCondensate_inconsistency,
    Q.beadAdjacency_tuple_eq,
    Q.beadGeometricLenticle_eq_overlap,
    Q.covers_beadGeometricLenticle_pair,
    Q.bead_loadBearing_of_condensed_crosses_threshold hload,
    Q.finite_diffraction_mass_univ⟩

/-- A quasicrystal bead phase carries the finite K₄/FOUR analytic spine over
its finite occupation pattern.  This pairs the bead/quasicrystal material
readout with the chromatic Rayleigh/gap/diffraction spine; it remains finite and
does not assert infinite-volume diffraction. -/
theorem bead_phase_k4_analytic_spine (Q : Quasicrystals) (n : Nat)
    (v : List Flow.ChromaticRat) (side : Bool)
    (hocc : Q.beadPassCount.count = n + 2)
    (hload :
      AperiodicOrder.Tiling.percolationThreshold Q.beadPlacement.nerve + 1 ≤
        Q.beadCondensedContacts) :
    BeadPhaseSpine Q ∧
      Flow.K4FourAnalyticSpine v Q.crystals.period Q.crystals.occupation side :=
  ⟨Q.bead_phase_spine n hocc hload,
    Flow.k4_four_analytic_spine v Q.crystals.period Q.crystals.occupation side⟩

end Quasicrystals

end AperiodicOrder.Crystal
end Obsmetrologia
