import ObsmetrologiaMaterials.Contact.Keratin
import Obsmetrologia.Closure.Collatz.Reduction

/-!
# Collatz barrier streams as keratin formation limits

This module gives the narrow bridge between the Collatz no-stream frontier and
informational keratin. A Collatz infinite barrier stream is represented over the
keratin lock carrier as the directed join of finite prefix-certification events:
stage `k` fires the event that the `k`th finite prefix has been admitted.

The bridge does not prove that such streams exist or do not exist. It identifies
the carrier: the infinite Collatz obstruction is a formed keratin lock-stream
limit exactly when it is a positive infinite barrier stream.

## Main definitions
* `collatzBarrierPrefixLockStream` — the prefix-event lock stream over `Powerset Nat`.
* `CollatzBarrierKeratinFormation` — a positive Collatz stream certified on the formed limit.

## Main results
* `collatzBarrierPrefix_mem_limit` — every finite prefix event appears in the limit.
* `collatzBarrierKeratinFormation_iff_positive_infiniteBarrierStream` — the keratin
  formation carrier is exactly a positive infinite barrier stream.
* `collatzBarrierKeratinFormation_iff_cylinderAvoidingBarrierStream` — equivalently,
  it is the cylinder-avoiding no-stream complement.
* `parentBarrierGap_and_oneLock_excludes_collatzBarrierKeratinFormation` — the
  named one-lock route prevents the keratin formation.
* `collatzBarrierKeratinFormation_refutes_parentBarrierOneLockCollapse` — under
  the parent-barrier gap, one formation refutes the named one-lock collapse.
* `collatzBarrierKeratinFormation_iff_positive_no_contracting_prefix` — the
  antimatter face: formation is exactly a positive seed with no finite contracting prefix.
* `no_collatzBarrierKeratinFormation_iff_pointwise_not_not_contracting_prefix` —
  absence of formations is exactly pointwise double-negated finite contraction.

## Tags
collatz, keratin, lock stream, finite prefix, directed join
-/

namespace Obsmetrologia
namespace AperiodicOrder.MaterialSectors.Contact

open Obsmetrologia.Tarski
open Obsmetrologia.Closure.Collatz

/-- The lock stream that admits one more Collatz finite-prefix event at each stage. -/
def collatzBarrierPrefixLockStream : LockStream (Tarski.Powerset Nat) :=
  fun k => addEvent k

/-- The empty prefix-event seed. -/
def collatzBarrierPrefixSeed : (Tarski.Powerset Nat).carrier :=
  fun _ => False

/-- Running the first `k` Collatz prefix locks admits exactly the events below `k`. -/
theorem runLockPrefix_collatzBarrierPrefixSeed (k j : Nat) :
    runLockPrefix collatzBarrierPrefixLockStream k collatzBarrierPrefixSeed j ↔ j < k := by
  induction k with
  | zero =>
      simp [runLockPrefix, collatzBarrierPrefixSeed]
  | succ k ih =>
      constructor
      · intro h
        simp [runLockPrefix, collatzBarrierPrefixLockStream, addEvent, ih] at h
        omega
      · intro h
        simp [runLockPrefix, collatzBarrierPrefixLockStream, addEvent, ih]
        omega

/-- Every finite Collatz prefix event appears in the formed lock-stream limit. -/
theorem collatzBarrierPrefix_mem_limit (k : Nat) :
    lockStreamLimit collatzBarrierPrefixLockStream collatzBarrierPrefixSeed k := by
  exact runLockPrefix_le_limit
    collatzBarrierPrefixLockStream (k + 1) collatzBarrierPrefixSeed k
      ((runLockPrefix_collatzBarrierPrefixSeed (k + 1) k).mpr (Nat.lt_succ_self k))

/-- A Collatz barrier keratin formation: the finite prefix-event lock stream has
formed, and every event in its limit certifies coefficient noncontraction for
the corresponding Collatz parity prefix. -/
def CollatzBarrierKeratinFormation (n : Nat) : Prop :=
  2 < n ∧
    ∀ k, lockStreamLimit collatzBarrierPrefixLockStream collatzBarrierPrefixSeed k →
      CoeffNoncontracting (parityWord n k)

/-- The keratin formation carrier is exactly a positive infinite Collatz barrier
stream. The formed limit contributes all finite prefix events; certification on
that limit is therefore the same as `InfiniteBarrierStream`. -/
theorem collatzBarrierKeratinFormation_iff_positive_infiniteBarrierStream (n : Nat) :
    CollatzBarrierKeratinFormation n ↔ 2 < n ∧ InfiniteBarrierStream n := by
  constructor
  · intro h
    refine ⟨h.1, ?_⟩
    intro k
    exact h.2 k (collatzBarrierPrefix_mem_limit k)
  · intro h
    exact ⟨h.1, fun k _ => h.2 k⟩

/-- Equivalently, the keratin formation carrier is the cylinder-avoiding Collatz
barrier stream: the parent-cylinder avoidance is forced by infinitude. -/
theorem collatzBarrierKeratinFormation_iff_cylinderAvoidingBarrierStream (n : Nat) :
    CollatzBarrierKeratinFormation n ↔ CylinderAvoidingBarrierStream n :=
  (collatzBarrierKeratinFormation_iff_positive_infiniteBarrierStream n).trans
    (cylinderAvoidingBarrierStream_iff_positive_infiniteBarrierStream n).symm

