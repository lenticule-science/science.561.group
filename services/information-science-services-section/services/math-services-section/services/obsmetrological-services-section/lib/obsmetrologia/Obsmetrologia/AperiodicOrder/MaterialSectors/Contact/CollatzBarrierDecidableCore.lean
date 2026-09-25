import Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.CollatzBarrierKeratin
import Obsmetrologia.AperiodicOrder.MaterialSectors.KappaSectorCharges
import Obsmetrologia.AperiodicOrder.Tiling.Witness.DecidableCore

/-!
# Collatz barrier formations and decidable cores

This module connects the Collatz keratin barrier boundary to the existing
`ExistenceQuestion`/`DecidableCore` machinery used for decidable cores of
undecidable questions. The keratin bridge proves that absence of barrier
formations gives pointwise double-negated finite contraction. A decidable core
is the extra object that turns that double negation into an actual prefix
witness.

## Main definitions

* `collatzContractingPrefixQuestion` — the existence question asking for a
  finite contracting prefix of a seed.
* `CollatzContractingPrefixCore` — a decidable core of that question.
* `collatzBoundedContractingPrefixQuestion` — the finite-window version.
* `ContractingPrefixBound` — a seed-indexed bound equating the unbounded and
  bounded prefix questions.

## Main results

* `collatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_decidable_assertion` —
  absence of formations plus a decision for the seed's existence assertion
  produces a decidable core.
* `noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_decidable_assertions` —
  pointwise decidable assertions collapse absence of formations to the no-stream
  frontier.
* `boundedCollatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_bound` —
  a finite search bound supplies the decidable core without assuming unbounded
  search decidability.
* `noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_contractingPrefixBound` —
  bounded search collapses absence of formations to the no-stream frontier.
* `collatzContractingPrefixCore_of_antimatterBarrierBoundary_and_cylinderLift` —
  the existing anti-matter boundary carrier produces prefix cores once the
  cylinder-lift face is supplied.
* `collatzContractingPrefixCore_of_fullSharedKappaCarrier` — a full shared
  κ-carrier produces prefix cores through its anti-matter boundary reading.

## Tags

Collatz, keratin, decidable core, witness, finite search
-/

namespace Obsmetrologia
namespace AperiodicOrder.MaterialSectors.Contact

open Obsmetrologia.Closure.Collatz
open Obsmetrologia.AperiodicOrder.Tiling.Witness

/-! ## Contracting-prefix existence questions -/

/-- The existence question asking for a finite contracting prefix of seed `n`. -/
def collatzContractingPrefixQuestion (n : Nat) : ExistenceQuestion where
  Object := Nat
  Certifies k := CoeffContracting (parityWord n k)

/-- A decidable core of the Collatz contracting-prefix question for seed `n`. -/
abbrev CollatzContractingPrefixCore (n : Nat) : Type :=
  DecidableCore (collatzContractingPrefixQuestion n)

/-- The assertion of the contracting-prefix question is the ordinary witness
existential used by the Collatz reduction. -/
theorem collatzContractingPrefixQuestion_assertion_iff (n : Nat) :
    (collatzContractingPrefixQuestion n).Assertion ↔
      ∃ k, CoeffContracting (parityWord n k) := by
  rfl

/-- A decidable core of the contracting-prefix question gives the ordinary
finite contracting-prefix witness. -/
theorem collatzContractingPrefixCore_witness {n : Nat}
    (core : CollatzContractingPrefixCore n) :
    ∃ k, CoeffContracting (parityWord n k) :=
  ⟨core.object, core.certificate⟩

/-- Eventual contraction for every nonterminal seed produces a decidable core
for each positive seed's contracting-prefix question. -/
theorem collatzContractingPrefixCore_of_everyNonterminalContracts
    (hcontracts : EveryNonterminalContracts) {n : Nat} (hn : 2 < n) :
  Nonempty (CollatzContractingPrefixCore n) := by
  obtain ⟨k, hk⟩ := hcontracts n hn
  exact ⟨DecidableCore.ofCertificate (collatzContractingPrefixQuestion n) k hk⟩

