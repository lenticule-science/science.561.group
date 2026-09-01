import ObsmetrologiaManual.DocSetup
import Obsmetrologia.Closure.Collatz.BackwardMargin
import Obsmetrologia.Closure.Collatz.CanonicalBarrierSeed
import Obsmetrologia.Closure.Collatz.SemigroupGap
import Obsmetrologia.Closure.Collatz.ModularProjections
import Obsmetrologia.Closure.Collatz.CrossingAudit
import Obsmetrologia.Closure.Collatz.Settling
import Obsmetrologia.Dynamics.Flow.BlowupClassification
import Obsmetrologia.AperiodicOrder.Tiling.ArithmeticZetaStar
import Obsmetrologia.AperiodicOrder.Tiling.Autopoiesis
import Obsmetrologia.AperiodicOrder.Tiling.CollatzTwoAdicLock

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.Discrete
open Obsmetrologia.Closure
open Obsmetrologia.Closure.Collatz
open Obsmetrologia.AperiodicOrder.Tiling

private theorem residueGapToParentGap
    (hres : ParentBarrierResidueGap) : ParentBarrierGap :=
  parentBarrierResidueGap_implies_parentBarrierGap hres

private theorem parentGapResidueIff :
    ParentBarrierGap <-> ParentBarrierResidueGap :=
  parentBarrierGap_iff_parentBarrierResidueGap

private theorem residueCarryIff :
    ParentBarrierResidueGap <-> ParentBarrierResidueCarryGap :=
  parentBarrierResidueGap_iff_parentBarrierResidueCarryGap

private theorem parentGapCarryIff :
    ParentBarrierGap <-> ParentBarrierResidueCarryGap :=
  parentBarrierGap_iff_parentBarrierResidueCarryGap

private theorem parentGapBadCylinderIff :
    ParentBarrierGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        Not (exists n, n < parentM p /\
          parityWord n (p ++ [Branch.E]).length =
            p ++ [Branch.E] /\
          n <=
            orbit n (p ++ [Branch.E]).length) :=
  parentBarrierGap_iff_no_badCylinderSeed

private theorem semigroupBadCylinderIff
    {p : List Branch} (hp : ParentBarrier p) :
    InTwoGenSemigroup (parentC p) (parentD p) (parentM p) <->
      exists n, n < parentM p /\
        parityWord n (p ++ [Branch.E]).length =
          p ++ [Branch.E] /\
        n <= orbit n (p ++ [Branch.E]).length :=
  inTwoGenSemigroup_iff_badCylinderSeed hp

private theorem parentGapBadBackwardSeedIff :
    ParentBarrierGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        Not (exists n, BadFirstPassageBackwardSeed p n) :=
  parentBarrierGap_iff_no_badBackwardSeed

private theorem semigroupBadBackwardSeedIff
    {p : List Branch} (hp : ParentBarrier p) :
    InTwoGenSemigroup (parentC p) (parentD p) (parentM p) <->
      exists n, BadFirstPassageBackwardSeed p n :=
  inTwoGenSemigroup_iff_badBackwardSeed hp

private theorem parentGapBackwardSeedDescentIff :
    ParentBarrierGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          orbit n (p ++ [Branch.E]).length < n :=
  parentBarrierGap_iff_backwardSeeds_descend

private theorem parentGapBackwardMarginFullCarryIff :
    ParentBarrierGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          Ord.Le (firstPassageBackwardModulus p)
            (firstPassageBackwardMargin p n) :=
  parentBarrierGap_iff_backwardMargins_fullCarry

private theorem parentGapBackwardCarryQuotientPositiveIff :
    ParentBarrierGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          Ord.Le (Ord.succ Ord.zero)
            (firstPassageBackwardCarryQuotient p n) :=
  parentBarrierGap_iff_backwardCarryQuotients_positive

private def NoActiveBackwardSeedCell (u : Utterance) : Prop :=
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, (hseed : FirstPassageBackwardSeed p n) ->
          Not ((firstPassageBackwardSeedCell u p n hseed).corner =
            Articulating.Corner.active)

private theorem parentGapNoActiveBackwardSeedCellIff (u : Utterance) :
    ParentBarrierGap <-> NoActiveBackwardSeedCell u := by
  simpa [NoActiveBackwardSeedCell] using
    parentBarrierGap_iff_no_activeBackwardSeedCell u

private theorem parentGapNoUngroundedClaimSideFiringIff :
    ParentBarrierGap <->
      NoUngroundedClaimSideFiringAtParentBarrier :=
  parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier

private theorem claimWithoutTokenIsFSideFiring :
    Blowup.cellType Articulating.Corner.absurd
        Articulating.Corner.active =
      some Blowup.FiringType.fSide :=
  rfl

private theorem activeToStableIsTopFiring :
    Blowup.cellType Articulating.Corner.active
        Articulating.Corner.stable =
      some Blowup.FiringType.top :=
  rfl

private theorem potentialIsSaturating
    {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (a : H.carrier) :
    AperiodicOrder.Tiling.Autopoiesis.cellCorner Q
        Articulating.Corner.potential a =
      (AperiodicOrder.Tiling.Autopoiesis.saturating Q).j
        a :=
  rfl

private theorem activeIsTransferring
    {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (a : H.carrier) :
    AperiodicOrder.Tiling.Autopoiesis.cellCorner Q
        Articulating.Corner.active a =
      (AperiodicOrder.Tiling.Autopoiesis.transferring Q).j
        a :=
  rfl

private theorem badSeedFiresFSide
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType (Articulating.Cell.initial u).corner
        (firstPassageBackwardSeedCell u p n hseed).corner =
      some Blowup.FiringType.fSide :=
  badBackwardSeedCell_induces_fSideFiring u hp hseed hbad

private theorem badSeedActiveToStableTop
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType
        (firstPassageBackwardSeedCell u p n hseed).corner
        Articulating.Corner.stable =
      some Blowup.FiringType.top :=
  badBackwardSeedCell_activeToStable_isTopFiring u hp hseed hbad

private theorem badSeedNegatesToTokenSide
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType (D4.D8.act D4.D8.neg (Articulating.Cell.initial u).corner)
        (D4.D8.act D4.D8.neg
          (firstPassageBackwardSeedCell u p n hseed).corner) =
      some Blowup.FiringType.tSide :=
  badBackwardSeedCell_negates_to_tSideFiring u hp hseed hbad

private theorem badSeedD4BypassesToTokenSide
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType
        (D4.D8.act D4.D8.negSwap
          (firstPassageBackwardSeedCell u p n hseed).corner)
        (D4.D8.act D4.D8.negSwap
          (D4.D8.act D4.D8.negSwap
            (firstPassageBackwardSeedCell u p n hseed).corner)) =
      some Blowup.FiringType.tSide :=
  badBackwardSeedCell_d4_bypasses_to_tSideFiring u hp hseed hbad

private theorem commutingNucleiTransferringAscends
    {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) {a : H.carrier}
    (htransferring : Q.j2.Fix a)
    (hnotSaturating : Not (Q.j1.Fix a)) :
    H.le a (Q.pi a) /\ Not (Q.pi a = a) :=
  Order.CommutingNuclei.transferring_without_saturating_pi_ascends
    Q htransferring hnotSaturating

private theorem nuclearQuartetJointAscends
    {H : Order.HeytingAlgebra}
    (Q : Order.NuclearQuartet H) {a : H.carrier}
    (hactive : Q.cornerOp Articulating.Corner.active a = a)
    (hnotPotential :
      Not (Q.cornerOp Articulating.Corner.potential a = a)) :
    H.le a (Q.cornerOp Articulating.Corner.stable a) /\
      Not (Q.cornerOp Articulating.Corner.stable a = a) :=
  Order.NuclearQuartet.active_not_potential_stable_ascends
    Q hactive hnotPotential

private theorem articulatingNoBackfill
    (u v : Utterance) (a : Articulating) :
    Articulating.utter u ≠ Articulating.pair v a :=
  Articulating.utter_ne_pair u v a

private theorem firstPassageSeedResidue
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hword : parityWord n (p ++ [Branch.E]).length =
      p ++ [Branch.E]) :
    (parentD p * n) % parentM p = parentC p % parentM p :=
  firstPassage_seed_residue hp hword

private theorem parentBarrierResidueRealizesFirstPassage
    {p : List Branch} {r : Nat}
    (hp : ParentBarrier p)
    (hrM : r < parentM p)
    (hrmod : (parentD p * r) % parentM p =
      parentC p % parentM p) :
    parityWord r (p ++ [Branch.E]).length = p ++ [Branch.E] :=
  parentBarrier_residue_realizes_firstPassage hp hrM hrmod

private theorem parentBarrierResidueDescentIffGap
    {p : List Branch} {r : Nat}
    (hp : ParentBarrier p)
    (hrM : r < parentM p)
    (hrmod : (parentD p * r) % parentM p =
      parentC p % parentM p) :
    orbit r (p ++ [Branch.E]).length < r <->
      parentC p < parentD p * r :=
  parentBarrier_residue_descent_iff_gap hp hrM hrmod

private theorem twoAdicNatProjection (x n : Nat) :
    (twoAdicResidueSystem.projAt n (twoAdicThreadOfNat x)).val =
      x % 2 ^ n :=
  twoAdicThreadOfNat_proj x n

private theorem twoAdicNatThreadStageSeparated (x y : Nat) :
    twoAdicThreadOfNat x = twoAdicThreadOfNat y <->
      forall n, x % 2 ^ n = y % 2 ^ n :=
  twoAdicThreadOfNat_eq_iff_all_residues_eq x y

private theorem twoAdicNatStageCylinder (x y n : Nat) :
    twoAdicResidueSystem.projAt n (twoAdicThreadOfNat x) =
        twoAdicResidueSystem.projAt n (twoAdicThreadOfNat y) <->
      x % 2 ^ n = y % 2 ^ n :=
  twoAdicThreadOfNat_proj_eq_iff_mod_eq x y n

private theorem twoAdicOdometerProjection
    (t : TwoAdicResidueThread) (n : Nat) :
    (twoAdicResidueSystem.projAt n (twoAdicOdometer t)).val =
      ((twoAdicResidueSystem.projAt n t).val + 1) % 2 ^ n :=
  twoAdicOdometer_proj t n

private theorem twoAdicOdometerNat (x : Nat) :
    twoAdicOdometer (twoAdicThreadOfNat x) =
      twoAdicThreadOfNat (x + 1) :=
  twoAdicOdometer_threadOfNat x

private theorem parentDTwoAdicUnit
    {p : List Branch} (hp : ParentBarrier p) :
    (parentD p).Coprime (2 ^ (p.length + 1)) :=
  parentD_coprime_twoAdicModulus hp

private theorem parentTwoAdicResidueExists
    {p : List Branch} (hp : ParentBarrier p) :
    exists r, r < 2 ^ (p.length + 1) /\
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1) :=
  parentBarrier_twoAdicResidue_exists hp

private theorem parentTwoAdicResidueUnique
    {p : List Branch} (hp : ParentBarrier p)
    {r s : Nat}
    (hr : r < 2 ^ (p.length + 1))
    (hs : s < 2 ^ (p.length + 1))
    (hrmod :
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1))
    (hsmod :
      (parentD p * s) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1)) :
    r = s :=
  parentBarrier_twoAdicResidue_unique hp hr hs hrmod hsmod

private theorem twoAdicUniqueResidueGapIff :
    ParentBarrierTwoAdicCarryGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap

private theorem residueCarryUniqueResidueIff :
    ParentBarrierResidueCarryGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicUniqueResidueGap

private theorem twoAdicCarryIff :
    ParentBarrierResidueCarryGap <-> ParentBarrierTwoAdicCarryGap :=
  parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap

private theorem residueUniqueResidueIff :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  parentBarrierResidueGap_iff_parentBarrierTwoAdicUniqueResidueGap

private theorem residueCarryQuotientIff :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicCarryQuotientGap :=
  parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryQuotientGap

private theorem residueCarryQuotientPositiveIff :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicCarryQuotientPositive :=
  parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryQuotientPositive

private theorem residueCylinderLiftIff :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicCylinderLiftGap :=
  parentBarrierResidueGap_iff_parentBarrierTwoAdicCylinderLiftGap

private theorem residueTwoAdicCarryIff :
    ParentBarrierResidueGap <-> ParentBarrierTwoAdicCarryGap :=
  parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap

private theorem parentGapUniqueResidueIff :
    ParentBarrierGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicUniqueResidueGap

private theorem parentGapTwoAdicCarryIff :
    ParentBarrierGap <-> ParentBarrierTwoAdicCarryGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCarryGap

private theorem parentGapCarryQuotientIff :
    ParentBarrierGap <->
      ParentBarrierTwoAdicCarryQuotientGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientGap

private theorem parentGapCarryQuotientPositiveIff :
    ParentBarrierGap <->
      ParentBarrierTwoAdicCarryQuotientPositive :=
  parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive

private theorem twoAdicQuotientOrdinalBackward
    (p : List Branch) (r : Nat) :
    parentBarrierTwoAdicCarryQuotientOrdinal p r =
      firstPassageBackwardCarryQuotient p r :=
  parentBarrierTwoAdicCarryQuotientOrdinal_eq_backwardCarryQuotient p r

private theorem twoAdicQuotientPositiveOrdinalIff :
    ParentBarrierTwoAdicCarryQuotientPositive <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall r, r < 2 ^ (p.length + 1) ->
          (parentD p * r) % 2 ^ (p.length + 1) =
            parentC p % 2 ^ (p.length + 1) ->
            Ord.Le (Ord.succ Ord.zero)
              (parentBarrierTwoAdicCarryQuotientOrdinal p r) :=
  parentBarrierTwoAdicCarryQuotientPositive_iff_ordinal

private theorem twoAdicQuotientPositiveBackwardQuotientIff :
    ParentBarrierTwoAdicCarryQuotientPositive <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          Ord.Le (Ord.succ Ord.zero)
            (firstPassageBackwardCarryQuotient p n) :=
  parentBarrierTwoAdicCarryQuotientPositive_iff_backwardCarryQuotients_positive

