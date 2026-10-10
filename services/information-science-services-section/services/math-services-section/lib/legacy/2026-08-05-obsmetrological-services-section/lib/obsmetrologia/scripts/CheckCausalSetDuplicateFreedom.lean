import Obsmetrologia.CausalSets.Causal.Diamond
import Obsmetrologia.CausalSets.Causal.ArticulationChain
import Obsmetrologia.CausalSets.BlackHoles.HoleDisconnectedCounterexample
import Obsmetrologia.CausalSets.BlackHoles.DiamondBeads
import Obsmetrologia.CausalSets.BlackHoles.DiamondLiftClosure

namespace Obsmetrologia.CausalSetDuplicateFreedomCheck

open Obsmetrologia.Discrete
open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.BlackHoles

/-- A small positive carrier whose distinct support proof is supplied at the
public `CausalSet` constructor. -/
def positiveDistinctEventConstruction : CausalSet (Fin 2) where
  events := [0, 1]
  events_nodup := by decide
  prec0 := fun _ _ => false
  acyclic :=
    { lt := fun _ _ => False
      edge_lt := by
        intro _ _ h
        cases h
      lt_trans := by
        intro _ _ _ h
        cases h
      lt_irrefl := by
        intro _ h
        exact h }

theorem positiveDistinctEventConstruction_nodup :
    positiveDistinctEventConstruction.events.Nodup :=
  carrier_events_nodup positiveDistinctEventConstruction

/-- The adversarial duplicate support has no proof of duplicate freedom. -/
theorem duplicateEventConstructionRejected :
    ¬ ([0, 0] : List (Fin 1)).Nodup := by decide

/--
error: Tactic `decide` proved that the proposition
  [0, 0].Nodup
is false
-/
#guard_msgs (error) in
def negativeControlRejectsUnprovedDuplicateSupport : CausalSet (Fin 1) where
  events := [0, 0]
  events_nodup := by decide
  prec0 := fun _ _ => false
  acyclic :=
    { lt := fun _ _ => False
      edge_lt := by
        intro _ _ h
        cases h
      lt_trans := by
        intro _ _ _ h
        cases h
      lt_irrefl := by
        intro _ h
        exact h }

example : CausalSets.Causal.Diamond.diamondCausalSet.events.Nodup :=
  CausalSets.Causal.Diamond.diamondCausalSet.events_nodup

example (a : Articulating) :
    (CausalSets.Causal.ArticulationChain.causalSet a).events.Nodup :=
  (CausalSets.Causal.ArticulationChain.causalSet a).events_nodup

example : threeAntichainCausalSet.events.Nodup :=
  threeAntichainCausalSet.events_nodup

example {E : Type} (C : CausalSet E) [CausalLeDecision C]
    [DecidableRel C.reaches] :
    (sequencingCausalSet C).events.Nodup :=
  (sequencingCausalSet C).events_nodup

example {E : Type} (C : CausalSet E) [CausalLeDecision C]
    [DecidableRel C.reaches] (P : SequencingDiamondBeadPayload C) :
    P.toBeadsThreadCausalSet.events.Nodup :=
  P.toBeadsThreadCausalSet.events_nodup

example : dlCausalSet.events.Nodup :=
  dlCausalSet.events_nodup

example {E : Type} (C : CausalSet E) [CausalLeDecision C]
    [DecidableRel C.reaches] : CausalSet (DiamondPoint C) :=
  sequencingCausalSet C

example {E : Type} (C : CausalSet E) [CausalLeDecision C]
    [DecidableRel C.reaches] : CausalSet (DiamondPoint C) :=
  HoleDiamondKinematicSpace C

example {E : Type} (C : CausalSet E) [CausalLeDecision C]
    [DecidableRel C.reaches] (P : SequencingDiamondBeadPayload C) :
    CausalSet (DiamondPoint C) :=
  P.toBeadsThreadCausalSet

/-- Enterprise observation contracts inherit duplicate freedom from the
public causal carrier rather than carrying a private predicate. -/
theorem observation_contract_inherits_carrier_nodup
    {E : Type} (C : CausalSet E) : C.events.Nodup :=
  C.events_nodup

#print axioms carrier_events_nodup
#print axioms observation_contract_inherits_carrier_nodup

end Obsmetrologia.CausalSetDuplicateFreedomCheck
