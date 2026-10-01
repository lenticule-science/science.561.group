import ObsmetrologiaPhysicalScience.CausalSets.Causal.Net
import ObsmetrologiaPhysicalScience.CausalSets.Causal.Alexandrov
import Obsmetrologia.Closure.OrdinalCore

/-!
# Hole — finite computable no-readout regions and their shrouds

This module promotes the finite no-readout construction away from black-hole
vocabulary. Given a causal set `C`, a decidable presentation of its settled
reflexive causal order, and a chosen Boolean readout region, an event is in the
hole when no listed event in the readout is reachable from it.

The construction is the causal-order base of a fuller `Hole` object. It proves
the no-readout closure laws and names the boundary between the no-readout side
and the readout exterior as the `Shroud`. The predicates are Boolean and their
listed carriers are `List.filter` computations over `C.events`, matching the
runtime observation handler in `sites/hole`.

## Main definitions

* `Region` — a finite computable region as a Boolean predicate.
* `CausalLeDecision` — the settled Boolean causal-order presentation for `C`.
* `ReachesReadout` — an event reaches the readout by a listed causal path.
* `HoleRegion` — events that do not reach the readout.
* `ReadoutExterior` — events that do reach the readout.
* `CausalAdjacent` — finite Boolean causal adjacency.
* `Shroud` — a hole event adjacent to the readout exterior.
* `EventHorizon` — a boundary carrier whose surface is the shroud.
* `Hole` — a carrier bundling the causal substrate, readout boundary, and an
  effect relation whose sources are shrouded.

## Main results

* `hole_future_closed` — the hole region is future-closed.
* `readoutExterior_past_closed` — the readout exterior is past-closed.
* `hole_exterior_disjoint` — no event is both inside and outside.
* `hole_no_future_to_exterior` — no interior event causally precedes an
  exterior event.
* `shroud_in_hole` / `shroud_has_exterior_neighbour` — the shroud lies on the
  hole side and touches the readout exterior.
* `shroud_has_exterior_predecessor` — shroud adjacency is oriented from
  exterior into the shroud.
* `holeRegion_isOpen` — the Boolean hole region, read as a Prop-valued set, is
  open in the causal Alexandrov topology.
* `holeRegion_connected_of_futureAnchor` — a single future anchor reached by
  every hole point connects the computed hole region.
* `holeRegion_connected_of_settlingAnchor` — a hole-side settling operation
  whose settled value is a single root connects the computed hole region.
* `holeRegion_connected_of_stepSettlingAnchor` — a finite causal step dynamics
  that reaches one root connects the computed hole region.
* `holeRegion_connected_of_rankedStepAnchor` — a ranked finite local step whose
  finite-stage height decreases to one root connects the computed hole region.
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Alexandrov

variable {E : Type} (C : CausalSet E)

/-! ## Computable finite regions -/

/-- A finite causal region is represented by a Boolean membership predicate. -/
abbrev Region (E : Type) := E → Bool

namespace Region

/-- Read a Boolean region as a Prop-valued predicate. -/
def asProp (U : Region E) : E → Prop := fun x => U x = true

/-- The listed events selected by a Boolean region. -/
def listed (C : CausalSet E) (U : Region E) : List E :=
  C.events.filter U

/-- Membership in the listed carrier is exactly list membership plus Boolean membership. -/
theorem mem_listed_iff (U : Region E) {x : E} :
    x ∈ listed C U ↔ x ∈ C.events ∧ U x = true := by
  simp [listed]

end Region

/-- A Boolean presentation of the settled reflexive causal order of `C`. -/
class CausalLeDecision {E : Type} (C : CausalSet E) where
  /-- The Boolean reflexive causal-order decider. -/
  leq : E → E → Bool
  /-- The Boolean decider presents the already proved causal order. -/
  leq_iff_causalLe : ∀ x y, leq x y = true ↔ CausalLe C x y

variable [CausalLeDecision C]

/-- Boolean reflexive causal precedence from the chosen settled-order presentation. -/
def CausalLeBool (x y : E) : Bool :=
  CausalLeDecision.leq C x y

/-- A Boolean causal-order fact reflects to the proved causal order. -/
theorem causalLeBool_eq_true_iff (x y : E) :
    CausalLeBool C x y = true ↔ CausalLe C x y :=
  CausalLeDecision.leq_iff_causalLe x y

/-- An event reaches a readout region when a listed readout event is in its causal future. -/
def ReachesReadout (readout : Region E) (x : E) : Bool :=
  C.events.any (fun y => readout y && CausalLeBool C x y)

/-- The hole region: events that cannot causally reach the chosen readout. -/
def HoleRegion (readout : Region E) : Region E :=
  fun x => !(ReachesReadout C readout x)

/-- The readout exterior: events that do causally reach the chosen readout. -/
def ReadoutExterior (readout : Region E) : Region E :=
  fun x => ReachesReadout C readout x

/-- The listed events of the computed hole region. -/
def HoleRegionEvents (readout : Region E) : List E :=
  Region.listed C (HoleRegion C readout)

/-- The listed events of the computed readout exterior. -/
def ReadoutExteriorEvents (readout : Region E) : List E :=
  Region.listed C (ReadoutExterior C readout)

/-- Membership in the listed hole region is the computed Boolean hole predicate. -/
theorem mem_holeRegionEvents_iff (readout : Region E) {x : E} :
    x ∈ HoleRegionEvents C readout ↔ x ∈ C.events ∧ HoleRegion C readout x = true := by
  simp [HoleRegionEvents, Region.mem_listed_iff]

