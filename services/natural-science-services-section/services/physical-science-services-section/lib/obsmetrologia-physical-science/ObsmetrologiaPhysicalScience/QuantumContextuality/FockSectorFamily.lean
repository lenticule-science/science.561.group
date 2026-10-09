import Obsmetrologia.Site.FilterFiberSector
import ObsmetrologiaPhysicalScience.QuantumContextuality.FockCondensate

/-!
# Fock sectors as a sector family

The finite Fock carrier `QuantumContextuality.FockSpace` is the total space of the
`Site.FilterFiberSector.SectorFamily` indexed by particle number.
-/

namespace Obsmetrologia
namespace Site.FilterFiberSector

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

end Site.FilterFiberSector
end Obsmetrologia
