import Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore
import Obsmetrologia.AperiodicOrder.Tiling.Witness.JeandelRaoSubstitutionTower

/-!
# The Jeandel--Rao witness as a decidable constructive core

The finite Jeandel--Rao carrier and its substitution tower supply a concrete
constructive object.  This module packages the object as an explicit certificate
for the existence assertion represented by the aperiodic witness question.

The external domino problem is not formalized here as a computability theorem.
The formal statement is narrower: once the finite carrier, marker-ring class,
and substitution tower have been constructed, the corresponding certificate is
decidable because the witness is already in hand.

## Main definitions

* `JeandelRaoAperiodicObject` -- the finite Jeandel--Rao object recorded by tile
  count, decorated cochain, and marker-ring core.
* `jeandelRaoConstructiveQuestion` -- the certificate demanded of this finite
  object: eleven tiles, the decorated class, the marker core, and the tower.

## Main results

* `jeandelRaoConstructiveCore` -- the concrete decidable core.
* `jeandelRao_constructive_existence` -- the constructive existence assertion.
* `jeandelRao_witness_is_decidable_core` -- the headline bridge from the witness
  to the decidable core.

## Implementation notes

The certificate includes only what the library proves: the finite nonzero
cohomology class, the marker-ring nonzero class, and the substitution-tower
direct-limit persistence.  Identification with the literal recognizable
substitution matrix of the Jeandel--Rao shift remains the separate persistence
frontier.

## Tags

Jeandel--Rao, decidable core, constructive witness, domino problem, substitution
tower
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Witness

/-! ## The Jeandel--Rao constructive object -/

/-- The finite Jeandel--Rao object as used by the constructive witness: the
eleven-tile count, the decorated cochain, and the marker-ring core cochain. -/
structure JeandelRaoAperiodicObject where
  /-- The Wang-tile count of the finite object. -/
  tileCount : Nat
  /-- The decorated one-vertex cochain. -/
  decorated : Edge → Int
  /-- The marker-ring core cochain. -/
  markerCore : QEdge → Int

/-- The concrete eleven-tile Jeandel--Rao object carried by the existing witness
cochains `phi` and `b3`. -/
def jeandelRao11Object : JeandelRaoAperiodicObject where
  tileCount := 11
  decorated := phi
  markerCore := b3

/-- The constructive existence question exposed by the Jeandel--Rao witness.  A
candidate certifies it when it is the eleven-tile object with the proved
decorated class, marker core, and substitution-tower persistence. -/
def jeandelRaoConstructiveQuestion : ExistenceQuestion where
  Object := JeandelRaoAperiodicObject
  Certifies object :=
    object.tileCount = 11
      ∧ object.decorated = phi
      ∧ object.markerCore = b3
      ∧ jrComplex.NonzeroH1Class object.decorated
      ∧ markerRingComplex.NonzeroH1Class object.markerCore
      ∧ (∀ ψ : QEdge → Int, markerRingComplex.IsCocycle (sigma ψ))
      ∧ sigma object.markerCore = object.markerCore
      ∧ (∀ n : Nat, sigmaIter n object.markerCore = object.markerCore)
      ∧ NonzeroInDirectLimit object.markerCore

/-- The concrete Jeandel--Rao certificate: the eleven-tile object is the
decorated nonzero class, the marker-ring nonzero class, and the persistent
substitution tower. -/
theorem jeandelRao11_certificate :
    jeandelRaoConstructiveQuestion.Certifies jeandelRao11Object := by
  dsimp [jeandelRaoConstructiveQuestion, jeandelRao11Object]
  exact
    ⟨rfl, rfl, rfl,
      jeandelRaoMarker01_nonzero_h1_class,
      markerRing_b3_nonzero_h1_class,
      jr_substitution_tower.1,
      jr_substitution_tower.2.1,
      jr_substitution_tower.2.2.1,
      jr_substitution_tower.2.2.2⟩

/-- The Jeandel--Rao certificate is decidable because the constructive witness
has already supplied the certificate. -/
def jeandelRao11_certificate_decidable :
    Decidable (jeandelRaoConstructiveQuestion.Certifies jeandelRao11Object) :=
  isTrue jeandelRao11_certificate

/-- The concrete decidable core of the constructive aperiodic existence
question. -/
def jeandelRaoConstructiveCore : DecidableCore jeandelRaoConstructiveQuestion :=
  DecidableCore.ofCertificate jeandelRaoConstructiveQuestion
    jeandelRao11Object jeandelRao11_certificate

/-- The Jeandel--Rao witness realizes the constructive existence assertion. -/
theorem jeandelRao_constructive_existence :
    jeandelRaoConstructiveQuestion.Assertion :=
  jeandelRaoConstructiveCore.assertion

/-- The Jeandel--Rao eleven-tile witness is a decidable core of the constructive
aperiodic existence question. -/
theorem jeandelRao_witness_is_decidable_core :
    ∃ core : DecidableCore jeandelRaoConstructiveQuestion,
      core.object.tileCount = 11 :=
  ⟨jeandelRaoConstructiveCore, rfl⟩

end AperiodicOrder.Tiling.Witness
end Obsmetrologia
