import Infomaterial.Relational.Spacetime.Operator.BenincasaDowker

/-!
# Endogenous Benincasa–Dowker coefficients from the Möbius inverse

The standard route to a Benincasa–Dowker operator posits a coefficient sequence `c(k)` and *fits* it
to a target manifold dimension `d` (the `(1,−2,1)` of 2D, the `(1,−9,16,−8)` of 4D). This module takes
the opposite, endogenous route: take the causal order itself, compute its incidence-algebra **Möbius
inverse** `μ(y,x)`, and **group those inverse weights by past-layer abundance** `|I(y,x)|`. The
resulting per-layer aggregate `endoCoeff(x,k) = ∑_{y ∈ L_k(x)} μ(y,x)` is read straight off the poset
— no dimension parameter enters.

The payoff is a reconstruction with no fit: the strict-past discrete action is *exactly* the sum of
the endogenous layer coefficients over the abundance layers (`endo_reconstructs_action`). Curvature is
endogenous to the poset. At the diamond the endogenous layer coefficients are `(−2, 0, +1)` and factor
through the posited layer-constancy coefficients `cDiamond` as `endoCoeff(x,k) = c(k)·|L_k(x)|`
(`diamond_endoCoeff_factors`) — the posited `c` is *recovered* as the per-element factor, not assumed.

## Main definitions

* `rangeSumZ` — the bounded layer sum `∑_{k<n} f(k)`.
* `strictAction` — the strict-past column Möbius sum `∑_{y ≺ x} μ(y,x)`, the discrete action at `x`.
* `endoCoeff` — the endogenous layer coefficient `∑_{y ∈ L_k(x)} μ(y,x)`, the Möbius inverse grouped
  by abundance.

## Main results

* `sum_by_key` — a weighted list sum regroups as the layer sum of its per-key masked sums.
* `endo_reconstructs_action` — `strictAction x = ∑_k endoCoeff(x,k)`: the action is the sum of the
  endogenous, dimension-free layer coefficients.
* `diamond_endoCoeff` / `diamond_endoCoeff_factors` — the diamond's endogenous coefficients `(−2,0,1)`
  and their factoring through the posited `cDiamond`.

## References

`content/.../causal-dalembertian/content/sprinkling-average`; the Möbius inverse of
`Spacetime.Incidence.Mobius`, the abundance layers of `Spacetime.Causal.Interval`, the posited
coefficients of `Lorentzian.BenincasaDowker`.

## Tags

Benincasa–Dowker, Möbius inverse, endogenous coefficient, past layer, discrete action
-/

namespace Infomaterial
namespace Relational.Spacetime.Operator.Coefficients

open Infomaterial.Relational.Spacetime.Incidence.Mobius
open Infomaterial.Relational.Spacetime.Causal.Interval
open Infomaterial.Relational.Spacetime.Operator.BenincasaDowker
open Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

variable {E : Type}

/-! ## (A) The bounded layer sum over `Int` -/

/-- The **bounded layer sum** `∑_{k<n} f(k)` of an integer-valued layer function. -/
def rangeSumZ (f : Nat → Int) : Nat → Int
  | 0 => 0
  | n + 1 => rangeSumZ f n + f n

/-- The layer sum of the zero function is `0`. -/
theorem rangeSumZ_zero (n : Nat) : rangeSumZ (fun _ => (0 : Int)) n = 0 := by
  induction n with
  | zero => rfl
  | succ m ih => show rangeSumZ (fun _ => (0 : Int)) m + 0 = 0; rw [ih, Int.add_zero]

/-- The layer sum is congruent in its layer function. -/
theorem rangeSumZ_congr (f g : Nat → Int) (n : Nat) (h : ∀ k, f k = g k) :
    rangeSumZ f n = rangeSumZ g n := by
  induction n with
  | zero => rfl
  | succ m ih => show rangeSumZ f m + f m = rangeSumZ g m + g m; rw [ih, h m]