private theorem positiveCylinderLiftArithmetic (k x y : Nat) :
    TwoAdicPositiveCylinderLift k x y <->
      x % 2 ^ k = y % 2 ^ k /\ 2 ^ k <= x - y :=
  twoAdicPositiveCylinderLift_iff_modulus_le_sub k x y

private theorem cylinderLiftCarryGapIff :
    ParentBarrierTwoAdicCylinderLiftGap <->
      ParentBarrierTwoAdicCarryGap :=
  parentBarrierTwoAdicCylinderLiftGap_iff_carryGap

private theorem parentGapCylinderLiftIff :
    ParentBarrierGap <->
      ParentBarrierTwoAdicCylinderLiftGap :=
  parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap

private theorem quotientPositiveCylinderDescent :
    ParentBarrierTwoAdicCarryQuotientPositive <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, n < parentM p ->
          parityWord n (p ++ [Branch.E]).length =
              p ++ [Branch.E] ->
          orbit n (p ++ [Branch.E]).length < n :=
  parentBarrierTwoAdicCarryQuotientPositive_iff_cylinderSeeds_descend

private theorem cylinderLiftCylinderDescent :
    ParentBarrierTwoAdicCylinderLiftGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, n < parentM p ->
          parityWord n (p ++ [Branch.E]).length =
              p ++ [Branch.E] ->
          orbit n (p ++ [Branch.E]).length < n :=
  parentBarrierTwoAdicCylinderLiftGap_iff_cylinderSeeds_descend

private theorem twoAdicGapToTermination
    (htwo : ParentBarrierTwoAdicCarryGap)
    (hcross : EveryNonterminalHasCrossing) :
    forall n, 0 < n -> ReachesTerminal n :=
  collatz_from_parentBarrierTwoAdicCarryGap_and_crossing htwo hcross

private theorem twoAdicNoStreamToTermination
    (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream) :
    forall n, 0 < n -> ReachesTerminal n :=
  collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    htwo hbar

private theorem twoAdicGapExactObstruction
    (htwo : ParentBarrierTwoAdicCarryGap) :
    (forall n, 0 < n -> ReachesTerminal n) <->
      NoPositiveInfiniteBarrierStream :=
  acceleratedCollatz_iff_noPositiveInfiniteBarrierStream_of_twoAdicCarryGap
    htwo

private theorem twoAdicOneFrontierCriterion :
    (ParentBarrierTwoAdicCarryGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierTwoAdicCarryGap ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicCarryGap_alone_solves_collatz_iff_twoAdicCarryGap_implies_noStream

private theorem twoAdicOneFrontierContractCriterion :
    (ParentBarrierTwoAdicCarryGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierTwoAdicCarryGap ->
        EveryNonterminalContracts) :=
  twoAdicCarryGap_alone_solves_collatz_iff_twoAdicCarryGap_implies_everyNonterminalContracts

private theorem twoAdicFrontierCollapse :
    (ParentBarrierTwoAdicCarryGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicCarryGap) :=
  frontierInputs_iff_twoAdicCarryGap_of_twoAdicCarryGap_implies_noStream

private theorem twoAdicUniqueResidueFrontierCollapse :
    (ParentBarrierTwoAdicUniqueResidueGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicUniqueResidueGap) :=
  frontierInputs_iff_twoAdicUniqueResidueGap_of_twoAdicUniqueResidueGap_implies_noStream

private theorem twoAdicFrontierGapAndOneLock :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicCarryGap /\ ParentBarrierOneLockCollapse :=
  frontierInputs_iff_twoAdicCarryGap_and_oneLock

private theorem twoAdicUniqueResidueFrontierGapAndOneLock :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicUniqueResidueGap /\ ParentBarrierOneLockCollapse :=
  frontierInputs_iff_twoAdicUniqueResidueGap_and_oneLock

private theorem twoAdicCarryQuotientFrontierGapAndOneLock :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicCarryQuotientPositive /\ ParentBarrierOneLockCollapse :=
  frontierInputs_iff_twoAdicCarryQuotientPositive_and_oneLock

private theorem twoAdicCylinderLiftFrontierGapAndOneLock :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicCylinderLiftGap /\ ParentBarrierOneLockCollapse :=
  frontierInputs_iff_twoAdicCylinderLiftGap_and_oneLock

private theorem parentBarrierOneLockCollapseCarryQuotientNoStream :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_noStream

private theorem parentBarrierOneLockCollapseCylinderLiftNoStream :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_noStream

private theorem parentBarrierOneLockCollapseCarryQuotientContracts :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        EveryNonterminalContracts) :=
  parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_everyNonterminalContracts

private theorem parentBarrierOneLockCollapseCylinderLiftContracts :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        EveryNonterminalContracts) :=
  parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_everyNonterminalContracts

private theorem parentBarrierOneLockCollapseCarryQuotientCrossing :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        EveryNonterminalHasCrossing) :=
  parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_everyNonterminalHasCrossing

private theorem parentBarrierOneLockCollapseCylinderLiftCrossing :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        EveryNonterminalHasCrossing) :=
  parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_everyNonterminalHasCrossing

private theorem parentBarrierOneLockCollapseUniqueResidueNoStream :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_noStream

private theorem parentBarrierOneLockCollapseUniqueResidueContracts :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        EveryNonterminalContracts) :=
  parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_everyNonterminalContracts

private theorem parentBarrierOneLockCollapseUniqueResidueCrossing :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        EveryNonterminalHasCrossing) :=
  parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_everyNonterminalHasCrossing

private theorem parentBarrierOneLockCollapseTwoAdicPackage :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicCarryGap) :=
  parentBarrierOneLockCollapse_iff_frontierInputs_twoAdicCarryGap

private theorem parentBarrierOneLockCollapseUniqueResiduePackage :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicUniqueResidueGap) :=
  parentBarrierOneLockCollapse_iff_frontierInputs_twoAdicUniqueResidueGap

private theorem parentBarrierOneLockCollapseTwoAdicTermination :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryGap ->
        forall n, 0 < n -> ReachesTerminal n) :=
  parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_collatz

private theorem parentBarrierOneLockCollapseUniqueResidueTermination :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        forall n, 0 < n -> ReachesTerminal n) :=
  parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_alone_solves_collatz