/-- Membership in the listed exterior is the computed Boolean exterior predicate. -/
theorem mem_readoutExteriorEvents_iff (readout : Region E) {x : E} :
    x ∈ ReadoutExteriorEvents C readout ↔
      x ∈ C.events ∧ ReadoutExterior C readout x = true := by
  simp [ReadoutExteriorEvents, Region.mem_listed_iff]

/-- A listed readout point lies in the readout exterior. -/
theorem readout_subset_readoutExterior_of_listed (readout : Region E) {x : E}
    (hxmem : x ∈ C.events) (hx : readout x = true) :
    ReadoutExterior C readout x = true := by
  unfold ReadoutExterior ReachesReadout
  rw [List.any_eq_true]
  refine ⟨x, hxmem, ?_⟩
  rw [Bool.and_eq_true]
  refine ⟨hx, ?_⟩
  rw [causalLeBool_eq_true_iff]
  exact causalLe_refl C x

/-- Every readout-exterior point reaches a listed readout point. -/
theorem readoutExterior_has_readout_anchor (readout : Region E) {x : E}
    (hx : ReadoutExterior C readout x = true) :
    ∃ r, r ∈ C.events ∧ readout r = true ∧ CausalLe C x r := by
  unfold ReadoutExterior ReachesReadout at hx
  rw [List.any_eq_true] at hx
  obtain ⟨r, hrmem, hr⟩ := hx
  rw [Bool.and_eq_true] at hr
  exact ⟨r, hrmem, hr.1, (causalLeBool_eq_true_iff C x r).mp hr.2⟩

/-- The readout exterior is past-closed: if `y` reaches readout and `x <= y`, then `x` does too. -/
theorem readoutExterior_past_closed (readout : Region E) {x y : E}
    (hxy : CausalLe C x y) (hy : ReadoutExterior C readout y = true) :
    ReadoutExterior C readout x = true := by
  unfold ReadoutExterior ReachesReadout at hy ⊢
  rw [List.any_eq_true] at hy ⊢
  obtain ⟨r, hrmem, hry⟩ := hy
  rw [Bool.and_eq_true] at hry
  refine ⟨r, hrmem, ?_⟩
  rw [Bool.and_eq_true]
  refine ⟨hry.1, ?_⟩
  rw [causalLeBool_eq_true_iff]
  exact causalLe_trans C hxy ((causalLeBool_eq_true_iff C y r).mp hry.2)

/-- The hole region is future-closed: no-readout propagates downstream. -/
theorem hole_future_closed (readout : Region E) {x y : E}
    (hx : HoleRegion C readout x = true) (hxy : CausalLe C x y) :
    HoleRegion C readout y = true := by
  unfold HoleRegion
  cases hy : ReadoutExterior C readout y
  · unfold ReadoutExterior at hy
    rw [hy]
    rfl
  · have hxout : ReadoutExterior C readout x = true :=
      readoutExterior_past_closed C readout hxy hy
    unfold HoleRegion at hx
    unfold ReadoutExterior at hxout
    rw [hxout] at hx
    cases hx

/-- The hole and the readout exterior are disjoint. -/
theorem hole_exterior_disjoint (readout : Region E) (x : E) :
    ¬ (HoleRegion C readout x = true ∧ ReadoutExterior C readout x = true) := by
  intro h
  unfold HoleRegion ReadoutExterior at h
  rw [h.2] at h
  cases h.1

/-- No hole-interior event causally precedes a readout-exterior event. -/
theorem hole_no_future_to_exterior (readout : Region E) {x y : E}
    (hin : HoleRegion C readout x = true) (hout : ReadoutExterior C readout y = true) :
    ¬ CausalLe C x y := by
  intro hxy
  exact hole_exterior_disjoint C readout x
    ⟨hin, readoutExterior_past_closed C readout hxy hout⟩

/-- Two events are causally adjacent when one causally precedes the other. -/
def CausalAdjacent (x y : E) : Bool :=
  CausalLeBool C x y || CausalLeBool C y x

/-- Boolean adjacency reflects the proved causal order in either direction. -/
theorem causalAdjacent_eq_true_iff (x y : E) :
    CausalAdjacent C x y = true ↔ CausalLe C x y ∨ CausalLe C y x := by
  unfold CausalAdjacent
  rw [Bool.or_eq_true, causalLeBool_eq_true_iff C x y, causalLeBool_eq_true_iff C y x]

/-- The shroud: a hole event causally adjacent to a readout-exterior event. -/
def Shroud (readout : Region E) (x : E) : Bool :=
  HoleRegion C readout x &&
    C.events.any (fun y => ReadoutExterior C readout y && CausalAdjacent C x y)

/-- The listed events of the computed shroud. -/
def ShroudEvents (readout : Region E) : List E :=
  Region.listed C (Shroud C readout)

/-- Membership in the listed shroud is the computed Boolean shroud predicate. -/
theorem mem_shroudEvents_iff (readout : Region E) {x : E} :
    x ∈ ShroudEvents C readout ↔ x ∈ C.events ∧ Shroud C readout x = true := by
  simp [ShroudEvents, Region.mem_listed_iff]

/-- A shroud event lies inside the hole region. -/
theorem shroud_in_hole (readout : Region E) {x : E}
    (h : Shroud C readout x = true) : HoleRegion C readout x = true := by
  unfold Shroud at h
  rw [Bool.and_eq_true] at h
  exact h.1

