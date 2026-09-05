import Infomaterial.Relational.Spacetime.Causal.Order
import Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

/-!
# Cone-field geometry — causal reachability as future/past cones, spacelike separation, diamonds

`Spacetime.Causal.Order` already settles a finite event DAG into its causal order: `C.reaches e₁ e₂`
holds exactly when `e₂` lies in the **future light cone** of `e₁`, reachable by a directed
`≺₀`-chain. This module promotes that bare reachability into a named **cone-field geometry** —
the first-class future/past cones, spacelike separation, and causal diamonds that the corpus's
light-cone reading speaks in (`content/.../lorentzian-causal-settling`). Nothing here is free
data: every cone is a thin predicate over `C.reaches`, and every law is discharged by the
reachability theorems (`reaches_trans`, `reaches_asymm`) the causal settling already proved.

The thesis the whole light-cone slate realizes is **light cone = local closure cone = reachable
future**: the strict cone is `Future C e = C.reaches e ·` and its reflexive closure `ClosedFuture`
is the principal up-set `CausalLe C e ·` of the causal order.

## Main definitions

* `Future` / `Past` — strict causal future/past cones of an event (`C.reaches`).
* `CausalLe` — reflexive causal precedence `x = y ∨ C.reaches x y`; the causal partial order.
* `ClosedFuture` / `ClosedPast` — reflexive cones (principal up-sets / down-sets of `CausalLe`).
* `Spacelike` — causal incomparability: neither event reaches the other.
* `Diamond` / `ClosedDiamond` — the strict/reflexive causal diamonds `I⁺(a) ∩ I⁻(b)`.

## Main results

* `causalLe_refl` / `causalLe_trans` / `causalLe_antisymm` — `CausalLe` is a partial order.
* `future_is_upward_closed` / `past_is_downward_closed` — cones are order-closed.
* `spacelike_symm` — spacelike separation is symmetric.
* `causal_reachability_is_cone_geometry` — the bundled headline: causal reachability induces a
  strict cone geometry obeying the expected order laws.

## References

`content/.../lorentzian-causal-settling/lorentzian-causal-settling.md`;
`content/.../myrheim-meyer-dimension`. Built on `Infomaterial.Relational.Spacetime.Causal.Order`.

## Tags

light cone, causal set, causal order, future cone, spacelike, causal diamond
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.Cone

open Infomaterial.Relational.Spacetime.Causal.Order

variable {E : Type} (C : CausalSet E)

/-! ## (A) The cones -/

/-- Strict causal future of an event: the events reachable by a nonempty causal chain. -/
def Future (e : E) : E → Prop := fun x => C.reaches e x

/-- Strict causal past of an event. -/
def Past (e : E) : E → Prop := fun x => C.reaches x e

/-- Reflexive causal precedence: equality or strict reachability — the causal partial order. -/
def CausalLe (x y : E) : Prop := x = y ∨ C.reaches x y

/-- Reflexive future cone — the principal up-set of `CausalLe` at `e`. -/
def ClosedFuture (e : E) : E → Prop := fun x => CausalLe C e x

/-- Reflexive past cone — the principal down-set of `CausalLe` at `e`. -/
def ClosedPast (e : E) : E → Prop := fun x => CausalLe C x e

/-- Spacelike separation: neither event causally precedes the other. -/
def Spacelike (x y : E) : Prop := ¬ C.reaches x y ∧ ¬ C.reaches y x

/-- The strict causal diamond `I⁺(a) ∩ I⁻(b)`: events strictly after `a` and strictly before `b`. -/
def Diamond (a b : E) : E → Prop := fun x => C.reaches a x ∧ C.reaches x b

/-- The reflexive causal diamond `J⁺(a) ∩ J⁻(b)` — contains the endpoints when `a ≤ b`. -/
def ClosedDiamond (a b : E) : E → Prop := fun x => CausalLe C a x ∧ CausalLe C x b

/-- Direct causal edge: the seed `≺₀` relation before transitive closure (a cone edge, not yet
a proved null generator). -/
def DirectFuture (e : E) : E → Prop := fun x => C.prec0 e x = true

/-! ## (B) `CausalLe` is a partial order -/

/-- `CausalLe` is reflexive. -/
theorem causalLe_refl (x : E) : CausalLe C x x := Or.inl rfl

/-- `CausalLe` is transitive — causal chains compose through the reflexive order. -/
theorem causalLe_trans {x y z : E} (h1 : CausalLe C x y) (h2 : CausalLe C y z) :
    CausalLe C x z := by
  rcases h1 with rfl | r1
  · exact h2
  · rcases h2 with rfl | r2
    · exact Or.inr r1
    · exact Or.inr (C.reaches_trans r1 r2)