/-- Absence of Collatz barrier keratin formations plus a decision procedure for
the seed's contracting-prefix assertion produces a decidable core. -/
theorem collatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_decidable_assertion
    (hnoForm : ¬ ∃ m, CollatzBarrierKeratinFormation m) {n : Nat}
    (hn : 2 < n)
    (hdec : Decidable ((collatzContractingPrefixQuestion n).Assertion)) :
    Nonempty (CollatzContractingPrefixCore n) := by
  haveI : Decidable ((collatzContractingPrefixQuestion n).Assertion) := hdec
  have hnotnot :
      ¬ ¬ (collatzContractingPrefixQuestion n).Assertion := by
    intro hno
    exact
      no_collatzBarrierKeratinFormation_implies_not_not_contracting_prefix
        hnoForm hn
        (by
          intro hcontract
          exact hno hcontract)
  obtain ⟨k, hk⟩ := Decidable.of_not_not hnotnot
  exact ⟨DecidableCore.ofCertificate (collatzContractingPrefixQuestion n) k hk⟩

/-- Pointwise decidable contracting-prefix assertions collapse absence of Collatz
barrier keratin formations to the no-positive-infinite-barrier-stream frontier. -/
theorem noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_decidable_assertions
    (hnoForm : ¬ ∃ m, CollatzBarrierKeratinFormation m)
    (hdec :
      ∀ n, 2 < n →
        Decidable ((collatzContractingPrefixQuestion n).Assertion)) :
    NoPositiveInfiniteBarrierStream := by
  intro n hn
  obtain ⟨core⟩ :=
    collatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_decidable_assertion
      hnoForm hn (hdec n hn)
  exact collatzContractingPrefixCore_witness core

/-! ## Bounded decidable cores -/

/-- The finite-window contracting-prefix question for seed `n` and bound `B`. -/
def collatzBoundedContractingPrefixQuestion (n B : Nat) : ExistenceQuestion where
  Object := Nat
  Certifies k := k < B ∧ CoeffContracting (parityWord n k)

/-- A decidable core of the bounded Collatz contracting-prefix question. -/
abbrev CollatzBoundedContractingPrefixCore (n B : Nat) : Type :=
  DecidableCore (collatzBoundedContractingPrefixQuestion n B)

/-- A finite bounded search over natural numbers is decidable whenever the
pointwise predicate is decidable. -/
def decidable_exists_lt_nat (B : Nat) (P : Nat → Prop) [DecidablePred P] :
    Decidable (∃ k, k < B ∧ P k) := by
  induction B with
  | zero =>
      exact isFalse (by
        rintro ⟨k, hk, _⟩
        exact Nat.not_lt_zero k hk)
  | succ B ih =>
      cases ih with
      | isTrue h =>
          exact isTrue (by
            rcases h with ⟨k, hk, hP⟩
            exact ⟨k, Nat.lt_trans hk (Nat.lt_succ_self B), hP⟩)
      | isFalse hno =>
          by_cases hP : P B
          · exact isTrue ⟨B, Nat.lt_succ_self B, hP⟩
          · exact isFalse (by
              rintro ⟨k, hk, hPk⟩
              have hsplit : k < B ∨ k = B := by omega
              cases hsplit with
              | inl hlt =>
                  exact hno ⟨k, hlt, hPk⟩
              | inr heq =>
                  exact hP (by rwa [heq] at hPk))

/-- The bounded contracting-prefix question is decidable because it is a finite
search over the decidable coefficient comparison. -/
def collatzBoundedContractingPrefixQuestion_decidable (n B : Nat) :
    Decidable ((collatzBoundedContractingPrefixQuestion n B).Assertion) := by
  haveI : DecidablePred (fun k => CoeffContracting (parityWord n k)) :=
    fun k => Nat.decLt _ _
  exact decidable_exists_lt_nat B (fun k => CoeffContracting (parityWord n k))

/-- A seed-indexed finite search bound for contracting prefixes: every positive
seed has an unbounded contracting prefix iff it has one below `B n`. -/
def ContractingPrefixBound (B : Nat → Nat) : Prop :=
  ∀ n, 2 < n →
    ((collatzContractingPrefixQuestion n).Assertion ↔
      (collatzBoundedContractingPrefixQuestion n (B n)).Assertion)

