import Infomaterial.Relational.Spacetime.Causal.Net

/-!
# Infohole — finite no-readout regions and their shrouds

This module promotes the finite no-readout construction away from black-hole
vocabulary.  The carrier is informational first: given a causal set `C` and a
chosen readout region, an event is in the infohole when no causal path from it
reaches that readout.

The construction is still the causal-order base of a fuller `Infohole` object.
It proves the no-readout closure laws and names the boundary between the
no-readout side and the readout exterior as the `Shroud`.  The bundled carrier
keeps its first effect law modest: every effect starts on that shroud.

## Main definitions

* `ReachesReadout` — an event has a causal path to the readout region.
* `InfoholeRegion` — events that do not reach the readout.
* `ReadoutExterior` — events that do reach the readout.
* `CausalAdjacent` — finite causal adjacency.
* `Shroud` — an infohole event adjacent to the readout exterior.
* `EventHorizon` — a boundary carrier whose surface is the shroud.
* `Infohole` — a carrier bundling the causal substrate, readout boundary, and
  an effect relation whose sources are shrouded.

## Main results

* `infohole_future_closed` — the infohole region is future-closed.
* `readoutExterior_past_closed` — the readout exterior is past-closed.
* `infohole_exterior_disjoint` — no event is both inside and outside.
* `infohole_no_future_to_exterior` — no interior event causally precedes an
  exterior event.
* `shroud_in_infohole` / `shroud_has_exterior_neighbour` — the shroud lies on
  the infohole side and touches the readout exterior.
* `shroud_has_exterior_predecessor` — shroud adjacency is oriented from
  exterior into the shroud.
* `Infohole.interior_future_closed` / `Infohole.effect_source_in_shroud` —
  bundled carrier laws for the full causal infohole object.
* `Infohole.effect_source_interior` / `Infohole.effect_source_not_exterior` —
  the first force-site consequences: effects start inside the no-readout region
  and never on the readout exterior.
-/

namespace Infomaterial
namespace Relational.Spacetime.Boundary.Infohole

open Infomaterial.Relational.Spacetime.Causal.Order
open Infomaterial.Relational.Spacetime.Causal.Cone
open Infomaterial.Relational.Spacetime.Causal.Net

variable {E : Type} (C : CausalSet E)

/-- An event reaches a readout region when it causally precedes some readout event. -/
def ReachesReadout (readout : Region E) (x : E) : Prop :=
  ∃ y, readout y ∧ CausalLe C x y

/-- The infohole region: events that cannot causally reach the chosen readout. -/
def InfoholeRegion (readout : Region E) : Region E :=
  fun x => ¬ ReachesReadout C readout x

/-- The readout exterior: events that do causally reach the chosen readout. -/
def ReadoutExterior (readout : Region E) : Region E :=
  fun x => ReachesReadout C readout x

/-- The infohole region is future-closed: no-readout propagates downstream. -/
theorem infohole_future_closed (readout : Region E) :
    FutureClosedRegion C (InfoholeRegion C readout) := by
  intro x y hx hxy hy
  obtain ⟨r, hr, hyr⟩ := hy
  exact hx ⟨r, hr, causalLe_trans C hxy hyr⟩

/-- The readout exterior is past-closed: if `y` reaches readout and `x <= y`, then `x` does too. -/
theorem readoutExterior_past_closed (readout : Region E) {x y : E}
    (hxy : CausalLe C x y) (hy : ReadoutExterior C readout y) :
    ReadoutExterior C readout x := by
  obtain ⟨r, hr, hyr⟩ := hy
  exact ⟨r, hr, causalLe_trans C hxy hyr⟩

/-- The infohole and the readout exterior are disjoint. -/
theorem infohole_exterior_disjoint (readout : Region E) (x : E) :
    ¬ (InfoholeRegion C readout x ∧ ReadoutExterior C readout x) :=
  fun ⟨hin, hout⟩ => hin hout

/-- No infohole-interior event causally precedes a readout-exterior event. -/
theorem infohole_no_future_to_exterior (readout : Region E) {x y : E}
    (hin : InfoholeRegion C readout x) (hout : ReadoutExterior C readout y) :
    ¬ CausalLe C x y := by
  intro hxy
  exact hin (readoutExterior_past_closed C readout hxy hout)

/-- Two events are causally adjacent when one causally precedes the other. -/
def CausalAdjacent (x y : E) : Prop :=
  CausalLe C x y ∨ CausalLe C y x

/-- The shroud: an infohole event causally adjacent to a readout-exterior event. -/
def Shroud (readout : Region E) (x : E) : Prop :=
  InfoholeRegion C readout x ∧ ∃ y, ReadoutExterior C readout y ∧ CausalAdjacent C x y

/-- A shroud event lies inside the infohole region. -/
theorem shroud_in_infohole (readout : Region E) {x : E}
    (h : Shroud C readout x) : InfoholeRegion C readout x :=
  h.1