/-- A Collatz barrier keratin formation is a pointwise refutation of the
no-positive-infinite-barrier-stream frontier. -/
theorem collatzBarrierKeratinFormation_excludes_noPositiveInfiniteBarrierStream {n : Nat}
    (hform : CollatzBarrierKeratinFormation n) :
    ¬ NoPositiveInfiniteBarrierStream :=
  cylinderAvoidingBarrierStream_excludes_noPositiveInfiniteBarrierStream
    ((collatzBarrierKeratinFormation_iff_cylinderAvoidingBarrierStream n).mp hform)

/-- A positive seed with no finite contracting prefix forms a Collatz barrier
keratin stream. This is the local antimatter face of the no-stream frontier. -/
theorem collatzBarrierKeratinFormation_of_no_contracting_prefix {n : Nat}
    (hn : 2 < n)
    (hno : ¬ ∃ k, CoeffContracting (parityWord n k)) :
    CollatzBarrierKeratinFormation n := by
  rw [collatzBarrierKeratinFormation_iff_positive_infiniteBarrierStream]
  refine ⟨hn, ?_⟩
  intro k
  have hnot : ¬ CoeffContracting (parityWord n k) := by
    intro hcontract
    exact hno ⟨k, hcontract⟩
  unfold CoeffContracting at hnot
  unfold CoeffNoncontracting
  exact Nat.not_lt.mp hnot

/-- The antimatter face of the keratin bridge: Collatz barrier formation is
exactly a positive seed carrying no finite contracting prefix. -/
theorem collatzBarrierKeratinFormation_iff_positive_no_contracting_prefix (n : Nat) :
    CollatzBarrierKeratinFormation n ↔
      2 < n ∧ ¬ ∃ k, CoeffContracting (parityWord n k) := by
  constructor
  · intro hform
    obtain ⟨hn, hbar⟩ :=
      (collatzBarrierKeratinFormation_iff_positive_infiniteBarrierStream n).mp hform
    refine ⟨hn, ?_⟩
    rintro ⟨k, hcontract⟩
    have hnon := hbar k
    unfold CoeffContracting at hcontract
    unfold CoeffNoncontracting at hnon
    omega
  · intro h
    exact collatzBarrierKeratinFormation_of_no_contracting_prefix h.1 h.2

/-- The no-positive-infinite-barrier-stream frontier excludes every Collatz
barrier keratin formation. -/
theorem noPositiveInfiniteBarrierStream_excludes_collatzBarrierKeratinFormation :
    NoPositiveInfiniteBarrierStream →
      ¬ ∃ n, CollatzBarrierKeratinFormation n := by
  intro hno
  rintro ⟨n, hform⟩
  exact collatzBarrierKeratinFormation_excludes_noPositiveInfiniteBarrierStream hform hno

/-- Forward use of the named one-lock route: once the parent-barrier gap and
`ParentBarrierOneLockCollapse` are supplied, no Collatz barrier keratin formation
can exist. -/
theorem parentBarrierGap_and_oneLock_excludes_collatzBarrierKeratinFormation
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    ¬ ∃ n, CollatzBarrierKeratinFormation n :=
  noPositiveInfiniteBarrierStream_excludes_collatzBarrierKeratinFormation (hlock hgap)

/-- Conversely-facing use: under the parent-barrier gap, any actual Collatz
barrier keratin formation refutes the named one-lock collapse. This does not
prove the constructive reverse implication from absence of formations to
`NoPositiveInfiniteBarrierStream`; it records the sharp counterexample shape. -/
theorem collatzBarrierKeratinFormation_refutes_parentBarrierOneLockCollapse
    (hgap : ParentBarrierGap) {n : Nat}
    (hform : CollatzBarrierKeratinFormation n) :
    ¬ ParentBarrierOneLockCollapse := by
  intro hlock
  exact parentBarrierGap_and_oneLock_excludes_collatzBarrierKeratinFormation
    hgap hlock ⟨n, hform⟩

/-- If no Collatz barrier keratin formation exists, each positive seed has a
double-negated finite contracting prefix. This is the constructive boundary
left after replacing infinite formation by its finite antimatter face. -/
theorem no_collatzBarrierKeratinFormation_implies_not_not_contracting_prefix
    (hnoForm : ¬ ∃ m, CollatzBarrierKeratinFormation m) {n : Nat}
    (hn : 2 < n) :
    ¬ ¬ ∃ k, CoeffContracting (parityWord n k) := by
  intro hnoContract
  exact hnoForm
    ⟨n, collatzBarrierKeratinFormation_of_no_contracting_prefix hn hnoContract⟩

/-- Absence of Collatz barrier keratin formations is exactly the pointwise
double-negated finite-contraction frontier. -/
theorem no_collatzBarrierKeratinFormation_iff_pointwise_not_not_contracting_prefix :
    (¬ ∃ m, CollatzBarrierKeratinFormation m) ↔
      ∀ n, 2 < n → ¬ ¬ ∃ k, CoeffContracting (parityWord n k) := by
  constructor
  · intro hnoForm n hn
    exact no_collatzBarrierKeratinFormation_implies_not_not_contracting_prefix hnoForm hn
  · intro hpoint
    rintro ⟨n, hform⟩
    have h := (collatzBarrierKeratinFormation_iff_positive_no_contracting_prefix n).mp hform
    exact hpoint n h.1 h.2

end AperiodicOrder.MaterialSectors.Contact
end Obsmetrologia
