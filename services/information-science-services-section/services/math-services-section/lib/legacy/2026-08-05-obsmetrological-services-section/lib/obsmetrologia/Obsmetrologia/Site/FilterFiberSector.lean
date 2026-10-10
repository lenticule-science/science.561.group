import Obsmetrologia.Site.Basic
import Obsmetrologia.QuantumContextuality.FockCondensate
import Obsmetrologia.AperiodicOrder.MaterialSectors.SectorPhaseDiagram

/-!
# Filters, fibers, and sectors

This module records the general shape that the site, Fock, and material-sector
constructions already share without collapsing them:

* a **filter** is a predicate selecting admissible points inside an already named fiber;
* a **fiber** is a family indexed by a base;
* a **sector** is an axis-indexed fiber whose total space is a dependent sum;
* a full material phase point is a section across sector axes, with thermal data kept as
  control rather than a sector.

The point is structural hygiene: filters do not move the base, fibers are indexed
families, and sectors are parallel axes rather than rungs of one ladder.
-/

namespace Obsmetrologia
namespace Site.FilterFiberSector

/-- A fiber family equipped with an internal admissibility predicate. The predicate is
the filter; it selects points already living over the same base index. -/
structure FilteredFiber (Base : Type) where
  /-- The fiber over a base point. -/
  Fiber : Base → Type
  /-- The filter/admissibility predicate internal to each fiber. -/
  accepts : (b : Base) → Fiber b → Prop

namespace FilteredFiber

/-- The total space of a filtered fiber. -/
abbrev Total {Base : Type} (F : FilteredFiber Base) : Type :=
  Sigma F.Fiber

/-- The total-space filter induced by the fiberwise predicates. -/
def acceptsTotal {Base : Type} (F : FilteredFiber Base) (x : F.Total) : Prop :=
  F.accepts x.1 x.2

/-- Filtering a point of a fiber keeps the base index fixed. -/
theorem accepts_keeps_base {Base : Type} (F : FilteredFiber Base)
    {b : Base} {x : F.Fiber b} (h : F.accepts b x) :
    ∃ y : F.Fiber b, F.accepts b y :=
  ⟨x, h⟩

end FilteredFiber

universe v

/-- An axis-indexed family of sectors. A sector point is a point of the dependent
sum; a product readout is a section through every sector axis. -/
structure SectorFamily (Axis : Type) where
  /-- The fiber over a sector axis. -/
  Sector : Axis → Type v

namespace SectorFamily

/-- The dependent-sum total space of sectors. -/
abbrev Total {Axis : Type} (S : SectorFamily.{v} Axis) : Type v :=
  Sigma S.Sector

/-- A section chooses a point in every sector axis. -/
abbrev Section {Axis : Type} (S : SectorFamily.{v} Axis) : Type v :=
  (a : Axis) → S.Sector a

end SectorFamily

/-! ## Site covers as filters on clopen fibers -/

/-- The Grothendieck cover relation is a filter on the list-fiber over each clopen. -/
def siteCoverFilter : FilteredFiber Site.Clopen where
  Fiber := fun _U => List Site.Clopen
  accepts := fun U fam => Site.Covers U fam

/-- Site cover filters are fiber-local: they constrain sub-clopens and their join,
not temporal advancement or base movement. -/
theorem siteCoverFilter_is_fiber_local {U : Site.Clopen} {fam : List Site.Clopen}
    (h : siteCoverFilter.accepts U fam) :
    (∀ Ui ∈ fam, Ui ⊑ U) ∧ Site.joinList fam = U :=
  Site.covers_is_fiber_local h

/-! ## Fock sectors as an axis-indexed family -/

/-- Fock sectors are indexed by particle number. -/
def fockSectorFamily (Mode : Type) : SectorFamily Nat where
  Sector := fun n => Fin n → Mode

/-- The total space of the particle-number sector family is the existing finite Fock carrier. -/
def fockSectorTotal_toFockSpace {Mode : Type}
    (s : (fockSectorFamily Mode).Total) : QuantumContextuality.FockSpace Mode :=
  s

/-- The existing finite Fock carrier is the total space of the particle-number sector family. -/
def fockSpace_toFockSectorTotal {Mode : Type}
    (s : QuantumContextuality.FockSpace Mode) : (fockSectorFamily Mode).Total :=
  s

/-- The Fock total-space identification round-trips on sector-family points. -/
theorem fockSectorTotal_roundtrip {Mode : Type}
    (s : (fockSectorFamily Mode).Total) :
    fockSpace_toFockSectorTotal (fockSectorTotal_toFockSpace s) = s := by
  cases s
  rfl

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