/-- A shroud event has a listed causally adjacent readout-exterior neighbour. -/
theorem shroud_has_exterior_neighbour (readout : Region E) {x : E}
    (h : Shroud C readout x = true) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧ CausalAdjacent C x y = true := by
  unfold Shroud at h
  rw [Bool.and_eq_true] at h
  have hany := h.2
  rw [List.any_eq_true] at hany
  obtain ⟨y, hymem, hy⟩ := hany
  rw [Bool.and_eq_true] at hy
  exact ⟨y, hymem, hy.1, hy.2⟩

/-- A shroud event is not itself in the readout exterior. -/
theorem shroud_not_exterior (readout : Region E) {x : E}
    (h : Shroud C readout x = true) : ReadoutExterior C readout x = false := by
  cases hx : ReadoutExterior C readout x
  · rfl
  · exact False.elim (hole_exterior_disjoint C readout x ⟨shroud_in_hole C readout h, hx⟩)

/-- A shroud event has a readout-exterior predecessor.

Adjacency to the exterior cannot point from the no-readout side outward: that
would make the shroud event reach readout. Therefore the exterior-adjacent event
causally precedes the shroud event. -/
theorem shroud_has_exterior_predecessor (readout : Region E) {x : E}
    (h : Shroud C readout x = true) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧ CausalLe C y x := by
  obtain ⟨y, hymem, hyout, hadj⟩ := shroud_has_exterior_neighbour C readout h
  rcases (causalAdjacent_eq_true_iff C x y).mp hadj with hxy | hyx
  · exact False.elim ((hole_no_future_to_exterior C readout (shroud_in_hole C readout h) hyout) hxy)
  · exact ⟨y, hymem, hyout, hyx⟩

/-- The three finite carriers computed by the runtime observation handler are list filters. -/
theorem runtime_observation_filter_shape (readout : Region E) :
    HoleRegionEvents C readout = C.events.filter (HoleRegion C readout)
      ∧ ReadoutExteriorEvents C readout = C.events.filter (ReadoutExterior C readout)
      ∧ ShroudEvents C readout = C.events.filter (Shroud C readout) :=
  ⟨rfl, rfl, rfl⟩

/-! ## Causal voids -/

/-- A **causal void** is a no-readout interior paired with its readout exterior. -/
structure CausalVoid (E : Type) where
  /-- The finite causal substrate. -/
  C : CausalSet E
  /-- The settled Boolean causal-order presentation. -/
  decision : CausalLeDecision C
  /-- The readout region whose non-reachability determines the void. -/
  readout : Region E
  /-- The no-readout interior. -/
  interior : Region E
  /-- The readout exterior. -/
  exterior : Region E
  /-- The interior is exactly the generated hole region. -/
  interior_eq_no_readout : ∀ x, interior x = (letI := decision; HoleRegion C readout x)
  /-- The exterior is exactly the generated readout exterior. -/
  exterior_eq_readout : ∀ x, exterior x = (letI := decision; ReadoutExterior C readout x)

namespace CausalVoid

variable (V : CausalVoid E)

/-- Build the canonical causal void from a causal set and readout region. -/
def ofReadout (C : CausalSet E) [d : CausalLeDecision C] (readout : Region E) : CausalVoid E where
  C := C
  decision := d
  readout := readout
  interior := HoleRegion C readout
  exterior := ReadoutExterior C readout
  interior_eq_no_readout := fun _ => rfl
  exterior_eq_readout := fun _ => rfl

/-- The interior of a causal void is future-closed. -/
theorem interior_future_closed {x y : E}
    (hx : V.interior x = true) (hxy : CausalLe V.C x y) : V.interior y = true := by
  letI := V.decision
  rw [V.interior_eq_no_readout x] at hx
  rw [V.interior_eq_no_readout y]
  exact hole_future_closed V.C V.readout hx hxy

/-- The exterior of a causal void is past-closed. -/
theorem exterior_past_closed {x y : E}
    (hxy : CausalLe V.C x y) (hy : V.exterior y = true) : V.exterior x = true := by
  letI := V.decision
  rw [V.exterior_eq_readout y] at hy
  rw [V.exterior_eq_readout x]
  exact readoutExterior_past_closed V.C V.readout hxy hy

/-- A causal void has disjoint interior and exterior. -/
theorem interior_exterior_disjoint (x : E) :
    ¬(V.interior x = true ∧ V.exterior x = true) := by
  letI := V.decision
  intro h
  exact hole_exterior_disjoint V.C V.readout x
    ⟨by simpa [V.interior_eq_no_readout x] using h.1,
     by simpa [V.exterior_eq_readout x] using h.2⟩

/-- No causal-void interior event causally precedes an exterior event. -/
theorem no_future_to_exterior {x y : E}
    (hin : V.interior x = true) (hout : V.exterior y = true) : ¬ CausalLe V.C x y := by
  letI := V.decision
  exact hole_no_future_to_exterior V.C V.readout
    (by simpa [V.interior_eq_no_readout x] using hin)
    (by simpa [V.exterior_eq_readout y] using hout)

end CausalVoid

/-! ## Event horizons and full holes -/

/-- An event-horizon carrier for a finite causal set. -/
structure EventHorizon (E : Type) where
  /-- The finite causal substrate whose boundary is being considered. -/
  C : CausalSet E
  /-- The settled Boolean causal-order presentation. -/
  decision : CausalLeDecision C
  /-- The readout region playing the finite external readout role. -/
  readout : Region E
  /-- The named horizon surface. -/
  surface : Region E
  /-- The surface is exactly the shroud determined by `C` and `readout`. -/
  surface_eq_shroud : ∀ x, surface x = (letI := decision; Shroud C readout x)

