import Obsmetrologia.CausalSets.BlackHoles.ArticulationDiamond
import Obsmetrologia.CausalSets.BlackHoles.PostHoleTile
import Obsmetrologia.AperiodicOrder.MaterialSectors.Contact.ShroudIndexedKeratin
import Obsmetrologia.KineticTheory.Gas.MolecularChaosGluing
import Obsmetrologia.DenseMatter.Quark
import Obsmetrologia.Dynamics.Flow.FreeEnergyLyapunov
import Obsmetrologia.Thermodynamics.Temperature
import Obsmetrologia.QuantumContextuality.FockCondensate

/-!
# Horizon frontier carriers

This module names the finite, readout-relative horizon projections that are
already defined by the hole/shroud development.  The names are external-physics
search aids; the theorems below only assert local causal-set and shroud-indexed
keratin laws.
-/

namespace Obsmetrologia
namespace CausalSets.BlackHoles.Horizon

open CausalSets.Causal.Order
open CausalSets.Causal.Cone
open CausalSets.Causal.Alexandrov
open CausalSets.BlackHoles
open AperiodicOrder.MaterialSectors.Contact
open KineticTheory.Gas
open QuantumContextuality
open Probability.Stochastic

variable {E : Type} (C : CausalSet E) [CausalLeDecision C]

/-! ## Readout-relative black-hole region -/

/-- The finite black-hole-region proxy is exactly the no-readout hole region:
events outside the causal past of the chosen readout. -/
abbrev BlackHoleRegion (readout : Region E) : Region E :=
  HoleRegion C readout

/-- The black-hole-region proxy is future closed. -/
theorem blackHole_future_closed (readout : Region E) {x y : E}
    (hx : BlackHoleRegion C readout x = true) (hxy : CausalLe C x y) :
    BlackHoleRegion C readout y = true :=
  hole_future_closed C readout hx hxy

/-! ## Apparent events and readout horizons -/

/-- A finite apparent event is a shroud event: an immediately visible
hole-side boundary point for the current readout, not a continuum apparent
horizon or trapped surface. -/
structure ApparentEvent (readout : Region E) where
  /-- The underlying finite causal-set event. -/
  point : E
  /-- Evidence that the event is on the shroud for the chosen readout. -/
  on_shroud : Shroud C readout point = true

/-- Apparent events lie in the finite black-hole-region proxy. -/
theorem ApparentEvent.in_blackHoleRegion {readout : Region E}
    (a : ApparentEvent C readout) :
    BlackHoleRegion C readout a.point = true :=
  shroud_in_hole C readout a.on_shroud

/-- Apparent events are not in the readout exterior. -/
theorem ApparentEvent.not_exterior {readout : Region E}
    (a : ApparentEvent C readout) :
    ReadoutExterior C readout a.point = false :=
  shroud_not_exterior C readout a.on_shroud

/-- Apparent events have an exterior predecessor at the finite causal
interface. -/
theorem ApparentEvent.has_exterior_predecessor {readout : Region E}
    (a : ApparentEvent C readout) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧
      CausalLe C y a.point :=
  shroud_has_exterior_predecessor C readout a.on_shroud

/-- A readout-relative horizon is the event-horizon package generated from the
same finite readout.  This is the Rindler-style lesson carried locally:
changing readout changes the horizon package. -/
abbrev ReadoutRelativeHorizon (readout : Region E) : EventHorizon E :=
  EventHorizon.ofReadout C readout

/-- The surface of a readout-relative horizon lies in its interior. -/
theorem readoutRelativeHorizon_surface_interior (readout : Region E) {x : E}
    (hx : (ReadoutRelativeHorizon C readout).surface x = true) :
    (ReadoutRelativeHorizon C readout).interior x = true :=
  EventHorizon.surface_interior (ReadoutRelativeHorizon C readout) hx

/-- The surface of a readout-relative horizon is definitionally the shroud
computed from that readout. -/
theorem readoutRelativeHorizon_surface_eq_shroud (readout : Region E) (x : E) :
    (ReadoutRelativeHorizon C readout).surface x = Shroud C readout x :=
  rfl

/-- The interior of a readout-relative horizon is exactly the finite
black-hole-region proxy for that readout. -/
theorem readoutRelativeHorizon_interior_eq_blackHoleRegion
    (readout : Region E) (x : E) :
    (ReadoutRelativeHorizon C readout).interior x =
      BlackHoleRegion C readout x :=
  rfl

/-- The exterior of a readout-relative horizon is exactly the readout
exterior. -/
theorem readoutRelativeHorizon_exterior_eq_readoutExterior
    (readout : Region E) (x : E) :
    (ReadoutRelativeHorizon C readout).exterior x =
      ReadoutExterior C readout x :=
  rfl

/-- A surface point of a readout-relative horizon is not in its readout
exterior. -/
theorem readoutRelativeHorizon_surface_not_exterior
    (readout : Region E) {x : E}
    (hx : (ReadoutRelativeHorizon C readout).surface x = true) :
    (ReadoutRelativeHorizon C readout).exterior x = false :=
  EventHorizon.surface_not_exterior (ReadoutRelativeHorizon C readout) hx

/-- A surface point of a readout-relative horizon has a readout-exterior
predecessor at the finite shroud interface. -/
theorem readoutRelativeHorizon_surface_has_exterior_predecessor
    (readout : Region E) {x : E}
    (hx : (ReadoutRelativeHorizon C readout).surface x = true) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧
      CausalLe C y x :=
  EventHorizon.surface_has_exterior_predecessor
    (ReadoutRelativeHorizon C readout) hx

/-! ## Finite SO readout frames -/

/-- A finite SO readout frame is the finite orientation-frame proxy available
at the readout horizon: a readout-generated horizon together with a finite
gauge group, connection, local transform, class function, and closed loop.  The
name is only a search bridge to SO-style frame language; no Lie group,
determinant, smooth frame bundle, or metric structure is asserted. -/
structure FiniteSOReadoutFrame (readout : Region E) where
  /-- The finite group used as the orientation-frame proxy. -/
  orientationGroup : DenseMatter.Quark.FiniteGroup
  /-- A finite connection over causal-set events. -/
  connection : DenseMatter.Quark.GaugeField orientationGroup E
  /-- A local finite gauge/frame transform. -/
  transform : DenseMatter.Quark.GaugeTransform orientationGroup E
  /-- A class function used as the finite Wilson-loop observable. -/
  observable : DenseMatter.Quark.ClassFunction orientationGroup
  /-- The closed-loop base event. -/
  base : E
  /-- The finite listed loop from the base event. -/
  loop : List E
  /-- The listed path closes back at the base event. -/
  closed_loop : DenseMatter.Quark.lastOf base loop = base

namespace FiniteSOReadoutFrame

/-- The readout frame's horizon surface is still exactly the shroud computed
from the readout. -/
theorem horizon_surface_eq_shroud {readout : Region E}
    (_F : FiniteSOReadoutFrame readout) (x : E) :
    (ReadoutRelativeHorizon C readout).surface x = Shroud C readout x :=
  readoutRelativeHorizon_surface_eq_shroud C readout x

