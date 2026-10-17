import ObsmetrologiaPhysicalScience.CausalSets.Causal.Cone
import Obsmetrologia.Site.Basic

/-!
# Causality packets

This module records the narrow, checked reading of a causality packet.  The
packet is not the causal object itself.  It is a boundary presentation of a
causal carrier readout: finite causal support, observable site support, and the
presentation value carried at the boundary.
-/

namespace Obsmetrologia
namespace Computing

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone

/-- A causal carrier readout bundles the causal and observable support that a
runtime boundary presentation is allowed to present. -/
structure CausalCarrierReadout (E Q Boundary : Type) where
  /-- The finite causal support: events plus direct causal links and acyclicity. -/
  causalSupport : CausalSet E
  /-- The observable site support where the carrier is read. -/
  observableSupport : Site.SiteObj Q
  /-- The boundary value that presents this carrier to a runtime channel. -/
  boundaryPresentation : Boundary

namespace CausalCarrierReadout

variable {E Q Boundary : Type} (R : CausalCarrierReadout E Q Boundary)

/-- The event carrier of a causal carrier readout. -/
abbrev Event : Type := Obsmetrologia.CausalSets.Causal.Order.Event R.causalSupport

/-- Reachability in the causal carrier readout is inherited from its causal support. -/
def Reaches (x y : E) : Prop := R.causalSupport.reaches x y

/-- Reflexive causal precedence in the causal carrier readout. -/
def CausalLe (x y : E) : Prop := Obsmetrologia.CausalSets.Causal.Cone.CausalLe R.causalSupport x y

/-- Carrier reachability composes because causal-set reachability composes. -/
theorem reaches_trans {a b c : E}
    (h1 : R.Reaches a b) (h2 : R.Reaches b c) : R.Reaches a c :=
  R.causalSupport.reaches_trans h1 h2

/-- Carrier reachability has no loops because its causal support is acyclic. -/
theorem reaches_irrefl (e : E) : ¬ R.Reaches e e :=
  R.causalSupport.reaches_irrefl e

/-- The carrier's reflexive causal precedence is transitive. -/
theorem causalLe_trans {a b c : E}
    (h1 : R.CausalLe a b) (h2 : R.CausalLe b c) : R.CausalLe a c :=
  Obsmetrologia.CausalSets.Causal.Cone.causalLe_trans R.causalSupport h1 h2

end CausalCarrierReadout

/-- A causality packet is a boundary presentation of an already-generated causal
carrier readout. -/
structure CausalityPacket {E Q Boundary : Type}
    (carrier : CausalCarrierReadout E Q Boundary) where
  /-- The boundary value admitted or emitted by a runtime channel. -/
  presentation : Boundary
  /-- The packet presents the carrier's boundary presentation; it does not
  replace the carrier. -/
  presentsCarrier : presentation = carrier.boundaryPresentation

namespace CausalityPacket

variable {E Q Boundary : Type} {R : CausalCarrierReadout E Q Boundary}

/-- A causality packet forgets to its carrier readout. -/
def carrier (_packet : CausalityPacket R) : CausalCarrierReadout E Q Boundary := R

/-- A causality packet is exactly a boundary presentation of its carrier. -/
theorem is_boundary_presentation (packet : CausalityPacket R) :
    packet.presentation = R.boundaryPresentation :=
  packet.presentsCarrier

/-- The causality carried by a packet is inherited from the carrier, not from the
packet boundary value. -/
theorem reaches_trans (packet : CausalityPacket R) {a b c : E}
    (h1 : R.Reaches a b) (h2 : R.Reaches b c) : R.Reaches a c :=
  packet.carrier.reaches_trans h1 h2

/-- Packet-carried causal precedence is transitive because the carrier support is. -/
theorem causalLe_trans (packet : CausalityPacket R) {a b c : E}
    (h1 : R.CausalLe a b) (h2 : R.CausalLe b c) : R.CausalLe a c :=
  packet.carrier.causalLe_trans h1 h2

end CausalityPacket

/-- The term "causality packet" denotes a boundary presentation subordinate to a
causal carrier readout. -/
theorem causalityPacket_is_boundary_presentation
    {E Q Boundary : Type} {R : CausalCarrierReadout E Q Boundary}
    (packet : CausalityPacket R) :
    packet.presentation = R.boundaryPresentation :=
  packet.is_boundary_presentation

/-- A causality packet carries causal composition only through its carrier readout. -/
theorem causalityPacket_reaches_trans
    {E Q Boundary : Type} {R : CausalCarrierReadout E Q Boundary}
    (packet : CausalityPacket R) {a b c : E}
    (h1 : R.Reaches a b) (h2 : R.Reaches b c) : R.Reaches a c :=
  packet.reaches_trans h1 h2

end Computing
end Obsmetrologia