/-- `CausalLe` is antisymmetric — no closed timelike curve: mutual precedence forces equality. -/
theorem causalLe_antisymm {x y : E} (h1 : CausalLe C x y) (h2 : CausalLe C y x) :
    x = y := by
  rcases h1 with h1 | r1
  · exact h1
  · rcases h2 with h2 | r2
    · exact h2.symm
    · exact (C.reaches_asymm r1 r2).elim

/-! ## (C) Cone closure laws -/

/-- The strict future cone is transitive (causal future of causal future). -/
theorem future_trans {a b c : E} (h1 : Future C a b) (h2 : Future C b c) :
    Future C a c := C.reaches_trans h1 h2

/-- A strict future cone is upward closed under reflexive causal precedence. -/
theorem future_is_upward_closed {a x y : E} (h1 : Future C a x) (h2 : CausalLe C x y) :
    Future C a y := by
  rcases h2 with rfl | r
  · exact h1
  · exact C.reaches_trans h1 r

/-- A strict past cone is downward closed under reflexive causal precedence. -/
theorem past_is_downward_closed {a x y : E} (h1 : Past C a x) (h2 : CausalLe C y x) :
    Past C a y := by
  rcases h2 with rfl | r
  · exact h1
  · exact C.reaches_trans r h1

/-! ## (D) Spacelike separation -/

/-- Spacelike separation is symmetric. -/
theorem spacelike_symm {x y : E} (h : Spacelike C x y) : Spacelike C y x := ⟨h.2, h.1⟩

/-- A spacelike pair has no left-to-right reachability. -/
theorem spacelike_irreaches_left {x y : E} (h : Spacelike C x y) : ¬ C.reaches x y := h.1

/-- A spacelike pair has no right-to-left reachability. -/
theorem spacelike_irreaches_right {x y : E} (h : Spacelike C x y) : ¬ C.reaches y x := h.2

/-! ## (E) Causal diamonds -/

/-- The strict diamond sits inside the future cone of its lower apex. -/
theorem diamond_subset_future {a b x : E} (h : Diamond C a b x) : Future C a x := h.1

/-- The strict diamond sits inside the past cone of its upper apex. -/
theorem diamond_subset_past {a b x : E} (h : Diamond C a b x) : Past C b x := h.2

/-- When `a` reaches `b`, both endpoints lie in the reflexive diamond `J⁺(a) ∩ J⁻(b)`. -/
theorem diamond_nonempty_of_reaches {a b : E} (h : C.reaches a b) :
    ClosedDiamond C a b a ∧ ClosedDiamond C a b b :=
  ⟨⟨causalLe_refl C a, Or.inr h⟩, ⟨Or.inr h, causalLe_refl C b⟩⟩

/-! ## (F) Boolean/computational bridge

The `MyrheimMeyer` apex count is, definitionally, the sum over events of the strict future-cone
sizes computed on a settled Boolean relation — the geometric reading of "number of causally
ordered pairs" the dimension estimator uses. -/

/-- Boolean strict future cone of a settled relation. -/
def FutureBool (prec : E → E → Bool) (e : E) : E → Bool := fun x => prec e x

/-- Boolean strict past cone of a settled relation. -/
def PastBool (prec : E → E → Bool) (e : E) : E → Bool := fun x => prec x e

/-- The Myrheim–Meyer apex count is the sum of strict future-cone sizes over the event list. -/
theorem apexCount_eq_sum_futureBool_lengths [DecidableEq E]
    (es : List E) (prec : E → E → Bool) :
    Spacetime.Dimension.OrderingFraction.apexCount es prec =
      es.foldl (fun acc e => acc + (es.filter (fun x => (e ≠ x) && prec e x)).length) 0 :=
  rfl

/-! ## (G) The bundled headline -/

/-- **Causal reachability is a strict cone geometry.** The reachability relation of a finite
causal set induces future/past cones, spacelike separation, and causal diamonds obeying the
expected order laws: reflexive, transitive, antisymmetric reflexive precedence; symmetric
spacelike separation; transitive future cones. -/
theorem causal_reachability_is_cone_geometry :
    (∀ x, CausalLe C x x)
    ∧ (∀ x y z, CausalLe C x y → CausalLe C y z → CausalLe C x z)
    ∧ (∀ x y, CausalLe C x y → CausalLe C y x → x = y)
    ∧ (∀ x y, Spacelike C x y → Spacelike C y x)
    ∧ (∀ a b c, Future C a b → Future C b c → Future C a c) :=
  ⟨fun x => causalLe_refl C x,
   fun _ _ _ h1 h2 => causalLe_trans C h1 h2,
   fun _ _ h1 h2 => causalLe_antisymm C h1 h2,
   fun _ _ h => spacelike_symm C h,
   fun _ _ _ h1 h2 => future_trans C h1 h2⟩

end Relational.Spacetime.Causal.Cone
end Infomaterial