/-- The readout frame's horizon interior is still the finite
black-hole-region proxy computed from the readout. -/
theorem horizon_interior_eq_blackHoleRegion {readout : Region E}
    (_F : FiniteSOReadoutFrame readout) (x : E) :
    (ReadoutRelativeHorizon C readout).interior x =
      BlackHoleRegion C readout x :=
  readoutRelativeHorizon_interior_eq_blackHoleRegion C readout x

/-- The readout frame's horizon exterior is still the readout exterior
computed from the same readout. -/
theorem horizon_exterior_eq_readoutExterior {readout : Region E}
    (_F : FiniteSOReadoutFrame readout) (x : E) :
    (ReadoutRelativeHorizon C readout).exterior x =
      ReadoutExterior C readout x :=
  readoutRelativeHorizon_exterior_eq_readoutExterior C readout x

/-- A closed loop in a finite SO readout frame transforms by conjugating its
holonomy at the base event. -/
theorem closedLoop_holonomy_conjugates {readout : Region E}
    (F : FiniteSOReadoutFrame readout) :
    DenseMatter.Quark.holo F.orientationGroup
        (DenseMatter.Quark.transformEdge F.orientationGroup F.connection F.transform)
        F.base F.loop =
      F.orientationGroup.mul (F.transform F.base)
        (F.orientationGroup.mul
          (DenseMatter.Quark.holo F.orientationGroup F.connection F.base F.loop)
          (F.orientationGroup.inv (F.transform F.base))) :=
  DenseMatter.Quark.closedLoop_holonomy_conjugates F.orientationGroup F.connection
    F.transform F.base F.loop F.closed_loop

/-- The finite Wilson-loop readout of a finite SO frame is invariant under
the retained local frame transform. -/
theorem wilsonLoop_invariant {readout : Region E}
    (F : FiniteSOReadoutFrame readout) :
    F.observable.f
        (DenseMatter.Quark.holo F.orientationGroup
          (DenseMatter.Quark.transformEdge F.orientationGroup F.connection F.transform)
          F.base F.loop) =
      F.observable.f
        (DenseMatter.Quark.holo F.orientationGroup F.connection F.base F.loop) :=
  DenseMatter.Quark.wilsonLoop_invariant F.orientationGroup F.connection F.transform
    F.observable F.base F.loop F.closed_loop

end FiniteSOReadoutFrame

/-! ## Antiholes and readout complementarity -/

/-- An event is reached from a readout region when a listed readout event is in
its causal past. -/
def ReachedFromReadout (readout : Region E) (x : E) : Bool :=
  C.events.any (fun y => readout y && CausalLeBool C y x)

/-- The readout future is the causal future of the chosen readout region. -/
def ReadoutFuture (readout : Region E) : Region E :=
  fun x => ReachedFromReadout C readout x

/-- The finite antihole region is the no-ingress side: events not reached from
the chosen readout. -/
def AntiholeRegion (readout : Region E) : Region E :=
  fun x => !(ReachedFromReadout C readout x)

/-- A listed readout point lies in the readout future. -/
theorem readout_subset_readoutFuture_of_listed (readout : Region E) {x : E}
    (hxmem : x ∈ C.events) (hx : readout x = true) :
    ReadoutFuture C readout x = true := by
  unfold ReadoutFuture ReachedFromReadout
  rw [List.any_eq_true]
  refine ⟨x, hxmem, ?_⟩
  rw [Bool.and_eq_true]
  refine ⟨hx, ?_⟩
  rw [causalLeBool_eq_true_iff]
  exact causalLe_refl C x

/-- Every readout-future point has a listed readout ancestor. -/
theorem readoutFuture_has_readout_anchor (readout : Region E) {x : E}
    (hx : ReadoutFuture C readout x = true) :
    ∃ r, r ∈ C.events ∧ readout r = true ∧ CausalLe C r x := by
  unfold ReadoutFuture ReachedFromReadout at hx
  rw [List.any_eq_true] at hx
  obtain ⟨r, hrmem, hr⟩ := hx
  rw [Bool.and_eq_true] at hr
  exact ⟨r, hrmem, hr.1, (causalLeBool_eq_true_iff C r x).mp hr.2⟩

/-- The readout future is future-closed. -/
theorem readoutFuture_future_closed (readout : Region E) {x y : E}
    (hx : ReadoutFuture C readout x = true) (hxy : CausalLe C x y) :
    ReadoutFuture C readout y = true := by
  unfold ReadoutFuture ReachedFromReadout at hx ⊢
  rw [List.any_eq_true] at hx ⊢
  obtain ⟨r, hrmem, hrx⟩ := hx
  rw [Bool.and_eq_true] at hrx
  refine ⟨r, hrmem, ?_⟩
  rw [Bool.and_eq_true]
  refine ⟨hrx.1, ?_⟩
  rw [causalLeBool_eq_true_iff]
  exact causalLe_trans C ((causalLeBool_eq_true_iff C r x).mp hrx.2) hxy

/-- The antihole region is past-closed. -/
theorem antihole_past_closed (readout : Region E) {x y : E}
    (hy : AntiholeRegion C readout y = true) (hxy : CausalLe C x y) :
    AntiholeRegion C readout x = true := by
  unfold AntiholeRegion
  cases hx : ReadoutFuture C readout x
  · unfold ReadoutFuture at hx
    rw [hx]
    rfl
  · have hyFuture : ReadoutFuture C readout y = true :=
      readoutFuture_future_closed C readout hx hxy
    unfold AntiholeRegion at hy
    unfold ReadoutFuture at hyFuture
    rw [hyFuture] at hy
    cases hy

/-- The antihole and the readout future are disjoint. -/
theorem antihole_readoutFuture_disjoint (readout : Region E) (x : E) :
    ¬ (AntiholeRegion C readout x = true ∧ ReadoutFuture C readout x = true) := by
  intro h
  unfold AntiholeRegion ReadoutFuture at h
  rw [h.2] at h
  cases h.1

/-- No readout-future event causally precedes an antihole event. -/
theorem antihole_no_ingress_from_readoutFuture (readout : Region E) {x y : E}
    (hx : AntiholeRegion C readout x = true) (hy : ReadoutFuture C readout y = true) :
    ¬ CausalLe C y x := by
  intro hyx
  exact antihole_readoutFuture_disjoint C readout x
    ⟨hx, readoutFuture_future_closed C readout hy hyx⟩

/-- No listed readout anchor can causally enter an antihole event. -/
theorem antihole_no_listed_readout_ingress (readout : Region E) {x r : E}
    (hx : AntiholeRegion C readout x = true) (hrmem : r ∈ C.events)
    (hr : readout r = true) :
    ¬ CausalLe C r x :=
  antihole_no_ingress_from_readoutFuture C readout hx
    (readout_subset_readoutFuture_of_listed C readout hrmem hr)