/-- The layer sum is additive in its layer function. -/
theorem rangeSumZ_add (f g : Nat → Int) (n : Nat) :
    rangeSumZ (fun k => f k + g k) n = rangeSumZ f n + rangeSumZ g n := by
  induction n with
  | zero => rfl
  | succ m ih =>
    show rangeSumZ (fun k => f k + g k) m + (f m + g m)
       = (rangeSumZ f m + f m) + (rangeSumZ g m + g m)
    rw [ih]; omega

/-- A single-hit indicator layer function sums to `0` over a range below its hit. -/
theorem rangeSumZ_indicator_zero (m : Nat) (v : Int) :
    ∀ n, n ≤ m → rangeSumZ (fun k => if m = k then v else 0) n = 0 := by
  intro n
  induction n with
  | zero => intro _; rfl
  | succ p ih =>
    intro hle
    show rangeSumZ (fun k => if m = k then v else 0) p + (if m = p then v else 0) = 0
    rw [if_neg (show m ≠ p by omega), ih (show p ≤ m by omega), Int.add_zero]

/-- A single-hit indicator layer function sums to its value over any range containing the hit. -/
theorem rangeSumZ_single (m : Nat) (v : Int) :
    ∀ n, m < n → rangeSumZ (fun k => if m = k then v else 0) n = v := by
  intro n
  induction n with
  | zero => intro h; exact absurd h (Nat.not_lt_zero m)
  | succ p ih =>
    intro h
    show rangeSumZ (fun k => if m = k then v else 0) p + (if m = p then v else 0) = v
    have hcase : m < p ∨ m = p := by omega
    rcases hcase with hlt | heq
    · rw [if_neg (show m ≠ p by omega), ih hlt, Int.add_zero]
    · subst heq
      rw [if_pos rfl, rangeSumZ_indicator_zero m v m (Nat.le_refl m), Int.zero_add]

/-! ## (B) Grouping a weighted sum by an abundance key -/

/-- **Regrouping a weighted list sum by a key.** A weight `w` summed over a list equals the layer sum
(over `k < n`) of its per-key masked sums, provided every element's key is below `n`. With the key the
interval abundance and the weight the Möbius value, this is the statement that the discrete action
decomposes into its abundance-layer contributions. -/
theorem sum_by_key (L : List E) (w : E → Int) (key : E → Nat) (n : Nat) :
    (∀ y ∈ L, key y < n) →
    L.foldr (fun y acc => w y + acc) 0
    = rangeSumZ (fun k => L.foldr (fun y acc => (if key y = k then w y else 0) + acc) 0) n := by
  induction L with
  | nil =>
    intro _
    have h0 : rangeSumZ
        (fun k => ([] : List E).foldr (fun y acc => (if key y = k then w y else 0) + acc) 0) n = 0 := by
      have he : (fun k => ([] : List E).foldr (fun y acc => (if key y = k then w y else 0) + acc) 0)
              = (fun _ => (0 : Int)) := by funext k; rfl
      rw [he]; exact rangeSumZ_zero n
    rw [h0]; rfl
  | cons a t ih =>
    intro hbound
    have hb : ∀ y ∈ t, key y < n := fun y hy => hbound y (List.mem_cons_of_mem a hy)
    have step1 : ∀ k, (a :: t).foldr (fun y acc => (if key y = k then w y else 0) + acc) 0
                  = (t.foldr (fun y acc => (if key y = k then w y else 0) + acc) 0)
                    + (if key a = k then w a else 0) := by
      intro k; rw [List.foldr_cons]; omega
    rw [List.foldr_cons, rangeSumZ_congr _ _ n step1, rangeSumZ_add, ← ih hb,
        rangeSumZ_single (key a) (w a) n (hbound a (List.mem_cons_self ..))]
    omega

/-! ## (C) The endogenous coefficients -/

variable [DecidableEq E]

/-- The **strict-past discrete action** at `x`: the column Möbius sum over the strict causal past,
`∑_{y ≺ x} μ(y,x)`. The nonlocal (layer-decomposable) part of the local curvature `□1(x)`. -/
def strictAction (es : List E) (prec : E → E → Bool) (x : E) : Int :=
  (es.filter (fun y => prec y x)).foldr (fun y acc => mobius es prec y x + acc) 0

