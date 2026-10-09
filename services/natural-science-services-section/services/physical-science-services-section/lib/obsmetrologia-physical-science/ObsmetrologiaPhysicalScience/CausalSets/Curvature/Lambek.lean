import ObsmetrologiaPhysicalScience.CausalSets.Action.EinsteinHilbertAction
import Obsmetrologia.Calculus.Logic.LambekCalculus

/-!
# Curvature as the Lambek residual defect

Curvature in geometry is a **commutator** — the failure of transport to commute, `[∇_μ, ∇_ν]`. The
Lambek calculus is exactly the algebra in which non-commutativity is *visible*: a non-commutative
product `·` carries **two** residuals, a left `\` and a right `/`, and they coincide precisely when `·`
commutes (`Lambek.commutative_collapses_to_single_implication`). This module proves the full
biconditional the corpus only had one half of — **the two residuals coincide iff the product
commutes** (`residuals_coincide_iff_commutative`) — so the *residual defect* `a\c` vs `c/a` IS the
non-commutativity, the algebraic avatar of curvature, vanishing exactly in the flat (commutative)
regime.

Its geometric instance is the causal order's incidence algebra. The discrete action has a **left**
form (the column Möbius sum `∑_{y ≼ x} μ(y,x)`, retarded — `Lorentzian.CausalSets.Action.EinsteinHilbertAction.localCurvature`)
and a dual **right** form (the row Möbius sum `∑_{x ≼ y} μ(x,y)`, advanced — `rowCurvature`); their
pointwise gap `curvatureDefect` is the left/right defect, the Lambek residual defect read on the
order. It localizes at the causal boundary (the diamond: `+1` at the minimal event, `−1` at the
maximal, `0` inside) and **integrates to zero** — a discrete Bianchi identity
(`total_curvature_defect_zero`), the column and row sums being the two orders of one double sum.

## Main definitions

* `rowCurvature` — the row (advanced) Möbius sum `∑_{x ≼ y} μ(x,y)`, dual to `localCurvature`.
* `curvatureDefect` — the left/right defect `localCurvature − rowCurvature`.

## Main results

* `residuals_coincide_iff_commutative` — the two Lambek residuals coincide iff the product commutes.
* `total_curvature_defect_zero` — `∑_x localCurvature = ∑_x rowCurvature` (discrete Bianchi).
* `total_defect_eq_zero` — the total curvature defect is zero.
* `diamond_curvatureDefect` — the diamond's defect profile `(1, 0, 0, −1)`, boundary-localized.

## References

`content/.../causal-dalembertian`; the Lambek bi-residuation of `Logic.LambekCalculus`, the Möbius
action of `CausalSets.Action.EinsteinHilbertAction` / `CausalSets.Incidence.Mobius`.

## Tags

curvature, Lambek calculus, residual defect, commutator, Bianchi identity, Möbius
-/

namespace Obsmetrologia
namespace CausalSets.Curvature.Lambek

open Obsmetrologia.CausalSets.Incidence.Mobius
open Obsmetrologia.CausalSets.Causal.Interval
open Obsmetrologia.CausalSets.Action.EinsteinHilbertAction
open Obsmetrologia.CausalSets.Dimension.OrderingFraction
open Obsmetrologia.Lambek

/-! ## (A) Flatness is commutativity of the two residuals

The corpus proves commutativity ⟹ residual coincidence. The converse is the missing half: from the
two adjunctions, `dot a b` is the least `c` with `b ≤ a\c`; if `a\c = c/a` that least `c` is also the
least with `dot b a ≤ c`, namely `dot b a`. So coincidence ⟹ commutativity, and the residual defect
is *exactly* the non-commutativity — curvature. -/

/-- **The two Lambek residuals coincide iff the product commutes.** Non-commutativity is precisely
the residual defect `a\c ≠ c/a`: the algebraic commutator that curvature is. The reverse direction is
the corpus's collapse theorem; the forward direction recovers commutativity from coincidence via the
bi-residuation. -/
theorem residuals_coincide_iff_commutative (A : LambekAlgebra) :
    (∀ a c, A.lres a c = A.rres c a) ↔ (∀ a b, A.dot a b = A.dot b a) := by
  constructor
  · intro hres a b
    apply A.le_antisymm
    · apply (A.dot_lres_le_iff a b (A.dot b a)).mpr
      rw [hres a (A.dot b a)]
      exact (A.dot_rres_le_iff b a (A.dot b a)).mp (A.le_refl (A.dot b a))
    · apply (A.dot_lres_le_iff b a (A.dot a b)).mpr
      rw [hres b (A.dot a b)]
      exact (A.dot_rres_le_iff a b (A.dot a b)).mp (A.le_refl (A.dot a b))
  · intro comm
    exact (A.commutative_collapses_to_single_implication comm).1

/-! ## (B) Integer fold algebra -/

variable {E : Type}

/-- A right fold of an additive accumulator is congruent in its summand. -/
theorem foldr_int_congr (L : List E) (f g : E → Int) (h : ∀ y, f y = g y) :
    L.foldr (fun y a => f y + a) 0 = L.foldr (fun y a => g y + a) 0 := by
  induction L with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih, h a]

/-- The all-zero additive fold is `0`. -/
theorem foldr_int_zero (L : List E) : L.foldr (fun _ a => (0 : Int) + a) 0 = 0 := by
  induction L with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; omega

/-- Additive folds split over a pointwise sum. -/
theorem foldr_int_add_split (L : List E) (f g : E → Int) :
    L.foldr (fun y a => (f y + g y) + a) 0
  = L.foldr (fun y a => f y + a) 0 + L.foldr (fun y a => g y + a) 0 := by
  induction L with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; omega

/-- Additive folds split over a pointwise difference. -/
theorem foldr_int_sub_split (L : List E) (f g : E → Int) :
    L.foldr (fun y a => (f y - g y) + a) 0
  = L.foldr (fun y a => f y + a) 0 - L.foldr (fun y a => g y + a) 0 := by
  induction L with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; omega

/-- A filtered additive fold equals the full fold of the masked summand. -/
theorem filter_foldr_eq_mask (L : List E) (p : E → Bool) (w : E → Int) :
    (L.filter p).foldr (fun y a => w y + a) 0
  = L.foldr (fun y a => (if p y = true then w y else 0) + a) 0 := by
  induction L with
  | nil => rfl
  | cons a t ih =>
    rw [List.filter_cons]
    cases h : p a with
    | true => simp [h, ih]
    | false => simp [h, ih]

/-- **Rectangular Fubini for additive double folds.** Summing `g y x` over `Lx` then `Ly` equals
summing over `Ly` then `Lx` — the two orders of one double sum. -/
theorem foldr_rect_swap (Lx Ly : List E) (g : E → E → Int) :
    Lx.foldr (fun x acc => Ly.foldr (fun y a => g y x + a) 0 + acc) 0
  = Ly.foldr (fun y acc => Lx.foldr (fun x a => g y x + a) 0 + acc) 0 := by
  induction Lx with
  | nil =>
    show (0 : Int) = Ly.foldr (fun y acc => ([] : List E).foldr (fun x a => g y x + a) 0 + acc) 0
    rw [foldr_int_congr Ly (fun y => ([] : List E).foldr (fun x a => g y x + a) 0) (fun _ => 0)
          (fun _ => rfl)]
    exact (foldr_int_zero Ly).symm
  | cons x xs ih =>
    show Ly.foldr (fun y a => g y x + a) 0
          + xs.foldr (fun x acc => Ly.foldr (fun y a => g y x + a) 0 + acc) 0
       = Ly.foldr (fun y acc =>
           (g y x + xs.foldr (fun x' a => g y x' + a) 0) + acc) 0
    rw [foldr_int_add_split Ly (fun y => g y x) (fun y => xs.foldr (fun x' a => g y x' + a) 0), ← ih]

/-! ## (C) The left and right causal curvature -/

variable [DecidableEq E]

/-- The **row (advanced) curvature** at `x`: the row Möbius sum `∑_{x ≼ y} μ(x,y)` over the causal
*future*. The dual of `localCurvature` (the column/retarded sum); the right residual to its left. -/
def rowCurvature (es : List E) (prec : E → E → Bool) (x : E) : Int :=
  (es.filter (fun y => leqB prec x y)).foldr (fun y acc => mobius es prec x y + acc) 0

/-- The **curvature defect** at `x`: the left/right (retarded/advanced) gap
`localCurvature x − rowCurvature x`. The Lambek residual defect read on the causal order — the
discrete commutator that curvature is. -/
def curvatureDefect (es : List E) (prec : E → E → Bool) (x : E) : Int :=
  localCurvature es prec x - rowCurvature es prec x

/-! ## (D) The discrete Bianchi identity -/

/-- `localCurvature` as a masked full fold (no filter). -/
theorem localCurvature_mask (es : List E) (prec : E → E → Bool) (x : E) :
    localCurvature es prec x
  = es.foldr (fun y a => (if leqB prec y x = true then mobius es prec y x else 0) + a) 0 := by
  unfold localCurvature
  exact filter_foldr_eq_mask es (fun y => leqB prec y x) (fun y => mobius es prec y x)

/-- `rowCurvature` as a masked full fold (no filter). -/
theorem rowCurvature_mask (es : List E) (prec : E → E → Bool) (x : E) :
    rowCurvature es prec x
  = es.foldr (fun y a => (if leqB prec x y = true then mobius es prec x y else 0) + a) 0 := by
  unfold rowCurvature
  exact filter_foldr_eq_mask es (fun y => leqB prec x y) (fun y => mobius es prec x y)

/-- **The discrete Bianchi identity.** The total left (column) curvature equals the total right (row)
curvature: `∑_x localCurvature = ∑_x rowCurvature`. Both are the two orders of the one double sum of
`μ(y,x)` over causal pairs `y ≼ x`; rectangular Fubini swaps them. -/
theorem total_curvature_defect_zero (es : List E) (prec : E → E → Bool) :
    es.foldr (fun x a => localCurvature es prec x + a) 0
  = es.foldr (fun x a => rowCurvature es prec x + a) 0 := by
  rw [foldr_int_congr es (fun x => localCurvature es prec x)
        (fun x => es.foldr (fun y a => (if leqB prec y x = true then mobius es prec y x else 0) + a) 0)
        (fun x => localCurvature_mask es prec x),
      foldr_int_congr es (fun x => rowCurvature es prec x)
        (fun x => es.foldr (fun y a => (if leqB prec x y = true then mobius es prec x y else 0) + a) 0)
        (fun x => rowCurvature_mask es prec x),
      foldr_rect_swap es es (fun y x => if leqB prec y x = true then mobius es prec y x else 0)]

/-- **The total curvature defect is zero** — the integrated left/right (retarded/advanced) gap
vanishes, a discrete Bianchi/Gauss–Bonnet: curvature is boundary-localized and sums to nothing. -/
theorem total_defect_eq_zero (es : List E) (prec : E → E → Bool) :
    es.foldr (fun x a => curvatureDefect es prec x + a) 0 = 0 := by
  show es.foldr (fun x a => (localCurvature es prec x - rowCurvature es prec x) + a) 0 = 0
  rw [foldr_int_sub_split es (fun x => localCurvature es prec x) (fun x => rowCurvature es prec x),
      total_curvature_defect_zero]
  omega

/-! ## (E) The diamond — curvature at the causal boundary -/

/-- **The diamond's row-curvature profile** `(0, 0, 0, 1)`: the advanced (row) Möbius sum is `1` at
the maximal event `3` and `0` elsewhere — the future-boundary (maximality) indicator, dual to
`localCurvature`'s past-boundary profile `(1,0,0,0)`. -/
theorem diamond_rowCurvature :
    rowCurvature fourEvents diamondPrec 0 = 0
    ∧ rowCurvature fourEvents diamondPrec 1 = 0
    ∧ rowCurvature fourEvents diamondPrec 2 = 0
    ∧ rowCurvature fourEvents diamondPrec 3 = 1 := by
  refine ⟨by decide, by decide, by decide, by decide⟩

/-- **The diamond's curvature-defect profile** `(1, 0, 0, −1)`: the left/right defect is `+1` at the
minimal (past-boundary) event, `−1` at the maximal (future-boundary) event, and `0` in the interior.
Curvature lives on the causal boundary. -/
theorem diamond_curvatureDefect :
    curvatureDefect fourEvents diamondPrec 0 = 1
    ∧ curvatureDefect fourEvents diamondPrec 1 = 0
    ∧ curvatureDefect fourEvents diamondPrec 2 = 0
    ∧ curvatureDefect fourEvents diamondPrec 3 = -1 := by
  refine ⟨by decide, by decide, by decide, by decide⟩

/-- **The diamond's total curvature defect is zero** — `1 + 0 + 0 + (−1) = 0`, the boundary terms
cancel (discrete Bianchi at the diamond). -/
theorem diamond_total_defect_zero :
    curvatureDefect fourEvents diamondPrec 0
    + curvatureDefect fourEvents diamondPrec 1
    + curvatureDefect fourEvents diamondPrec 2
    + curvatureDefect fourEvents diamondPrec 3 = 0 := by decide

end CausalSets.Curvature.Lambek
end Obsmetrologia