/-- A listed readout point is not itself an antihole point. -/
theorem listed_readout_not_antihole (readout : Region E) {x : E}
    (hxmem : x ∈ C.events) (hx : readout x = true) :
    AntiholeRegion C readout x = false := by
  have hFuture := readout_subset_readoutFuture_of_listed C readout hxmem hx
  cases hAnti : AntiholeRegion C readout x
  · rfl
  · exact False.elim
      (antihole_readoutFuture_disjoint C readout x ⟨hAnti, hFuture⟩)

/-- The antihole shroud is an antihole event causally adjacent to the readout
future. -/
def AntiholeShroud (readout : Region E) (x : E) : Bool :=
  AntiholeRegion C readout x &&
    C.events.any (fun y => ReadoutFuture C readout y && CausalAdjacent C x y)

/-- An antihole-shroud event lies inside the antihole region. -/
theorem antiholeShroud_in_antihole (readout : Region E) {x : E}
    (h : AntiholeShroud C readout x = true) :
    AntiholeRegion C readout x = true := by
  unfold AntiholeShroud at h
  rw [Bool.and_eq_true] at h
  exact h.1

/-- An antihole-shroud event has a listed causally adjacent readout-future
neighbour. -/
theorem antiholeShroud_has_readoutFuture_neighbour (readout : Region E) {x : E}
    (h : AntiholeShroud C readout x = true) :
    ∃ y, y ∈ C.events ∧ ReadoutFuture C readout y = true ∧
      CausalAdjacent C x y = true := by
  unfold AntiholeShroud at h
  rw [Bool.and_eq_true] at h
  have hany := h.2
  rw [List.any_eq_true] at hany
  obtain ⟨y, hymem, hy⟩ := hany
  rw [Bool.and_eq_true] at hy
  exact ⟨y, hymem, hy.1, hy.2⟩

/-- An antihole-shroud event is not itself in the readout future. -/
theorem antiholeShroud_not_readoutFuture (readout : Region E) {x : E}
    (h : AntiholeShroud C readout x = true) :
    ReadoutFuture C readout x = false := by
  cases hx : ReadoutFuture C readout x
  · rfl
  · exact False.elim
      (antihole_readoutFuture_disjoint C readout x
        ⟨antiholeShroud_in_antihole C readout h, hx⟩)

/-- An antihole-shroud event has a readout-future successor.

Adjacency to the readout future cannot point into the antihole: that would make
the antihole event reachable from readout. -/
theorem antiholeShroud_has_readoutFuture_successor (readout : Region E) {x : E}
    (h : AntiholeShroud C readout x = true) :
    ∃ y, y ∈ C.events ∧ ReadoutFuture C readout y = true ∧ CausalLe C x y := by
  obtain ⟨y, hymem, hyFuture, hadj⟩ :=
    antiholeShroud_has_readoutFuture_neighbour C readout h
  rcases (causalAdjacent_eq_true_iff C x y).mp hadj with hxy | hyx
  · exact ⟨y, hymem, hyFuture, hxy⟩
  · exact False.elim
      ((antihole_no_ingress_from_readoutFuture C readout
        (antiholeShroud_in_antihole C readout h) hyFuture) hyx)

/-- A finite readout-complementarity witness: one event is a hole for the left
readout and exterior for the right readout. -/
structure ReadoutComplementarityWitness (left right : Region E) where
  /-- The event on which the two readouts disagree. -/
  point : E
  /-- The left readout classifies the point as inside the black-hole-region
  proxy. -/
  left_hole : BlackHoleRegion C left point = true
  /-- The right readout classifies the same point as exterior. -/
  right_exterior : ReadoutExterior C right point = true

/-- A complementarity witness cannot come from one single readout. -/
theorem ReadoutComplementarityWitness.not_single_readout {left right : Region E}
    (W : ReadoutComplementarityWitness C left right) :
    left ≠ right := by
  intro h
  cases h
  exact hole_exterior_disjoint C left W.point
    ⟨W.left_hole, W.right_exterior⟩

namespace ReadoutComplementarityWitness

/-- The left readout cannot also classify the witnessed event as exterior. -/
theorem left_not_exterior {left right : Region E}
    (W : ReadoutComplementarityWitness C left right) :
    ReadoutExterior C left W.point = false := by
  have hnot : ¬ ReadoutExterior C left W.point = true := by
    intro hleftExterior
    exact hole_exterior_disjoint C left W.point
      ⟨W.left_hole, hleftExterior⟩
  cases h : ReadoutExterior C left W.point
  · rfl
  · exact False.elim (hnot h)

/-- The right readout cannot also classify the witnessed event as inside the
black-hole-region proxy. -/
theorem right_not_blackHoleRegion {left right : Region E}
    (W : ReadoutComplementarityWitness C left right) :
    BlackHoleRegion C right W.point = false := by
  have hnot : ¬ BlackHoleRegion C right W.point = true := by
    intro hrightHole
    exact hole_exterior_disjoint C right W.point
      ⟨hrightHole, W.right_exterior⟩
  cases h : BlackHoleRegion C right W.point
  · rfl
  · exact False.elim (hnot h)

/-- At the witnessed event, the two readouts cannot share one common
hole/exterior classification pair. -/
theorem no_common_classification {left right : Region E}
    (W : ReadoutComplementarityWitness C left right) :
    ¬ (BlackHoleRegion C left W.point = BlackHoleRegion C right W.point ∧
      ReadoutExterior C left W.point = ReadoutExterior C right W.point) := by
  intro hsame
  have hrightHole : BlackHoleRegion C right W.point = true := by
    rw [← hsame.1]
    exact W.left_hole
  exact hole_exterior_disjoint C right W.point
    ⟨hrightHole, W.right_exterior⟩

end ReadoutComplementarityWitness

/-! ## Finite wormhole bridge -/

/-- A finite wormhole bridge witness is a causal adjacency equipped with a
nonzero connected-correlation minor.  It is a bridge witness, not a smooth
throat geometry. -/
structure FiniteWormholeBridge {V : Type} (J : Joint V) where
  /-- The left event of the finite bridge. -/
  left : E
  /-- The right event of the finite bridge. -/
  right : E
  /-- The bridge endpoints are causally adjacent in the finite carrier. -/
  adjacent : CausalAdjacent C left right = true
  /-- First row index used by the connected-correlation minor. -/
  row₀ : V
  /-- Second row index used by the connected-correlation minor. -/
  row₁ : V
  /-- First column index used by the connected-correlation minor. -/
  col₀ : V
  /-- Second column index used by the connected-correlation minor. -/
  col₁ : V
  /-- The connected-correlation minor is nonzero. -/
  correlated : corr J row₀ row₁ col₀ col₁ ≠ 0

namespace FiniteWormholeBridge

/-- The bridge endpoints form a causal edge in one direction. -/
theorem causal_bridge {V : Type} {J : Joint V} (W : FiniteWormholeBridge C J) :
    CausalLe C W.left W.right ∨ CausalLe C W.right W.left :=
  (causalAdjacent_eq_true_iff C W.left W.right).mp W.adjacent

/-- A finite wormhole bridge cannot be molecular-chaos factorized. -/
theorem not_factorizes {V : Type} {J : Joint V} (W : FiniteWormholeBridge C J) :
    ¬ Factorizes J := by
  intro h
  have hdecor := factorizes_imp_decorrelated J h W.row₀ W.row₁ W.col₀ W.col₁
  exact W.correlated hdecor