namespace EventHorizon

variable (H : EventHorizon E)

/-- Build the canonical event horizon from a causal set and readout region. -/
def ofReadout (C : CausalSet E) [d : CausalLeDecision C] (readout : Region E) : EventHorizon E where
  C := C
  decision := d
  readout := readout
  surface := Shroud C readout
  surface_eq_shroud := fun _ => rfl

/-- The no-readout interior bounded by an event horizon. -/
def interior : Region E := letI := H.decision; HoleRegion H.C H.readout

/-- The readout exterior of an event horizon. -/
def exterior : Region E := letI := H.decision; ReadoutExterior H.C H.readout

/-- A proof-carrying event lies on the horizon surface when its point lies on that surface. -/
def onSurfaceEvent (e : Event H.C) : Prop := H.surface e.point = true

/-- Horizon-surface points lie inside the no-readout interior. -/
theorem surface_interior {x : E} (h : H.surface x = true) : H.interior x = true := by
  letI := H.decision
  exact shroud_in_hole H.C H.readout (by simpa [H.surface_eq_shroud x] using h)

/-- Horizon-surface points are not in the readout exterior. -/
theorem surface_not_exterior {x : E} (h : H.surface x = true) : H.exterior x = false := by
  letI := H.decision
  exact shroud_not_exterior H.C H.readout (by simpa [H.surface_eq_shroud x] using h)

/-- The horizon interior is future-closed. -/
theorem interior_future_closed {x y : E}
    (hx : H.interior x = true) (hxy : CausalLe H.C x y) : H.interior y = true := by
  letI := H.decision
  exact hole_future_closed H.C H.readout hx hxy

/-- The horizon exterior is past-closed. -/
theorem exterior_past_closed {x y : E}
    (hxy : CausalLe H.C x y) (hy : H.exterior y = true) : H.exterior x = true := by
  letI := H.decision
  exact readoutExterior_past_closed H.C H.readout hxy hy

/-- No interior event causally precedes an exterior event. -/
theorem interior_no_future_to_exterior {x y : E}
    (hin : H.interior x = true) (hout : H.exterior y = true) :
    ¬ CausalLe H.C x y := by
  letI := H.decision
  exact hole_no_future_to_exterior H.C H.readout hin hout

/-- A horizon-surface event has a readout-exterior predecessor. -/
theorem surface_has_exterior_predecessor {x : E} (h : H.surface x = true) :
    ∃ y, y ∈ H.C.events ∧ H.exterior y = true ∧ CausalLe H.C y x := by
  letI := H.decision
  exact shroud_has_exterior_predecessor H.C H.readout (by simpa [H.surface_eq_shroud x] using h)

/-- A proof-carrying event on the horizon surface lies in the no-readout interior. -/
theorem event_surface_interior (e : Event H.C) (h : H.onSurfaceEvent e) :
    H.interior e.point = true :=
  surface_interior H h

end EventHorizon

/-- A full causal `Hole` carrier. -/
structure Hole (E : Type) where
  /-- The finite causal substrate on which the hole is computed. -/
  C : CausalSet E
  /-- The settled Boolean causal-order presentation. -/
  decision : CausalLeDecision C
  /-- The readout region whose causal non-reachability defines the interior. -/
  readout : Region E
  /-- The event-level effect relation carried by the hole boundary theory. -/
  effect : E → E → Prop
  /-- Every effect source is supported on the computed shroud. -/
  effect_source_shrouded : ∀ {x y : E}, effect x y →
    (letI := decision; Shroud C readout x = true)

namespace Hole

variable (H : Hole E)

/-- The interior/no-readout region of a `Hole`. -/
def interior : Region E := letI := H.decision; HoleRegion H.C H.readout

/-- The readout exterior of a `Hole`. -/
def exterior : Region E := letI := H.decision; ReadoutExterior H.C H.readout

/-- The shroud of a `Hole`: boundary-side events touching the readout exterior. -/
def shroud : Region E := letI := H.decision; Shroud H.C H.readout

/-- The event horizon carried by a `Hole`. -/
def eventHorizon : EventHorizon E where
  C := H.C
  decision := H.decision
  readout := H.readout
  surface := H.shroud
  surface_eq_shroud := fun _ => rfl

/-- The causal void carried by a `Hole`. -/
def causalVoid : CausalVoid E where
  C := H.C
  decision := H.decision
  readout := H.readout
  interior := H.interior
  exterior := H.exterior
  interior_eq_no_readout := fun _ => rfl
  exterior_eq_readout := fun _ => rfl

/-- The interior of a `Hole` is future-closed. -/
theorem interior_future_closed {x y : E}
    (hx : H.interior x = true) (hxy : CausalLe H.C x y) : H.interior y = true := by
  letI := H.decision
  exact hole_future_closed H.C H.readout hx hxy

/-- The exterior of a `Hole` is past-closed. -/
theorem exterior_past_closed {x y : E}
    (hxy : CausalLe H.C x y) (hy : H.exterior y = true) : H.exterior x = true := by
  letI := H.decision
  exact readoutExterior_past_closed H.C H.readout hxy hy