private theorem twoAdicNoStreamKappaBridge
    (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <-> ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    htwo hbar m hm

private theorem twoAdicNoStreamKappaStageBridge
    (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    htwo hbar m hm

private theorem twoAdicNoStreamTotalStoppingStageBridge
    (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <->
      ReachesTerminal m :=
  totalStoppingStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream
    htwo hbar m hm

private theorem twoAdicKappaPackageCriterion :
    (ParentBarrierTwoAdicCarryGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierTwoAdicCarryGap ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicCarryGap_alone_solves_kappa_package_iff_twoAdicCarryGap_implies_noStream

private theorem twoAdicCarryQuotientKappaPackageCriterion :
    (ParentBarrierTwoAdicCarryQuotientPositive ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicCarryQuotientPositive_alone_solves_kappa_package_iff_twoAdicCarryQuotientPositive_implies_noStream

private theorem twoAdicCylinderLiftKappaPackageCriterion :
    (ParentBarrierTwoAdicCylinderLiftGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicCylinderLiftGap_alone_solves_kappa_package_iff_twoAdicCylinderLiftGap_implies_noStream

private theorem parentBarrierOneLockCollapseTwoAdicKappaPackage :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_kappa_package

private theorem parentBarrierOneLockCollapseCarryQuotientKappaPackage :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_alone_solves_kappa_package

private theorem parentBarrierOneLockCollapseCylinderLiftKappaPackage :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_alone_solves_kappa_package

private theorem parentBarrierOneLockCollapseUniqueResidueKappaPackage :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_alone_solves_kappa_package

private theorem residueGapCylinderDescent :
    ParentBarrierResidueGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, n < parentM p ->
          parityWord n (p ++ [Branch.E]).length =
              p ++ [Branch.E] ->
          orbit n (p ++ [Branch.E]).length < n :=
  parentBarrierResidueGap_iff_cylinderSeeds_descend

private theorem residueGapToTermination
    (hres : ParentBarrierResidueGap)
    (hcross : EveryNonterminalHasCrossing) :
    forall n, 0 < n -> ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_crossing hres hcross

private theorem residueNoStreamToTermination
    (hres : ParentBarrierResidueGap)
    (hbar : NoPositiveInfiniteBarrierStream) :
    forall n, 0 < n -> ReachesTerminal n :=
  collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream hres hbar

private theorem residueGapExactObstruction
    (hres : ParentBarrierResidueGap) :
    (forall n, 0 < n -> ReachesTerminal n) <->
      NoPositiveInfiniteBarrierStream :=
  acceleratedCollatz_iff_noPositiveInfiniteBarrierStream_of_residueGap hres

private theorem frontierInputsTermination
    (h : CollatzFrontierInputs) :
    forall n, 0 < n -> ReachesTerminal n :=
  collatz_from_frontierInputs h

private theorem frontierInputsExact :
    CollatzFrontierInputs <->
      ParentBarrierResidueGap /\
        (forall n, 0 < n -> ReachesTerminal n) :=
  frontierInputs_iff_residueGap_and_acceleratedCollatz

private theorem frontierInputsResidueCollapse :
    (ParentBarrierResidueGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierResidueGap) :=
  frontierInputs_iff_residueGap_of_residueGap_implies_noStream

private theorem frontierInputsParentGapCollapse :
    (ParentBarrierGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierGap) :=
  frontierInputs_iff_parentBarrierGap_of_parentBarrierGap_implies_noStream

private theorem parentBarrierOneLockCollapsePackage :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierGap) :=
  parentBarrierOneLockCollapse_iff_frontierInputs_parentBarrierGap

private theorem parentBarrierOneLockCollapseResiduePackage :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierResidueGap) :=
  parentBarrierOneLockCollapse_iff_frontierInputs_residueGap

private theorem frontierInputsParentGapAndOneLock :
    CollatzFrontierInputs <->
      ParentBarrierGap /\ ParentBarrierOneLockCollapse :=
  frontierInputs_iff_parentBarrierGap_and_oneLock

private theorem frontierInputsResidueGapAndOneLock :
    CollatzFrontierInputs <->
      ParentBarrierResidueGap /\ ParentBarrierOneLockCollapse :=
  frontierInputs_iff_residueGap_and_oneLock

private theorem oneFrontierCriterion :
    (ParentBarrierResidueGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierResidueGap ->
        NoPositiveInfiniteBarrierStream) :=
  residueGap_alone_solves_collatz_iff_residueGap_implies_noStream

private theorem parentGapOneFrontierCriterion :
    (ParentBarrierGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_noStream

private theorem parentBarrierOneLockCollapseTermination :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierGap ->
        forall n, 0 < n -> ReachesTerminal n) :=
  parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_collatz

private theorem oneFrontierContractCriterion :
    (ParentBarrierResidueGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierResidueGap ->
        EveryNonterminalContracts) :=
  residueGap_alone_solves_collatz_iff_residueGap_implies_everyNonterminalContracts

private theorem parentGapOneFrontierContractCriterion :
    (ParentBarrierGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierGap ->
        EveryNonterminalContracts) :=
  parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_everyNonterminalContracts

private theorem oneLockNoStream
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    NoPositiveInfiniteBarrierStream :=
  noPositiveInfiniteBarrierStream_of_parentBarrierGap_and_oneLock hgap hlock

private theorem oneLockCrossing
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    EveryNonterminalHasCrossing :=
  everyNonterminalHasCrossing_of_parentBarrierGap_and_oneLock hgap hlock

private theorem oneLockContracts
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    EveryNonterminalContracts :=
  everyNonterminalContracts_of_parentBarrierGap_and_oneLock hgap hlock

private theorem oneLockDescent
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    forall n, 2 < n -> FallsBelowSelf n :=
  allFallBelow_of_parentBarrierGap_and_oneLock hgap hlock

private theorem oneLockTermination
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    forall n, 0 < n -> ReachesTerminal n :=
  collatz_from_parentBarrierGap_and_oneLock hgap hlock

private theorem residueOneLockTermination
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse) :
    forall n, 0 < n -> ReachesTerminal n :=
  collatz_from_residueGap_and_oneLock hres hlock

private theorem crossingNoInfiniteStream :
    EveryNonterminalHasCrossing <->
      NoPositiveInfiniteBarrierStream :=
  everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream

private theorem contractsCrossing :
    EveryNonterminalContracts <->
      EveryNonterminalHasCrossing :=
  everyNonterminalContracts_iff_crossing

private theorem contractsNoInfiniteStream :
    EveryNonterminalContracts <->
      NoPositiveInfiniteBarrierStream :=
  everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream

private theorem parentCylinderNoInfiniteStream :
    EveryNonterminalHasParentBarrierCylinder <->
      NoPositiveInfiniteBarrierStream :=
  everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream

private theorem cylinderAvoidingPositiveInfinite (n : Nat) :
    CylinderAvoidingBarrierStream n <->
      2 < n /\ InfiniteBarrierStream n :=
  cylinderAvoidingBarrierStream_iff_positive_infiniteBarrierStream n

private theorem cylinderAvoidingNoParentCylinder (n : Nat) :
    CylinderAvoidingBarrierStream n <->
      2 < n /\ InfiniteBarrierStream n /\
        Not (exists p : List Branch,
          ParentBarrier p /\
            parityWord n (p ++ [Branch.E]).length = p ++ [Branch.E]) :=
  cylinderAvoidingBarrierStream_iff_infinite_and_no_parentCylinder n

private theorem noStreamExcludesCylinderAvoiding :
    NoPositiveInfiniteBarrierStream ->
      Not (exists n, CylinderAvoidingBarrierStream n) :=
  noPositiveInfiniteBarrierStream_excludes_cylinderAvoiding

private theorem kappaIsStoppingStage (m k : Nat) :
    ClosureOrdinalStage m k <->
      TotalStoppingStage m k :=
  closureOrdinalStage_iff_totalStoppingStage m k

private theorem descentKappaBridge
    (hdesc : forall n, 2 < n -> FallsBelowSelf n)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <-> ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_all_fall_below hdesc m hm

private theorem descentKappaStageBridge
    (hdesc : forall n, 2 < n -> FallsBelowSelf n)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <-> ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below hdesc m hm

private theorem descentTotalStoppingStageBridge
    (hdesc : forall n, 2 < n -> FallsBelowSelf n)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <-> ReachesTerminal m :=
  totalStoppingStage_exists_iff_reachesTerminal_of_all_fall_below hdesc m hm

private theorem residueKappaBridge
    (hres : ParentBarrierResidueGap)
    (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <-> ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_residueGap_and_crossing hres hcross m hm

private theorem residueKappaStageBridge
    (hres : ParentBarrierResidueGap)
    (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <-> ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_crossing
    hres hcross m hm

private theorem zetaStarBridge
    {N : Nat} (z : ArithmeticZetaStar N) :
    (zetaStarZeroSet z = fun _ => true)
      /\ FiniteDiscreteDelone (zetaStarZeroSet z)
      /\ finiteDiffractionMass N (zetaStarZeroSet z) Set.univ = N + 1
      /\ (finiteFourierDualKind z.phase = FiniteDiffractionKind.purePoint <->
        IsPisotInflation z.phase) :=
  ⟨(zetaStar_bridge_evidence z).1,
    (zetaStar_bridge_evidence z).2.1,
    (zetaStar_bridge_evidence z).2.2.1,
    (zetaStar_bridge_evidence z).2.2.2.1⟩

private theorem zetaStarTraceIdentity
    {N : Nat} (z : ArithmeticZetaStar N) (d : Fin (N + 1)) :
    (zetaStarTrace z d).B * orbit z.seed d.val =
      (zetaStarTrace z d).A * z.seed + (zetaStarTrace z d).C :=
  zetaStarTrace_affine_identity z d

private theorem zetaStarTraceDenominator
    {N : Nat} (z : ArithmeticZetaStar N) (d : Fin (N + 1)) :
    (zetaStarTrace z d).B = 2 ^ d.val :=
  zetaStarTrace_B_eq_two_pow z d

private theorem zetaStarMassPurePoint
    {N : Nat} (z : ArithmeticZetaStar N)
    (h : IsPisotInflation z.phase) :
    (zetaStarFiniteDiffractionReadout z).component =
        FiniteDiffractionKind.purePoint /\
      (zetaStarFiniteDiffractionReadout z).atomMass =
        finiteDiffractionMass N (zetaStarZeroSet z) Set.univ /\
      0 < (zetaStarFiniteDiffractionReadout z).atomMass :=
  zetaStar_finiteDiffractionMass_purePoint_of_pisot z h

private theorem zetaStarPhaseReadout
    {N : Nat} (z : ArithmeticZetaStar N) :
    lebesgueType (zetaStarFiniteDiffractionReadout z).component =
      zetaStarPhaseType z :=
  zetaStar_phaseType_readout z

private theorem zetaStarPhaseTrichotomy
    {N : Nat} (z : ArithmeticZetaStar N) :
    zetaStarPhaseType z = Regime.consistent \/
      zetaStarPhaseType z = Regime.paraconsistent \/
        zetaStarPhaseType z = Regime.mixed :=
  zetaStar_phaseType_trichotomy z

private theorem zetaStarPurePointIffPhaseConsistent
    {N : Nat} (z : ArithmeticZetaStar N) :
    (zetaStarFiniteDiffractionReadout z).component =
        FiniteDiffractionKind.purePoint <->
      zetaStarPhaseType z = Regime.consistent :=
  zetaStar_readout_purePoint_iff_phaseType_consistent z

private theorem zetaStarFiniteQuasicrystal
    {N : Nat} (z : ArithmeticZetaStar N)
    (h : IsPisotInflation z.phase) :
    FinitePurePointQuasicrystal N (zetaStarZeroSet z) z.phase :=
  zetaStar_finitePurePointQuasicrystal_of_pisot z h

private theorem zetaStarCanonicalMassPurePoint
    (N : Nat) :
    (zetaStarFiniteDiffractionReadout (canonicalZetaStar N)).component =
        FiniteDiffractionKind.purePoint /\
      (zetaStarFiniteDiffractionReadout (canonicalZetaStar N)).atomMass =
        finiteDiffractionMass N
          (zetaStarZeroSet (canonicalZetaStar N)) Set.univ /\
      0 < (zetaStarFiniteDiffractionReadout
        (canonicalZetaStar N)).atomMass :=
  canonicalZetaStar_finiteDiffractionMass_purePoint N

private theorem zetaStarCanonicalQuasicrystal
    (N : Nat) :
    FinitePurePointQuasicrystal N
      (zetaStarZeroSet (canonicalZetaStar N))
      (canonicalZetaStar N).phase :=
  canonicalZetaStar_finitePurePointQuasicrystal N

private theorem zetaStarCanonicalFiniteForm
    (N : Nat) :
    ZetaStarFiniteDysonQuasicrystalForm (canonicalZetaStar N) :=
  canonicalZetaStar_finiteDysonQuasicrystalForm N

private theorem zetaStarExists
    (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarArithmeticSettlingCertificate z /\
        IsPisotInflation z.phase /\
          FinitePurePointQuasicrystal N (zetaStarZeroSet z) z.phase :=
  exists_zetaStar_finitePurePointQuasicrystal N

private theorem zetaStarExistsMassPurePoint
    (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarArithmeticSettlingCertificate z /\
        zetaStarPhaseType z = Regime.consistent /\
          (zetaStarFiniteDiffractionReadout z).component =
              FiniteDiffractionKind.purePoint /\
            (zetaStarFiniteDiffractionReadout z).atomMass =
              finiteDiffractionMass N
                (zetaStarZeroSet z) Set.univ /\
              0 <
                (zetaStarFiniteDiffractionReadout z).atomMass :=
  exists_zetaStar_finiteDiffractionMass_purePoint N

private theorem zetaStarExistsFiniteForm
    (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarFiniteDysonQuasicrystalForm z :=
  exists_zetaStar_finiteDysonQuasicrystalForm N

private def zetaStarFiniteDisplacementCoalgebra
    (N : Nat) :
    ZetaStarDisplacementCoalgebra N :=
  canonicalZetaStarDisplacementCoalgebra N

private theorem zetaStarFiniteDisplacementCoalgebraPurePoint
    (N : Nat) :
    ((canonicalZetaStarDisplacementCoalgebra N).observe
        (canonicalZetaStar N)).component =
      FiniteDiffractionKind.purePoint :=
  canonicalZetaStarDisplacementCoalgebra_purePoint N

private theorem zetaStarFiniteDisplacementCoalgebraQuasicrystal
    (N : Nat) :
    FinitePurePointQuasicrystal N
      ((canonicalZetaStarDisplacementCoalgebra N).observe
        (canonicalZetaStar N)).zeroSet
      (canonicalZetaStar N).phase :=
  canonicalZetaStarDisplacementCoalgebra_quasicrystal N

private theorem zetaStarCoalgebraicApparatus :
    ZetaStarCoalgebraicPromotionApparatus :=
  zetaStar_coalgebraicPromotion_apparatus

private theorem zetaStarMetallizationBoundary :
    MetallizationAlgebraCoalgebraBoundary :=
  metallization_algebraCoalgebraBoundary

private theorem zetaStarAlgebraCoalgebraBoundary :
    ZetaStarAlgebraCoalgebraBoundary :=
  zetaStar_algebraCoalgebraBoundary

private def zetaStarAnalyticRichnessRecovery :
    ZetaStarAnalyticRichnessRecovery :=
  zetaStar_analyticRichnessRecovery

private theorem zetaStarCanonicalShortcut
    (N : Nat) :
    exists k m, 1 <= k /\ m % 2 = 1 /\
      3 * (canonicalZetaStar N).seed + 1 = 2 ^ k * m /\
        twoAdicVal (2 ^ k) = k /\
          k <= twoAdicVal (3 * (canonicalZetaStar N).seed + 1) :=
  canonicalZetaStar_shortcut_twoAdicValuation N

private theorem zetaStarExistsWithOddShortcut
    (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarArithmeticSettlingCertificate z /\
        IsPisotInflation z.phase /\
          z.seed % 2 = 1 /\
            (exists k m, 1 <= k /\ m % 2 = 1 /\
              3 * z.seed + 1 = 2 ^ k * m /\
                twoAdicVal (2 ^ k) = k /\
                  k <= twoAdicVal (3 * z.seed + 1)) /\
              FinitePurePointQuasicrystal N (zetaStarZeroSet z) z.phase :=
  exists_zetaStar_arithmeticSettling_with_odd_shortcut N

private theorem zetaStarArithmeticCertificate
    {N : Nat} (z : ArithmeticZetaStar N) :
    ZetaStarArithmeticSettlingCertificate z :=
  zetaStar_arithmeticSettling_certificate z

private theorem residueNoStreamKappaBridge
    (hres : ParentBarrierResidueGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <-> ReachesTerminal m :=
  reachedQuiesces_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    hres hbar m hm

private theorem residueNoStreamKappaStageBridge
    (hres : ParentBarrierResidueGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <-> ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream
    hres hbar m hm

private theorem frontierInputsKappaStage
    (h : CollatzFrontierInputs)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <-> ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_frontierInputs h m hm

private theorem frontierInputsTotalStoppingStage
    (h : CollatzFrontierInputs)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <-> ReachesTerminal m :=
  totalStoppingStage_exists_iff_reachesTerminal_of_frontierInputs h m hm

private theorem residueKappaPackageCriterion :
    (ParentBarrierResidueGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierResidueGap ->
        NoPositiveInfiniteBarrierStream) :=
  residueGap_alone_solves_kappa_package_iff_residueGap_implies_noStream

private theorem parentGapKappaPackageCriterion :
    (ParentBarrierGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierGap_alone_solves_kappa_package_iff_parentBarrierGap_implies_noStream

private theorem parentBarrierOneLockCollapseKappaPackage :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package

private theorem oneLockKappaStage
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  closureOrdinalStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock
    hgap hlock m hm

private theorem oneLockTotalStoppingStage
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <->
      ReachesTerminal m :=
  totalStoppingStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock
    hgap hlock m hm

private theorem oneLockKappaPackage
    (hgap : ParentBarrierGap) (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  kappaPackage_of_parentBarrierGap_and_oneLock hgap hlock

private theorem residueOneLockKappaPackage
    (hres : ParentBarrierResidueGap) (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  kappaPackage_of_residueGap_and_oneLock hres hlock

private theorem twoAdicCarryQuotientOneLockKappaPackage
    (hquot : ParentBarrierTwoAdicCarryQuotientPositive)
    (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  kappaPackage_of_twoAdicCarryQuotientPositive_and_oneLock hquot hlock

private theorem twoAdicCylinderLiftOneLockKappaPackage
    (hlift : ParentBarrierTwoAdicCylinderLiftGap)
    (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  kappaPackage_of_twoAdicCylinderLiftGap_and_oneLock hlift hlock

/-!
A frontier page for the Collatz settlement, residue gap, and stopping-time bridge.
-/

#doc (Manual) "Collatz frontier" =>

# Collatz Frontier

The Collatz claim-site is a strict-finite settlement only after its frontier
inputs are named. The live Lean graph now separates three things:

* the green arithmetic skeleton: affine traces, first-passage words, parent
  barriers, semigroup certificates, residue characterization, and conditional
  reduction;
* the green settlement bridge: reached-set quiescence is terminal reachability
  under universal descent;
* the red inputs: the parent-barrier gap itself and the crossing/no-infinite
  barrier-stream statement.

The point of the page is not to announce a solved Collatz theorem. It is to
show exactly what the library proves.

## The Residue Gap

The semigroup frontier is:

{docstring Obsmetrologia.Closure.Collatz.ParentBarrierGap}

Its residue sharpening is:

{docstring Obsmetrologia.Closure.Collatz.ParentBarrierResidueGap}

Lean proves that the residue inequality implies the semigroup gap:

{docstring Obsmetrologia.Closure.Collatz.parentBarrierResidueGap_implies_parentBarrierGap}

and in fact proves the equivalence:

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_parentBarrierResidueGap}

The residue-form frontier alias is:

{docstring Obsmetrologia.Closure.Collatz.parentBarrierResidueGap_holds}

The same face can be read as a full-modulus carry:

{docstring Obsmetrologia.Closure.Collatz.ParentBarrierResidueCarryGap}

{docstring Obsmetrologia.Closure.Collatz.residue_lt_iff_modulus_le_sub}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierResidueGap_iff_parentBarrierResidueCarryGap}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_parentBarrierResidueCarryGap}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierResidueCarryGap_holds}

The aperiodic inverse-hull carrier for that face is now explicit:

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicResidueSystem}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicThreadOfNat}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicThreadOfNat_proj}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicThreadOfNat_ext}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicThreadOfNat_eq_iff_all_residues_eq}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicThreadOfNat_proj_eq_iff_mod_eq}

{docstring Obsmetrologia.AperiodicOrder.Tiling.TwoAdicPositiveCylinderLift}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicStageSucc}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicStageSucc_restrict}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicOdometer}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicOdometer_proj}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicOdometer_threadOfNat}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentD_coprime_twoAdicModulus}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrier_twoAdicResidue_exists}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrier_twoAdicResidue_unique}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ParentBarrierTwoAdicCarryGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ParentBarrierTwoAdicUniqueResidueGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ParentBarrierTwoAdicCarryQuotientGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotient}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientOrdinal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ParentBarrierTwoAdicCarryQuotientPositive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ParentBarrierTwoAdicCylinderLiftGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryGap_iff_uniqueResidueGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryGap_iff_carryQuotientGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryGap_iff_carryQuotientPositive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientGap_iff_carryQuotientPositive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCylinderLiftGap_iff_carryQuotientPositive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientOrdinal_eq_backwardCarryQuotient}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientPositive_iff_ordinal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicUniqueResidueGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryQuotientGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryQuotientPositive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueCarryGap_iff_parentBarrierTwoAdicCarryGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueGap_iff_parentBarrierTwoAdicUniqueResidueGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryQuotientGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryQuotientPositive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierResidueGap_iff_parentBarrierTwoAdicCarryGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_parentBarrierTwoAdicUniqueResidueGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_parentBarrierTwoAdicCarryQuotientPositive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientPositive_iff_backwardCarryQuotients_positive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_parentBarrierTwoAdicCylinderLiftGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_parentBarrierTwoAdicCarryGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryQuotientPositive_iff_cylinderSeeds_descend}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCylinderLiftGap_iff_cylinderSeeds_descend}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierTwoAdicCarryGap_holds}