/-- A shroud event has a causally adjacent readout-exterior neighbour. -/
theorem shroud_has_exterior_neighbour (readout : Region E) {x : E}
    (h : Shroud C readout x) :
    ∃ y, ReadoutExterior C readout y ∧ CausalAdjacent C x y :=
  h.2

/-- A shroud event is not itself in the readout exterior. -/
theorem shroud_not_exterior (readout : Region E) {x : E}
    (h : Shroud C readout x) : ¬ ReadoutExterior C readout x :=
  fun hout => infohole_exterior_disjoint C readout x ⟨h.1, hout⟩

/-- A shroud event has a readout-exterior predecessor.

Adjacency to the exterior cannot point from the no-readout side outward: that
would make the shroud event reach readout.  Therefore the exterior-adjacent
event causally precedes the shroud event. -/
theorem shroud_has_exterior_predecessor (readout : Region E) {x : E}
    (h : Shroud C readout x) :
    ∃ y, ReadoutExterior C readout y ∧ CausalLe C y x := by
  obtain ⟨y, hyout, hadj⟩ := h.2
  rcases hadj with hxy | hyx
  · exact False.elim ((infohole_no_future_to_exterior C readout h.1 hyout) hxy)
  · exact ⟨y, hyout, hyx⟩

/-- An event-horizon carrier for a finite causal set.

The surface is carried explicitly so downstream constructions can pass a named
boundary object.  The proof field pins that surface to the finite causal
definition already established here: the shroud, i.e. interior events adjacent
to the readout exterior. -/
structure EventHorizon (E : Type) where
  /-- The finite causal substrate whose boundary is being considered. -/
  C : CausalSet E
  /-- The readout region playing the finite role of the external readout/future boundary. -/
  readout : Region E
  /-- The named horizon surface. -/
  surface : Region E
  /-- The surface is exactly the shroud determined by `C` and `readout`. -/
  surface_iff_shroud : ∀ x, surface x ↔ Shroud C readout x

namespace EventHorizon

variable (H : EventHorizon E)

/-- Build the canonical event horizon from a causal set and readout region. -/
def ofReadout (C : CausalSet E) (readout : Region E) : EventHorizon E where
  C := C
  readout := readout
  surface := Shroud C readout
  surface_iff_shroud := fun _ => Iff.rfl

/-- The no-readout interior bounded by an event horizon. -/
def interior : Region E := InfoholeRegion H.C H.readout

/-- The readout exterior of an event horizon. -/
def exterior : Region E := ReadoutExterior H.C H.readout

/-- A proof-carrying event lies on the horizon surface when its point lies on that surface. -/
def onSurfaceEvent (e : Event H.C) : Prop := H.surface e.point

/-- The horizon surface is exactly the shroud. -/
theorem surface_iff_shroud_at {x : E} : H.surface x ↔ Shroud H.C H.readout x :=
  H.surface_iff_shroud x

/-- Horizon-surface points lie inside the no-readout interior. -/
theorem surface_interior {x : E} (h : H.surface x) : H.interior x :=
  shroud_in_infohole H.C H.readout ((surface_iff_shroud_at H).mp h)

/-- Horizon-surface points are not in the readout exterior. -/
theorem surface_not_exterior {x : E} (h : H.surface x) : ¬ H.exterior x :=
  shroud_not_exterior H.C H.readout ((surface_iff_shroud_at H).mp h)

/-- The horizon interior is future-closed. -/
theorem interior_future_closed : FutureClosedRegion H.C H.interior :=
  infohole_future_closed H.C H.readout

/-- The horizon exterior is past-closed. -/
theorem exterior_past_closed {x y : E}
    (hxy : CausalLe H.C x y) (hy : H.exterior y) : H.exterior x :=
  readoutExterior_past_closed H.C H.readout hxy hy

/-- No interior event causally precedes an exterior event. -/
theorem interior_no_future_to_exterior {x y : E}
    (hin : H.interior x) (hout : H.exterior y) :
    ¬ CausalLe H.C x y :=
  infohole_no_future_to_exterior H.C H.readout hin hout

/-- A horizon-surface event has a readout-exterior predecessor. -/
theorem surface_has_exterior_predecessor {x : E} (h : H.surface x) :
    ∃ y, H.exterior y ∧ CausalLe H.C y x :=
  shroud_has_exterior_predecessor H.C H.readout ((surface_iff_shroud_at H).mp h)

/-- A proof-carrying event on the horizon surface lies in the no-readout interior. -/
theorem event_surface_interior (e : Event H.C) (h : H.onSurfaceEvent e) :
    H.interior e.point :=
  surface_interior H h

end EventHorizon

/-- A full causal `Infohole` carrier.

The carrier keeps the finite no-readout construction as generated data rather
than analogy.  It packages:

* a causal set `C`;
* a readout region;
* an effect relation on events;
* a support law saying every effect starts on the shroud.