/-- Shroud events lie inside the hole interior. -/
theorem shroud_in_interior {x : E} (h : H.shroud x = true) : H.interior x = true := by
  letI := H.decision
  exact shroud_in_hole H.C H.readout h

/-- Shroud events are not readout-exterior events. -/
theorem shroud_not_in_exterior {x : E} (h : H.shroud x = true) : H.exterior x = false := by
  letI := H.decision
  exact shroud_not_exterior H.C H.readout h

/-- No hole-interior event causally precedes a readout-exterior event. -/
theorem interior_no_future_to_exterior {x y : E}
    (hin : H.interior x = true) (hout : H.exterior y = true) :
    ¬ CausalLe H.C x y := by
  letI := H.decision
  exact hole_no_future_to_exterior H.C H.readout hin hout

/-- The void carried by a `Hole` has no causal future into its exterior. -/
theorem causalVoid_no_future_to_exterior {x y : E}
    (hin : H.causalVoid.interior x = true) (hout : H.causalVoid.exterior y = true) :
    ¬ CausalLe H.C x y :=
  CausalVoid.no_future_to_exterior H.causalVoid hin hout

/-- Every shroud event has a readout-exterior predecessor. -/
theorem shroud_exterior_predecessor {x : E} (h : H.shroud x = true) :
    ∃ y, y ∈ H.C.events ∧ H.exterior y = true ∧ CausalLe H.C y x := by
  letI := H.decision
  exact shroud_has_exterior_predecessor H.C H.readout h

/-- Every effect source is a shroud event. -/
theorem effect_source_in_shroud {x y : E} (h : H.effect x y) : H.shroud x = true :=
  H.effect_source_shrouded h

/-- Every effect source lies in the no-readout interior. -/
theorem effect_source_interior {x y : E} (h : H.effect x y) : H.interior x = true :=
  H.shroud_in_interior (H.effect_source_in_shroud h)

/-- No effect source lies in the readout exterior. -/
theorem effect_source_not_exterior {x y : E} (h : H.effect x y) :
    H.exterior x = false :=
  H.shroud_not_in_exterior (H.effect_source_in_shroud h)

/-- The canonical shroud-local effect relation: a shroud event acts on adjacent events. -/
def shroudEffect (C : CausalSet E) [CausalLeDecision C] (readout : Region E) (x y : E) : Prop :=
  Shroud C readout x = true ∧ CausalAdjacent C x y = true

/-- Build the canonical causal hole from a causal set and a readout region. -/
def ofReadout (C : CausalSet E) [d : CausalLeDecision C] (readout : Region E) : Hole E where
  C := C
  decision := d
  readout := readout
  effect := shroudEffect C readout
  effect_source_shrouded := fun h => h.1

/-- The canonical effect relation is shroud-local by construction. -/
theorem ofReadout_effect_source_in_shroud
    (C : CausalSet E) [CausalLeDecision C] (readout : Region E) {x y : E}
    (h : (ofReadout C readout).effect x y) :
    (ofReadout C readout).shroud x = true :=
  effect_source_in_shroud (ofReadout C readout) h

/-- The canonical effect relation starts inside the no-readout interior. -/
theorem ofReadout_effect_source_interior
    (C : CausalSet E) [CausalLeDecision C] (readout : Region E) {x y : E}
    (h : (ofReadout C readout).effect x y) :
    (ofReadout C readout).interior x = true :=
  effect_source_interior (ofReadout C readout) h

/-- The canonical effect relation never starts on the readout exterior. -/
theorem ofReadout_effect_source_not_exterior
    (C : CausalSet E) [CausalLeDecision C] (readout : Region E) {x y : E}
    (h : (ofReadout C readout).effect x y) :
    (ofReadout C readout).exterior x = false :=
  effect_source_not_exterior (ofReadout C readout) h

end Hole

/-! ## Alexandrov-topological bridge -/

/-- Read a Boolean finite region as a subset of the causal Alexandrov poset. -/
def asCausalOpenSet (U : Region E) : Obsmetrologia.Alexandrov.Opens (causalPartialOrder C) :=
  Region.asProp U

/-- A future core for a hole region.

The core is a connected no-readout subset that every hole event can still reach.
It is the extra algebraic data missing from connected-readout hypotheses: the
readout anchors the exterior, while this core anchors the hole side. -/
structure HoleFutureCore (readout : Region E) where
  /-- The connected carrier inside the no-readout side. -/
  core : Obsmetrologia.Alexandrov.Opens (causalPartialOrder C)
  /-- The core is connected in the causal Alexandrov topology. -/
  connected : Obsmetrologia.Alexandrov.IsConnected (causalTopology C) core
  /-- Every core point lies in the computed hole region. -/
  subset_hole : ∀ x, core x → HoleRegion C readout x = true
  /-- Every hole point has a causal future anchor in the core. -/
  cofinal : ∀ x, HoleRegion C readout x = true → ∃ k, core k ∧ CausalLe C x k

/-- A single future anchor for the computed hole region. -/
structure HoleFutureAnchor (readout : Region E) where
  /-- The anchor event on the no-readout side. -/
  root : E
  /-- The anchor lies in the computed hole region. -/
  in_hole : HoleRegion C readout root = true
  /-- Every computed hole event causally reaches the anchor. -/
  anchors : ∀ x, HoleRegion C readout x = true → CausalLe C x root