The two-adic face also carries the same conditional termination route:

{docstring Obsmetrologia.AperiodicOrder.Tiling.collatz_from_parentBarrierTwoAdicCarryGap_and_crossing}

{docstring Obsmetrologia.AperiodicOrder.Tiling.collatz_from_parentBarrierTwoAdicCarryGap_and_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.acceleratedCollatz_iff_noPositiveInfiniteBarrierStream_of_twoAdicCarryGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicCarryGap_alone_solves_collatz_iff_twoAdicCarryGap_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicCarryGap_alone_solves_collatz_iff_twoAdicCarryGap_implies_everyNonterminalContracts}

{docstring Obsmetrologia.AperiodicOrder.Tiling.frontierInputs_iff_twoAdicCarryGap_of_twoAdicCarryGap_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.frontierInputs_iff_twoAdicUniqueResidueGap_of_twoAdicUniqueResidueGap_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.frontierInputs_iff_twoAdicCarryGap_and_oneLock}

{docstring Obsmetrologia.AperiodicOrder.Tiling.frontierInputs_iff_twoAdicUniqueResidueGap_and_oneLock}

{docstring Obsmetrologia.AperiodicOrder.Tiling.frontierInputs_iff_twoAdicCarryQuotientPositive_and_oneLock}

{docstring Obsmetrologia.AperiodicOrder.Tiling.frontierInputs_iff_twoAdicCylinderLiftGap_and_oneLock}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_everyNonterminalContracts}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_everyNonterminalContracts}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_implies_everyNonterminalHasCrossing}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_implies_everyNonterminalHasCrossing}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_everyNonterminalContracts}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_implies_everyNonterminalHasCrossing}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_frontierInputs_twoAdicCarryGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_collatz}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_frontierInputs_twoAdicUniqueResidueGap}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_alone_solves_collatz}

The settlement bridge also transports through the two-adic face:

{docstring Obsmetrologia.AperiodicOrder.Tiling.reachedQuiesces_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.closureOrdinalStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.totalStoppingStage_exists_iff_reachesTerminal_of_twoAdicCarryGap_and_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicCarryGap_alone_solves_kappa_package_iff_twoAdicCarryGap_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicCarryQuotientPositive_alone_solves_kappa_package_iff_twoAdicCarryQuotientPositive_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.twoAdicCylinderLiftGap_alone_solves_kappa_package_iff_twoAdicCylinderLiftGap_implies_noStream}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCarryGap_alone_solves_kappa_package}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCarryQuotientPositive_alone_solves_kappa_package}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicCylinderLiftGap_alone_solves_kappa_package}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierOneLockCollapse_iff_twoAdicUniqueResidueGap_alone_solves_kappa_package}

The same residue inequality is exactly the first-passage cylinder descent
skeleton:

{docstring Obsmetrologia.Closure.Collatz.firstPassage_seed_residue}

{docstring Obsmetrologia.Closure.Collatz.parentBarrier_residue_realizes_firstPassage}

{docstring Obsmetrologia.Closure.Collatz.parentBarrier_residue_descent_iff_gap}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierResidueGap_iff_cylinderSeeds_descend}

The finite-state attack face is the bad-cylinder language: a semigroup
certificate is exactly a non-descending representative in the first-passage
cylinder.

{docstring Obsmetrologia.Closure.Collatz.badCylinderSeed_of_semigroup_certificate}

{docstring Obsmetrologia.Closure.Collatz.semigroup_certificate_of_badCylinderSeed}

{docstring Obsmetrologia.Closure.Collatz.inTwoGenSemigroup_iff_badCylinderSeed}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_badCylinderSeed}

The backward reading names the finite representative itself. A backward seed is
a bounded parity-cylinder representative, and the parent-barrier inverse
residue is exactly the backward seed of the first-passage word.

{docstring Obsmetrologia.Closure.Collatz.BackwardCylinderSeed}

{docstring Obsmetrologia.Closure.Collatz.backwardCylinderSeed_exists}

{docstring Obsmetrologia.Closure.Collatz.FirstPassageBackwardSeed}

{docstring Obsmetrologia.Closure.Collatz.parentBarrier_inverseResidue_is_backwardSeed}

The same obstruction can then be stated without mentioning the semigroup until
the final equivalence: a bad backward seed is a first-passage backward seed
whose iterate does not descend.

{docstring Obsmetrologia.Closure.Collatz.BadFirstPassageBackwardSeed}

{docstring Obsmetrologia.Closure.Collatz.inTwoGenSemigroup_iff_badBackwardSeed}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_badBackwardSeed}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardSeeds_descend}

The margin face uses the project's own ordinal carrier. The arithmetic trace
still computes in the finite fragment, but the public lock is stated as an
order relation between finite ordinals: the parent-modulus ordinal lies below
the backward-margin ordinal.

{docstring Obsmetrologia.Ord.ofNat_le_ofNat_iff}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardMargin}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardDescentAmount}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardModulus}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardCarryQuotient}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardMargin_eq_ofNat_modulus_mul_descentAmount}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_descent_iff_margin_positive}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_descent_iff_fullCarry}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardCarryQuotient_eq_descentAmount}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_descent_iff_carryQuotient_positive}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_fullCarry_iff_carryQuotient_positive}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_carryQuotient_positive_iff_not_bad}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeed_fullCarry_iff_not_bad}

The canonical front-loaded subcase has an exact denominator recurrence. Write
`D = 2^(a+b+1)-3^a`, `P = 2^(a+b+1)`, and `T = 2^(b+1)`. Up-steps propagate
`T <= D` automatically. Same-`b` steps are the only remaining aperture, and Lean
now proves that the global canonical denominator-growth statement is equivalent
to filling exactly those same-step margins. If a denominator-bound failure ever
occurs at `a >= 2`, it sits strictly on the next up-branch side, so it cannot
itself be followed by another same-`b` transition. A counterexample, if one
exists, must also sit in the top quotient block:
`3^a / 2^(b+1) = 2^a - 1`. Conversely, the denominator bound is exactly
top-block avoidance, equivalently avoidance of the final dyadic slice below the
parent ceiling. Lean also packages these as global equivalences over every
canonical parent barrier with `a >= 3`, and records the exact positive remainder
that would witness failure. Thus the global target is exactly absence of those
positive top-slice remainders.

{docstring Obsmetrologia.Closure.Collatz.parentD_canonicalWord}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominator_update_same}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominator_update_up}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominator_failure_forces_next_up_margin}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominator_failure_forces_next_not_same}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominatorBound_step_same_iff_margin}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominatorBound_iff_same_step_margins}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominator_failure_forces_top_quotient}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominatorBound_iff_not_top_quotient}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominatorBound_iff_not_last_dyadic_slice}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominatorBound_all_iff_not_top_quotient}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominatorBound_all_iff_not_last_dyadic_slice}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominator_failure_iff_top_remainder_exists}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominator_no_top_remainder_iff_not_last_dyadic_slice}

{docstring Obsmetrologia.Closure.Collatz.canonicalDenominatorBound_all_iff_no_top_remainder_exists}

The same edge can be read as a token/claim boundary cell. The seed proof supplies
the claim side; the positive carry quotient supplies the token side. The bad
seed is therefore exactly the `active` corner: claim present, token absent.

The inducer is already present in the firing dynamics. The blowup table classifies
`absurd -> active` as `fSide`: the claim side fires while the token side is
still absent. In the nuclear reading, `potential` is the saturating nucleus and
`active` is the transferring nucleus. Thus the bad articulation is the transfer
side firing before the saturating identity side has supplied the token. The
abstract nucleus theorem names the same boundary: active/transferring without
potential/saturating is not invariant under the joint forward closure. The
firing-table complement says that a nontrivial forward move out of `active`
can only be the `active -> stable` top-firing row. The FOUR/D4 symmetry carries
the same mechanism through a finite bypass: negation transports the ungrounded
claim-side `fSide` edge to the token-side `tSide` edge, and the `negSwap`
rotation carries `active` around the cycle
`active -> absurd -> potential -> stable`. The parent-barrier gap is therefore
equivalent to the absence of ungrounded claim-side `fSide` firings at
nontrivial first-passage boundaries.

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell_active_iff_bad}

{docstring Obsmetrologia.Closure.Collatz.firstPassageBackwardSeedCell_stable_iff_not_bad}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardMargins_positive}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardMargins_fullCarry}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_backwardCarryQuotients_positive}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_iff_no_activeBackwardSeedCell}

{docstring Obsmetrologia.Blowup.active_nontrivial_forward_cellType_top}

{docstring Obsmetrologia.Blowup.active_cellType_top_iff_stable}

{docstring Obsmetrologia.Blowup.potential_nontrivial_forward_cellType_top}

{docstring Obsmetrologia.Blowup.claimSide_firing_negates_to_tokenSide}

{docstring Obsmetrologia.Blowup.active_top_firing_negates_to_potential_top_firing}

{docstring Obsmetrologia.Blowup.active_d4_bypass_cycle}

{docstring Obsmetrologia.Blowup.active_d4_bypass_first_firing}

{docstring Obsmetrologia.Order.CommutingNuclei.transferring_without_saturating_pi_ascends}

{docstring Obsmetrologia.Order.NuclearQuartet.active_not_potential_stable_ascends}

{docstring Obsmetrologia.AperiodicOrder.Tiling.NoUngroundedClaimSideFiringAtParentBarrier}

{docstring Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_induces_fSideFiring}

{docstring Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_negates_to_tSideFiring}

{docstring Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_d4_bypasses_to_tSideFiring}

{docstring Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_activeToStable_isTopFiring}

{docstring Obsmetrologia.AperiodicOrder.Tiling.badBackwardSeedCell_isTransferring}

{docstring Obsmetrologia.AperiodicOrder.Tiling.parentBarrierGap_iff_noUngroundedClaimSideFiringAtParentBarrier}

Checked:

