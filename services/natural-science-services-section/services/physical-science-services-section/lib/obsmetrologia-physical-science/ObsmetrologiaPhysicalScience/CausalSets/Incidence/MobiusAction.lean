import ObsmetrologiaPhysicalScience.CausalSets.Operator.Coefficients
import ObsmetrologiaPhysicalScience.CausalSets.Action.EinsteinHilbertAction

/-!
# The Benincasa–Dowker action is the Möbius action, under layer-constancy

The internal Benincasa–Dowker operator ([CausalSets.Operator.BenincasaDowker.lean](CausalSets.Operator.BenincasaDowker.lean)) posits a fixed
per-element coefficient stencil `c(k)` graded by interval abundance; the discrete action
([CausalSets.Action.EinsteinHilbertAction.lean](CausalSets.Action.EinsteinHilbertAction.lean)) sums the incidence Möbius weights. They were compared
only pointwise and over the reals (`dalembertianStrict_eq_BD`). This module wires them at the **action
level, over `ℤ`**, and closes the named *BDG-vs-Möbius comparison*: the intrinsic Möbius action equals
the public layer-grouped BD action exactly when the Möbius weights are layer-constant.

The bridge is the endogenous coefficient ([CausalSets.Operator.Coefficients.lean](CausalSets.Operator.Coefficients.lean)):
`endoCoeff(x,k) = ∑_{y ∈ L_k(x)} μ(y,x)` is the Möbius inverse grouped by abundance, and
`strictAction x = ∑_k endoCoeff(x,k)` already reconstructs the action. Here we prove, for an arbitrary
layer-constant causal set (not just the diamond), that the endogenous coefficient **factors** as the
public per-element coefficient times the layer population,

  `endoCoeff(x,k) = c(k) · |L_k(x)|`   (`endoCoeff_layerConstant`),

so the Möbius action *is* the layer-grouped Benincasa–Dowker action with the public stencil,

  `strictAction x = ∑_{k} c(k) · |L_k(x)| = bdLayerAction c x`   (`strictAction_eq_bdLayerAction`).

The reflexive Einstein–Hilbert action adds only the trivial diagonal `μ(x,x)=1`: on the diamond
`bdAction = |events| + ∑_x strictAction x` (`diamond_bdAction_eq_count_add_strict`), so the full action
decomposes as event-count (diagonal) plus the layer-grouped BD curvature. The diamond's public stencil
`cDiamond` is recovered, not fitted (`diamond_strictAction_eq_bd`).

## Main definitions

* `bdLayerAction` — the layer-grouped Benincasa–Dowker action `∑_k c(k) · |L_k(x)|` with stencil `c`.

## Main results

* `endoCoeff_layerConstant` — `endoCoeff(x,k) = c(k) · |L_k(x)|` under layer-constancy (general).
* `strictAction_eq_bdLayerAction` — the Möbius action is the layer-grouped BD action (general).
* `diamond_strictAction_eq_bd` / `diamond_bdAction_eq_count_add_strict` — the diamond carrier.

## References

`content/.../causal-dalembertian`; the endogenous coefficients of
`Lorentzian.EndogenousCoefficients`, the stencil of `Lorentzian.BenincasaDowker`, the action of
`CausalSets.Action.EinsteinHilbertAction`, the layers of `CausalSets.Causal.Interval`.

## Tags

Benincasa–Dowker action, Möbius inverse, layer-constancy, endogenous coefficient, discrete action
-/

namespace Obsmetrologia
namespace CausalSets.Incidence.MobiusAction

open Obsmetrologia.CausalSets.Incidence.Mobius
open Obsmetrologia.CausalSets.Causal.Interval
open Obsmetrologia.CausalSets.Operator.BenincasaDowker
open Obsmetrologia.CausalSets.Operator.Coefficients
open Obsmetrologia.CausalSets.Action.EinsteinHilbertAction
open Obsmetrologia.CausalSets.Dimension.OrderingFraction

variable {E : Type}

/-! ## (A) A masked Möbius sum is the coefficient times the layer population -/

/-- **A layer-constant masked sum collapses to coefficient times count.** Over a list `L` whose every
element's weight is its key's coefficient (`w y = c (key y)`), the sum of `w` masked to a single key
`k` is `c(k)` times the number of elements with that key. The abstract heart of the endogenous
coefficient's factoring. -/
theorem masked_sum_layerConstant (L : List E) (w : E → Int) (key : E → Nat) (c : Nat → Int) (k : Nat)
    (h : ∀ y ∈ L, w y = c (key y)) :
    L.foldr (fun y acc => (if key y = k then w y else 0) + acc) 0
    = c k * Int.ofNat (L.countP (fun y => key y == k)) := by
  induction L with
  | nil => simp
  | cons a t ih =>
    have ht : ∀ y ∈ t, w y = c (key y) := fun y hy => h y (List.mem_cons_of_mem a hy)
    rw [List.foldr_cons, ih ht, List.countP_cons]
    by_cases hk : key a = k
    · have hwa : w a = c k := by rw [h a (List.mem_cons_self ..), hk]
      have hba : (key a == k) = true := beq_iff_eq.mpr hk
      rw [if_pos hk, hwa]
      simp only [hba, if_true]
      rw [show Int.ofNat (t.countP (fun y => key y == k) + 1)
            = Int.ofNat (t.countP (fun y => key y == k)) + 1 from rfl,
          Int.mul_add, Int.mul_one]
      omega
    · have hba : (key a == k) = false := by
        cases hb : (key a == k) with
        | true => exact absurd (beq_iff_eq.mp hb) hk
        | false => rfl
      rw [if_neg hk, hba]
      simp

/-! ## (B) The layer count as a filtered count -/