end FiniteWormholeBridge

/-- The EPR joint supplies a finite wormhole bridge whenever the causal carrier
supplies an adjacent endpoint pair. -/
def eprFiniteWormholeBridge {x y : E} (hxy : CausalAdjacent C x y = true) :
    FiniteWormholeBridge C eprJoint where
  left := x
  right := y
  adjacent := hxy
  row₀ := 0
  row₁ := 1
  col₀ := 0
  col₁ := 1
  correlated := by
    rw [epr_corr_one]
    decide

/-! ## Finite geon carrier -/

/-- A finite geon carrier is a hole-side finite settling process whose stages
reach one common no-readout root.  This is a self-sustaining finite
hole-region carrier, not a continuum mass-without-mass geometry. -/
structure FiniteGeonCarrier (readout : Region E) where
  /-- The finite local settling process carried by the hole side. -/
  settling : HoleStepSettlingAnchor C readout

namespace FiniteGeonCarrier

/-- The settled root is inside the finite black-hole-region proxy. -/
theorem root_in_blackHoleRegion {readout : Region E}
    (G : FiniteGeonCarrier C readout) :
    BlackHoleRegion C readout G.settling.root = true :=
  G.settling.root_in_hole

/-- A finite geon carrier induces a single future anchor at its settled root. -/
def futureAnchor {readout : Region E} (G : FiniteGeonCarrier C readout) :
    HoleFutureAnchor C readout :=
  G.settling.toFutureAnchor C

/-- A finite geon carrier induces the connected future core of its settled
root. -/
def futureCore {readout : Region E} (G : FiniteGeonCarrier C readout) :
    HoleFutureCore C readout :=
  G.settling.toFutureCore C

/-- The computed hole region carried by a finite geon carrier is connected. -/
theorem connected_region {readout : Region E}
    (G : FiniteGeonCarrier C readout) :
    HoleRegionConnected C readout :=
  holeRegion_connected_of_stepSettlingAnchor C readout G.settling

/-- A finite geon carrier presents the computed hole side as an Alexandrov
topological region. -/
def topologicalRegion {readout : Region E}
    (G : FiniteGeonCarrier C readout) :
    Obsmetrologia.Alexandrov.Region (causalTopology C) :=
  HoleRegion.topologicalRegion C readout (FiniteGeonCarrier.connected_region C G)

/-- Every shroud event of a finite geon lies between an exterior predecessor
and the settled root. -/
theorem shroud_between_exterior_and_root {readout : Region E}
    (G : FiniteGeonCarrier C readout) {x : E}
    (hx : Shroud C readout x = true) :
    ∃ y,
      y ∈ C.events
        ∧ ReadoutExterior C readout y = true
        ∧ CausalLe C y x
        ∧ CausalLe C x G.settling.root :=
  G.settling.shroud_between_exterior_and_step_settled_anchor C hx

end FiniteGeonCarrier

/-! ## Finite ergosphere extraction -/

/-- A finite ergosphere extraction witness is a shroud-side boundary event
paired with one hard-closure settling firing whose free energy strictly
drops.  It is not a rotating continuum ergosphere. -/
structure FiniteErgosphereExtraction (readout : Region E) where
  /-- The finite apparent boundary event where extraction is read. -/
  boundary : ApparentEvent C readout
  /-- The hard-closure dynamics supplying the energy functional. -/
  closure : Reading.Closure
  /-- The seed valuation for the finite settling orbit. -/
  seed : Valuation
  /-- The finite support over which free energy is measured. -/
  cells : List PredicationCell
  /-- The finite step at which the support cell fires. -/
  stage : Nat
  /-- The support cell that changes across the settling step. -/
  cell : PredicationCell
  /-- The firing cell belongs to the finite support. -/
  cell_mem : cell ∈ cells
  /-- The support cell changes across `stage → stage + 1`. -/
  fires :
    Valuation.fenOrbit closure seed stage cell ≠
      Valuation.fenOrbit closure seed (stage + 1) cell

namespace FiniteErgosphereExtraction

/-- The boundary point of a finite ergosphere extraction lies on the finite
black-hole-region proxy. -/
theorem boundary_in_blackHoleRegion {readout : Region E}
    (X : FiniteErgosphereExtraction C readout) :
    BlackHoleRegion C readout X.boundary.point = true :=
  X.boundary.in_blackHoleRegion C

/-- The boundary point of a finite ergosphere extraction has an exterior
predecessor at the shroud interface. -/
theorem has_exterior_predecessor {readout : Region E}
    (X : FiniteErgosphereExtraction C readout) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧
      CausalLe C y X.boundary.point :=
  X.boundary.has_exterior_predecessor C

/-- The finite extractable-work law: the Nat-valued free energy strictly
drops across the recorded firing. -/
theorem strict_energy_drop {readout : Region E}
    (X : FiniteErgosphereExtraction C readout) :
    Valuation.freeEnergy X.closure X.seed X.cells (X.stage + 1) <
      Valuation.freeEnergy X.closure X.seed X.cells X.stage :=
  Valuation.freeEnergy_strict_of_fires X.closure X.seed X.cells X.stage
    X.cell X.cell_mem X.fires

end FiniteErgosphereExtraction

/-! ## Finite Unruh readout -/

/-- A finite Unruh readout witness is a readout-relative apparent boundary
event equipped with a finite C4 ledger and its generated Fock sector.  This is
particle-number readout only, not a thermal-bath theorem. -/
structure FiniteUnruhReadoutWitness (readout : Region E) (Mode : Type) where
  /-- The apparent boundary event where the particle readout is taken. -/
  boundary : ApparentEvent C readout
  /-- The finite creation/annihilation ledger. -/
  ledger : C4Ledger
  /-- The occupation assignment for the generated finite Fock sector. -/
  occupation : Fin ledger.particleNumber → Mode

namespace FiniteUnruhReadoutWitness

/-- The boundary point of a finite Unruh readout lies in the finite
black-hole-region proxy. -/
theorem boundary_in_blackHoleRegion {readout : Region E} {Mode : Type}
    (U : FiniteUnruhReadoutWitness C readout Mode) :
    BlackHoleRegion C readout U.boundary.point = true :=
  U.boundary.in_blackHoleRegion C

/-- The boundary point of a finite Unruh readout has an exterior predecessor at
the shroud interface. -/
theorem has_exterior_predecessor {readout : Region E} {Mode : Type}
    (U : FiniteUnruhReadoutWitness C readout Mode) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧
      CausalLe C y U.boundary.point :=
  U.boundary.has_exterior_predecessor C

/-- The finite Fock sector generated by the witness ledger. -/
def sector {readout : Region E} {Mode : Type}
    (U : FiniteUnruhReadoutWitness C readout Mode) : FockSpace Mode :=
  U.ledger.fockSector U.occupation

/-- The readout sector has exactly the C4 ledger particle number. -/
theorem sector_particleNumber {readout : Region E} {Mode : Type}
    (U : FiniteUnruhReadoutWitness C readout Mode) :
    (sector C U).particleNumber = U.ledger.particleNumber :=
  U.ledger.fockSector_particleNumber U.occupation