```lean
example
    (hres : ParentBarrierResidueGap) :
    ParentBarrierGap :=
  residueGapToParentGap hres

example :
    ParentBarrierGap <->
      ParentBarrierResidueGap :=
  parentGapResidueIff

example :
    ParentBarrierResidueGap <->
      ParentBarrierResidueCarryGap :=
  residueCarryIff

example :
    ParentBarrierGap <->
      ParentBarrierResidueCarryGap :=
  parentGapCarryIff

example :
    ParentBarrierGap <->
      (forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        Not (exists n, BadFirstPassageBackwardSeed p n)) :=
  parentGapBadBackwardSeedIff

example :
    ParentBarrierGap <->
      (forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          orbit n (p ++ [Branch.E]).length < n) :=
  parentGapBackwardSeedDescentIff

example :
    ParentBarrierGap <->
      (forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          Ord.Le (firstPassageBackwardModulus p)
            (firstPassageBackwardMargin p n)) :=
  parentGapBackwardMarginFullCarryIff

example :
    ParentBarrierGap <->
      (forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          Ord.Le (Ord.succ Ord.zero)
            (firstPassageBackwardCarryQuotient p n)) :=
  parentGapBackwardCarryQuotientPositiveIff

example (u : Utterance) :
    ParentBarrierGap <-> NoActiveBackwardSeedCell u :=
  parentGapNoActiveBackwardSeedCellIff u

example :
    ParentBarrierGap <->
      NoUngroundedClaimSideFiringAtParentBarrier :=
  parentGapNoUngroundedClaimSideFiringIff

example :
    Blowup.cellType Articulating.Corner.absurd
        Articulating.Corner.active =
      some Blowup.FiringType.fSide :=
  claimWithoutTokenIsFSideFiring

example (after : Articulating.Corner)
    (hle : Charge.leK
      Articulating.Corner.active after = true)
    (hne : Not (after = Articulating.Corner.active)) :
    Blowup.cellType Articulating.Corner.active after =
        some Blowup.FiringType.top /\
      after = Articulating.Corner.stable :=
  Blowup.active_nontrivial_forward_cellType_top hle hne

example :
    Blowup.cellType Articulating.Corner.active
        Articulating.Corner.stable =
      some Blowup.FiringType.top :=
  activeToStableIsTopFiring

example (after : Articulating.Corner) :
    Blowup.cellType Articulating.Corner.active after =
        some Blowup.FiringType.top <->
      after = Articulating.Corner.stable :=
  Blowup.active_cellType_top_iff_stable after

example {after : Articulating.Corner}
    (hle : Charge.leK Articulating.Corner.potential after = true)
    (hne : Not (after = Articulating.Corner.potential)) :
    Blowup.cellType Articulating.Corner.potential after =
        some Blowup.FiringType.top /\
      after = Articulating.Corner.stable :=
  Blowup.potential_nontrivial_forward_cellType_top hle hne

example :
    Blowup.cellType Articulating.Corner.absurd
        Articulating.Corner.active =
        some Blowup.FiringType.fSide ->
      Blowup.cellType
        (D4.D8.act D4.D8.neg Articulating.Corner.absurd)
        (D4.D8.act D4.D8.neg Articulating.Corner.active) =
        some Blowup.FiringType.tSide :=
  Blowup.claimSide_firing_negates_to_tokenSide

example :
    Blowup.cellType Articulating.Corner.active
        Articulating.Corner.stable =
        some Blowup.FiringType.top ->
      Blowup.cellType
        (D4.D8.act D4.D8.neg Articulating.Corner.active)
        (D4.D8.act D4.D8.neg Articulating.Corner.stable) =
        some Blowup.FiringType.top :=
  Blowup.active_top_firing_negates_to_potential_top_firing

example :
    D4.D8.act D4.D8.negSwap Articulating.Corner.active =
        Articulating.Corner.absurd /\
      D4.D8.act D4.D8.negSwap Articulating.Corner.absurd =
        Articulating.Corner.potential /\
      D4.D8.act D4.D8.negSwap Articulating.Corner.potential =
        Articulating.Corner.stable /\
      D4.D8.act D4.D8.negSwap Articulating.Corner.stable =
        Articulating.Corner.active :=
  Blowup.active_d4_bypass_cycle

example :
    Blowup.cellType
        (D4.D8.act D4.D8.negSwap Articulating.Corner.active)
        (D4.D8.act D4.D8.negSwap
          (D4.D8.act D4.D8.negSwap
            Articulating.Corner.active)) =
      some Blowup.FiringType.tSide :=
  Blowup.active_d4_bypass_first_firing

example
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType (Articulating.Cell.initial u).corner
        (firstPassageBackwardSeedCell
          u p n hseed).corner =
      some Blowup.FiringType.fSide :=
  badSeedFiresFSide u hp hseed hbad

example
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType (D4.D8.act D4.D8.neg (Articulating.Cell.initial u).corner)
        (D4.D8.act D4.D8.neg
          (firstPassageBackwardSeedCell
            u p n hseed).corner) =
      some Blowup.FiringType.tSide :=
  badSeedNegatesToTokenSide u hp hseed hbad

example
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType
        (D4.D8.act D4.D8.negSwap
          (firstPassageBackwardSeedCell
            u p n hseed).corner)
        (D4.D8.act D4.D8.negSwap
          (D4.D8.act D4.D8.negSwap
            (firstPassageBackwardSeedCell
              u p n hseed).corner)) =
      some Blowup.FiringType.tSide :=
  badSeedD4BypassesToTokenSide u hp hseed hbad

example
    (u : Utterance)
    {p : List Branch} {n : Nat}
    (hp : ParentBarrier p)
    (hseed : FirstPassageBackwardSeed p n)
    (hbad : BadFirstPassageBackwardSeed p n) :
    Blowup.cellType
        (firstPassageBackwardSeedCell
          u p n hseed).corner
        Articulating.Corner.stable =
      some Blowup.FiringType.top :=
  badSeedActiveToStableTop u hp hseed hbad

example
    {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (a : H.carrier) :
    Autopoiesis.cellCorner Q Articulating.Corner.potential a =
      (Autopoiesis.saturating Q).j a :=
  potentialIsSaturating Q a

example
    {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) (a : H.carrier) :
    Autopoiesis.cellCorner Q Articulating.Corner.active a =
      (Autopoiesis.transferring Q).j a :=
  activeIsTransferring Q a

example
    {H : Order.HeytingAlgebra}
    (Q : Order.CommutingNuclei H) {a : H.carrier}
    (htransferring : Q.j2.Fix a)
    (hnotSaturating : Not (Q.j1.Fix a)) :
    H.le a (Q.pi a) /\ Not (Q.pi a = a) :=
  commutingNucleiTransferringAscends
    Q htransferring hnotSaturating

example
    {H : Order.HeytingAlgebra}
    (Q : Order.NuclearQuartet H) {a : H.carrier}
    (hactive : Q.cornerOp Articulating.Corner.active a = a)
    (hnotPotential :
      Not (Q.cornerOp Articulating.Corner.potential a = a)) :
    H.le a (Q.cornerOp Articulating.Corner.stable a) /\
      Not (Q.cornerOp Articulating.Corner.stable a = a) :=
  nuclearQuartetJointAscends Q hactive hnotPotential

example (u v : Utterance) (a : Articulating) :
    Articulating.utter u ≠ Articulating.pair v a :=
  articulatingNoBackfill u v a

example :
    ParentBarrierGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        Not (exists n, n < parentM p /\
          parityWord n (p ++ [Branch.E]).length =
            p ++ [Branch.E] /\
          n <= orbit n (p ++ [Branch.E]).length) :=
  parentGapBadCylinderIff

example {p : List Branch}
    (hp : ParentBarrier p) :
    InTwoGenSemigroup
        (parentC p) (parentD p) (parentM p) <->
      exists n, n < parentM p /\
        parityWord n (p ++ [Branch.E]).length =
          p ++ [Branch.E] /\
        n <= orbit n (p ++ [Branch.E]).length :=
  semigroupBadCylinderIff hp

example (x n : Nat) :
    (twoAdicResidueSystem.projAt n
        (twoAdicThreadOfNat x)).val =
      x % 2 ^ n := by
  exact twoAdicNatProjection x n

example (x y : Nat) :
    twoAdicThreadOfNat x = twoAdicThreadOfNat y <->
      forall n, x % 2 ^ n = y % 2 ^ n :=
  twoAdicNatThreadStageSeparated x y

example (x y n : Nat) :
    twoAdicResidueSystem.projAt n
        (twoAdicThreadOfNat x) =
      twoAdicResidueSystem.projAt n
        (twoAdicThreadOfNat y) <->
      x % 2 ^ n = y % 2 ^ n :=
  twoAdicNatStageCylinder x y n

example (t : TwoAdicResidueThread) (n : Nat) :
    (twoAdicResidueSystem.projAt n
        (twoAdicOdometer t)).val =
      ((twoAdicResidueSystem.projAt n t).val + 1) % 2 ^ n :=
  twoAdicOdometerProjection t n

example (x : Nat) :
    twoAdicOdometer (twoAdicThreadOfNat x) =
      twoAdicThreadOfNat (x + 1) :=
  twoAdicOdometerNat x

example {p : List Branch} (hp : ParentBarrier p) :
    (parentD p).Coprime
      (2 ^ (p.length + 1)) :=
  parentDTwoAdicUnit hp

example {p : List Branch} (hp : ParentBarrier p) :
    exists r, r < 2 ^ (p.length + 1) /\
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1) :=
  parentTwoAdicResidueExists hp

example {p : List Branch} (hp : ParentBarrier p)
    {r s : Nat}
    (hr : r < 2 ^ (p.length + 1))
    (hs : s < 2 ^ (p.length + 1))
    (hrmod :
      (parentD p * r) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1))
    (hsmod :
      (parentD p * s) % 2 ^ (p.length + 1) =
        parentC p % 2 ^ (p.length + 1)) :
    r = s :=
  parentTwoAdicResidueUnique hp hr hs hrmod hsmod

example :
    ParentBarrierTwoAdicCarryGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  twoAdicUniqueResidueGapIff

example :
    ParentBarrierResidueCarryGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  residueCarryUniqueResidueIff

example :
    ParentBarrierResidueCarryGap <->
      ParentBarrierTwoAdicCarryGap :=
  twoAdicCarryIff

example :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  residueUniqueResidueIff

example :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicCarryQuotientGap :=
  residueCarryQuotientIff

example :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicCarryQuotientPositive :=
  residueCarryQuotientPositiveIff

example :
    ParentBarrierResidueGap <->
      ParentBarrierTwoAdicCarryGap :=
  residueTwoAdicCarryIff

example :
    ParentBarrierGap <->
      ParentBarrierTwoAdicUniqueResidueGap :=
  parentGapUniqueResidueIff

example :
    ParentBarrierGap <->
      ParentBarrierTwoAdicCarryGap :=
  parentGapTwoAdicCarryIff

example :
    ParentBarrierGap <->
      ParentBarrierTwoAdicCarryQuotientGap :=
  parentGapCarryQuotientIff

example :
    ParentBarrierGap <->
      ParentBarrierTwoAdicCarryQuotientPositive :=
  parentGapCarryQuotientPositiveIff

example (p : List Branch) (r : Nat) :
    parentBarrierTwoAdicCarryQuotientOrdinal p r =
      firstPassageBackwardCarryQuotient p r :=
  twoAdicQuotientOrdinalBackward p r

example :
    ParentBarrierTwoAdicCarryQuotientPositive <->
      (forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall r, r < 2 ^ (p.length + 1) ->
          (parentD p * r) % 2 ^ (p.length + 1) =
            parentC p % 2 ^ (p.length + 1) ->
            let q :=
              parentBarrierTwoAdicCarryQuotientOrdinal p r
            Ord.Le (Ord.succ Ord.zero) q) :=
  twoAdicQuotientPositiveOrdinalIff

example :
    ParentBarrierTwoAdicCarryQuotientPositive <->
      (forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, FirstPassageBackwardSeed p n ->
          Ord.Le (Ord.succ Ord.zero)
            (firstPassageBackwardCarryQuotient p n)) :=
  twoAdicQuotientPositiveBackwardQuotientIff

example :
    ParentBarrierGap <->
      ParentBarrierTwoAdicCylinderLiftGap :=
  parentGapCylinderLiftIff

example :
    ParentBarrierTwoAdicCarryQuotientPositive <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, n < parentM p ->
          parityWord n (p ++ [Branch.E]).length =
              p ++ [Branch.E] ->
          orbit n (p ++ [Branch.E]).length < n :=
  quotientPositiveCylinderDescent

example :
    ParentBarrierTwoAdicCylinderLiftGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, n < parentM p ->
          parityWord n (p ++ [Branch.E]).length =
              p ++ [Branch.E] ->
          orbit n (p ++ [Branch.E]).length < n :=
  cylinderLiftCylinderDescent

example (htwo : ParentBarrierTwoAdicCarryGap)
    (hcross : EveryNonterminalHasCrossing) :
    forall n, 0 < n -> ReachesTerminal n :=
  twoAdicGapToTermination htwo hcross

example (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream) :
    forall n, 0 < n -> ReachesTerminal n :=
  twoAdicNoStreamToTermination htwo hbar

example (htwo : ParentBarrierTwoAdicCarryGap) :
    (forall n, 0 < n -> ReachesTerminal n) <->
      NoPositiveInfiniteBarrierStream :=
  twoAdicGapExactObstruction htwo

example :
    (ParentBarrierTwoAdicCarryGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierTwoAdicCarryGap ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicOneFrontierCriterion

example :
    (ParentBarrierTwoAdicCarryGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierTwoAdicCarryGap ->
        EveryNonterminalContracts) :=
  twoAdicOneFrontierContractCriterion

example :
    (ParentBarrierTwoAdicCarryGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicCarryGap) :=
  twoAdicFrontierCollapse

example :
    (ParentBarrierTwoAdicUniqueResidueGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicUniqueResidueGap) :=
  twoAdicUniqueResidueFrontierCollapse

example :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicCarryGap /\
        ParentBarrierOneLockCollapse :=
  twoAdicFrontierGapAndOneLock

example :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicUniqueResidueGap /\
        ParentBarrierOneLockCollapse :=
  twoAdicUniqueResidueFrontierGapAndOneLock

example :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicCarryQuotientPositive /\
        ParentBarrierOneLockCollapse :=
  twoAdicCarryQuotientFrontierGapAndOneLock

example :
    CollatzFrontierInputs <->
      ParentBarrierTwoAdicCylinderLiftGap /\
        ParentBarrierOneLockCollapse :=
  twoAdicCylinderLiftFrontierGapAndOneLock

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierOneLockCollapseCarryQuotientNoStream

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierOneLockCollapseCylinderLiftNoStream

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        EveryNonterminalContracts) :=
  parentBarrierOneLockCollapseCarryQuotientContracts

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        EveryNonterminalContracts) :=
  parentBarrierOneLockCollapseCylinderLiftContracts

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        EveryNonterminalHasCrossing) :=
  parentBarrierOneLockCollapseCarryQuotientCrossing

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        EveryNonterminalHasCrossing) :=
  parentBarrierOneLockCollapseCylinderLiftCrossing

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentBarrierOneLockCollapseUniqueResidueNoStream

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        EveryNonterminalContracts) :=
  parentBarrierOneLockCollapseUniqueResidueContracts

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        EveryNonterminalHasCrossing) :=
  parentBarrierOneLockCollapseUniqueResidueCrossing

example :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicCarryGap) :=
  parentBarrierOneLockCollapseTwoAdicPackage

example :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierTwoAdicUniqueResidueGap) :=
  parentBarrierOneLockCollapseUniqueResiduePackage

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryGap ->
        forall n, 0 < n -> ReachesTerminal n) :=
  parentBarrierOneLockCollapseTwoAdicTermination

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        forall n, 0 < n -> ReachesTerminal n) :=
  parentBarrierOneLockCollapseUniqueResidueTermination

example (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <->
      ReachesTerminal m :=
  twoAdicNoStreamKappaBridge htwo hbar m hm

example (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  twoAdicNoStreamKappaStageBridge htwo hbar m hm

example (htwo : ParentBarrierTwoAdicCarryGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <->
      ReachesTerminal m :=
  twoAdicNoStreamTotalStoppingStageBridge htwo hbar m hm

example :
    (ParentBarrierTwoAdicCarryGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierTwoAdicCarryGap ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicKappaPackageCriterion

example :
    (ParentBarrierTwoAdicCarryQuotientPositive ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicCarryQuotientKappaPackageCriterion

example :
    (ParentBarrierTwoAdicCylinderLiftGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        NoPositiveInfiniteBarrierStream) :=
  twoAdicCylinderLiftKappaPackageCriterion

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapseTwoAdicKappaPackage

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCarryQuotientPositive ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapseCarryQuotientKappaPackage

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicCylinderLiftGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapseCylinderLiftKappaPackage

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierTwoAdicUniqueResidueGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapseUniqueResidueKappaPackage

example :
    ParentBarrierResidueGap <->
      forall p : List Branch, ParentBarrier p ->
        Not (TrivialParentBarrier p) ->
        forall n, n < parentM p ->
          parityWord n (p ++ [Branch.E]).length =
              p ++ [Branch.E] ->
          orbit n (p ++ [Branch.E]).length < n :=
  residueGapCylinderDescent
```