/-- The past-layer population is the abundance-`k` count over the strict past:
`|L_k(x)| = #{ y ≺ x : |I(y,x)| = k }`. -/
theorem layerCount_eq_countP [DecidableEq E] (es : List E) (prec : E → E → Bool) (x : E) (k : Nat) :
    layerCount es prec x k
    = (es.filter (fun y => prec y x)).countP (fun y => intervalCard es prec y x == k) := by
  unfold layerCount pastLayer
  rw [← List.countP_eq_length_filter, List.countP_filter]
  congr 1
  funext y
  exact Bool.and_comm _ _

/-! ## (C) The endogenous coefficient factors through the public stencil -/

variable [DecidableEq E]

/-- **The endogenous coefficient factors as stencil times layer population.** When the strict-past
Möbius weights are layer-constant (`μ(y,x) = c(|I(y,x)|)`), the Möbius-inverse layer aggregate
`endoCoeff(x,k)` equals the public per-element coefficient `c(k)` times the layer population `|L_k(x)|`.
The general form of `CausalSets.Operator.Coefficients.diamond_endoCoeff_factors`. -/
theorem endoCoeff_layerConstant (es : List E) (prec : E → E → Bool) (c : Nat → Int) (x : E) (k : Nat)
    (hlc : ∀ y, prec y x = true → mobius es prec y x = c (intervalCard es prec y x)) :
    endoCoeff es prec x k = c k * Int.ofNat (layerCount es prec x k) := by
  rw [layerCount_eq_countP]
  unfold endoCoeff
  exact masked_sum_layerConstant (es.filter (fun y => prec y x)) (fun y => mobius es prec y x)
    (fun y => intervalCard es prec y x) c k
    (fun y hy => hlc y (List.mem_filter.mp hy).2)

/-! ## (D) The Möbius action is the layer-grouped Benincasa–Dowker action -/

/-- The **layer-grouped Benincasa–Dowker action** at `x` with stencil `c`: `∑_{k} c(k) · |L_k(x)|`,
the public coefficients weighted by the poset's own layer populations. -/
def bdLayerAction (es : List E) (prec : E → E → Bool) (c : Nat → Int) (x : E) : Int :=
  rangeSumZ (fun k => c k * Int.ofNat (layerCount es prec x k)) (es.length + 1)

/-- **The Möbius action is the Benincasa–Dowker layer action (under layer-constancy).**
`strictAction x = ∑_k c(k) · |L_k(x)|` — the intrinsic column Möbius sum equals the public
layer-grouped BD action exactly when the Möbius weights are layer-constant. This is the
BDG-vs-Möbius comparison at the action level, over `ℤ`: the endogenous `endo_reconstructs_action`
regrouping with the public stencil recovered via `endoCoeff_layerConstant`. -/
theorem strictAction_eq_bdLayerAction (es : List E) (prec : E → E → Bool) (c : Nat → Int) (x : E)
    (hlc : ∀ y, prec y x = true → mobius es prec y x = c (intervalCard es prec y x)) :
    strictAction es prec x = bdLayerAction es prec c x := by
  rw [endo_reconstructs_action]
  unfold bdLayerAction
  exact rangeSumZ_congr _ _ _ (fun k => endoCoeff_layerConstant es prec c x k hlc)

/-! ## (E) The diamond carrier -/

/-- **The diamond's Möbius action is its Benincasa–Dowker layer action.** At the apex, the strict
Möbius action equals the layer-grouped BD action with the public stencil `cDiamond` — the stencil is
recovered from the poset, not fitted. -/
theorem diamond_strictAction_eq_bd :
    strictAction fourEvents diamondPrec 3 = bdLayerAction fourEvents diamondPrec cDiamond 3 :=
  strictAction_eq_bdLayerAction fourEvents diamondPrec cDiamond 3 diamond_layer_constant

/-- **The diamond's Einstein–Hilbert action decomposes as diagonal plus Möbius action.**
`bdAction = |events| + ∑_x strictAction x`: the reflexive EH action is the event count (the trivial
diagonal `μ(x,x)=1`) plus the strict-past Möbius action, whose apex term is the layer-grouped BD
curvature. -/
theorem diamond_bdAction_eq_count_add_strict :
    bdAction fourEvents diamondPrec
    = Int.ofNat fourEvents.length
      + (strictAction fourEvents diamondPrec 0 + strictAction fourEvents diamondPrec 1
         + strictAction fourEvents diamondPrec 2 + strictAction fourEvents diamondPrec 3) := by
  decide

/-! ## (F) The bundled headline -/

/-- **BDG–Möbius action wiring.** The internal Benincasa–Dowker stencil and the incidence Möbius
action are one object at the action level, over `ℤ`:

* (factoring) `endoCoeff(x,k) = c(k) · |L_k(x)|` under layer-constancy (`endoCoeff_layerConstant`);
* (comparison) `strictAction x = ∑_k c(k) · |L_k(x)| = bdLayerAction c x`
  (`strictAction_eq_bdLayerAction`);
* (diamond) the public stencil `cDiamond` is recovered, and `bdAction = |events| + ∑_x strictAction x`.

The BD operator's value on the unit field is the integer layer-grouped action. -/
theorem bdg_mobius_action_wiring (es : List E) (prec : E → E → Bool) (c : Nat → Int) (x : E)
    (hlc : ∀ y, prec y x = true → mobius es prec y x = c (intervalCard es prec y x)) :
    (∀ k, endoCoeff es prec x k = c k * Int.ofNat (layerCount es prec x k))
    ∧ strictAction es prec x = bdLayerAction es prec c x :=
  ⟨fun k => endoCoeff_layerConstant es prec c x k hlc,
   strictAction_eq_bdLayerAction es prec c x hlc⟩

end CausalSets.Incidence.MobiusAction
end Obsmetrologia
