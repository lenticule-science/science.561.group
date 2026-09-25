import Obsmetrologia.CausalSets.BlackHoles.PostHoleTile
import Obsmetrologia.CausalSets.BlackHoles.HoleDiamondCausalSet
import Obsmetrologia.CausalSets.BlackHoles.ArticulationDiamond

/-!
# Diamond-lift closure

The Diamond-Lift Closure Conjecture (`dev/content/notes/2026/07/02/`) asks
whether a FOUR-coloured post-hole tile over a causal set `C` admits a
sequencing-compatible lift to the causal-diamond kinematic space `K(C) :=
HoleDiamondKinematicSpace C`, and whether the lift is again a FOUR-coloured
post-hole tile.

Two pieces of that closure are general, holding for *any* causal
set `C`: the map sending a diamond point to its upper endpoint is monotone
from `K(C)` to `C` (`upperPoint_monotone`), and hole membership pulls back
along it (`holeRegion_lift_pullback`). The rest of the closure -- an actual
`PostHoleTile` witness on both sides -- needs an instance to be
non-vacuous, per this file's `\notready`-turned-`\leanok` companion node.
That witness is built over a finite, Mark-downstream carrier: three
real `Articulating` values, the prefix chain of one real `markStepCausalSet`
top, packaged as a finite subtype so `Hole.lean`'s future-core machinery
(whose closure/connectivity quantifiers range over the whole ambient type)
applies to what it was built for -- a finite event carrier.
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Alexandrov
open Obsmetrologia.CausalSets.Causal.ArticulationChain
open Obsmetrologia.Discrete (Graph)

/-! ## The general diamond-lift lemmas -/

variable {E : Type} (C : CausalSet E) [CausalLeDecision C] [DecidableEq E] [DecidableRel C.reaches]

omit [DecidableEq E] in
/-- The upper-endpoint map is monotone from the sequencing kinematic space to
the base causal set: a sequencing edge (or equality) between diamond points
gives a causal inequality between their upper endpoints. -/
theorem upperPoint_monotone {p q : DiamondPoint C}
    (h : CausalLe (sequencingCausalSet C) p q) :
    CausalLe C p.upper.point q.upper.point := by
  rcases h with heq | hreach
  · subst heq
    exact causalLe_refl C p.upper.point
  · have hprec : sequencingPrec0 C p q = true := sequencing_reaches_to_prec0 C hreach
    have hle : CausalLe C p.upper.point q.lower.point :=
      (sequencing_prec0_eq_true_iff C p q).1 hprec
    exact causalLe_trans C hle (Or.inr q.reaches_upper)

/-- Hole membership pulls back along the upper-endpoint map: if the upper
endpoint of a diamond point lies in the base hole region, the diamond point
itself lies in the pulled-back hole region on `K(C)`. -/
theorem holeRegion_lift_pullback (readout : Region E) {p : DiamondPoint C}
    (hp : HoleRegion C readout p.upper.point = true) :
    HoleRegion (sequencingCausalSet C) (fun q => readout q.upper.point) p = true := by
  unfold HoleRegion
  cases hreaches : ReachesReadout (sequencingCausalSet C) (fun q => readout q.upper.point) p
  · rfl
  · exfalso
    unfold ReachesReadout at hreaches
    rw [List.any_eq_true] at hreaches
    obtain ⟨q, _, hq⟩ := hreaches
    rw [Bool.and_eq_true] at hq
    have hqreadout : readout q.upper.point = true := hq.1
    have hqle : CausalLe (sequencingCausalSet C) p q :=
      (causalLeBool_eq_true_iff (sequencingCausalSet C) p q).1 hq.2
    have hple : CausalLe C p.upper.point q.upper.point := upperPoint_monotone C hqle
    have hreach : ReachesReadout C readout p.upper.point = true := by
      unfold ReachesReadout
      rw [List.any_eq_true]
      exact ⟨q.upper.point, q.upper.point_listed, by
        rw [Bool.and_eq_true]
        exact ⟨hqreadout, (causalLeBool_eq_true_iff C p.upper.point q.upper.point).2 hple⟩⟩
    unfold HoleRegion at hp
    rw [hreach] at hp
    cases hp

omit [DecidableEq E] in
/-- The lower-endpoint map is monotone from the sequencing kinematic space to
the base causal set, dually to `upperPoint_monotone`: a sequencing edge (or
equality) between diamond points gives a causal inequality between their
lower endpoints too, since `p.lower ≤ p.upper ≤ q.lower` whenever `p ≺ q`. -/
theorem lowerPoint_monotone {p q : DiamondPoint C}
    (h : CausalLe (sequencingCausalSet C) p q) :
    CausalLe C p.lower.point q.lower.point := by
  rcases h with heq | hreach
  · subst heq
    exact causalLe_refl C p.lower.point
  · have hprec : sequencingPrec0 C p q = true := sequencing_reaches_to_prec0 C hreach
    have hle : CausalLe C p.upper.point q.lower.point :=
      (sequencing_prec0_eq_true_iff C p q).1 hprec
    exact causalLe_trans C (Or.inr p.reaches_upper) hle