The empirical sentence belongs beside the proof term, not inside it: the finite
audit `pnpm run collatz:audit:parent-gap` checks parent-prefix length `28`,
enumerates `1,166,059` parent barriers, checks `1,166,057` nontrivial cases,
and finds zero residue-gap violations, zero carry-quotient positivity
violations, zero cylinder-realization violations, zero bad-cylinder violations,
and zero mismatches between the proved-equivalent faces. Lean records the theorem
shape and the conditional transport: the semigroup-gap frontier is exactly the
modular inequality frontier, exactly the positive carry-quotient frontier,
exactly the no-bad-cylinder frontier, and exactly the positive two-adic
cylinder-lift frontier. The finite audit is evidence for the red node, not a
proof of it.

## The OddCount Slice: An Outright Sub-Theorem

Everything above transports a red node through equivalences. It never proves
the node. The march described here is different in kind: it closes whole
slices of `ParentBarrierGap` outright, for every barrier of a given shape, by
direct computation rather than by audit.

The trace sandwich pins the shape available at a given odd-step count:

{docstring Obsmetrologia.Closure.Collatz.parentBarrier_pow_sandwich}

and no nontrivial parent barrier can have fewer than two odd steps, because
`oddCount ≤ 1` is sandwiched into one of the two words the gap statement
already excludes:

{docstring Obsmetrologia.Closure.Collatz.TrivialParentBarrier}

{docstring Obsmetrologia.Closure.Collatz.nontrivial_parentBarrier_oddCount_ge_two}

At exactly two odd steps the same sandwich pins the length to `3`, and the
third `ParentBarrier` conjunct (every proper prefix noncontracting) eliminates
every arrangement except the front-loaded word, so `oddCount = 2` forces the
single shape `O O E`:

{docstring Obsmetrologia.Closure.Collatz.list_branch_length_three}

{docstring Obsmetrologia.Closure.Collatz.parentBarrier_oddCount_two_shape}

For that one word `D = 7`, `M = 16`, `C = 5`, and `5 ∉ ⟨7, 16⟩` by direct
computation, closing the gap outright for the whole slice:

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_holds_oddCount_le_two}

The technique repeats one exponent higher: `2^len ≤ 3^3 = 27 < 2·2^len` still
pins a unique length, now `4`, and among the four arrangements with three `O`s
and one `E` the same noncontracting-prefix conjunct eliminates `E O O O`,
leaving two survivors, `O O E O` and `O O O E`, each closed by the same
direct-computation technique:

{docstring Obsmetrologia.Closure.Collatz.list_branch_length_four}

{docstring Obsmetrologia.Closure.Collatz.parentBarrier_oddCount_three_shape}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_holds_oddCount_le_three}

Checked:

```lean
example {p : List Branch}
    (hp : ParentBarrier p) (hnt : Not (TrivialParentBarrier p))
    (hle : oddCount p <= 3) :
    Not (InTwoGenSemigroup (parentC p) (parentD p) (parentM p)) :=
  parentBarrierGap_holds_oddCount_le_three hp hnt hle
```

Read this as what the red node `parentBarrierGap_holds` at the end of this
page is actually red about: not "unproved everywhere," but "unproved once
`oddCount ≥ 4`." Every barrier with at most three odd steps already satisfies
`ParentBarrierGap`, unconditionally, no `sorry`, no numerical bound on the
barrier itself — the first nonvacuous instances of the open gap proved for
every barrier of the given shape, rather than merely audited across finitely
many seeds.

## The Canonical Frontier: A Kernel-Checked Sweep

The oddCount slice closes small barriers by shape. The canonical family closes
a different cut: the front-loaded word `canonicalWord a b = O^a ++ E^b` for
every length, reduced to one arithmetic aperture and then checked by the Lean
kernel itself across a widening numerical range.

`CanonicalBarrierSeed` proves the canonical denominator-growth claim is
equivalent to a same-step margin family — see the canonical denominator
recurrence above. The first kernel-checked instance of that family,
`canonicalSameStepMargins_below_3000`, recomputes `canonicalTrailingEven` from
scratch at each `a`, an `O(N^2)` cost that stops at `N = 3000`; chained
through the denominator bound it closes the semigroup gap on that whole
range:

{docstring Obsmetrologia.Closure.Collatz.canonicalWord_not_inTwoGenSemigroup_of_lt_3000}

`canonicalMarginRun` replaces the from-scratch recomputation with a
near-linear accumulator that carries `canonicalTrailingEven a` forward one
step at a time, turning the `O(N^2)` sweep into `O(N)` kernel work:

{docstring Obsmetrologia.Closure.Collatz.canonicalMarginRun}

{docstring Obsmetrologia.Closure.Collatz.canonicalSameStepMargins_below_of_marginRun}

That near-linear sweep reaches the blueprint's own stated numerical target,
`a = 20000`, still by kernel `decide` alone — no `native_decide`, no external
script:

{docstring Obsmetrologia.Closure.Collatz.canonicalSameStepMargins_below_20000}

{docstring Obsmetrologia.Closure.Collatz.canonicalWord_not_inTwoGenSemigroup_of_lt_20000}

Checked:

```lean
example {a : Nat} (ha : 3 <= a) (ha' : a < 20000) :
    Not (InTwoGenSemigroup
      (parentC (canonicalWord a (canonicalTrailingEven a)))
      (parentD (canonicalWord a (canonicalTrailingEven a)))
      (parentM (canonicalWord a (canonicalTrailingEven a)))) :=
  canonicalWord_not_inTwoGenSemigroup_of_lt_20000 ha ha'
```

An elementary continued-fraction route to the unbounded claim
(`CanonicalSameStepMargins` for every `a ≥ 3`, not merely every `a < 20000`)
was investigated and found infeasible even to partially formalize: the same
recurrence the canonical denominator obeys at each transition is exactly the
continuant recursion for the continued fraction of `log_2 3`, so bounding it
elementarily is the same quantitative distance-between-powers-of-2-and-3
problem an effective irrationality measure would have to solve anyway, not a
shortcut around it. The kernel sweep above is therefore evidence in the same
sense the numerical audits are evidence, with one difference worth naming
plainly: it is evidence the Lean kernel itself checked, not evidence a script
reported and the corpus trusted.

## The Green Conditional Reduction

The crossing hypothesis is still a separate named input:

{docstring Obsmetrologia.Closure.Collatz.EveryNonterminalHasCrossing}

Its barrier-stream form is:

{docstring Obsmetrologia.Closure.Collatz.NoPositiveInfiniteBarrierStream}

and Lean proves the equivalence:

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalHasCrossing_iff_noPositiveInfiniteBarrierStream}

The same obstruction can be read without first-passage bookkeeping:

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalContracts_iff_crossing}

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalContracts_iff_noPositiveInfiniteBarrierStream}

The same obstruction can be read as finite parent-barrier cylinder extraction:

{docstring Obsmetrologia.Closure.Collatz.EveryNonterminalHasParentBarrierCylinder}

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalHasParentBarrierCylinder_iff_crossing}

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalHasParentBarrierCylinder_iff_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.Closure.Collatz.infiniteBarrierStream_excludes_parentBarrierCylinder}

The complement can be named without adding a new red assertion:

{docstring Obsmetrologia.Closure.Collatz.CylinderAvoidingBarrierStream}

{docstring Obsmetrologia.Closure.Collatz.cylinderAvoidingBarrierStream_iff_positive_infiniteBarrierStream}

{docstring Obsmetrologia.Closure.Collatz.cylinderAvoidingBarrierStream_iff_infinite_and_no_parentCylinder}

{docstring Obsmetrologia.Closure.Collatz.cylinderAvoidingBarrierStream_excludes_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.Closure.Collatz.noPositiveInfiniteBarrierStream_excludes_cylinderAvoiding}

Checked:

```lean
example :
    EveryNonterminalHasCrossing <->
      NoPositiveInfiniteBarrierStream :=
  crossingNoInfiniteStream

example :
    EveryNonterminalContracts <->
      EveryNonterminalHasCrossing :=
  contractsCrossing

example :
    EveryNonterminalContracts <->
      NoPositiveInfiniteBarrierStream :=
  contractsNoInfiniteStream

example :
    EveryNonterminalHasParentBarrierCylinder <->
      NoPositiveInfiniteBarrierStream :=
  parentCylinderNoInfiniteStream

example (n : Nat) :
    CylinderAvoidingBarrierStream n <->
      2 < n /\ InfiniteBarrierStream n :=
  cylinderAvoidingPositiveInfinite n

example (n : Nat) :
    CylinderAvoidingBarrierStream n <->
      2 < n /\ InfiniteBarrierStream n /\
        Not (exists p : List Branch,
          ParentBarrier p /\
            parityWord n (p ++ [Branch.E]).length =
              p ++ [Branch.E]) :=
  cylinderAvoidingNoParentCylinder n

example :
    NoPositiveInfiniteBarrierStream ->
      Not (exists n, CylinderAvoidingBarrierStream n) :=
  noStreamExcludesCylinderAvoiding
```

## The Wide Crossing Audit

The crossing/no-stream frontier is red exactly like the parent-barrier gap,
but until recently it carried no Lean-internal finite evidence at all — the
parent-gap frontier had the numerical audit above; this one had only an
external Python printout to point at. `Reduction` closes that asymmetry with
the corpus's first Lean-checked finite audit of the crossing frontier: a
decidability instance on `CoeffContracting` lets the Lean kernel itself decide
a bounded instance of `EveryNonterminalContracts`, no external script, no
`native_decide`.

{docstring Obsmetrologia.Closure.Collatz.decCoeffContracting}

{docstring Obsmetrologia.Closure.Collatz.auditBound}

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalContracts_below}

That first witness decides the `Prop`-level bounded existential directly,
which recomputes `parityWord`/`traceOfWord` from scratch at every candidate
depth — `O(depth)` work repeated `O(depth)` times per seed, the reason the
audited range stopped at `n < 500`. `CrossingAudit` supersedes it in range
only, leaving `auditBound`/`everyNonterminalContracts_below` untouched, by
replacing that quadratic-per-seed `Prop` sweep with a tail-recursive `Bool`
verifier that carries the running trace coefficients forward one letter at a
time — `O(1)` work per step, matching `parityWord`/`traceOfWord`'s own
`CoeffContracting` semantics exactly, proved sound once and then decided only
on the resulting closed `Bool` computation:

{docstring Obsmetrologia.Closure.Collatz.crossingBool}

{docstring Obsmetrologia.Closure.Collatz.crossingBool_sound}

{docstring Obsmetrologia.Closure.Collatz.crossingSweep}

{docstring Obsmetrologia.Closure.Collatz.crossingSweep_sound}

{docstring Obsmetrologia.Closure.Collatz.crossingAuditBound}

{docstring Obsmetrologia.Closure.Collatz.crossingAuditDepth}

{docstring Obsmetrologia.Closure.Collatz.crossingSweep_holds}

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalContracts_below_wide}

Checked:

```lean
example (n : Nat) (hn : 2 < n) (hN : n < crossingAuditBound) :
    exists k, CoeffContracting (parityWord n k) :=
  everyNonterminalContracts_below_wide n hn hN
```

Read the two witnesses together as one story about trust, not two unrelated
lemmas. `everyNonterminalContracts_below` is real, kernel-checked evidence,
but its `O(depth^2)`-per-seed cost caps what a `decide` call can reach.
`everyNonterminalContracts_below_wide` is the same open-frontier statement, in
the identical shape, checked by the same kernel over a hundred times the
range — a hundredfold widening bought by changing how the evidence is
computed, not by weakening what is claimed. Neither witness closes
`EveryNonterminalContracts`; both replace an external audit's trust surface
with a Lean term the kernel itself checks.

With that input, the residue gap reaches termination:

{docstring Obsmetrologia.Closure.Collatz.collatz_from_parentBarrierResidueGap_and_crossing}

The same conditional is also named directly in the barrier-stream language:

{docstring Obsmetrologia.Closure.Collatz.collatz_from_parentBarrierResidueGap_and_noPositiveInfiniteBarrierStream}

The exact obstruction after the residue gap is:

{docstring Obsmetrologia.Closure.Collatz.acceleratedCollatz_iff_noPositiveInfiniteBarrierStream_of_residueGap}

The green packaged two-frontier input is:

{docstring Obsmetrologia.Closure.Collatz.CollatzFrontierInputs}

{docstring Obsmetrologia.Closure.Collatz.collatz_from_frontierInputs}

{docstring Obsmetrologia.Closure.Collatz.frontierInputs_iff_residueGap_and_acceleratedCollatz}

{docstring Obsmetrologia.Closure.Collatz.frontierInputs_iff_residueGap_of_residueGap_implies_noStream}

{docstring Obsmetrologia.Closure.Collatz.frontierInputs_iff_parentBarrierGap_of_parentBarrierGap_implies_noStream}

{docstring Obsmetrologia.Closure.Collatz.ParentBarrierOneLockCollapse}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_frontierInputs_parentBarrierGap}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_frontierInputs_residueGap}

{docstring Obsmetrologia.Closure.Collatz.frontierInputs_iff_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.frontierInputs_iff_residueGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.residueGap_alone_solves_collatz_iff_residueGap_implies_noStream}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_noStream}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_collatz}

Equivalently, the same one-frontier collapse is a proof that the residue gap
forces bare eventual coefficient contraction:

{docstring Obsmetrologia.Closure.Collatz.residueGap_alone_solves_collatz_iff_residueGap_implies_everyNonterminalContracts}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_alone_solves_collatz_iff_parentBarrierGap_implies_everyNonterminalContracts}

Checked:

