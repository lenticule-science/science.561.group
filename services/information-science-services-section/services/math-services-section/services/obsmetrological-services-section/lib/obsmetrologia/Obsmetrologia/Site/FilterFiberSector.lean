import Obsmetrologia.Site.Basic

/-!
# Filters, fibers, and sectors

This module records the general shape that site covers, Fock sectors, and material
sectors share without collapsing them:

* a **filter** is a predicate selecting admissible points inside an already named fiber;
* a **fiber** is a family indexed by a base;
* a **sector** is an axis-indexed fiber whose total space is a dependent sum;
* a full material phase point is a section across sector axes, with thermal data kept as
  control rather than a sector.

The point is structural hygiene: filters do not move the base, fibers are indexed
families, and sectors are parallel axes rather than rungs of one ladder.

Only the site instance lives here. The Fock instance (`fockSectorFamily`) is in the
physical-science package and the material instance (`materialSectorFamily`) in the materials
package; both import this module.
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

end Site.FilterFiberSector
end Obsmetrologia