The descent obstruction, persistence across richer flows, and quantitative
color/entropy laws can refine this carrier later.  This is the first Lean object
that already knows its interior, exterior, shroud, and effect boundary. -/
structure Infohole (E : Type) where
  /-- The finite causal substrate on which the infohole is computed. -/
  C : CausalSet E
  /-- The readout region whose causal non-reachability defines the interior. -/
  readout : Region E
  /-- The event-level effect relation carried by the infohole boundary theory. -/
  effect : E → E → Prop
  /-- Every effect source is supported on the shroud. -/
  effect_source_shrouded : ∀ {x y : E}, effect x y → Shroud C readout x

namespace Infohole

variable (H : Infohole E)

/-- The interior/no-readout region of an `Infohole`. -/
def interior : Region E := InfoholeRegion H.C H.readout

/-- The readout exterior of an `Infohole`. -/
def exterior : Region E := ReadoutExterior H.C H.readout

/-- The shroud of an `Infohole`: the boundary-side events touching the readout exterior. -/
def shroud : Region E := Shroud H.C H.readout

/-- The event horizon carried by an `Infohole`. -/
def eventHorizon : EventHorizon E where
  C := H.C
  readout := H.readout
  surface := H.shroud
  surface_iff_shroud := fun _ => Iff.rfl

/-- The interior of an `Infohole` is future-closed. -/
theorem interior_future_closed : FutureClosedRegion H.C H.interior :=
  infohole_future_closed H.C H.readout

/-- The exterior of an `Infohole` is past-closed. -/
theorem exterior_past_closed {x y : E}
    (hxy : CausalLe H.C x y) (hy : H.exterior y) : H.exterior x :=
  readoutExterior_past_closed H.C H.readout hxy hy

/-- Shroud events lie inside the infohole interior. -/
theorem shroud_in_interior {x : E} (h : H.shroud x) : H.interior x :=
  shroud_in_infohole H.C H.readout h

/-- Shroud events are not readout-exterior events. -/
theorem shroud_not_in_exterior {x : E} (h : H.shroud x) : ¬ H.exterior x :=
  fun hout => infohole_exterior_disjoint H.C H.readout x ⟨h.1, hout⟩

/-- No infohole-interior event causally precedes a readout-exterior event. -/
theorem interior_no_future_to_exterior {x y : E}
    (hin : H.interior x) (hout : H.exterior y) :
    ¬ CausalLe H.C x y :=
  infohole_no_future_to_exterior H.C H.readout hin hout

/-- Every shroud event has a readout-exterior predecessor. -/
theorem shroud_exterior_predecessor {x : E} (h : H.shroud x) :
    ∃ y, H.exterior y ∧ CausalLe H.C y x :=
  shroud_has_exterior_predecessor H.C H.readout h

/-- Every effect source is a shroud event. -/
theorem effect_source_in_shroud {x y : E} (h : H.effect x y) : H.shroud x :=
  H.effect_source_shrouded h

/-- Every effect source lies in the no-readout interior. -/
theorem effect_source_interior {x y : E} (h : H.effect x y) : H.interior x :=
  H.shroud_in_interior (H.effect_source_in_shroud h)

/-- No effect source lies in the readout exterior. -/
theorem effect_source_not_exterior {x y : E} (h : H.effect x y) :
    ¬ H.exterior x :=
  H.shroud_not_in_exterior (H.effect_source_in_shroud h)

/-- The canonical shroud-local effect relation: a shroud event acts on causally adjacent events. -/
def shroudEffect (C : CausalSet E) (readout : Region E) (x y : E) : Prop :=
  Shroud C readout x ∧ CausalAdjacent C x y

/-- Build the canonical causal infohole from a causal set and a readout region. -/
def ofReadout (C : CausalSet E) (readout : Region E) : Infohole E where
  C := C
  readout := readout
  effect := shroudEffect C readout
  effect_source_shrouded := fun h => h.1

/-- The canonical effect relation is shroud-local by construction. -/
theorem ofReadout_effect_source_in_shroud
    (C : CausalSet E) (readout : Region E) {x y : E}
    (h : (ofReadout C readout).effect x y) :
    (ofReadout C readout).shroud x :=
  effect_source_in_shroud (ofReadout C readout) h

/-- The canonical effect relation starts inside the no-readout interior. -/
theorem ofReadout_effect_source_interior
    (C : CausalSet E) (readout : Region E) {x y : E}
    (h : (ofReadout C readout).effect x y) :
    (ofReadout C readout).interior x :=
  effect_source_interior (ofReadout C readout) h

/-- The canonical effect relation never starts on the readout exterior. -/
theorem ofReadout_effect_source_not_exterior
    (C : CausalSet E) (readout : Region E) {x y : E}
    (h : (ofReadout C readout).effect x y) :
    ¬ (ofReadout C readout).exterior x :=
  effect_source_not_exterior (ofReadout C readout) h

end Infohole

end Relational.Spacetime.Boundary.Infohole
end Infomaterial