```lean
example (hres : ParentBarrierResidueGap)
    (hcross : EveryNonterminalHasCrossing) :
    forall n, 0 < n -> ReachesTerminal n :=
  residueGapToTermination hres hcross

example (hres : ParentBarrierResidueGap)
    (hbar : NoPositiveInfiniteBarrierStream) :
    forall n, 0 < n -> ReachesTerminal n :=
  residueNoStreamToTermination hres hbar

example (hres : ParentBarrierResidueGap) :
    (forall n, 0 < n -> ReachesTerminal n) <->
      NoPositiveInfiniteBarrierStream :=
  residueGapExactObstruction hres

example (h : CollatzFrontierInputs) :
    forall n, 0 < n -> ReachesTerminal n :=
  frontierInputsTermination h

example :
    CollatzFrontierInputs <->
      ParentBarrierResidueGap /\
        (forall n, 0 < n -> ReachesTerminal n) :=
  frontierInputsExact

example :
    (ParentBarrierResidueGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierResidueGap) :=
  frontierInputsResidueCollapse

example :
    (ParentBarrierGap ->
        NoPositiveInfiniteBarrierStream) <->
      (CollatzFrontierInputs <->
        ParentBarrierGap) :=
  frontierInputsParentGapCollapse

example :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierGap) :=
  parentBarrierOneLockCollapsePackage

example :
    ParentBarrierOneLockCollapse <->
      (CollatzFrontierInputs <->
        ParentBarrierResidueGap) :=
  parentBarrierOneLockCollapseResiduePackage

example :
    CollatzFrontierInputs <->
      ParentBarrierGap /\
        ParentBarrierOneLockCollapse :=
  frontierInputsParentGapAndOneLock

example :
    CollatzFrontierInputs <->
      ParentBarrierResidueGap /\
        ParentBarrierOneLockCollapse :=
  frontierInputsResidueGapAndOneLock

example :
    (ParentBarrierResidueGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierResidueGap ->
        NoPositiveInfiniteBarrierStream) :=
  oneFrontierCriterion

example :
    (ParentBarrierGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentGapOneFrontierCriterion

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierGap ->
        forall n, 0 < n -> ReachesTerminal n) :=
  parentBarrierOneLockCollapseTermination

example :
    (ParentBarrierResidueGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierResidueGap ->
        EveryNonterminalContracts) :=
  oneFrontierContractCriterion

example :
    (ParentBarrierGap ->
        forall n, 0 < n -> ReachesTerminal n) <->
      (ParentBarrierGap ->
        EveryNonterminalContracts) :=
  parentGapOneFrontierContractCriterion
```

Forward use of the named lock is also green:

{docstring Obsmetrologia.Closure.Collatz.noPositiveInfiniteBarrierStream_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalHasCrossing_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.everyNonterminalContracts_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.allFallBelow_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.collatz_from_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.collatz_from_residueGap_and_oneLock}

Checked:

```lean
example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse) :
    NoPositiveInfiniteBarrierStream :=
  oneLockNoStream hgap hlock

example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse) :
    EveryNonterminalHasCrossing :=
  oneLockCrossing hgap hlock

example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse) :
    EveryNonterminalContracts :=
  oneLockContracts hgap hlock

example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse) :
    forall n, 2 < n -> FallsBelowSelf n :=
  oneLockDescent hgap hlock

example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse) :
    forall n, 0 < n -> ReachesTerminal n :=
  oneLockTermination hgap hlock

example (hres : ParentBarrierResidueGap)
    (hlock : ParentBarrierOneLockCollapse) :
    forall n, 0 < n -> ReachesTerminal n :=
  residueOneLockTermination hres hlock
```

This route proves: `C < D*r` for
every nontrivial parent barrier, plus crossing/no-stream, implies accelerated
Collatz termination. More sharply, once the residue gap is assumed, no-stream is
equivalent to accelerated termination, and no-stream is equivalent to bare
eventual coefficient contraction. Removing crossing unconditionally would require
a proof of `EveryNonterminalHasCrossing`, or equivalently
`EveryNonterminalContracts`, not a prose reclassification of it. Removing it
under the named one-lock route follows from the named proposition, which supplies
no-stream from the parent-barrier gap.

The reason is structural. The residue gap acts on parent barriers, and a parent
barrier is obtained from a first-passage word. A seed with no finite crossing has
not yet supplied such a word, so the parent-barrier inequality has no local object
to close.

## Kappa And Stopping Time

The settlement carrier is the reached-set accumulation:

{docstring Obsmetrologia.Closure.Collatz.settling_accumulates}

The clean stopping-time bridge keeps the descent assumption explicit:

{docstring Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_all_fall_below}

The exact finite-stage identification is:

{docstring Obsmetrologia.Closure.Collatz.ClosureOrdinalStage}

{docstring Obsmetrologia.Closure.Collatz.TotalStoppingStage}

{docstring Obsmetrologia.Closure.Collatz.closureOrdinalStage_iff_totalStoppingStage}

Existence of the finite closure-ordinal stage is also tied to quiescence and,
under descent, to terminal reachability:

{docstring Obsmetrologia.Closure.Collatz.exists_closureOrdinalStage_iff_reachedQuiesces}

{docstring Obsmetrologia.Closure.Collatz.exists_totalStoppingStage_iff_closureOrdinalStage}

{docstring Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_all_fall_below}

{docstring Obsmetrologia.Closure.Collatz.totalStoppingStage_exists_iff_reachesTerminal_of_all_fall_below}

Checked:

```lean
example (m k : Nat) :
    ClosureOrdinalStage m k <->
      TotalStoppingStage m k :=
  kappaIsStoppingStage m k

example (hdesc : forall n, 2 < n -> FallsBelowSelf n)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <-> ReachesTerminal m :=
  descentKappaBridge hdesc m hm

example (hdesc : forall n, 2 < n -> FallsBelowSelf n)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  descentKappaStageBridge hdesc m hm

example (hdesc : forall n, 2 < n -> FallsBelowSelf n)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <->
      ReachesTerminal m :=
  descentTotalStoppingStageBridge hdesc m hm
```

The residue/crossing version is also green:

{docstring Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_residueGap_and_crossing}

{docstring Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_crossing}

and so is the residue/no-infinite-stream version:

{docstring Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream}

{docstring Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_residueGap_and_noPositiveInfiniteBarrierStream}

The packaged-input version is:

{docstring Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_frontierInputs}

{docstring Obsmetrologia.Closure.Collatz.totalStoppingStage_exists_iff_reachesTerminal_of_frontierInputs}

The one-frontier settlement-level criterion is:

{docstring Obsmetrologia.Closure.Collatz.residueGap_alone_solves_kappa_package_iff_residueGap_implies_noStream}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_alone_solves_kappa_package_iff_parentBarrierGap_implies_noStream}

{docstring Obsmetrologia.Closure.Collatz.parentBarrierOneLockCollapse_iff_parentBarrierGap_alone_solves_kappa_package}

Checked:

```lean
example (hres : ParentBarrierResidueGap)
    (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <-> ReachesTerminal m :=
  residueKappaBridge hres hcross m hm

example (hres : ParentBarrierResidueGap)
    (hcross : EveryNonterminalHasCrossing)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  residueKappaStageBridge hres hcross m hm

example (hres : ParentBarrierResidueGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ReachedQuiesces m k) <-> ReachesTerminal m :=
  residueNoStreamKappaBridge hres hbar m hm

example (hres : ParentBarrierResidueGap)
    (hbar : NoPositiveInfiniteBarrierStream)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  residueNoStreamKappaStageBridge hres hbar m hm

example (h : CollatzFrontierInputs)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  frontierInputsKappaStage h m hm

example (h : CollatzFrontierInputs)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <->
      ReachesTerminal m :=
  frontierInputsTotalStoppingStage h m hm

example :
    (ParentBarrierResidueGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierResidueGap ->
        NoPositiveInfiniteBarrierStream) :=
  residueKappaPackageCriterion

example :
    (ParentBarrierGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) <->
      (ParentBarrierGap ->
        NoPositiveInfiniteBarrierStream) :=
  parentGapKappaPackageCriterion

example :
    ParentBarrierOneLockCollapse <->
      (ParentBarrierGap ->
        forall m, 0 < m ->
          ReachesTerminal m /\
            (exists k, ClosureOrdinalStage m k) /\
              (exists k, TotalStoppingStage m k)) :=
  parentBarrierOneLockCollapseKappaPackage
```

Forward use of the named lock at the settlement layer is:

{docstring Obsmetrologia.Closure.Collatz.reachedQuiesces_iff_reachesTerminal_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.closureOrdinalStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.totalStoppingStage_exists_iff_reachesTerminal_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.kappaPackage_of_parentBarrierGap_and_oneLock}

{docstring Obsmetrologia.Closure.Collatz.kappaPackage_of_residueGap_and_oneLock}

{docstring Obsmetrologia.AperiodicOrder.Tiling.kappaPackage_of_twoAdicCarryQuotientPositive_and_oneLock}

{docstring Obsmetrologia.AperiodicOrder.Tiling.kappaPackage_of_twoAdicCylinderLiftGap_and_oneLock}

Checked:

```lean
example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (exists k, ClosureOrdinalStage m k) <->
      ReachesTerminal m :=
  oneLockKappaStage hgap hlock m hm

example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse)
    (m : Nat) (hm : 0 < m) :
    (exists k, TotalStoppingStage m k) <->
      ReachesTerminal m :=
  oneLockTotalStoppingStage hgap hlock m hm

example (hgap : ParentBarrierGap)
    (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  oneLockKappaPackage hgap hlock

example (hres : ParentBarrierResidueGap)
    (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  residueOneLockKappaPackage hres hlock

example (hquot : ParentBarrierTwoAdicCarryQuotientPositive)
    (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  twoAdicCarryQuotientOneLockKappaPackage hquot hlock

example (hlift : ParentBarrierTwoAdicCylinderLiftGap)
    (hlock : ParentBarrierOneLockCollapse) :
    forall m, 0 < m ->
      ReachesTerminal m /\
        (exists k, ClosureOrdinalStage m k) /\
          (exists k, TotalStoppingStage m k) :=
  twoAdicCylinderLiftOneLockKappaPackage hlift hlock
```

Read this as the kappa statement Lean proves: under the descent skeleton's
explicit inputs, the closure ordinal of the reached-set settlement is the finite
stopping stage. The unconditional statement remains red because it substitutes
the two frontier holes.

## The Modular Frontier: A Corrected Commuting Square

The blueprint once conjectured a commuting square for the two branch
projections at modulus `6`. Lean does not confirm that square. It refutes it,
finds the true governing modulus, and proves the corrected statement — the
same discipline the page has followed throughout, applied to a claim the
corpus had not yet checked rather than to one still open.

The even branch is the saturating projection, the odd branch the transferring
projection, each realized exactly as `step`'s own branches:

{docstring Obsmetrologia.Closure.Collatz.sigma}

{docstring Obsmetrologia.Closure.Collatz.Delta}

Read literally as everywhere-defined `Nat`-division formulas, the square does
not commute for all `n`:

{docstring Obsmetrologia.Closure.Collatz.sigma_Delta_not_forall_comm}

The failure is not modulus drift from `6` to some nearby number the blueprint
merely guessed wrong. It is a domain problem first: `σ`'s proper domain is the
evens, `Δ`'s the odds, and the two branch-consistent composites live on
disjoint residue classes mod `4`, so the literal square never has a point at
which both sides are branch-consistent instances of the accelerated map at
once:

{docstring Obsmetrologia.Closure.Collatz.sigmaDelta_domain_iff}

{docstring Obsmetrologia.Closure.Collatz.DeltaSigma_domain_iff}

{docstring Obsmetrologia.Closure.Collatz.sigmaDelta_composite_domains_disjoint}

Reading the two sides as raw formulas anyway (the only way to compare them at
a common `n`), Lean proves the exact correction: the commuting equality holds
precisely on the residues `0` and `3` modulo `4`, a period-`4` phenomenon, not
period `6`:

{docstring Obsmetrologia.Closure.Collatz.sigma_Delta_comm_iff_mod4}

and modulus `6` is not merely the wrong guess, it is witnessed insufficient —
`n = 1` and `n = 7` agree mod `6` and disagree on the commuting equality, so
no refinement at modulus `6` could ever pin down the truth:

{docstring Obsmetrologia.Closure.Collatz.mod6_does_not_determine_comm}

Checked:

```lean
example : Not (forall n : Nat, sigma (Delta n) = Delta (sigma n)) :=
  sigma_Delta_not_forall_comm

example (n : Nat) :
    sigma (Delta n) = Delta (sigma n) <->
      (n % 4 = 0 \/ n % 4 = 3) :=
  sigma_Delta_comm_iff_mod4 n

example :
    exists n n' : Nat, n % 6 = n' % 6 /\
      sigma (Delta n) = Delta (sigma n) /\
        sigma (Delta n') ≠ Delta (sigma n') :=
  mod6_does_not_determine_comm
```

The governing modulus `4 = 2^2` is not an arbitrary better fit. It is the same
power-of-two modulus the corpus already proves governs a length-`2` parity
word (`AffineTrace.trace_B_eq_two_pow_length`), so the corrected law is not a
patch on the blueprint's arithmetic; it is the arithmetic the rest of this
page already uses, applied honestly to the one claim that had drifted from it.
A conjectured symmetry entered the blueprint unchecked; Lean read it, found
the counterexample at `n = 1`, and replaced the claim with the law the trace
structure actually supports.

## Zeta-Star Finite Bridge

The arithmetic zeta-star object now exists in the finite form Lean proves. It
is not an analytic zeta function. It is the affine-trace residual generated by a
positive Collatz seed and read on the finite displacement carrier used by the
finite diffraction module.

{docstring Obsmetrologia.AperiodicOrder.Tiling.ArithmeticZetaStar}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar_seed_odd}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarZeroSet}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarTrace_affine_identity}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarTrace_B_eq_two_pow}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarTrace_A_eq_three_pow_oddCount}