/-- A hole-side settling operation whose settled value is a single future anchor. -/
structure HoleSettlingAnchor (readout : Region E) where
  /-- The settled anchor event. -/
  root : E
  /-- The hole-side settling map. -/
  settle : E → E
  /-- The settled anchor lies in the computed hole region. -/
  root_in_hole : HoleRegion C readout root = true
  /-- Settling moves every hole event forward in the causal order. -/
  causal : ∀ x, HoleRegion C readout x = true → CausalLe C x (settle x)
  /-- Every hole event has the same settled value. -/
  collapses : ∀ x, HoleRegion C readout x = true → settle x = root

/-- Iterate a hole-side step map for a finite number of stages. -/
def iterateStep (step : E → E) : Nat → E → E
  | 0, x => x
  | n + 1, x => step (iterateStep step n x)

/-- A finite settling stage as a carrier, with its ordinal reading available upstream. -/
structure FiniteStage where
  /-- The finite count used for structural induction over local settling. -/
  count : Nat

namespace FiniteStage

/-- The initial finite settling stage. -/
def zero : FiniteStage := ⟨0⟩

/-- The successor finite settling stage. -/
def succ (s : FiniteStage) : FiniteStage := ⟨s.count + 1⟩

/-- Read a finite stage as the corresponding finite ordinal. -/
def ordinal (s : FiniteStage) : Ord := Ord.ofNat s.count

/-- Build a finite-stage carrier from a raw finite count. -/
def ofNat (n : Nat) : FiniteStage := ⟨n⟩

@[simp] theorem zero_count : zero.count = 0 := rfl

@[simp] theorem succ_count (s : FiniteStage) : (succ s).count = s.count + 1 := rfl

@[simp] theorem ofNat_count (n : Nat) : (ofNat n).count = n := rfl

@[simp] theorem ordinal_ofNat (n : Nat) : (ofNat n).ordinal = Ord.ofNat n := rfl

end FiniteStage

/-- Iterating `n + 1` steps is the same as stepping once and then iterating `n` more times. -/
theorem iterateStep_succ_apply (step : E → E) (n : Nat) (x : E) :
    iterateStep step (n + 1) x = iterateStep step n (step x) := by
  induction n with
  | zero => rfl
  | succ n ih =>
      show step (iterateStep step (n + 1) x) = step (iterateStep step n (step x))
      rw [ih]

/-- A finite hole-side step dynamics whose iterates settle to one root. -/
structure HoleStepSettlingAnchor (readout : Region E) where
  /-- The settled anchor event. -/
  root : E
  /-- One local post-hole settling step. -/
  step : E → E
  /-- The finite-stage carrier assigned to an event. -/
  stages : E → FiniteStage
  /-- The settled anchor lies in the computed hole region. -/
  root_in_hole : HoleRegion C readout root = true
  /-- One step keeps hole events inside the computed hole region. -/
  step_in_hole : ∀ x, HoleRegion C readout x = true → HoleRegion C readout (step x) = true
  /-- One step moves hole events forward in the causal order. -/
  causal_step : ∀ x, HoleRegion C readout x = true → CausalLe C x (step x)
  /-- After the assigned finite number of stages, every hole event reaches the common root. -/
  settles_to_root :
    ∀ x, HoleRegion C readout x = true → iterateStep step (stages x).count x = root

/-- A ranked finite local step dynamics whose height decreases to one root. -/
structure HoleRankedStepAnchor (readout : Region E) where
  /-- The settled anchor event. -/
  root : E
  /-- One local post-hole settling step. -/
  step : E → E
  /-- A finite-stage height measuring remaining local settling stages. -/
  height : E → FiniteStage
  /-- The settled anchor lies in the computed hole region. -/
  root_in_hole : HoleRegion C readout root = true
  /-- The root has height zero. -/
  height_root : (height root).count = 0
  /-- Height-zero hole events are the root. -/
  root_of_height_zero : ∀ x, HoleRegion C readout x = true → (height x).count = 0 → x = root
  /-- Hole events remain in the hole after one local step. -/
  step_in_hole :
    ∀ x, HoleRegion C readout x = true → HoleRegion C readout (step x) = true
  /-- Hole events move causally forward after one local step. -/
  causal_step : ∀ x, HoleRegion C readout x = true → CausalLe C x (step x)
  /-- Non-root hole events strictly lower their finite height by one local step. -/
  height_step :
    ∀ x, HoleRegion C readout x = true → x ≠ root →
      (height (step x)).count + 1 = (height x).count

namespace HoleRankedStepAnchor

/-- A positive-height hole event is not the root. -/
theorem ne_root_of_height_succ {readout : Region E} (S : HoleRankedStepAnchor C readout)
    {x : E} {n : Nat} (hheight : (S.height x).count = n + 1) : x ≠ S.root := by
  intro hxr
  rw [hxr, S.height_root] at hheight
  cases hheight

/-- A local ranked step lowers the height from `n + 1` to `n`. -/
theorem height_step_eq_pred {readout : Region E} (S : HoleRankedStepAnchor C readout)
    {x : E} {n : Nat} (hx : HoleRegion C readout x = true)
    (hheight : (S.height x).count = n + 1) : (S.height (S.step x)).count = n := by
  have hneq : x ≠ S.root := HoleRankedStepAnchor.ne_root_of_height_succ C S hheight
  have hstep := S.height_step x hx hneq
  rw [hheight] at hstep
  exact Nat.succ.inj hstep

