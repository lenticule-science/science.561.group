import Obsmetrologia.Site.FilterFiberSector
import ObsmetrologiaMaterials.SectorPhaseDiagram

/-!
# Material sectors as a sector family

A material phase point is a section through the `Site.FilterFiberSector.SectorFamily` whose
axes are the structural, transport, and topological sectors. Thermal data remains a control
parameter outside the family.
-/

namespace Obsmetrologia
namespace Site.FilterFiberSector

/-! ## Material sectors as a product of axes -/

open Obsmetrologia.AperiodicOrder.Tiling
open Obsmetrologia.AperiodicOrder.Tiling.Moduli
open Obsmetrologia.AperiodicOrder.MaterialSectors.SectorPhaseDiagram

/-- The transport sector fiber retains its ordinal and moduli indices. -/
abbrev MaterialTransportFiber : Type 1 :=
  @Sigma Ord (fun κ => @Sigma ModuliPoint (fun p => TransportSector κ p))

/-- The material sector family: structural, transport, and topological axes have distinct
fiber types. The structural/topological sectors are lifted only so this mixed universe
family can sit beside the higher transport fiber. Thermal data remains a control
parameter outside this sector family. -/
def materialSectorFamily : SectorFamily.{1} MaterialSector where
  Sector
    | MaterialSector.structural => ULift StructuralSector
    | MaterialSector.transport => MaterialTransportFiber
    | MaterialSector.topological => ULift TopologicalSector

/-- A material sector phase point is a section through the material sector family,
with transport retaining its ordinal/moduli indices. -/
def materialSectorSectionOfPoint {G : AperiodicOrder.Crystal.Glass}
    {γ : G.RatBasinFreeEnergyBridge} {b : G.basins.Basin} {θ : Real.Internal.Rat}
    {κ : Ord} {p : ModuliPoint}
    (P : SectorPhasePoint γ b θ κ p) :
    (a : MaterialSector) → materialSectorFamily.Sector a
  | MaterialSector.structural => ULift.up P.structural
  | MaterialSector.transport => ⟨κ, p, P.transport⟩
  | MaterialSector.topological => ULift.up P.topological

/-- Reading a material phase point as a sector section preserves the proved bridge:
metallizable transport and conducting topology are carried together at the material
carrier, not collapsed into one sector. -/
theorem materialSectorSection_metallic_transport_conducts {G : AperiodicOrder.Crystal.Glass}
    {γ : G.RatBasinFreeEnergyBridge} {b : G.basins.Basin} {θ : Real.Internal.Rat}
    {κ : Ord} {p : ModuliPoint}
    (P : SectorPhasePoint γ b θ κ p) :
    P.transport.readout = TransportReadout.metallizable ∧ P.topological.Conducting :=
  P.metallic_transport_conducts

end Site.FilterFiberSector
end Obsmetrologia