{docstring Obsmetrologia.AperiodicOrder.Tiling.FiniteDiscreteDelone}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarZeroSet_eq_univ}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarZeroSet_finiteDiscreteDelone}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_finiteDiffractionMass_univ}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarFiniteDiffractionReadout}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarFiniteDiffractionReadout_mass}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarPhaseType}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarSubstitutionMatrix}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarSubstitutionMatrix_primitive}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarSubstitutionMatrix_cayleyHamilton}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_phase_purePoint_iff_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarFiniteDiffractionReadout_component_purePoint_iff_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_finiteDiffractionMass_purePoint_of_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_shortcut_twoAdicValuation}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar_shortcut_twoAdicValuation}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_phaseType_readout}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_phaseType_trichotomy}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_phaseType_consistent_iff_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_readout_purePoint_iff_phaseType_consistent}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_finitePurePointQuasicrystal_of_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar_phaseType_consistent}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar_finiteDiffractionMass_purePoint}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar_finitePurePointQuasicrystal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ZetaStarFiniteDysonQuasicrystalForm}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStar_finiteDysonQuasicrystalForm}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ZetaStarArithmeticSettlingCertificate}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_arithmeticSettling_certificate}

{docstring Obsmetrologia.AperiodicOrder.Tiling.exists_zetaStar_finitePurePointQuasicrystal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.exists_zetaStar_finiteDiffractionMass_purePoint}

{docstring Obsmetrologia.AperiodicOrder.Tiling.exists_zetaStar_finiteDysonQuasicrystalForm}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ZetaStarDisplacementReadout}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarDisplacementReadout}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarDisplacementReadout_evidence}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ZetaStarDisplacementCoalgebra}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStarDisplacementCoalgebra}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarDisplacementCoalgebra_finiteDelone}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarDisplacementCoalgebra_mass}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarDisplacementCoalgebra_observe_step}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStarDisplacementCoalgebra_purePoint_iff_pisot}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStarDisplacementCoalgebra_purePoint}

{docstring Obsmetrologia.AperiodicOrder.Tiling.canonicalZetaStarDisplacementCoalgebra_quasicrystal}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ZetaStarCoalgebraicPromotionApparatus}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_coalgebraicPromotion_apparatus}

{docstring Obsmetrologia.AperiodicOrder.Tiling.MetallizationAlgebraCoalgebraBoundary}

{docstring Obsmetrologia.AperiodicOrder.Tiling.metallization_algebraCoalgebraBoundary}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ZetaStarAlgebraCoalgebraBoundary}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_algebraCoalgebraBoundary}

{docstring Obsmetrologia.AperiodicOrder.Tiling.UpTo.ObservedBisim}

{docstring Obsmetrologia.AperiodicOrder.Tiling.UpTo.ObservedBisimUTC}

{docstring Obsmetrologia.AperiodicOrder.Tiling.UpTo.observedBisimUTC_sound}

{docstring Obsmetrologia.AperiodicOrder.Tiling.UpTo.ObservedGeoMld}

{docstring Obsmetrologia.AperiodicOrder.Tiling.UpTo.observedGeoMld_to_geoMld}

{docstring Obsmetrologia.AperiodicOrder.Tiling.ZetaStarAnalyticRichnessRecovery}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_analyticRichnessRecovery}

{docstring Obsmetrologia.AperiodicOrder.Tiling.exists_zetaStar_arithmeticSettling_with_odd_shortcut}

{docstring Obsmetrologia.AperiodicOrder.Tiling.zetaStar_bridge_evidence}

Checked:

```lean
example {N : Nat} (z : ArithmeticZetaStar N) :
    zetaStarZeroSet z = fun _ => true :=
  (zetaStarBridge z).1

example {N : Nat} (z : ArithmeticZetaStar N) :
    FiniteDiscreteDelone (zetaStarZeroSet z) :=
  (zetaStarBridge z).2.1

example {N : Nat} (z : ArithmeticZetaStar N) :
    finiteDiffractionMass N
        (zetaStarZeroSet z) Set.univ = N + 1 :=
  (zetaStarBridge z).2.2.1

example {N : Nat} (z : ArithmeticZetaStar N)
    (d : Fin (N + 1)) :
    (zetaStarTrace z d).B * orbit z.seed d.val =
      (zetaStarTrace z d).A * z.seed +
        (zetaStarTrace z d).C :=
  zetaStarTraceIdentity z d

example {N : Nat} (z : ArithmeticZetaStar N)
    (d : Fin (N + 1)) :
    (zetaStarTrace z d).B = 2 ^ d.val :=
  zetaStarTraceDenominator z d

example {N : Nat} (z : ArithmeticZetaStar N)
    (h : IsPisotInflation z.phase) :
    (zetaStarFiniteDiffractionReadout z).component =
        FiniteDiffractionKind.purePoint :=
  (zetaStarMassPurePoint z h).1

example {N : Nat} (z : ArithmeticZetaStar N) :
    lebesgueType
        (zetaStarFiniteDiffractionReadout z).component =
      zetaStarPhaseType z :=
  zetaStarPhaseReadout z

example {N : Nat} (z : ArithmeticZetaStar N) :
    zetaStarPhaseType z = Regime.consistent \/
      zetaStarPhaseType z = Regime.paraconsistent \/
        zetaStarPhaseType z = Regime.mixed :=
  zetaStarPhaseTrichotomy z

example {N : Nat} (z : ArithmeticZetaStar N) :
    (zetaStarFiniteDiffractionReadout z).component =
        FiniteDiffractionKind.purePoint <->
      zetaStarPhaseType z = Regime.consistent :=
  zetaStarPurePointIffPhaseConsistent z

example (N : Nat) :
    (zetaStarFiniteDiffractionReadout
        (canonicalZetaStar N)).component =
      FiniteDiffractionKind.purePoint :=
  (zetaStarCanonicalMassPurePoint N).1

example (N : Nat) :
    FinitePurePointQuasicrystal N
      (zetaStarZeroSet (canonicalZetaStar N))
      (canonicalZetaStar N).phase :=
  zetaStarCanonicalQuasicrystal N

example (N : Nat) :
    ZetaStarFiniteDysonQuasicrystalForm
      (canonicalZetaStar N) :=
  zetaStarCanonicalFiniteForm N

example {N : Nat} (z : ArithmeticZetaStar N)
    (h : IsPisotInflation z.phase) :
    FinitePurePointQuasicrystal N
      (zetaStarZeroSet z) z.phase :=
  zetaStarFiniteQuasicrystal z h

example {N : Nat} (z : ArithmeticZetaStar N) :
    ZetaStarArithmeticSettlingCertificate z :=
  zetaStarArithmeticCertificate z

example (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarArithmeticSettlingCertificate z /\
        zetaStarPhaseType z = Regime.consistent := by
  obtain ⟨z, hcert, hphase, _hpure, _hmass, _hpos⟩ :=
    zetaStarExistsMassPurePoint N
  exact ⟨z, hcert, hphase⟩

example (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarFiniteDysonQuasicrystalForm z :=
  zetaStarExistsFiniteForm N

example (N : Nat) :
    ZetaStarDisplacementCoalgebra N :=
  zetaStarFiniteDisplacementCoalgebra N

example (N : Nat) :
    ((canonicalZetaStarDisplacementCoalgebra N).observe
        (canonicalZetaStar N)).component =
      FiniteDiffractionKind.purePoint :=
  zetaStarFiniteDisplacementCoalgebraPurePoint N

example (N : Nat) :
    FinitePurePointQuasicrystal N
      ((canonicalZetaStarDisplacementCoalgebra N).observe
        (canonicalZetaStar N)).zeroSet
      (canonicalZetaStar N).phase :=
  zetaStarFiniteDisplacementCoalgebraQuasicrystal N

example :
    ZetaStarCoalgebraicPromotionApparatus :=
  zetaStarCoalgebraicApparatus

example :
    MetallizationAlgebraCoalgebraBoundary :=
  zetaStarMetallizationBoundary

example :
    ZetaStarAlgebraCoalgebraBoundary :=
  zetaStarAlgebraCoalgebraBoundary

example :
    ZetaStarAnalyticRichnessRecovery :=
  zetaStarAnalyticRichnessRecovery

example (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarArithmeticSettlingCertificate z /\
        IsPisotInflation z.phase /\
          FinitePurePointQuasicrystal N
            (zetaStarZeroSet z) z.phase :=
  zetaStarExists N

example (N : Nat) :
    exists k m, 1 <= k /\ m % 2 = 1 /\
      3 * (canonicalZetaStar N).seed + 1 = 2 ^ k * m /\
        twoAdicVal (2 ^ k) = k /\
          k <= twoAdicVal
            (3 * (canonicalZetaStar N).seed + 1) :=
  zetaStarCanonicalShortcut N

example (N : Nat) :
    exists z : ArithmeticZetaStar N,
      ZetaStarArithmeticSettlingCertificate z /\
        IsPisotInflation z.phase /\
          z.seed % 2 = 1 /\
            (exists k m,
              1 <= k /\ m % 2 = 1 /\
              3 * z.seed + 1 = 2 ^ k * m /\
                twoAdicVal (2 ^ k) = k /\
                  k <= twoAdicVal (3 * z.seed + 1)) /\
              FinitePurePointQuasicrystal N
                (zetaStarZeroSet z) z.phase :=
  zetaStarExistsWithOddShortcut N
```

This bridge is what Lean proves: the affine-trace residual supplies a zero-set on the
finite displacement space, that zero-set is finite-discrete Delone, and its
finite diffraction mass is read as a positive pure-point atom on the Pisot side
of the existing StepN phase classifier. The same finite readout is now
connected to the corpus's `phaseType`: pure-point is exactly the
consistent/Pisot phase, and the phase lies in the bigraded trichotomy. The
arithmetic certificate also records the odd-seed 2-adic shortcut valuation, the
affine-trace identity with denominator coefficient `2^d`, and the primitive
Fibonacci substitution matrix with its characteristic-polynomial witness. The
canonical witness has seed `1` and Pisot phase, so Lean now proves the bundled
finite diffraction form directly, including the finite pure-point mass
statement, finite quasicrystal witness, and canonical odd shortcut. Lean also
constructs the finite observed displacement coalgebra: its observation carries
the zero-set, finite mass, finite component, and phase readout, and the finite
unfold step preserves that observation.
The analytic promotion is still open, but its shape is internal to the corpus:
Lean now also packages the available coalgebraic apparatus around the finite
form: the metallization dichotomy as the finite-algebra/limit-coalgebra
boundary, directed-join attainment, finite Scott-continuity, algebra/coalgebra
duality for settling orbits, and up-to-closure coinductive classification. The
reframe Lean proves is this: the finite side is the algebraic fold that
reaches the fixpoint, and the analytic side is the coalgebraic unfold observed
through Scott-continuous directed joins and coinduction. The failure mode was
that the original coalgebraic kernel remembered only equality of settled values;
it did not carry the analytic observation. The observed-coinduction layer fixes
that interface: if a relation carries a diffraction, phase, spectral, or mass
readout through the closure step, coinduction preserves that readout along the
orbit. The missing theorem is therefore sharper: instantiate the zeta-star
displacement coalgebra, define the diffraction observation on it, and prove the
observed up-to-closure compatibility. A genuine Delone set in that displacement
coalgebra, and a pure-point diffraction theorem in the Dyson/RH sense, are not
consequences of the finite carrier alone.

## Remaining Frontier

The red nodes are:

{docstring Obsmetrologia.Closure.Collatz.parentBarrierGap_holds}

Read this red node together with the oddCount slice above: it is the same
`ParentBarrierGap`, so the whole `oddCount ≤ 3` slice is already discharged.
What remains open is exactly `oddCount ≥ 4`, plus the canonical family beyond
the kernel-checked range `a < 20000` and the general (non-canonical, non-slice)
family the offset envelope confines but does not close.

The crossing/no-positive-infinite-barrier-stream claim is still a red blueprint
frontier, but no longer a second Lean `sorry` declaration. Its proved forms are
`EveryNonterminalHasCrossing`, `NoPositiveInfiniteBarrierStream`, and the proved
equivalences between crossing, no-stream, and eventual contraction above. Its
finite kernel-checked evidence is now the wide crossing audit above,
`everyNonterminalContracts_below_wide`, covering `2 < n < 50000` — a
hundredfold widening of the first witness's `n < 500`, by a near-linear
verifier rather than a weaker claim.

The first is the parent-barrier semigroup gap, now sharpened to the modular
inequality `C < D*r`. The second is the crossing/no-positive-infinite-barrier
stream claim. The descent skeleton is green around them; the open problem has
not been proved to reduce to the modular inequality alone.

The one-lock accounting is nevertheless formalized. Lean proves that
`CollatzFrontierInputs` is equivalent to `ParentBarrierGap /\
ParentBarrierOneLockCollapse`, and on the two-adic face to
`ParentBarrierTwoAdicUniqueResidueGap /\ ParentBarrierOneLockCollapse`. It also
proves that
`ParentBarrierOneLockCollapse` is equivalent to the single implication
`ParentBarrierTwoAdicUniqueResidueGap -> NoPositiveInfiniteBarrierStream`, and
also to the same unique-residue inequality forcing eventual contraction or first
crossing. Proving that implication is the legitimate route to saying the whole
termination and κ/total-stopping package is isolated to the one modular
inequality `C < D*r`, where `r = C*D^{-1} mod 2^(|p|+1)`.
The Collatz-specific audit records the same distinction in
`sites/docs/coverage/collatz-frontier-audit.{json,md}`: no hard trust surfaces,
while `ParentBarrierOneLockCollapse` is checked as a named
proposition/equivalence layer, not as a proved implication.
The same arithmetic lock now has the positive carry-quotient face
`D*r = C + 2^(|p|+1)*(q+1)`, making the next finite-state attack a question
about forcing the exact quotient `(D*r - C)/2^(|p|+1)` away from zero on the
parent-barrier language. It also has the inverse-hull cylinder-lift face: `D*r`
and `C` have the same stage-`|p|+1` projection in `twoAdicResidueSystem`, and
the remaining demand is that this same-cylinder lift is by at least one full
binary modulus. Lean proves this cylinder-lift face directly equivalent to the
carry inequality: a positive lift is exactly residue equality modulo the binary
stage plus the full-modulus lower bound on `D*r - C`.

The zeta-star frontier is separate: promote the finite-discrete zero-set to the
intended analytic Delone carrier and prove the pure-point diffraction statement
there. The finite bridge above tells the proof graph where that theorem must
attach; it does not solve RH.