/-- A ranked local step reaches the root after the event's finite height. -/
theorem iterateStep_height_eq_root {readout : Region E} (S : HoleRankedStepAnchor C readout)
    {x : E} (hx : HoleRegion C readout x = true) :
    iterateStep S.step (S.height x).count x = S.root := by
  generalize hn : (S.height x).count = n
  revert x
  induction n with
  | zero =>
      intro x hx hn
      exact S.root_of_height_zero x hx hn
  | succ n ih =>
      intro x hx hn
      have hneq : x ≠ S.root := HoleRankedStepAnchor.ne_root_of_height_succ C S hn
      rw [iterateStep_succ_apply]
      exact ih (x := S.step x) (S.step_in_hole x hx)
        (HoleRankedStepAnchor.height_step_eq_pred C S hx hn)

/-- A ranked local step carrier induces a finite step settling carrier. -/
def toStepSettlingAnchor {readout : Region E} (S : HoleRankedStepAnchor C readout) :
    HoleStepSettlingAnchor C readout where
  root := S.root
  step := S.step
  stages := S.height
  root_in_hole := S.root_in_hole
  step_in_hole := S.step_in_hole
  causal_step := S.causal_step
  settles_to_root := by
    intro x hx
    exact HoleRankedStepAnchor.iterateStep_height_eq_root C S hx

end HoleRankedStepAnchor

namespace HoleStepSettlingAnchor

/-- Iterated steps keep a hole event inside the computed hole region. -/
theorem iterateStep_in_hole {readout : Region E} (S : HoleStepSettlingAnchor C readout)
    (n : Nat) {x : E} (hx : HoleRegion C readout x = true) :
    HoleRegion C readout (iterateStep S.step n x) = true := by
  induction n with
  | zero => exact hx
  | succ n ih => exact S.step_in_hole (iterateStep S.step n x) ih

/-- Iterated steps move a hole event forward in the causal order. -/
theorem iterateStep_causal {readout : Region E} (S : HoleStepSettlingAnchor C readout)
    (n : Nat) {x : E} (hx : HoleRegion C readout x = true) :
    CausalLe C x (iterateStep S.step n x) := by
  induction n with
  | zero => exact causalLe_refl C x
  | succ n ih =>
      exact causalLe_trans C ih
        (S.causal_step (iterateStep S.step n x)
          (HoleStepSettlingAnchor.iterateStep_in_hole C S n hx))

/-- A finite step settling carrier induces a settling anchor by taking the assigned iterate. -/
def toSettlingAnchor {readout : Region E} (S : HoleStepSettlingAnchor C readout) :
    HoleSettlingAnchor C readout where
  root := S.root
  settle := fun x => iterateStep S.step (S.stages x).count x
  root_in_hole := S.root_in_hole
  causal := fun x hx => HoleStepSettlingAnchor.iterateStep_causal C S (S.stages x).count hx
  collapses := S.settles_to_root

end HoleStepSettlingAnchor

namespace HoleFutureAnchor

/-- A future anchor induces a connected future core, namely its principal future. -/
def toFutureCore {readout : Region E} (A : HoleFutureAnchor C readout) :
    HoleFutureCore C readout where
  core := (causalTopology C).upperSet A.root
  connected := Obsmetrologia.Alexandrov.isConnected_upperSet (causalTopology C) A.root
  subset_hole := fun _ hx => hole_future_closed C readout A.in_hole hx
  cofinal := fun x hx => ⟨A.root, causalLe_refl C A.root, A.anchors x hx⟩

/-- A shroud event lies between a backward exterior predecessor and the hole future anchor. -/
theorem shroud_between_exterior_and_anchor {readout : Region E}
    (A : HoleFutureAnchor C readout) {x : E} (hx : Shroud C readout x = true) :
    ∃ y,
      y ∈ C.events
        ∧ ReadoutExterior C readout y = true
        ∧ CausalLe C y x
        ∧ CausalLe C x A.root := by
  obtain ⟨y, hymem, hyout, hyx⟩ := shroud_has_exterior_predecessor C readout hx
  exact ⟨y, hymem, hyout, hyx, A.anchors x (shroud_in_hole C readout hx)⟩

end HoleFutureAnchor

namespace HoleSettlingAnchor

/-- A settling anchor induces a future anchor by reading its common settled value. -/
def toFutureAnchor {readout : Region E} (S : HoleSettlingAnchor C readout) :
    HoleFutureAnchor C readout where
  root := S.root
  in_hole := S.root_in_hole
  anchors := by
    intro x hx
    exact S.collapses x hx ▸ S.causal x hx

/-- A settling anchor induces the connected future core of its settled root. -/
def toFutureCore {readout : Region E} (S : HoleSettlingAnchor C readout) :
    HoleFutureCore C readout :=
  S.toFutureAnchor.toFutureCore C

/-- A shroud event lies between a backward exterior predecessor and the settled anchor. -/
theorem shroud_between_exterior_and_settled_anchor {readout : Region E}
    (S : HoleSettlingAnchor C readout) {x : E} (hx : Shroud C readout x = true) :
    ∃ y,
      y ∈ C.events
        ∧ ReadoutExterior C readout y = true
        ∧ CausalLe C y x
        ∧ CausalLe C x S.root :=
  S.toFutureAnchor.shroud_between_exterior_and_anchor C hx

end HoleSettlingAnchor

namespace HoleStepSettlingAnchor

/-- A finite step settling carrier induces a future anchor at its settled root. -/
def toFutureAnchor {readout : Region E} (S : HoleStepSettlingAnchor C readout) :
    HoleFutureAnchor C readout :=
  S.toSettlingAnchor.toFutureAnchor C