/-- A single creation event gives the finite one-particle readout witness at an
apparent boundary event. -/
def singleCreation {readout : Region E} {Mode : Type}
    (boundary : ApparentEvent C readout) (mode : Mode) :
    FiniteUnruhReadoutWitness C readout Mode where
  boundary := boundary
  ledger := ⟨[C4LedgerStep.matterCreate]⟩
  occupation := fun _ => mode

/-- The single-creation finite readout has particle number one. -/
theorem singleCreation_sector_particleNumber {readout : Region E} {Mode : Type}
    (boundary : ApparentEvent C readout) (mode : Mode) :
    (sector C (singleCreation C boundary mode)).particleNumber = 1 := by
  calc
    (sector C (singleCreation C boundary mode)).particleNumber
        = (singleCreation C boundary mode).ledger.particleNumber :=
          sector_particleNumber C (singleCreation C boundary mode)
    _ = 1 := C4Ledger.particleNumber_single_create

end FiniteUnruhReadoutWitness

/-! ## Finite Unruh thermal readout -/

/-- A finite Unruh thermal-readout witness pairs the finite apparent-boundary
particle readout with a lifted thermodynamic transition.  It is a bridge
between two already-defined carriers: readout-relative Fock-sector counting and
balanced finite temperature production. -/
structure FiniteUnruhThermalReadoutWitness
    (readout : Region E) (Mode S : Type) (V : StochSemiring) where
  /-- The finite boundary/Fock readout witness. -/
  readoutWitness : FiniteUnruhReadoutWitness C readout Mode
  /-- The finite thermodynamic transition retained with its upstream evidence. -/
  transition : Thermodynamics.Temperature.LiftedThermoTransition S V

namespace FiniteUnruhThermalReadoutWitness