/-- Hole membership pulls back along the lower-endpoint map too, dually to
`holeRegion_lift_pullback`: reading `R◊`/`χ◊` off a diamond's *lower* endpoint
is an equally "endpoint-reflecting lift" in the conjecture's sense. -/
theorem holeRegion_lift_pullback_lower (readout : Region E) {p : DiamondPoint C}
    (hp : HoleRegion C readout p.lower.point = true) :
    HoleRegion (sequencingCausalSet C) (fun q => readout q.lower.point) p = true := by
  unfold HoleRegion
  cases hreaches : ReachesReadout (sequencingCausalSet C) (fun q => readout q.lower.point) p
  · rfl
  · exfalso
    unfold ReachesReadout at hreaches
    rw [List.any_eq_true] at hreaches
    obtain ⟨q, _, hq⟩ := hreaches
    rw [Bool.and_eq_true] at hq
    have hqreadout : readout q.lower.point = true := hq.1
    have hqle : CausalLe (sequencingCausalSet C) p q :=
      (causalLeBool_eq_true_iff (sequencingCausalSet C) p q).1 hq.2
    have hple : CausalLe C p.lower.point q.lower.point := lowerPoint_monotone C hqle
    have hreach : ReachesReadout C readout p.lower.point = true := by
      unfold ReachesReadout
      rw [List.any_eq_true]
      exact ⟨q.lower.point, q.lower.point_listed, by
        rw [Bool.and_eq_true]
        exact ⟨hqreadout, (causalLeBool_eq_true_iff C p.lower.point q.lower.point).2 hple⟩⟩
    unfold HoleRegion at hp
    rw [hreach] at hp
    cases hp

/-! ## A concrete three-event Mark-generated chain -/

/-- The floor utterance's token mark. -/
def dlFloorMark1 : Mark := ⟨"diamondlift-floor-token"⟩
/-- The floor utterance's claim mark. -/
def dlFloorMark2 : Mark := ⟨"diamondlift-floor-claim"⟩
/-- The floor utterance. -/
def dlFloorUtt : Utterance := ⟨⟨dlFloorMark1⟩, ⟨dlFloorMark2⟩⟩
/-- The floor of the chain: the bare uttered articulation. -/
def dlFloorA : Articulating := Articulating.utter dlFloorUtt

/-- The middle step's token mark. -/
def dlMidMark1 : Mark := ⟨"diamondlift-mid-token"⟩
/-- The middle step's claim mark. -/
def dlMidMark2 : Mark := ⟨"diamondlift-mid-claim"⟩
/-- The middle articulation: one mark step above the floor. -/
def dlLevel1A : Articulating := markStepArticulating dlMidMark1 dlMidMark2 dlFloorA

/-- The top step's token mark. -/
def dlTopMark1 : Mark := ⟨"diamondlift-top-token"⟩
/-- The top step's claim mark. -/
def dlTopMark2 : Mark := ⟨"diamondlift-top-claim"⟩
/-- The top articulation: one mark step above the middle. -/
def dlTopA : Articulating := markStepArticulating dlTopMark1 dlTopMark2 dlLevel1A

theorem dlLevel1A_ne_dlFloorA : dlLevel1A ≠ dlFloorA := by decide
theorem dlTopA_ne_dlFloorA : dlTopA ≠ dlFloorA := by decide
theorem dlTopA_ne_dlLevel1A : dlTopA ≠ dlLevel1A := by decide

/-- The listed underlying articulations of the chain, floor to top. -/
def dlEventsList : List Articulating := [dlFloorA, dlLevel1A, dlTopA]