/-- A finite step settling carrier induces the connected future core of its settled root. -/
def toFutureCore {readout : Region E} (S : HoleStepSettlingAnchor C readout) :
    HoleFutureCore C readout :=
  S.toFutureAnchor.toFutureCore C

/-- A shroud event lies between a backward exterior predecessor and the finite-step settled root. -/
theorem shroud_between_exterior_and_step_settled_anchor {readout : Region E}
    (S : HoleStepSettlingAnchor C readout) {x : E} (hx : Shroud C readout x = true) :
    ∃ y,
      y ∈ C.events
        ∧ ReadoutExterior C readout y = true
        ∧ CausalLe C y x
        ∧ CausalLe C x S.root :=
  S.toSettlingAnchor.shroud_between_exterior_and_settled_anchor C hx

end HoleStepSettlingAnchor

/-- The computed hole region is open in the causal Alexandrov topology. -/
theorem holeRegion_isOpen (readout : Region E) :
    (causalTopology C).IsOpen (asCausalOpenSet C (HoleRegion C readout)) := by
  intro x y hx hxy
  exact hole_future_closed C readout hx hxy

/-- Connectedness of the computed hole region is a separate topological question. -/
def HoleRegionConnected (readout : Region E) : Prop :=
  Obsmetrologia.Alexandrov.IsConnected
    (causalTopology C) (asCausalOpenSet C (HoleRegion C readout))

/-- A hole region is connected when it carries a connected future core. -/
theorem holeRegion_connected_of_futureCore (readout : Region E)
    (K : HoleFutureCore C readout) : HoleRegionConnected C readout := by
  exact Obsmetrologia.Alexandrov.isConnected_of_connected_cofinal_subset
    (causalTopology C)
    (U := asCausalOpenSet C (HoleRegion C readout))
    (K := K.core)
    K.connected
    K.subset_hole
    K.cofinal

/-- A hole region is connected when every hole event reaches a single future anchor. -/
theorem holeRegion_connected_of_futureAnchor (readout : Region E)
    (A : HoleFutureAnchor C readout) : HoleRegionConnected C readout :=
  holeRegion_connected_of_futureCore C readout A.toFutureCore

/-- A hole region is connected when its hole-side settling collapses to one anchor. -/
theorem holeRegion_connected_of_settlingAnchor (readout : Region E)
    (S : HoleSettlingAnchor C readout) : HoleRegionConnected C readout :=
  holeRegion_connected_of_futureAnchor C readout S.toFutureAnchor

/-- A hole region is connected when finite causal step settling reaches one anchor. -/
theorem holeRegion_connected_of_stepSettlingAnchor (readout : Region E)
    (S : HoleStepSettlingAnchor C readout) : HoleRegionConnected C readout :=
  holeRegion_connected_of_settlingAnchor C readout S.toSettlingAnchor

/-- A hole region is connected when a finite ranked local step descends to one anchor. -/
theorem holeRegion_connected_of_rankedStepAnchor (readout : Region E)
    (S : HoleRankedStepAnchor C readout) : HoleRegionConnected C readout :=
  holeRegion_connected_of_stepSettlingAnchor C readout S.toStepSettlingAnchor

/-- A certified general topological region carried by the computed hole region. -/
def HoleRegion.topologicalRegion (readout : Region E)
    (hconn : HoleRegionConnected C readout) :
    Obsmetrologia.Alexandrov.Region (causalTopology C) :=
  ⟨asCausalOpenSet C (HoleRegion C readout), holeRegion_isOpen C readout, hconn⟩

/-- Openness of the readout exterior is not automatic; it must be supplied before it is a region. -/
def ReadoutExteriorOpen (readout : Region E) : Prop :=
  (causalTopology C).IsOpen (asCausalOpenSet C (ReadoutExterior C readout))

/-- Connectedness of the readout exterior is a separate topological question. -/
def ReadoutExteriorConnected (readout : Region E) : Prop :=
  Obsmetrologia.Alexandrov.IsConnected
    (causalTopology C) (asCausalOpenSet C (ReadoutExterior C readout))

/-- A listed connected readout has connected readout exterior. -/
theorem readoutExterior_connected_of_connected_listed_readout (readout : Region E)
    (hlisted : ∀ x, readout x = true → x ∈ C.events)
    (hconn : Obsmetrologia.Alexandrov.IsConnected
      (causalTopology C) (asCausalOpenSet C readout)) :
    ReadoutExteriorConnected C readout := by
  exact Obsmetrologia.Alexandrov.isConnected_of_connected_cofinal_subset
    (causalTopology C)
    (U := asCausalOpenSet C (ReadoutExterior C readout))
    (K := asCausalOpenSet C readout)
    hconn
    (fun x hx => readout_subset_readoutExterior_of_listed C readout (hlisted x hx) hx)
    (fun x hx => by
      obtain ⟨r, _, hr, hxr⟩ := readoutExterior_has_readout_anchor C readout hx
      exact ⟨r, hr, hxr⟩)

/-- A certified general topological region carried by the computed readout exterior. -/
def ReadoutExterior.topologicalRegion (readout : Region E)
    (hopen : ReadoutExteriorOpen C readout)
    (hconn : ReadoutExteriorConnected C readout) :
    Obsmetrologia.Alexandrov.Region (causalTopology C) :=
  ⟨asCausalOpenSet C (ReadoutExterior C readout), hopen, hconn⟩

end CausalSets.BlackHoles
end Obsmetrologia