/-- Absence of Collatz barrier keratin formations plus a finite search bound
produces a decidable core for the bounded contracting-prefix question. -/
theorem boundedCollatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_bound
    {B : Nat → Nat}
    (hnoForm : ¬ ∃ m, CollatzBarrierKeratinFormation m)
    (hbound : ContractingPrefixBound B) {n : Nat} (hn : 2 < n) :
    Nonempty (CollatzBoundedContractingPrefixCore n (B n)) := by
  have hnotnot :
      ¬ ¬ (collatzBoundedContractingPrefixQuestion n (B n)).Assertion := by
    intro hnoBound
    have hiff :
        (collatzContractingPrefixQuestion n).Assertion ↔
          (collatzBoundedContractingPrefixQuestion n (B n)).Assertion :=
      hbound n hn
    have hnoUnbounded : ¬ (collatzContractingPrefixQuestion n).Assertion := by
      intro hcontract
      exact hnoBound (hiff.mp hcontract)
    exact
      no_collatzBarrierKeratinFormation_implies_not_not_contracting_prefix
        hnoForm hn hnoUnbounded
  haveI : Decidable ((collatzBoundedContractingPrefixQuestion n (B n)).Assertion) :=
    collatzBoundedContractingPrefixQuestion_decidable n (B n)
  obtain ⟨k, hk⟩ := Decidable.of_not_not hnotnot
  exact
    ⟨DecidableCore.ofCertificate
      (collatzBoundedContractingPrefixQuestion n (B n)) k hk⟩

/-- A bounded contracting-prefix core gives the ordinary unbounded contracting
prefix witness. -/
theorem collatzBoundedContractingPrefixCore_witness {n B : Nat}
    (core : CollatzBoundedContractingPrefixCore n B) :
    ∃ k, CoeffContracting (parityWord n k) :=
  ⟨core.object, core.certificate.2⟩

/-- A finite contracting-prefix search bound collapses absence of Collatz barrier
keratin formations to the no-positive-infinite-barrier-stream frontier. -/
theorem noPositiveInfiniteBarrierStream_of_no_collatzBarrierKeratinFormation_and_contractingPrefixBound
    {B : Nat → Nat}
    (hnoForm : ¬ ∃ m, CollatzBarrierKeratinFormation m)
    (hbound : ContractingPrefixBound B) :
    NoPositiveInfiniteBarrierStream := by
  intro n hn
  obtain ⟨core⟩ :=
    boundedCollatzContractingPrefixCore_of_no_collatzBarrierKeratinFormation_and_bound
      hnoForm hbound hn
  exact collatzBoundedContractingPrefixCore_witness core

/-! ## Anti-matter boundary adapters -/

/-- The existing anti-matter barrier-boundary carrier already stores the missing
map from the two-adic cylinder-lift face to eventual coefficient contraction;
therefore it produces Collatz contracting-prefix cores for every positive seed
once the cylinder-lift face is supplied. -/
theorem collatzContractingPrefixCore_of_antimatterBarrierBoundary_and_cylinderLift
    {G : AperiodicOrder.Crystal.Glass}
    {γ : AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge G}
    {b : G.basins.Basin} {θ : Real.Internal.Rat}
    (hboundary : Nonempty (KappaSectorCharges.AntimatterBarrierBoundary γ b θ))
    (hlift : AperiodicOrder.Tiling.ParentBarrierTwoAdicCylinderLiftGap)
    {n : Nat} (hn : 2 < n) :
    Nonempty (CollatzContractingPrefixCore n) := by
  have hcontracts :
      AperiodicOrder.Tiling.ParentBarrierTwoAdicCylinderLiftGap →
        EveryNonterminalContracts :=
    (KappaSectorCharges.antimatter_barrier_boundary_iff_cylinderLiftContracts
      γ b θ).mp hboundary
  exact collatzContractingPrefixCore_of_everyNonterminalContracts
    (hcontracts hlift) hn

/-- A full shared κ-carrier produces Collatz contracting-prefix cores through
the cylinder-lift and one-lock data carried by its Collatz projection. -/
theorem collatzContractingPrefixCore_of_fullSharedKappaCarrier
    {G : AperiodicOrder.Crystal.Glass}
    {γ : AperiodicOrder.Crystal.Glass.RatBasinFreeEnergyBridge G}
    {b : G.basins.Basin} {θ : Real.Internal.Rat}
    (hcarrier : Nonempty (KappaSectorCharges.FullSharedKappaCarrier γ b θ))
    {n : Nat} (hn : 2 < n) :
    Nonempty (CollatzContractingPrefixCore n) := by
  rcases hcarrier with ⟨C⟩
  have hcontracts : EveryNonterminalContracts :=
    (AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_everyNonterminalContracts.mp
      C.collatzProjection.oneLock) C.collatzProjection.cylinderLiftGap
  exact collatzContractingPrefixCore_of_everyNonterminalContracts hcontracts hn

end AperiodicOrder.MaterialSectors.Contact
end Obsmetrologia
