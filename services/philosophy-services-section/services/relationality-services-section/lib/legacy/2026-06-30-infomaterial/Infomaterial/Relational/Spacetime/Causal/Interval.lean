import Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

/-!
# The causal order interval and its past-layer decomposition

The **order interval** of a causal order `prec` between two events `x ≺ y` is the set of events
strictly between them, `I(x,y) = {z : x ≺ z ≺ y}`; its cardinality `|I(x,y)|` is the *abundance*
that grades the pair. Reading the abundance of every past pair `y ≺ x` sorts the causal past of
`x` into **layers** `L_k(x) = {y ≺ x : |I(y,x)| = k}`: layer `0` is the covering relation (the
irreducible links, no event between), layer `k` the pairs separated by exactly `k` intermediate
events. This layered past is the substrate the nonlocal causal-order operators sum over — the
same interval abundance the Myrheim–Meyer estimator reads at `k = 1` (relations) is read at every
`k` here — and the layers **partition** the past: every past event sits in exactly one.

This module supplies the interval, its cardinality, and the past layers, decidably, on a Boolean
causal order over a finite event list (the settled `prec` of `Spacetime.Causal.Order`); the diamond
witness exhibits a concrete layered past.

## Main definitions

* `between` / `intervalCard` — the open order interval `I(x,y)` and its cardinality `|I(x,y)|`.
* `pastLayer` / `layerCount` — the past events `y ≺ x` at interval abundance `k`, and their count.
* `pastCount` — the size of the causal past of `x`.

## Main results

* `mem_pastLayer` — membership in a past layer is `y ≺ x ∧ |I(y,x)| = k`.
* `intervalCard_zero_iff` — abundance `0` is exactly the empty interval (a covering link).
* `diamond_layer_profile` / `diamond_layers_partition_past` — the diamond's layered past
  `(2, 0, 1)` over `k = 0,1,2`, summing to the past size `3`.

## References

`content/.../lorentzian-causal-settling`; reads the causal order of `Spacetime.Causal.Order` and the
apex combinatorics of `Spacetime.Dimension.OrderingFraction`.

## Tags

order interval, causal abundance, past layer, covering relation, causal set
-/

namespace Infomaterial
namespace Relational.Spacetime.Causal.Interval

/-! ## (A) The order interval and its abundance -/

/-- The **open order interval** `I(x,y) = {z : x ≺ z ≺ y}`: the listed events strictly between
`x` and `y` under the causal order `prec`. A `filter` over the event list. -/
def between {E : Type} (es : List E) (prec : E → E → Bool) (x y : E) : List E :=
  es.filter (fun z => prec x z && prec z y)

/-- The **interval abundance** `|I(x,y)|`: the number of events strictly between `x` and `y` —
the grade of the causal pair. -/
def intervalCard {E : Type} (es : List E) (prec : E → E → Bool) (x y : E) : Nat :=
  (between es prec x y).length

/-- An event lies in the interval `I(x,y)` exactly when the order brackets it: `x ≺ z` and
`z ≺ y` (and it is a listed event). -/
theorem mem_between {E : Type} (es : List E) (prec : E → E → Bool) (x y z : E) :
    z ∈ between es prec x y ↔ z ∈ es ∧ prec x z = true ∧ prec z y = true := by
  simp [between, List.mem_filter, Bool.and_eq_true]

/-- **Abundance `0` is the covering relation.** `|I(x,y)| = 0` exactly when no event lies
between `x` and `y` — the pair is an irreducible causal link (layer `0`). -/
theorem intervalCard_zero_iff {E : Type} (es : List E) (prec : E → E → Bool) (x y : E) :
    intervalCard es prec x y = 0 ↔ between es prec x y = [] := by
  simp [intervalCard, List.length_eq_zero_iff]

/-! ## (B) The past layers -/

/-- The size of the **causal past** of `x`: the listed events `y` with `y ≺ x`. -/
def pastCount {E : Type} (es : List E) (prec : E → E → Bool) (x : E) : Nat :=
  (es.filter (fun y => prec y x)).length

/-- The **past layer** `L_k(x)`: the listed past events `y ≺ x` whose interval to `x` has
abundance exactly `k`. Layer `0` is the covering links; layer `k` the pairs with `k`
intermediate events. -/
def pastLayer {E : Type} (es : List E) (prec : E → E → Bool) (x : E) (k : Nat) : List E :=
  es.filter (fun y => prec y x && (intervalCard es prec y x == k))

/-- The **layer count** `|L_k(x)|` — the cardinality of the `k`-th past layer, the abundance
the nonlocal causal operators weight. -/
def layerCount {E : Type} (es : List E) (prec : E → E → Bool) (x : E) (k : Nat) : Nat :=
  (pastLayer es prec x k).length

/-- **Membership in a past layer.** `y ∈ L_k(x)` exactly when `y` is a listed past event of `x`
(`y ≺ x`) whose interval abundance to `x` is `k`. -/
theorem mem_pastLayer {E : Type} (es : List E) (prec : E → E → Bool) (x : E) (k : Nat) (y : E) :
    y ∈ pastLayer es prec x k ↔ y ∈ es ∧ prec y x = true ∧ intervalCard es prec y x = k := by
  simp [pastLayer, List.mem_filter, Bool.and_eq_true, beq_iff_eq]

/-! ## (C) The diamond's layered past

The corpus diamond (`Lorentzian.Spacetime.Dimension.OrderingFraction.diamondPrec`: `0≺1, 0≺2, 0≺3, 1≺3, 2≺3` over
`fourEvents = [0,1,2,3]`) has top event `3` with past `{0,1,2}`. Its intervals to `3`:
`I(1,3) = I(2,3) = ∅` (covering links, layer `0`) and `I(0,3) = {1,2}` (abundance `2`, layer `2`).
So the layered past is `(|L_0|, |L_1|, |L_2|) = (2, 0, 1)`, partitioning the past of size `3`. -/

open Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

/-- **The diamond top event's layer profile** `(|L_0|, |L_1|, |L_2|)(3) = (2, 0, 1)`: two
covering links (`1≺3`, `2≺3`), none at abundance `1`, one at abundance `2` (`0≺3`, bracketed by
`1` and `2`). -/
theorem diamond_layer_profile :
    layerCount fourEvents diamondPrec 3 0 = 2
    ∧ layerCount fourEvents diamondPrec 3 1 = 0
    ∧ layerCount fourEvents diamondPrec 3 2 = 1 := by
  refine ⟨by decide, by decide, by decide⟩

/-- **The layers partition the diamond's past.** `|L_0| + |L_1| + |L_2| = 2 + 0 + 1 = 3` is the
size of the causal past of `3` — every past event sits in exactly one abundance layer. -/
theorem diamond_layers_partition_past :
    layerCount fourEvents diamondPrec 3 0
      + layerCount fourEvents diamondPrec 3 1
      + layerCount fourEvents diamondPrec 3 2
    = pastCount fourEvents diamondPrec 3 := by
  decide

end Relational.Spacetime.Causal.Interval
end Infomaterial