/-- The thermal bridge keeps the boundary point inside the finite
black-hole-region proxy. -/
theorem boundary_in_blackHoleRegion {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    BlackHoleRegion C readout W.readoutWitness.boundary.point = true :=
  W.readoutWitness.boundary_in_blackHoleRegion C

/-- The thermal bridge keeps the exterior predecessor at the shroud interface. -/
theorem has_exterior_predecessor {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧
      CausalLe C y W.readoutWitness.boundary.point :=
  W.readoutWitness.has_exterior_predecessor C

/-- The thermal bridge keeps the Fock-sector particle-number law. -/
theorem sector_particleNumber {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    (FiniteUnruhReadoutWitness.sector C W.readoutWitness).particleNumber =
      W.readoutWitness.ledger.particleNumber :=
  W.readoutWitness.sector_particleNumber C

/-- The retained thermodynamic transition has positive creation count. -/
theorem creationCount_pos {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    0 < W.transition.creationCount :=
  Thermodynamics.Temperature.LiftedThermoTransition.creationCount_pos
    W.transition

/-- The retained thermodynamic transition has balanced stochastic flux. -/
theorem flux_balanced {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    Thermodynamics.Temperature.Balanced W.transition.flux :=
  Thermodynamics.Temperature.LiftedThermoTransition.flux_balanced
    W.transition

/-- The retained thermodynamic transition reads temperature as the stationary
distribution value at the retained state. -/
theorem temperature_eq_distribution {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    W.transition.temperature =
      W.transition.stochastic.distribution W.transition.stochastic.state :=
  Thermodynamics.Temperature.LiftedThermoTransition.temperature_eq_distribution
    W.transition

/-- The retained thermodynamic transition has a unique balanced temperature. -/
theorem temperature_unique {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    ∃ T : V.carrier,
      (T = W.transition.stochastic.kernel.advance
            W.transition.stochastic.distribution
            W.transition.stochastic.state ∧
        T = W.transition.stochastic.distribution
            W.transition.stochastic.state) ∧
        ∀ U : V.carrier,
          U = W.transition.stochastic.kernel.advance
              W.transition.stochastic.distribution
              W.transition.stochastic.state ∧
            U = W.transition.stochastic.distribution
              W.transition.stochastic.state → U = T :=
  Thermodynamics.Temperature.LiftedThermoTransition.temperature_unique
    W.transition

/-- The finite thermal-readout bridge carries the full finite churn package:
positive creation, balanced flux, positive Landauer cost, and positive
hard-flow discharge. -/
theorem produces_creation_landauer_and_discharge
    {readout : Region E} {Mode S : Type} {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    0 < W.transition.creationCount ∧
      Thermodynamics.Temperature.Balanced W.transition.flux ∧
      0 < W.transition.landauerCost ∧ 0 < W.transition.discharge :=
  Thermodynamics.Temperature.LiftedThermoTransition.produces_creation_landauer_and_discharge
    W.transition

/-- The compact readout/temperature bridge: the boundary event is in the
finite black-hole-region proxy and the retained temperature is the stationary
distribution value. -/
theorem readout_and_temperature {readout : Region E} {Mode S : Type}
    {V : StochSemiring}
    (W : FiniteUnruhThermalReadoutWitness C readout Mode S V) :
    BlackHoleRegion C readout W.readoutWitness.boundary.point = true ∧
      W.transition.temperature =
        W.transition.stochastic.distribution W.transition.stochastic.state :=
  ⟨W.boundary_in_blackHoleRegion C, W.temperature_eq_distribution C⟩

end FiniteUnruhThermalReadoutWitness

/-! ## Finite trapped-surface witness -/

/-- A finite trapped-surface witness is the articulation-site carrier already
present in the kugelblitz frontier: the next articulation diamond crosses from
readout exterior to the shroud-side no-readout region.  This does not assert
continuum expansions or a singularity theorem. -/
structure FiniteTrappedSurfaceWitness (readout : Region Articulating) where
  /-- The articulation site whose next diamond crosses the readout horizon. -/
  site : KugelblitzArticulationSite readout

namespace FiniteTrappedSurfaceWitness

/-- The causal set generated by the trapped articulation site. -/
def causalSet {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) : CausalSet Articulating :=
  T.site.causalSet

/-- The upper endpoint of the generated articulation diamond. -/
def upper {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) : Articulating :=
  T.site.next

/-- The underlying articulation diamond crosses the readout horizon. -/
theorem crosses_readout_horizon {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) :
    DiamondCrossesReadoutHorizon T.site.causalSet readout T.site.diamondPoint := by
  exact T.site.crosses

/-- The lower endpoint remains in the readout exterior. -/
theorem lower_exterior {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) :
    ReadoutExterior T.site.causalSet readout T.site.tail = true :=
  T.site.tail_exterior

/-- The upper endpoint lands on the shroud. -/
theorem upper_shroud {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) :
    Shroud T.site.causalSet readout T.upper = true :=
  T.site.next_shroud

/-- The upper endpoint is inside the finite black-hole-region proxy. -/
theorem upper_in_blackHoleRegion {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) :
    BlackHoleRegion T.site.causalSet readout T.upper = true :=
  T.site.next_in_hole

/-- The upper endpoint is no longer in the readout exterior. -/
theorem upper_not_exterior {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) :
    ReadoutExterior T.site.causalSet readout T.upper = false :=
  shroud_not_exterior T.site.causalSet readout T.upper_shroud

/-- The trapped upper endpoint is an apparent event for the generated causal
set and readout. -/
def apparentEvent {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) : ApparentEvent T.site.causalSet readout where
  point := T.upper
  on_shroud := T.upper_shroud

/-- The trapped upper endpoint has an exterior predecessor at the finite causal
interface. -/
theorem upper_has_exterior_predecessor {readout : Region Articulating}
    (T : FiniteTrappedSurfaceWitness readout) :
    ∃ y, y ∈ T.site.causalSet.events ∧
      ReadoutExterior T.site.causalSet readout y = true ∧
        CausalLe T.site.causalSet y T.upper :=
  (T.apparentEvent).has_exterior_predecessor T.site.causalSet

end FiniteTrappedSurfaceWitness

/-! ## Membrane, plate, patches, and censorship proxies -/

/-- The finite membrane carrier is the already defined shroud-indexed keratin
object: a material contact complex indexed by shroud events. -/
abbrev HorizonMembrane (S : Order.CompleteLattice) (E : Type) : Type 1 :=
  ShroudIndexedKeratin S E

/-- A membrane vertex is indexed by a shroud event. -/
theorem HorizonMembrane.vertex_on_shroud {S : Order.CompleteLattice}
    (M : HorizonMembrane S E) (v : M.complex.Vertex) :
    M.hole.shroud (M.shroudPoint v) = true :=
  M.shroudEvent_on_shroud v

/-- A membrane vertex indexed by the shroud is inside the represented hole. -/
theorem HorizonMembrane.vertex_in_interior {S : Order.CompleteLattice}
    (M : HorizonMembrane S E) (v : M.complex.Vertex) :
    M.hole.interior (M.shroudPoint v) = true :=
  M.shroudEvent_in_hole v

/-- Horizon-membrane lock histories inflate every seed stalk. -/
theorem HorizonMembrane.lockedSeed_infl {S : Order.CompleteLattice}
    (M : HorizonMembrane S E) (seed : Obsmetrologia.Tarski.Assign M.complex) :
    ∀ v, S.le (seed v) (M.lockedSeed seed v) :=
  ShroudIndexedKeratin.lockedSeed_infl M seed

/-- Settling a locked horizon-membrane seed is least among compatible states
above it. -/
theorem HorizonMembrane.settle_locked_least_compatible
    {S : Order.CompleteLattice}
    (M : HorizonMembrane S E)
    (seed x : Obsmetrologia.Tarski.Assign M.complex)
    (hcomp : Obsmetrologia.Tarski.IsCompatible M.complex x)
    (hx : ∀ v, S.le (M.lockedSeed seed v) (x v)) :
    (Obsmetrologia.Tarski.AssignCL S M.complex.Vertex).le
      (Obsmetrologia.Tarski.settle M.complex (M.lockedSeed seed)) x :=
  ShroudIndexedKeratin.settle_locked_least_compatible M seed x hcomp hx

/-- The Bekenstein-plate proxy is the finite list of shroud events.  Counting
or capacity laws must be proved over this list; no area law is asserted here. -/
abbrev BekensteinPlate (readout : Region E) : List E :=
  ShroudEvents C readout

/-- Membership in the finite plate is exactly listed shroud membership. -/
theorem mem_bekensteinPlate_iff (readout : Region E) {x : E} :
    x ∈ BekensteinPlate C readout ↔
      x ∈ C.events ∧ Shroud C readout x = true :=
  mem_shroudEvents_iff C readout

/-- Every finite plate event lies in the black-hole-region proxy. -/
theorem bekensteinPlate_in_blackHoleRegion (readout : Region E) {x : E}
    (hx : x ∈ BekensteinPlate C readout) :
    BlackHoleRegion C readout x = true :=
  shroud_in_hole C readout ((mem_bekensteinPlate_iff C readout).mp hx).2

/-- The finite plate count is exactly the length of the shroud-filtered event
list. -/
theorem bekensteinPlate_card_eq_filter (readout : Region E) :
    (BekensteinPlate C readout).length =
      (C.events.filter (Shroud C readout)).length := by
  rfl

/-- The finite plate has no more entries than the ambient finite causal-set
event list.  This is a counting bound, not a continuum area law. -/
theorem bekensteinPlate_length_le_events (readout : Region E) :
    (BekensteinPlate C readout).length ≤ C.events.length := by
  unfold BekensteinPlate ShroudEvents Region.listed
  exact List.length_filter_le (Shroud C readout) C.events

/-- A finite Bekenstein-plate capacity witness pairs the shroud-event plate
with a load-bearing Landauer support.  The capacity below is finite Landauer
cost only; no entropy formula or continuum area law is asserted. -/
structure BekensteinPlateCapacityWitness (readout : Region E) where
  /-- The load-bearing support whose Landauer cost supplies finite capacity. -/
  support : Thermodynamics.Temperature.LandauerSupport

namespace BekensteinPlateCapacityWitness

/-- The plate side of a capacity witness is the finite shroud-event plate. -/
def plate {readout : Region E}
    (_W : BekensteinPlateCapacityWitness readout) : List E :=
  BekensteinPlate C readout

/-- The capacity side is the Landauer cost of the bundled support. -/
def capacity {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) : Nat :=
  W.support.cost

/-- Bundled finite plate capacity is positive because the support is
load-bearing. -/
theorem capacity_pos {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) :
    0 < W.capacity :=
  Thermodynamics.Temperature.LandauerSupport.cost_pos W.support

/-- The capacity is exactly the support's Landauer cost. -/
theorem capacity_eq_landauer_cost {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) :
    W.capacity = W.support.cost :=
  rfl

/-- The support ledger keeps the existing anti-Landauer Euler-characteristic
law. -/
theorem ledger_eq_eulerChar {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) :
    W.support.ledger = AntiLandauer.eulerChar W.support.nerve :=
  Thermodynamics.Temperature.LandauerSupport.ledger_eq_eulerChar W.support

/-- The plate count remains exactly the shroud-filter count. -/
theorem plate_card_eq_filter {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) :
    (plate C W).length = (C.events.filter (Shroud C readout)).length :=
  bekensteinPlate_card_eq_filter C readout

/-- The plate side stays bounded by the ambient finite event list. -/
theorem plate_length_le_events {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) :
    (plate C W).length ≤ C.events.length :=
  bekensteinPlate_length_le_events C readout

/-- Every event listed by the plate side remains in the black-hole-region
proxy. -/
theorem event_in_blackHoleRegion {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) {x : E}
    (hx : x ∈ plate C W) :
    BlackHoleRegion C readout x = true :=
  bekensteinPlate_in_blackHoleRegion C readout hx

/-- The finite package combines positive Landauer capacity with the plate's
ambient event-list bound. -/
theorem finite_capacity_package {readout : Region E}
    (W : BekensteinPlateCapacityWitness readout) :
    0 < W.capacity ∧ (plate C W).length ≤ C.events.length :=
  ⟨W.capacity_pos, plate_length_le_events C W⟩

end BekensteinPlateCapacityWitness

/-- A hole-region patch is a region contained in the no-readout side for a
chosen readout. -/
structure HoleRegionPatch (readout : Region E) where
  /-- The Boolean membership predicate for the local patch. -/
  patch : Region E
  /-- Patch membership stays inside the black-hole-region proxy. -/
  contained : ∀ {x : E}, patch x = true → BlackHoleRegion C readout x = true

namespace HoleRegionPatch

/-- Patch membership is black-hole-region membership for the ambient readout. -/
theorem in_blackHoleRegion {readout : Region E}
    (P : HoleRegionPatch C readout) {x : E} (hx : P.patch x = true) :
    BlackHoleRegion C readout x = true :=
  P.contained hx

/-- A hole-region patch point cannot also be readout exterior. -/
theorem not_exterior {readout : Region E}
    (P : HoleRegionPatch C readout) {x : E} (hx : P.patch x = true) :
    ReadoutExterior C readout x = false := by
  have hnot : ¬ ReadoutExterior C readout x = true := by
    intro hout
    exact hole_exterior_disjoint C readout x ⟨P.contained hx, hout⟩
  cases h : ReadoutExterior C readout x
  · rfl
  · exact False.elim (hnot h)

/-- No patch point causally precedes a readout-exterior point. -/
theorem no_future_to_exterior {readout : Region E}
    (P : HoleRegionPatch C readout) {x y : E} (hx : P.patch x = true)
    (hy : ReadoutExterior C readout y = true) :
    ¬ CausalLe C x y :=
  hole_no_future_to_exterior C readout (P.contained hx) hy

end HoleRegionPatch

/-- The shroud itself is a hole-region patch. -/
def shroudPatch (readout : Region E) : HoleRegionPatch C readout where
  patch := Shroud C readout
  contained := by
    intro x hx
    exact shroud_in_hole C readout hx

/-- The shroud patch has exactly the shroud membership predicate. -/
theorem shroudPatch_patch_eq_shroud (readout : Region E) (x : E) :
    (shroudPatch C readout).patch x = Shroud C readout x :=
  rfl

/-- Shroud-patch points have readout-exterior predecessors. -/
theorem shroudPatch_has_exterior_predecessor (readout : Region E) {x : E}
    (hx : (shroudPatch C readout).patch x = true) :
    ∃ y, y ∈ C.events ∧ ReadoutExterior C readout y = true ∧
      CausalLe C y x :=
  shroud_has_exterior_predecessor C readout hx

/-- Shroud-patch points are not readout exterior. -/
theorem shroudPatch_not_exterior (readout : Region E) {x : E}
    (hx : (shroudPatch C readout).patch x = true) :
    ReadoutExterior C readout x = false :=
  HoleRegionPatch.not_exterior C (shroudPatch C readout) hx

/-- The no-readout region of the sequencing causal-diamond space is a
hole-region patch. -/
def kinematicHoleRegionPatch {E : Type} (C : CausalSet E)
    [CausalLeDecision C] [DecidableEq E] [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) :
    HoleRegionPatch (HoleDiamondKinematicSpace C) readout := by
  letI : CausalLeDecision (HoleDiamondKinematicSpace C) :=
    sequencingCausalLeDecision C
  exact
    { patch := HoleRegion (HoleDiamondKinematicSpace C) readout
      contained := by
        intro _ hx
        exact hx }

/-- The kinematic patch predicate is the no-readout predicate on the
sequencing causal-diamond space. -/
theorem kinematicHoleRegionPatch_patch_eq_holeRegion {E : Type}
    (C : CausalSet E) [CausalLeDecision C] [DecidableEq E]
    [DecidableRel C.reaches]
    (readout : Region (DiamondPoint C)) (x : DiamondPoint C) :
    (kinematicHoleRegionPatch C readout).patch x =
      HoleRegion (HoleDiamondKinematicSpace C) readout x :=
  rfl

/-- A kinematic patch point is not in the readout exterior of the sequencing
causal-diamond space. -/
theorem kinematicHoleRegionPatch_not_exterior {E : Type}
    (C : CausalSet E) [CausalLeDecision C] [DecidableEq E]
    [DecidableRel C.reaches]
    {readout : Region (DiamondPoint C)}
    {x : DiamondPoint C}
    (hx : (kinematicHoleRegionPatch C readout).patch x = true) :
    ReadoutExterior (HoleDiamondKinematicSpace C) readout x = false := by
  letI : CausalLeDecision (HoleDiamondKinematicSpace C) :=
    sequencingCausalLeDecision C
  exact HoleRegionPatch.not_exterior
    (HoleDiamondKinematicSpace C) (kinematicHoleRegionPatch C readout) hx

/-- A kinematic patch point cannot causally precede a readout-exterior
diamond point. -/
theorem kinematicHoleRegionPatch_no_future_to_exterior {E : Type}
    (C : CausalSet E) [CausalLeDecision C] [DecidableEq E]
    [DecidableRel C.reaches]
    {readout : Region (DiamondPoint C)}
    {x y : DiamondPoint C}
    (hx : (kinematicHoleRegionPatch C readout).patch x = true)
    (hy : ReadoutExterior (HoleDiamondKinematicSpace C) readout y = true) :
    ¬ CausalLe (HoleDiamondKinematicSpace C) x y := by
  letI : CausalLeDecision (HoleDiamondKinematicSpace C) :=
    sequencingCausalLeDecision C
  exact HoleRegionPatch.no_future_to_exterior
    (HoleDiamondKinematicSpace C) (kinematicHoleRegionPatch C readout) hx hy

/-- Censorship, at the finite level: a hole effect cannot have an
exterior source. -/
theorem no_naked_hole_effect_source (H : Hole E) {x y : E}
    (h : H.effect x y) :
    H.exterior x = false :=
  H.effect_source_not_exterior h

/-- For the canonical readout-generated hole, no effect source is naked to the
same readout exterior. -/
theorem no_naked_canonical_hole_effect_source (readout : Region E) {x y : E}
    (h : (Hole.ofReadout C readout).effect x y) :
    ReadoutExterior C readout x = false :=
  Hole.ofReadout_effect_source_not_exterior C readout h

/-! ## Formation frontier aliases -/

/-- The finite critical-collapse candidate currently available in the corpus is
the kugelblitz articulation step: the next articulation diamond crosses the
readout horizon.  Scaling laws remain outside this carrier. -/
abbrev CriticalCollapseCandidate (readout : Region Articulating)
    (u : Utterance) (tail : Articulating) : Prop :=
  ArticulationKugelblitzStep readout u tail

/-- A critical-collapse candidate read as the reusable kugelblitz
articulation-site carrier. -/
def criticalCollapseCandidate_site
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    KugelblitzArticulationSite readout where
  utterance := u
  tail := tail
  crosses := h

/-- The candidate tail is listed in the generated articulation-prefix chain. -/
theorem criticalCollapseCandidate_tail_mem_prefixes
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (_h : CriticalCollapseCandidate readout u tail) :
    tail ∈ CausalSets.Causal.ArticulationChain.prefixes (Articulating.pair u tail) :=
  CausalSets.Causal.ArticulationChain.tail_mem_prefixes_pair u tail

/-- The candidate next point is listed in its generated articulation-prefix
chain. -/
theorem criticalCollapseCandidate_next_mem_prefixes
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (_h : CriticalCollapseCandidate readout u tail) :
    Articulating.pair u tail ∈
      CausalSets.Causal.ArticulationChain.prefixes (Articulating.pair u tail) :=
  CausalSets.Causal.ArticulationChain.pair_mem_prefixes_pair u tail

/-- The tail reaches the next articulation in the generated causal set. -/
theorem criticalCollapseCandidate_tail_reaches_next
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (_h : CriticalCollapseCandidate readout u tail) :
    (CausalSets.Causal.ArticulationChain.causalSet
      (Articulating.pair u tail)).reaches tail (Articulating.pair u tail) :=
  CausalSets.Causal.ArticulationChain.tail_reaches_pair u tail

/-- The tail causally precedes the next articulation in the generated causal
set. -/
theorem criticalCollapseCandidate_tail_causalLe_next
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    CausalLe
      (CausalSets.Causal.ArticulationChain.causalSet
        (Articulating.pair u tail))
      tail (Articulating.pair u tail) :=
  Or.inr (criticalCollapseCandidate_tail_reaches_next h)

/-- A critical-collapse candidate starts from an exterior articulation tail. -/
theorem criticalCollapseCandidate_tail_exterior
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    ReadoutExterior (CausalSets.Causal.ArticulationChain.causalSet
      (Articulating.pair u tail)) readout tail = true :=
  articulationKugelblitz_tail_exterior h

/-- A critical-collapse candidate lands the paired articulation on the shroud. -/
theorem criticalCollapseCandidate_pair_shroud
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    Shroud (CausalSets.Causal.ArticulationChain.causalSet
      (Articulating.pair u tail)) readout (Articulating.pair u tail) = true :=
  articulationKugelblitz_pair_shroud h

/-- A critical-collapse candidate lands the next articulation in the hole
region. -/
theorem criticalCollapseCandidate_next_in_hole
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    HoleRegion (CausalSets.Causal.ArticulationChain.causalSet
      (Articulating.pair u tail)) readout (Articulating.pair u tail) = true :=
  articulationKugelblitz_pair_in_hole h

/-- A critical-collapse candidate's next articulation is no longer exterior. -/
theorem criticalCollapseCandidate_next_not_exterior
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    ReadoutExterior (CausalSets.Causal.ArticulationChain.causalSet
      (Articulating.pair u tail)) readout (Articulating.pair u tail) = false :=
  shroud_not_exterior
    (CausalSets.Causal.ArticulationChain.causalSet
      (Articulating.pair u tail))
    readout (criticalCollapseCandidate_pair_shroud h)

/-- A critical-collapse candidate carries the local hole-region switch of its
kugelblitz articulation step. -/
theorem criticalCollapseCandidate_holeRegionSwitch
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    ArticulationHoleRegionSwitchesAt readout u tail :=
  articulationKugelblitz_holeRegionSwitch h

/-- A critical-collapse candidate canonically gives the finite trapped-surface
witness already carried by the kugelblitz articulation site. -/
def criticalCollapseCandidate_trappedSurfaceWitness
    {readout : Region Articulating} {u : Utterance} {tail : Articulating}
    (h : CriticalCollapseCandidate readout u tail) :
    FiniteTrappedSurfaceWitness readout where
  site := criticalCollapseCandidate_site h

/-- A mark-built critical-collapse candidate uses the utterance generated
directly from its token and claim marks. -/
abbrev MarkCriticalCollapseCandidate (readout : Region Articulating)
    (token claim : Mark) (tail : Articulating) : Prop :=
  CriticalCollapseCandidate readout (utteranceOfMarks token claim) tail

/-- The mark-built candidate utterance's token side carries the supplied token mark. -/
@[simp] theorem markCriticalCollapseCandidate_utterance_token
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (_h : MarkCriticalCollapseCandidate readout token claim tail) :
    (utteranceOfMarks token claim).token.mark = token :=
  rfl

/-- The mark-built candidate utterance's claim side carries the supplied claim mark. -/
@[simp] theorem markCriticalCollapseCandidate_utterance_claim
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (_h : MarkCriticalCollapseCandidate readout token claim tail) :
    (utteranceOfMarks token claim).claim.mark = claim :=
  rfl

/-- The tail is listed in the mark-generated articulation-prefix chain. -/
theorem markCriticalCollapseCandidate_tail_mem_prefixes
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    tail ∈ CausalSets.Causal.ArticulationChain.prefixes
      (markStepArticulating token claim tail) :=
  criticalCollapseCandidate_tail_mem_prefixes h

/-- The next articulation is listed in the mark-generated articulation-prefix
chain. -/
theorem markCriticalCollapseCandidate_next_mem_prefixes
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    markStepArticulating token claim tail ∈
      CausalSets.Causal.ArticulationChain.prefixes
        (markStepArticulating token claim tail) :=
  criticalCollapseCandidate_next_mem_prefixes h

/-- The tail reaches the mark-built next articulation in the generated causal
set. -/
theorem markCriticalCollapseCandidate_tail_reaches_next
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    (markStepCausalSet token claim tail).reaches tail
      (markStepArticulating token claim tail) :=
  criticalCollapseCandidate_tail_reaches_next h

/-- The tail causally precedes the mark-built next articulation in the
generated causal set. -/
theorem markCriticalCollapseCandidate_tail_causalLe_next
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    CausalLe (markStepCausalSet token claim tail) tail
      (markStepArticulating token claim tail) :=
  criticalCollapseCandidate_tail_causalLe_next h

/-- The mark-built tail starts in the readout exterior. -/
theorem markCriticalCollapseCandidate_tail_exterior
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    ReadoutExterior (markStepCausalSet token claim tail) readout tail = true :=
  criticalCollapseCandidate_tail_exterior h

/-- The mark-built next articulation lands on the shroud. -/
theorem markCriticalCollapseCandidate_next_shroud
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    Shroud (markStepCausalSet token claim tail) readout
      (markStepArticulating token claim tail) = true :=
  criticalCollapseCandidate_pair_shroud h

/-- The mark-built next articulation lies in the computed hole region. -/
theorem markCriticalCollapseCandidate_next_in_blackHoleRegion
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    BlackHoleRegion (markStepCausalSet token claim tail) readout
      (markStepArticulating token claim tail) = true :=
  criticalCollapseCandidate_next_in_hole h

/-- The mark-built next articulation is no longer exterior. -/
theorem markCriticalCollapseCandidate_next_not_exterior
    {readout : Region Articulating} {token claim : Mark} {tail : Articulating}
    (h : MarkCriticalCollapseCandidate readout token claim tail) :
    ReadoutExterior (markStepCausalSet token claim tail) readout
      (markStepArticulating token claim tail) = false :=
  criticalCollapseCandidate_next_not_exterior h

end CausalSets.BlackHoles.Horizon
end Obsmetrologia
