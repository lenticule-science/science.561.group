import Obsmetrologia.CausalSets.BlackHoles.Hole

/-!
# Disconnected hole-region counterexample

This module gives the small obstruction to the unaided connected-readout
claim.  In a three-event antichain, the singleton readout is connected, but the
computed no-readout side is the two remaining isolated events, hence separated.

## Main definitions

* `threeAntichainCausalSet` -- the three-event causally disconnected substrate.
* `antichainSingletonReadout` -- the singleton readout at event `0`.
* `antichainHoleLeft` and `antichainHoleRight` -- the two separated hole pieces.

## Main results

* `antichainSingletonReadout_connected` -- the readout itself is connected.
* `antichainSingletonReadout_hole_not_connected` -- the generated hole region is not.
* `connected_readout_does_not_force_holeRegion_connected` -- the packaged refutation.
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Alexandrov
open Obsmetrologia.Alexandrov

/-! ## The three-event antichain -/

/-- The empty direct-causal graph on three events. -/
abbrev threeAntichainPrec : Fin 3 → Fin 3 → Bool := fun _ _ => false

/-- The three-event antichain causal set. -/
abbrev threeAntichainCausalSet : CausalSet (Fin 3) where
  events := [0, 1, 2]
  events_nodup := by decide
  prec0 := threeAntichainPrec
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

/-- No strict causal reachability exists in the three-event antichain. -/
theorem threeAntichain_no_reaches {x y : Fin 3} :
    ¬ threeAntichainCausalSet.reaches x y := by
  intro h
  cases h with
  | last hxy => cases hxy
  | cons hxy _ => cases hxy

/-- Reflexive causal order in the three-event antichain is equality. -/
theorem threeAntichain_causalLe_iff_same (x y : Fin 3) :
    CausalLe threeAntichainCausalSet x y ↔ x = y := by
  constructor
  · intro h
    rcases h with hxy | hxy
    · exact hxy
    · exact False.elim (threeAntichain_no_reaches hxy)
  · intro h
    exact Or.inl h

/-- Boolean equality presents the antichain causal order. -/
instance threeAntichainCausalLeDecision : CausalLeDecision threeAntichainCausalSet where
  leq x y := decide (x = y)
  leq_iff_causalLe := by
    intro x y
    rw [threeAntichain_causalLe_iff_same]
    exact decide_eq_true_iff

/-! ## Singleton readout and separated hole pieces -/

/-- The singleton readout at event `0`. -/
abbrev antichainSingletonReadout : Region (Fin 3) := fun x => decide (x = 0)

/-- The left isolated hole piece, event `1`. -/
abbrev antichainHoleLeft : Opens (causalPartialOrder threeAntichainCausalSet) :=
  fun x => x = (1 : Fin 3)

/-- The right isolated hole piece, event `2`. -/
abbrev antichainHoleRight : Opens (causalPartialOrder threeAntichainCausalSet) :=
  fun x => x = (2 : Fin 3)

/-- Every subset is Alexandrov-open in the three-event antichain. -/
theorem threeAntichain_isOpen (U : Opens (causalPartialOrder threeAntichainCausalSet)) :
    (causalTopology threeAntichainCausalSet).IsOpen U := by
  intro x y hx hxy
  change Fin 3 at x
  change Fin 3 at y
  have hEq : x = y := (threeAntichain_causalLe_iff_same x y).mp hxy
  simpa [hEq] using hx

/-- The singleton readout is connected. -/
theorem antichainSingletonReadout_connected :
    IsConnected (causalTopology threeAntichainCausalSet)
      (asCausalOpenSet threeAntichainCausalSet antichainSingletonReadout) := by
  apply isConnected_congr (causalTopology threeAntichainCausalSet)
    (U := (causalTopology threeAntichainCausalSet).upperSet (0 : Fin 3))
  · intro x
    change Fin 3 at x
    change CausalLe threeAntichainCausalSet (0 : Fin 3) x ↔
      antichainSingletonReadout x = true
    constructor
    · intro hx
      have hEq : (0 : Fin 3) = x :=
        (threeAntichain_causalLe_iff_same (0 : Fin 3) x).mp hx
      subst x
      rfl
    · intro hx
      have hEq : x = (0 : Fin 3) := decide_eq_true_iff.mp hx
      exact Or.inl hEq.symm
  · exact isConnected_upperSet (causalTopology threeAntichainCausalSet) (0 : Fin 3)

/-- The computed hole is exactly the two non-readout antichain events. -/
theorem antichainHole_cover_bool : ∀ x : Fin 3,
    (HoleRegion threeAntichainCausalSet antichainSingletonReadout x = true ↔
      x = (1 : Fin 3) ∨ x = (2 : Fin 3)) := by
  decide

/-- A singleton readout in a causally disconnected substrate can generate a disconnected hole. -/
theorem antichainSingletonReadout_hole_not_connected :
    ¬ HoleRegionConnected threeAntichainCausalSet antichainSingletonReadout := by
  intro hconn
  rcases hconn with ⟨_, hsep⟩
  have hnot := hsep antichainHoleLeft antichainHoleRight
    ?hleftOpen ?hrightOpen ?hdisjoint ?hcover
  · rcases hnot with hleftEmpty | hrightEmpty
    · exact hleftEmpty ⟨(1 : Fin 3), rfl⟩
    · exact hrightEmpty ⟨(2 : Fin 3), rfl⟩
  · refine ⟨antichainHoleLeft, threeAntichain_isOpen antichainHoleLeft, ?_⟩
    intro x
    constructor
    · intro hx
      change Fin 3 at x
      subst x
      exact
        ⟨by
          change HoleRegion threeAntichainCausalSet antichainSingletonReadout
            (1 : Fin 3) = true
          decide, rfl⟩
    · intro hx
      exact hx.2
  · refine ⟨antichainHoleRight, threeAntichain_isOpen antichainHoleRight, ?_⟩
    intro x
    constructor
    · intro hx
      change Fin 3 at x
      subst x
      exact
        ⟨by
          change HoleRegion threeAntichainCausalSet antichainSingletonReadout
            (2 : Fin 3) = true
          decide, rfl⟩
    · intro hx
      exact hx.2
  · intro x hx
    rcases hx with ⟨hx1, hx2⟩
    change Fin 3 at x
    subst x
    cases hx2
  · intro x
    change Fin 3 at x
    change HoleRegion threeAntichainCausalSet antichainSingletonReadout x = true ↔
      x = (1 : Fin 3) ∨ x = (2 : Fin 3)
    exact antichainHole_cover_bool x

/-- Connected readout alone does not force the generated hole region to be connected. -/
theorem connected_readout_does_not_force_holeRegion_connected :
    ∃ (C : CausalSet (Fin 3)) (_ : CausalLeDecision C) (readout : Region (Fin 3)),
      IsConnected (causalTopology C) (asCausalOpenSet C readout)
        ∧ ¬ HoleRegionConnected C readout := by
  exact ⟨threeAntichainCausalSet, threeAntichainCausalLeDecision,
    antichainSingletonReadout, antichainSingletonReadout_connected,
    antichainSingletonReadout_hole_not_connected⟩

end CausalSets.BlackHoles
end Obsmetrologia
