import Obsmetrologia.CausalSets.Causal.Alexandrov

/-!
# Light observation — reconstructing the causal event from its cone signatures

The finite, order-theoretic reduction of the Lorentzian inverse problem (*given light observations,
what can be reconstructed?*): an event is determined by its observed past/future cone signatures
when the observer family is **separating**. An observer family is a predicate on events; the
signature of an event records which observers lie in its past and future cones. When every event is
an observer, the signatures recover the causal order and separate events — the finite analogue of
*light observations reconstruct the causal structure* (`content/.../lorentzian-causal-settling`;
the same separating-stage pattern as `AperiodicOrder.Tiling.InverseHull`).

This is Approach A of the build note: Prop-level signatures over `CausalSets.Causal.Cone.CausalLe`. A Boolean
computational stage and an inverse-hull stage are left as later refinements.

## Main definitions

* `ObserverFamily` / `allObservers` — a predicate selecting observation events; the full family.
* `pastSignature` / `futureSignature` — the observers in an event's reflexive past/future cone.
* `SameSignature` — two events with identical past- and future-signatures.
* `Separating` — equal signatures force equality of events.

## Main results

* `allObservers_pastSignature_iff` / `allObservers_futureSignature_iff` — full signatures recover
  the causal order.
* `allObservers_separating` — the full observer family separates events.
* `pastSignature_mono` / `futureSignature_antimono` — signatures vary monotonically with the order.
* `full_light_observation_reconstructs_causal_order` — the bundled headline.

## References

`content/.../lorentzian-causal-settling`. Built on `Obsmetrologia.CausalSets.Causal.AlexandrovTopology`.

## Tags

light observation, causal reconstruction, inverse problem, separating family, causal order
-/

namespace Obsmetrologia
namespace CausalSets.Causal.LightObservation

open Obsmetrologia.CausalSets.Causal.Order
open Obsmetrologia.CausalSets.Causal.Cone

variable {E : Type} (C : CausalSet E)

/-! ## (A) Observer families and signatures -/

/-- An observer family: events where light-cone observations are available. -/
abbrev ObserverFamily (E : Type) := E → Prop

/-- The full event set as observers. -/
def allObservers : ObserverFamily E := fun _ => True

/-- Which observers lie in the reflexive causal past of `x`. -/
def pastSignature (O : ObserverFamily E) (x : E) : E → Prop :=
  fun o => O o ∧ CausalSets.Causal.Cone.CausalLe C o x

/-- Which observers lie in the reflexive causal future of `x`. -/
def futureSignature (O : ObserverFamily E) (x : E) : E → Prop :=
  fun o => O o ∧ CausalSets.Causal.Cone.CausalLe C x o

/-- Two events have the same observation signature relative to `O`. -/
def SameSignature (O : ObserverFamily E) (x y : E) : Prop :=
  pastSignature C O x = pastSignature C O y ∧ futureSignature C O x = futureSignature C O y

/-- Observers separate events when equal observed signatures force equality. -/
def Separating (O : ObserverFamily E) : Prop :=
  ∀ x y, SameSignature C O x y → x = y

/-! ## (B) Full observers recover the causal order -/

/-- With all observers, the past signature of `y` contains `x` iff `x` causally precedes `y`. -/
theorem allObservers_pastSignature_iff (x y : E) :
    pastSignature C allObservers y x ↔ CausalSets.Causal.Cone.CausalLe C x y :=
  ⟨fun h => h.2, fun h => ⟨trivial, h⟩⟩

/-- With all observers, the future signature of `x` contains `y` iff `x` causally precedes `y`. -/
theorem allObservers_futureSignature_iff (x y : E) :
    futureSignature C allObservers x y ↔ CausalSets.Causal.Cone.CausalLe C x y :=
  ⟨fun h => h.2, fun h => ⟨trivial, h⟩⟩

/-! ## (C) Full observers separate events -/

/-- The full observer family separates events: equal cone signatures force equality. The reflexive
self-membership of an event in its own future cone, transported across the signature equality,
yields mutual precedence, hence equality by antisymmetry (no closed timelike curve). -/
theorem allObservers_separating : Separating C allObservers := by
  intro x y hsig
  have hyx : CausalSets.Causal.Cone.CausalLe C y x := by
    have hxx : futureSignature C allObservers x x := ⟨trivial, CausalSets.Causal.Cone.causalLe_refl C x⟩
    exact ((iff_of_eq (congrFun hsig.2 x)).mp hxx).2
  have hxy : CausalSets.Causal.Cone.CausalLe C x y := by
    have hyy : futureSignature C allObservers y y := ⟨trivial, CausalSets.Causal.Cone.causalLe_refl C y⟩
    exact ((iff_of_eq (congrFun hsig.2 y)).mpr hyy).2
  exact CausalSets.Causal.Cone.causalLe_antisymm C hxy hyx

/-! ## (D) Observation monotonicity -/

/-- Past signatures grow along the causal order. -/
theorem pastSignature_mono (O : ObserverFamily E) {x y : E}
    (hxy : CausalSets.Causal.Cone.CausalLe C x y) :
    ∀ o, pastSignature C O x o → pastSignature C O y o :=
  fun _ h => ⟨h.1, CausalSets.Causal.Cone.causalLe_trans C h.2 hxy⟩

/-- Future signatures shrink along the causal order. -/
theorem futureSignature_antimono (O : ObserverFamily E) {x y : E}
    (hxy : CausalSets.Causal.Cone.CausalLe C x y) :
    ∀ o, futureSignature C O y o → futureSignature C O x o :=
  fun _ h => ⟨h.1, CausalSets.Causal.Cone.causalLe_trans C hxy h.2⟩

/-! ## (E) The bundled headline -/

/-- **Full light-cone observation reconstructs the finite causal event.** With every event an
observer, the observer family separates events, and the observed past/future signatures recover the
causal order. -/
theorem full_light_observation_reconstructs_causal_order :
    Separating C allObservers
    ∧ (∀ x y, pastSignature C allObservers y x ↔ CausalSets.Causal.Cone.CausalLe C x y)
    ∧ (∀ x y, futureSignature C allObservers x y ↔ CausalSets.Causal.Cone.CausalLe C x y) :=
  ⟨allObservers_separating C,
   fun x y => allObservers_pastSignature_iff C x y,
   fun x y => allObservers_futureSignature_iff C x y⟩

end CausalSets.Causal.LightObservation
end Obsmetrologia
