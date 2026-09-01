/-!
# Decidable cores of existence questions

This module contains the generic carrier used when an otherwise broad or
undecidable existence question has a concrete constructive core: a chosen object,
a proof that the object satisfies the question's certificate, and a decision
procedure for that certificate.

## Main definitions

* `ExistenceQuestion` — a type of candidate objects together with a certificate
  predicate.
* `ExistenceQuestion.Assertion` — the bare existence assertion for a question.
* `DecidableCore` — a chosen object whose certificate is both proved and
  decidable.
* `DecidableCore.ofCertificate` — a concrete certificate gives a decidable core.
* `DecidableCore.assertion` — a decidable core realizes the bare assertion.

## Tags

decidable core, existence question, witness, certificate
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.Witness

/-! ## Existence questions and decidable cores -/

/-- An existence question is a type of candidate objects together with the
certificate predicate that makes a candidate count as a realization. -/
structure ExistenceQuestion where
  /-- Candidate objects for the question. -/
  Object : Type
  /-- The certificate predicate that marks a candidate as a realization. -/
  Certifies : Object → Prop

/-- The bare existence assertion attached to an `ExistenceQuestion`. -/
def ExistenceQuestion.Assertion (Q : ExistenceQuestion) : Prop :=
  ∃ object : Q.Object, Q.Certifies object

/-- A decidable core of an existence question is a chosen object, a proof that it
certifies the question, and a decision procedure for that certificate. -/
structure DecidableCore (Q : ExistenceQuestion) where
  /-- The chosen constructive object. -/
  object : Q.Object
  /-- The proof that the chosen object realizes the question. -/
  certificate : Q.Certifies object
  /-- A decision procedure for the chosen object's certificate. -/
  decideCertificate : Decidable (Q.Certifies object)

namespace DecidableCore

/-- A concrete certified object is already a decidable core: the certificate is
decidable because it is proved. -/
def ofCertificate (Q : ExistenceQuestion) (object : Q.Object)
    (certificate : Q.Certifies object) : DecidableCore Q where
  object := object
  certificate := certificate
  decideCertificate := isTrue certificate

/-- A decidable core realizes the bare existence assertion of its question. -/
theorem assertion {Q : ExistenceQuestion} (core : DecidableCore Q) :
    Q.Assertion :=
  ⟨core.object, core.certificate⟩

end DecidableCore

end AperiodicOrder.Tiling.Witness
end Obsmetrologia