/-- The **endogenous Benincasa–Dowker coefficient** at abundance `k`: the Möbius inverse weights of
the strict past, masked to the layer `L_k(x)` and summed, `∑_{y ≺ x, |I(y,x)|=k} μ(y,x)`. Read
straight off the poset — no dimension parameter. -/
def endoCoeff (es : List E) (prec : E → E → Bool) (x : E) (k : Nat) : Int :=
  (es.filter (fun y => prec y x)).foldr
    (fun y acc => (if intervalCard es prec y x = k then mobius es prec y x else 0) + acc) 0

/-- **The discrete action is the sum of the endogenous layer coefficients.**
`strictAction x = ∑_{k} endoCoeff(x,k)` — the column Möbius sum reconstructs exactly as the sum, over
abundance layers, of the Möbius inverse grouped by abundance. Curvature is endogenous to the poset;
no coefficient is fitted to a dimension. -/
theorem endo_reconstructs_action (es : List E) (prec : E → E → Bool) (x : E) :
    strictAction es prec x = rangeSumZ (endoCoeff es prec x) (es.length + 1) := by
  have bound : ∀ y ∈ (es.filter (fun y => prec y x)),
      (fun y => intervalCard es prec y x) y < es.length + 1 := by
    intro y _
    have hle : intervalCard es prec y x ≤ es.length := by
      unfold intervalCard between
      exact List.length_filter_le _ _
    show intervalCard es prec y x < es.length + 1
    omega
  exact sum_by_key (es.filter (fun y => prec y x)) (fun y => mobius es prec y x)
    (fun y => intervalCard es prec y x) (es.length + 1) bound

/-! ## (D) The diamond — endogenous coefficients, recovered

The diamond apex `3` has strict past `{0,1,2}` with Möbius weights `μ(0,3)=+1` (abundance `2`),
`μ(1,3)=μ(2,3)=−1` (abundance `0`). Grouping by abundance gives endogenous coefficients `(−2,0,+1)`,
summing to the strict action `−1`. -/

/-- **The diamond's endogenous coefficients** `(−2, 0, +1)`: the abundance-`0` layer (two covering
links, each `μ=−1`) aggregates to `−2`, the abundance-`2` layer (`μ=+1`) to `+1`. Read off the poset's
Möbius inverse, with no dimension input. -/
theorem diamond_endoCoeff :
    endoCoeff fourEvents diamondPrec 3 0 = -2
    ∧ endoCoeff fourEvents diamondPrec 3 1 = 0
    ∧ endoCoeff fourEvents diamondPrec 3 2 = 1 := by
  refine ⟨by decide, by decide, by decide⟩

/-- **The diamond's action reconstructs from its endogenous coefficients** `−2 + 0 + 1 = −1`. The
strict-past column Möbius sum is the sum of the endogenously-grouped Möbius weights. -/
theorem diamond_action_is_layer_sum :
    strictAction fourEvents diamondPrec 3
    = rangeSumZ (endoCoeff fourEvents diamondPrec 3) 3 := by decide

/-- **The endogenous coefficients factor through the posited layer-constancy coefficients.**
`endoCoeff(x,k) = cDiamond(k) · |L_k(x)|`: the endogenous Möbius grouping *recovers* the posited
per-element coefficient `cDiamond` as the layer-averaged factor — the posited `c` is read off the
poset, not assumed. -/
theorem diamond_endoCoeff_factors :
    endoCoeff fourEvents diamondPrec 3 0
      = cDiamond 0 * Int.ofNat (layerCount fourEvents diamondPrec 3 0)
    ∧ endoCoeff fourEvents diamondPrec 3 2
      = cDiamond 2 * Int.ofNat (layerCount fourEvents diamondPrec 3 2) := by
  refine ⟨by decide, by decide⟩

end Relational.Spacetime.Operator.Coefficients
end Infomaterial