/-- The finite Mark-downstream carrier: three real `Articulating` values, the
prefix chain of the `markStepCausalSet` top `dlTopA`, packaged as a
finite subtype so `Hole.lean`'s future-core machinery -- whose closure and
connectivity quantifiers range over the whole ambient type -- applies to what
it was built for, a finite event carrier, rather than the unbounded
`Articulating` type itself. -/
def DLChain : Type := {a : Articulating // a ∈ dlEventsList}

instance : DecidableEq DLChain := inferInstanceAs (DecidableEq (Subtype _))

/-- The floor event of the finite chain carrier. -/
def dlFloor : DLChain := ⟨dlFloorA, by decide⟩
/-- The middle event of the finite chain carrier. -/
def dlLevel1 : DLChain := ⟨dlLevel1A, by decide⟩
/-- The top event of the finite chain carrier. -/
def dlTop : DLChain := ⟨dlTopA, by decide⟩

theorem dlLevel1_ne_dlFloor : dlLevel1 ≠ dlFloor := fun h =>
  dlLevel1A_ne_dlFloorA (congrArg Subtype.val h)
theorem dlTop_ne_dlFloor : dlTop ≠ dlFloor := fun h =>
  dlTopA_ne_dlFloorA (congrArg Subtype.val h)
theorem dlTop_ne_dlLevel1 : dlTop ≠ dlLevel1 := fun h =>
  dlTopA_ne_dlLevel1A (congrArg Subtype.val h)

/-- The listed events of the finite chain carrier. -/
def dlEvents : List DLChain := [dlFloor, dlLevel1, dlTop]

/-- The finite diamond-lift chain lists its three events without duplicates. -/
theorem dlEvents_nodup : dlEvents.Nodup := by decide

/-- Every chain event is one of the three listed events. -/
theorem DLChain.cases (x : DLChain) : x = dlFloor ∨ x = dlLevel1 ∨ x = dlTop := by
  obtain ⟨a, ha⟩ := x
  simp only [dlEventsList, List.mem_cons, List.not_mem_nil] at ha
  rcases ha with h | h | h | h
  · exact Or.inl (Subtype.ext h)
  · exact Or.inr (Or.inl (Subtype.ext h))
  · exact Or.inr (Or.inr (Subtype.ext h))
  · exact h.elim

/-- The direct-continuation edge of the finite chain carrier, read off the
underlying articulations. -/
def dlPrec0 (x y : DLChain) : Bool := directlyContinues x.val y.val

theorem dlPrec0_depth_lt {x y : DLChain} (h : dlPrec0 x y = true) :
    x.val.depth < y.val.depth :=
  directlyContinues_depth_lt h

/-- The direct-continuation edge of the finite chain carrier is acyclic, with
underlying articulation depth as ranking. -/
def dlAcyclic : Graph.StrictOrderClosure dlPrec0 where
  lt := fun x y => x.val.depth < y.val.depth
  edge_lt := fun {_ _} h => dlPrec0_depth_lt h
  lt_trans := fun {_ _ _} hab hbc => Nat.lt_trans hab hbc
  lt_irrefl := fun x h => Nat.lt_irrefl x.val.depth h

/-- The finite Mark-generated three-event chain, as a causal set. -/
def dlCausalSet : CausalSet DLChain where
  events := dlEvents
  events_nodup := dlEvents_nodup
  prec0 := dlPrec0
  acyclic := dlAcyclic

theorem dlFloor_prec0_dlLevel1 : dlCausalSet.prec0 dlFloor dlLevel1 = true := by decide
theorem dlLevel1_prec0_dlTop : dlCausalSet.prec0 dlLevel1 dlTop = true := by decide

theorem dlFloor_reaches_dlLevel1 : dlCausalSet.reaches dlFloor dlLevel1 :=
  CausalSet.reaches.last dlFloor_prec0_dlLevel1
theorem dlLevel1_reaches_dlTop : dlCausalSet.reaches dlLevel1 dlTop :=
  CausalSet.reaches.last dlLevel1_prec0_dlTop
theorem dlFloor_reaches_dlTop : dlCausalSet.reaches dlFloor dlTop :=
  CausalSet.reaches.cons dlFloor_prec0_dlLevel1 dlLevel1_reaches_dlTop

theorem dlLevel1_not_reaches_dlFloor : ¬ dlCausalSet.reaches dlLevel1 dlFloor := fun h =>
  absurd (show dlLevel1.val.depth < dlFloor.val.depth from dlCausalSet.reaches_to_lt h)
    (by decide)
theorem dlTop_not_reaches_dlFloor : ¬ dlCausalSet.reaches dlTop dlFloor := fun h =>
  absurd (show dlTop.val.depth < dlFloor.val.depth from dlCausalSet.reaches_to_lt h)
    (by decide)
theorem dlTop_not_reaches_dlLevel1 : ¬ dlCausalSet.reaches dlTop dlLevel1 := fun h =>
  absurd (show dlTop.val.depth < dlLevel1.val.depth from dlCausalSet.reaches_to_lt h)
    (by decide)

/-- The Boolean reflexive causal order of the finite chain carrier. -/
def dlLeqBool (x y : DLChain) : Bool :=
  decide (x = y) ||
    (decide (x = dlFloor) && (decide (y = dlLevel1) || decide (y = dlTop))) ||
    (decide (x = dlLevel1) && decide (y = dlTop))

theorem dlLeqBool_eq_true_iff (x y : DLChain) :
    dlLeqBool x y = true ↔ CausalLe dlCausalSet x y := by
  rcases DLChain.cases x with hx | hx | hx <;> rcases DLChain.cases y with hy | hy | hy <;>
    subst hx <;> subst hy
  · exact ⟨fun _ => Or.inl rfl, fun _ => by decide⟩
  · exact ⟨fun _ => Or.inr dlFloor_reaches_dlLevel1, fun _ => by decide⟩
  · exact ⟨fun _ => Or.inr dlFloor_reaches_dlTop, fun _ => by decide⟩
  · refine ⟨fun h => absurd h (by decide), fun h => absurd h ?_⟩
    rintro (h | h)
    · exact dlLevel1_ne_dlFloor h
    · exact dlLevel1_not_reaches_dlFloor h
  · exact ⟨fun _ => Or.inl rfl, fun _ => by decide⟩
  · exact ⟨fun _ => Or.inr dlLevel1_reaches_dlTop, fun _ => by decide⟩
  · refine ⟨fun h => absurd h (by decide), fun h => absurd h ?_⟩
    rintro (h | h)
    · exact dlTop_ne_dlFloor h
    · exact dlTop_not_reaches_dlFloor h
  · refine ⟨fun h => absurd h (by decide), fun h => absurd h ?_⟩
    rintro (h | h)
    · exact dlTop_ne_dlLevel1 h
    · exact dlTop_not_reaches_dlLevel1 h
  · exact ⟨fun _ => Or.inl rfl, fun _ => by decide⟩

instance dlCausalLeDecision : CausalLeDecision dlCausalSet where
  leq := dlLeqBool
  leq_iff_causalLe := dlLeqBool_eq_true_iff

/-- Reachability in the finite chain carrier is exactly the Boolean order
minus the diagonal, letting `DecidableRel` route through `DecidableEq`
instead of case-splitting the `Or`-valued `DLChain.cases`. -/
theorem dlCausalSet_reaches_iff (x y : DLChain) :
    dlCausalSet.reaches x y ↔ dlLeqBool x y = true ∧ x ≠ y := by
  constructor
  · intro h
    refine ⟨(dlLeqBool_eq_true_iff x y).2 (Or.inr h), ?_⟩
    rintro rfl
    exact dlCausalSet.reaches_irrefl x h
  · rintro ⟨hle, hne⟩
    rcases (dlLeqBool_eq_true_iff x y).1 hle with heq | hreach
    · exact absurd heq hne
    · exact hreach

instance dlDecidableRelReaches : DecidableRel dlCausalSet.reaches := fun x y =>
  decidable_of_iff _ (dlCausalSet_reaches_iff x y).symm

/-! ## A nonempty hole and its proper colouring -/

/-- The readout: only the floor event. -/
def dlReadout : Region DLChain := fun x => decide (x = dlFloor)

/-- The computed hole region is exactly the two non-floor events. -/
theorem dlHoleRegion_iff (x : DLChain) :
    HoleRegion dlCausalSet dlReadout x = true ↔ x ≠ dlFloor := by
  rcases DLChain.cases x with hx | hx | hx <;> subst hx <;> decide

/-- The FOUR-valued colouring: the top event alone carries the active phase. -/
def dlColor : DLChain → Charge := fun x => if x = dlTop then Charge.tTop else Charge.kBot

/-- `dlColor` properly colours the post-hole tile adjacency graph: the sole
edge, between the two hole events `dlLevel1` and `dlTop`, gets distinct
colours. -/
theorem dlColoring : HoleTileColoring dlCausalSet dlReadout dlColor := by
  intro u v h
  rcases DLChain.cases u with hu | hu | hu <;> rcases DLChain.cases v with hv | hv | hv <;>
    subst hu <;> subst hv <;>
    first
      | exact absurd h (by decide)
      | decide

/-- The readout region is exactly the floor, matching `dlReadout` pointwise: the
Boolean predicate read as a Prop is the singleton `{dlFloor}`. -/
theorem dlReadout_asProp_eq_singleton (x : DLChain) :
    dlReadout x = true ↔ x = dlFloor := decide_eq_true_iff

/-- The readout region -- a single point -- is connected, via the general
`isConnected_singleton` base case rather than any bespoke argument. -/
theorem dlReadoutConnected :
    Obsmetrologia.Alexandrov.IsConnected (causalTopology dlCausalSet)
      (asCausalOpenSet dlCausalSet dlReadout) :=
  Obsmetrologia.Alexandrov.isConnected_congr (causalTopology dlCausalSet)
    (fun x => (dlReadout_asProp_eq_singleton x).symm)
    (Obsmetrologia.Alexandrov.isConnected_singleton (causalTopology dlCausalSet) dlFloor)

/-- **The readout exterior is connected**: a witness for
`ReadoutExteriorConnected`, the sibling of `HoleRegionConnected`
(witnessed by `dlPostHoleTile` above) that had none anywhere in the library
before this. The readout (`{dlFloor}`) is listed and connected
(`dlReadoutConnected`), so `readoutExterior_connected_of_connected_listed_readout`
applies directly. -/
theorem dlReadoutExteriorConnected : ReadoutExteriorConnected dlCausalSet dlReadout :=
  readoutExterior_connected_of_connected_listed_readout dlCausalSet dlReadout
    (fun x hx => by
      have hxf : x = dlFloor := (dlReadout_asProp_eq_singleton x).1 hx
      subst hxf
      decide)
    dlReadoutConnected

/-! ## A concrete post-hole tile, and its lift -/

/-- The top event anchors the whole hole region: `dlColor`'s active phase is
exactly the top event's own principal future, and every hole event reaches
the top. -/
def dlAnchorCore : AnchoredPrincipalColorFutureCore dlCausalSet dlReadout dlColor where
  root := dlTop
  phase := Charge.tTop
  principal := by
    intro x
    rcases DLChain.cases x with hx | hx | hx <;> subst hx
    · constructor
      · intro h
        exact absurd h.1 (by decide)
      · intro h
        rcases h with h | h
        · exact absurd h dlTop_ne_dlFloor
        · exact absurd h dlTop_not_reaches_dlFloor
    · constructor
      · intro h
        exact absurd h.2 (by decide)
      · intro h
        rcases h with h | h
        · exact absurd h dlTop_ne_dlLevel1
        · exact absurd h dlTop_not_reaches_dlLevel1
    · exact ⟨fun _ => Or.inl rfl, fun _ => ⟨by decide, by decide⟩⟩
  anchors := by
    intro x hx
    rcases DLChain.cases x with hx' | hx' | hx' <;> subst hx'
    · exact absurd hx (by decide)
    · exact Or.inr dlLevel1_reaches_dlTop
    · exact Or.inl rfl

/-- The concrete post-hole tile: the two-event hole `{dlLevel1, dlTop}` of
the finite Mark-generated chain, coloured by `dlColor`, anchored at
`dlTop`. -/
def dlPostHoleTile : PostHoleTile dlCausalSet dlReadout :=
  (AnchoredColorSettledPostHoleTile.mk
      Obsmetrologia.Combinatorics.CorpusTileAdjacencyConvention.king dlColor dlColoring
      dlAnchorCore).toPrincipalColorSettledPostHoleTile.toColorSettledPostHoleTile.toPostHoleTile

/-! ## The diamond lift of the concrete tile -/

/-- Nothing in the finite chain reaches the floor: it is the global minimum. -/
theorem dlNothing_reaches_dlFloor (x : DLChain) : ¬ dlCausalSet.reaches x dlFloor := by
  rcases DLChain.cases x with hx | hx | hx <;> subst hx
  · exact dlCausalSet.reaches_irrefl dlFloor
  · exact dlLevel1_not_reaches_dlFloor
  · exact dlTop_not_reaches_dlFloor

/-- No diamond point's upper endpoint is the floor: the floor is always the
lower endpoint of a diamond built over this chain, never the upper one. -/
theorem dlDiamondPoint_upper_ne_dlFloor (p : DiamondPoint dlCausalSet) :
    p.upper.point ≠ dlFloor := fun h =>
  dlNothing_reaches_dlFloor p.lower.point (h ▸ p.reaches_upper)

/-- The lifted readout on diamond points: pull back the base readout along
the upper endpoint, per the diamond-lift closure conjecture's `R◊`. -/
def dlReadoutD : Region (DiamondPoint dlCausalSet) := fun p => dlReadout p.upper.point

/-- The lifted colouring on diamond points: pull back `dlColor` along the
upper endpoint, per the conjecture's `χ◊`. -/
def dlColorD : DiamondPoint dlCausalSet → Charge := fun p => dlColor p.upper.point

/-- Every diamond point lifts into the pulled-back hole region: no diamond
point's upper endpoint can be the readout floor. -/
theorem dlHoleRegionD_true (p : DiamondPoint dlCausalSet) :
    HoleRegion (sequencingCausalSet dlCausalSet) dlReadoutD p = true :=
  holeRegion_lift_pullback dlCausalSet dlReadout
    ((dlHoleRegion_iff p.upper.point).2 (dlDiamondPoint_upper_ne_dlFloor p))

/-- No diamond point ending at `dlTop` sequencing-precedes anything: nothing
is reached from the top of this chain (`dlTop_not_reaches_dlFloor`,
`dlTop_not_reaches_dlLevel1`, `reaches_irrefl`), so any candidate successor's
own `reaches_upper` witness is contradictory. -/
theorem dlNoSuccessor_of_upper_dlTop {a b : DiamondPoint dlCausalSet}
    (ha : a.upper.point = dlTop) (hab : sequencingPrec0 dlCausalSet a b = true) : False := by
  have hle : CausalLe dlCausalSet a.upper.point b.lower.point :=
    (sequencing_prec0_eq_true_iff dlCausalSet a b).1 hab
  rw [ha] at hle
  rcases hle with heq | hreach
  · have hbreach : dlCausalSet.reaches dlTop b.upper.point := by
      rw [heq]; exact b.reaches_upper
    rcases DLChain.cases b.upper.point with hbu | hbu | hbu
    · exact dlTop_not_reaches_dlFloor (hbu ▸ hbreach)
    · exact dlTop_not_reaches_dlLevel1 (hbu ▸ hbreach)
    · exact dlCausalSet.reaches_irrefl dlTop (hbu ▸ hbreach)
  · rcases DLChain.cases b.lower.point with hbl | hbl | hbl <;> rw [hbl] at hreach
    · exact dlTop_not_reaches_dlFloor hreach
    · exact dlTop_not_reaches_dlLevel1 hreach
    · exact dlCausalSet.reaches_irrefl dlTop hreach

/-- `dlColorD` properly colours the lifted post-hole tile adjacency graph:
any two diamond points related by one sequencing step have upper endpoints
related by one step of the base order, and `dlColor` already distinguishes
every base-adjacent pair through that same relation. -/
theorem dlColoringD :
    HoleTileColoring (sequencingCausalSet dlCausalSet) dlReadoutD dlColorD := by
  intro p q h
  have hadj : CausalAdjacent (sequencingCausalSet dlCausalSet) p q = true :=
    holeTileAdjacency_causalAdjacent (sequencingCausalSet dlCausalSet) dlReadoutD h
  have hne : p ≠ q := holeTileAdjacency_ne (sequencingCausalSet dlCausalSet) dlReadoutD h
  have hor := (causalAdjacent_eq_true_iff (sequencingCausalSet dlCausalSet) p q).1 hadj
  have hpq : sequencingPrec0 dlCausalSet p q = true ∨ sequencingPrec0 dlCausalSet q p = true := by
    rcases hor with hle | hle
    · rcases hle with heq | hreach
      · exact absurd heq hne
      · exact Or.inl (sequencing_reaches_to_prec0 dlCausalSet hreach)
    · rcases hle with heq | hreach
      · exact absurd heq.symm hne
      · exact Or.inr (sequencing_reaches_to_prec0 dlCausalSet hreach)
  -- Every actual sequencing step over this three-event chain runs from the
  -- diamond ending at `dlLevel1` to the diamond ending at `dlTop`: that is
  -- the chain's only direct edge, so it is the only place a lifted colour
  -- clash could arise.
  have hcolor : ∀ {a b : DiamondPoint dlCausalSet}, sequencingPrec0 dlCausalSet a b = true →
      dlColorD a ≠ dlColorD b := by
    intro a b hab
    have hle : CausalLe dlCausalSet a.upper.point b.lower.point :=
      (sequencing_prec0_eq_true_iff dlCausalSet a b).1 hab
    have hau : a.upper.point ≠ dlFloor := dlDiamondPoint_upper_ne_dlFloor a
    rcases DLChain.cases a.upper.point with ha | ha | ha
    · exact absurd ha hau
    · -- `a.upper.point = dlLevel1`; find `b.upper.point` from `b.lower.point`.
      rcases DLChain.cases b.lower.point with hbl | hbl | hbl
      · exfalso
        rw [ha, hbl] at hle
        rcases hle with heq | hreach
        · exact dlLevel1_ne_dlFloor heq
        · exact dlLevel1_not_reaches_dlFloor hreach
      · have hbreach : dlCausalSet.reaches dlLevel1 b.upper.point := by
          rw [← hbl]; exact b.reaches_upper
        rcases DLChain.cases b.upper.point with hbu | hbu | hbu
        · exact absurd hbu (dlDiamondPoint_upper_ne_dlFloor b)
        · exact absurd (hbu ▸ hbreach) (dlCausalSet.reaches_irrefl dlLevel1)
        · simp only [dlColorD, ha, hbu, dlColor]; decide
      · exfalso
        have hbreach : dlCausalSet.reaches dlTop b.upper.point := by
          rw [← hbl]; exact b.reaches_upper
        rcases DLChain.cases b.upper.point with hbu | hbu | hbu
        · exact dlTop_not_reaches_dlFloor (hbu ▸ hbreach)
        · exact dlTop_not_reaches_dlLevel1 (hbu ▸ hbreach)
        · exact dlCausalSet.reaches_irrefl dlTop (hbu ▸ hbreach)
    · -- `a.upper.point = dlTop`; no diamond point ending at the top has any
      -- successor at all, since nothing is reached from the top.
      exact (dlNoSuccessor_of_upper_dlTop ha hab).elim
  rcases hpq with hpq | hqp
  · exact hcolor hpq
  · exact (hcolor hqp).symm

/-! ## The lift does not close: a provable collapse, not a mystery -/

/-- The one direct edge of the finite chain, as a diamond point. -/
def dlDPStep : DiamondPoint dlCausalSet :=
  ⟨⟨dlFloor, by decide⟩, ⟨dlLevel1, by decide⟩, dlFloor_reaches_dlLevel1⟩

/-- The other direct edge of the finite chain, as a diamond point. -/
def dlDPStep' : DiamondPoint dlCausalSet :=
  ⟨⟨dlLevel1, by decide⟩, ⟨dlTop, by decide⟩, dlLevel1_reaches_dlTop⟩

/-- The long-jump diamond of the finite chain, skipping the middle event. -/
def dlDPJump : DiamondPoint dlCausalSet :=
  ⟨⟨dlFloor, by decide⟩, ⟨dlTop, by decide⟩, dlFloor_reaches_dlTop⟩

/-- The long-jump diamond and the second-step diamond are distinct: they
disagree at the lower endpoint. -/
theorem dlDPJump_ne_dlDPStep' : dlDPJump ≠ dlDPStep' := fun h => by
  have hl : (dlDPJump : DiamondPoint dlCausalSet).lower.point = dlDPStep'.lower.point := by
    rw [h]
  exact dlLevel1_ne_dlFloor hl.symm

/-- The lift collapses: the long-jump diamond and the second-step
diamond are two *distinct* diamond points that the upper-endpoint map sends
to the *same* base event, and hence to the same lifted colour. -/
theorem dlDPJump_dlDPStep'_upperPoint_collapse :
    dlDPJump.upper.point = dlDPStep'.upper.point := rfl

theorem dlDPJump_dlDPStep'_colorD_collapse :
    dlColorD dlDPJump = dlColorD dlDPStep' := rfl

/-- And the collapse is not merely a colour coincidence: the two diamond
points are causally *unrelated* in the sequencing order, in both directions.
The long-jump diamond has no predecessor (nothing has upper endpoint
`dlFloor`, so nothing can hand off into it) and no successor (nothing is
reached from `dlTop`, by `dlNoSuccessor_of_upper_dlTop`) -- it is an isolated point of `K(dlCausalSet)`, not merely absent from the one edge the
base tile's hole carries. -/
theorem dlDPJump_dlDPStep'_unrelated :
    ¬ CausalLe (sequencingCausalSet dlCausalSet) dlDPJump dlDPStep' ∧
      ¬ CausalLe (sequencingCausalSet dlCausalSet) dlDPStep' dlDPJump := by
  constructor
  · rintro (heq | hreach)
    · exact dlDPJump_ne_dlDPStep' heq
    · exact dlNoSuccessor_of_upper_dlTop rfl (sequencing_reaches_to_prec0 dlCausalSet hreach)
  · rintro (heq | hreach)
    · exact dlDPJump_ne_dlDPStep' heq.symm
    · exact dlNoSuccessor_of_upper_dlTop rfl (sequencing_reaches_to_prec0 dlCausalSet hreach)

/-! ## Flipping the endpoint: the lower-endpoint lift closes

`dlReadoutD`/`dlColorD` read off the *upper* endpoint and left the future core
open (`dlDPJump` is isolated). Reading off the *lower* endpoint instead is an
equally "endpoint-reflecting lift" -- the conjecture names no
preferred endpoint -- and here it collapses the lifted hole to the single
point `dlDPStep'`, closing the whole `PostHoleTile` outright: a singleton
hole has no adjacency pairs to colour and is connected for free. -/

/-- A diamond point is determined by its two endpoints: `Event`'s and
`DiamondPoint`'s remaining fields are `Prop`-valued, so once the points agree
the structures agree by proof irrelevance. -/
theorem DiamondPoint.ext_point {p q : DiamondPoint dlCausalSet}
    (hl : p.lower.point = q.lower.point) (hu : p.upper.point = q.upper.point) : p = q := by
  obtain ⟨⟨pl, plh⟩, ⟨pu, puh⟩, ph⟩ := p
  obtain ⟨⟨ql, qlh⟩, ⟨qu, quh⟩, qh⟩ := q
  simp only at hl hu
  subst hl
  subst hu
  rfl

/-- **Every diamond point over this three-event chain is one of exactly
three**: the two direct edges (`dlDPStep`, `dlDPStep'`) or the long jump
(`dlDPJump`). Reached by ruling out the six impossible `(lower, upper)`
combinations via `reaches_upper` (self-loops, or a listed pair that never
`dlCausalSet.reaches`), leaving exactly the three that do. -/
theorem DiamondPoint.cases_dl (p : DiamondPoint dlCausalSet) :
    p = dlDPStep ∨ p = dlDPStep' ∨ p = dlDPJump := by
  rcases DLChain.cases p.lower.point with hl | hl | hl <;>
    rcases DLChain.cases p.upper.point with hu | hu | hu <;>
    first
      | (exact Or.inl (DiamondPoint.ext_point hl hu))
      | (exact Or.inr (Or.inl (DiamondPoint.ext_point hl hu)))
      | (exact Or.inr (Or.inr (DiamondPoint.ext_point hl hu)))
      | (exact absurd (show dlCausalSet.reaches p.lower.point p.upper.point from p.reaches_upper)
          (by rw [hl, hu]; first
            | exact dlCausalSet.reaches_irrefl _
            | exact dlLevel1_not_reaches_dlFloor
            | exact dlTop_not_reaches_dlFloor
            | exact dlTop_not_reaches_dlLevel1))

/-- The lifted readout on diamond points, reading off the *lower* endpoint. -/
def dlReadoutDLower : Region (DiamondPoint dlCausalSet) := fun p => dlReadout p.lower.point

/-- The lifted colouring on diamond points, reading off the *lower* endpoint. -/
def dlColorDLower : DiamondPoint dlCausalSet → Charge := fun p => dlColor p.lower.point

/-- **The lower-pullback hole is exactly the singleton `{dlDPStep'}`.**
Case-split over the three possible diamond points: `dlDPStep` and `dlDPJump`
both have lower endpoint `dlFloor`, so they reflexively reach the (lower-read)
readout and are excluded; `dlDPStep'` has no successors at all
(`dlNoSuccessor_of_upper_dlTop`) and its own lower endpoint isn't the floor,
so it never reaches the readout either way. -/
theorem dlHoleRegionDLower_iff (p : DiamondPoint dlCausalSet) :
    HoleRegion (sequencingCausalSet dlCausalSet) dlReadoutDLower p = true ↔ p = dlDPStep' := by
  rcases DiamondPoint.cases_dl p with hp | hp | hp <;> subst hp <;> decide

/-- **`dlColorDLower` properly colours the lower-pullback tile, vacuously.**
The lifted hole is the singleton `{dlDPStep'}` (`dlHoleRegionDLower_iff`), so
`HoleTileAdjacency` (which needs two *distinct* hole events) has no edges at
all to colour. -/
theorem dlColoringDLower :
    HoleTileColoring (sequencingCausalSet dlCausalSet) dlReadoutDLower dlColorDLower := by
  intro u v h
  have hu : HoleRegion (sequencingCausalSet dlCausalSet) dlReadoutDLower u = true :=
    holeTileAdjacency_left (sequencingCausalSet dlCausalSet) dlReadoutDLower h
  have hv : HoleRegion (sequencingCausalSet dlCausalSet) dlReadoutDLower v = true :=
    holeTileAdjacency_right (sequencingCausalSet dlCausalSet) dlReadoutDLower h
  have hune : u ≠ v := holeTileAdjacency_ne (sequencingCausalSet dlCausalSet) dlReadoutDLower h
  exact absurd (((dlHoleRegionDLower_iff u).1 hu).trans ((dlHoleRegionDLower_iff v).1 hv).symm) hune

/-- **The lower-pullback future core**: the singleton hole is trivially
connected (`isConnected_singleton`) and every hole point -- there being only
one -- reaches it reflexively. -/
def dlFutureCoreDLower : HoleFutureCore (sequencingCausalSet dlCausalSet) dlReadoutDLower where
  core := fun p => p = dlDPStep'
  connected :=
    Obsmetrologia.Alexandrov.isConnected_singleton
      (causalTopology (sequencingCausalSet dlCausalSet)) dlDPStep'
  subset_hole := fun p hp => (dlHoleRegionDLower_iff p).2 hp
  cofinal := fun p hp => ⟨dlDPStep', rfl, ((dlHoleRegionDLower_iff p).1 hp) ▸ Or.inl rfl⟩

/-- **The lower-endpoint lift closes.** Flipping which endpoint
`R◊`/`χ◊` read -- lower instead of upper, an equally choice the
conjecture's "endpoint-reflecting lift" phrasing does not rule out -- collapses
the lifted hole to one point, and a singleton hole is a `PostHoleTile` for
free: no adjacency pairs to colour, trivially connected. Where the
upper-endpoint lift's obstruction was a, proved fact about `K(C)`
(`dlDPJump_dlDPStep'_unrelated`), it was an obstruction *for that specific
lift*, not for the diamond space itself -- a different, equally legitimate
lift of the same base tile closes outright. -/
def dlPostHoleTileDLower : PostHoleTile (sequencingCausalSet dlCausalSet) dlReadoutDLower where
  convention := Obsmetrologia.Combinatorics.CorpusTileAdjacencyConvention.king
  color := dlColorDLower
  coloring := dlColoringDLower
  futureCore := dlFutureCoreDLower

end CausalSets.BlackHoles
end Obsmetrologia
