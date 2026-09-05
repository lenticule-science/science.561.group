import Infomaterial.Relational.Spacetime.Curvature.Lambek

/-!
# The direction-resolved curvature tensor

The scalar [Lambek curvature defect](Spacetime.Curvature.Lambek.lean) `localCurvature − rowCurvature` is a
**trace**: it collapses a two-index object. This module exposes that object — the curvature **tensor**
resolved along causal directions. At an event `x` and a *direction event* `y`, the left/right residual
defect of the incidence Möbius is

  `curvatureTensor x y = μ(y,x) − μ(x,y)`,

the retarded weight (`y` in the past cone, `μ(y,x)`) minus the advanced weight (`y` in the future
cone, `μ(x,y)`). Off the cone of `x` both vanish (`mobius_zero_of_not_above`), so the tensor is
supported exactly on `x`'s past ∪ future — the discrete tangent directions of `ConeField`. It is
**antisymmetric** (`curvatureTensor x y = −curvatureTensor y x`), the hallmark of a curvature 2-form,
and:

* its **row trace** over directions is the scalar defect (`tensor_row_trace`): the scalar curvature is
  the trace of the directional tensor, exactly as `R` is the trace of `Ric`;
* its **total** over all index pairs is zero (`tensor_total_zero`) — antisymmetry forced through
  rectangular Fubini, a conservation law sharper than the scalar Bianchi identity.

The symmetric companion `symCurvature x y = μ(y,x) + μ(x,y)` has trace `∑_y symCurvature x y =
localCurvature x + rowCurvature x` — the `+`-trace where the antisymmetric defect is the `−`-trace
(the two gradings of the Möbius double sum). What is **green** is purely the incidence-algebra
**identity** `∑_x (∑_y symCurvature x y) = 2·bdAction` (`total_ricciScalar_eq_two_bdAction`): the
symmetric Möbius trace totals to twice the column-Möbius-sum total.

**INTERPRETATION (conjectural, NOT proved — frontier).** Calling `symCurvature`'s trace a *Ricci
scalar*, `curvatureTensor` a *curvature 2-form*, `bdAction` the *Einstein–Hilbert action*, and the
identity above an *`S ↔ R` relation* is a geometric reading that is **only justified by a continuum
limit that is not established here** (there is no Lorentzian manifold, no metric, no `√g` in this
development). The names are aspirational; the theorems below are exact statements about Möbius incidence
sums on a finite poset, and *only those statements are green*. The Riemannian Ricci scalar `R` and the
`⟨S⟩ → −¼∫R√g` continuum law remain genuinely open.

## Main definitions

* `curvatureTensor` — the antisymmetric directional defect `μ(y,x) − μ(x,y)`.
* `symCurvature` — the symmetric (Ricci-type) part `μ(y,x) + μ(x,y)`.
* `ricciScalar` — the discrete Ricci scalar, the symmetric trace `∑_y symCurvature x y`.

## Main results

* `curvatureTensor_antisymm` / `curvatureTensor_diag` — antisymmetry and vanishing diagonal.
* `curvature_decomposition` — `sym + antisym = 2μ`, the symmetric/antisymmetric split.
* `tensor_row_trace` — `∑_y curvatureTensor x y = curvatureDefect x` (scalar = trace of tensor).
* `tensor_total_zero` — the tensor sums to zero over all pairs (antisymmetric conservation).
* `ricciScalar_eq` — the Ricci scalar is `localCurvature + rowCurvature` (retarded + advanced).
* `ricci_defect_bigrading` — scalar and defect are the two gradings: `sum = 2·local`, `diff = 2·row`.
* `total_ricciScalar_eq_two_bdAction` — `∑_x ricciScalar x = 2·bdAction` (the discrete `S ↔ R`).

## References

`content/.../causal-dalembertian/content/lambek-curvature`; the scalar defect of
`Spacetime.Curvature.Lambek`, the Möbius vanishing of `Spacetime.Incidence.Mobius`, the cones of
`Lorentzian.ConeField`.

## Tags

curvature tensor, Ricci, antisymmetric, residual defect, trace, Möbius, Bianchi
-/

namespace Infomaterial
namespace Relational.Spacetime.Curvature.Ricci

open Infomaterial.Relational.Spacetime.Incidence.Mobius
open Infomaterial.Relational.Spacetime.Action.EinsteinHilbertAction
open Infomaterial.Relational.Spacetime.Curvature.Lambek
open Infomaterial.Relational.Spacetime.Dimension.OrderingFraction

variable {E : Type}

/-! ## (A) Fold helpers and off-cone vanishing -/

/-- An additive fold of a negated summand is the negation of the fold. -/
theorem foldr_int_neg (L : List E) (f : E → Int) :
    L.foldr (fun y a => (- f y) + a) 0 = - L.foldr (fun y a => f y + a) 0 := by
  induction L with
  | nil => rfl
  | cons a t ih => simp only [List.foldr_cons, ih]; omega

variable [DecidableEq E]

/-- **The Möbius value vanishes off the reflexive cone.** `leqB prec a b = false` (neither `a = b`
nor `a ≺ b`) forces `μ(a,b) = 0`. -/
theorem mobius_zero_of_not_leqB (es : List E) (prec : E → E → Bool) (a b : E)
    (h : leqB prec a b = false) : mobius es prec a b = 0 := by
  unfold leqB at h
  rw [Bool.or_eq_false_iff] at h
  exact mobius_zero_of_not_above es prec a b (of_decide_eq_false h.1) h.2

/-- `localCurvature` summed over the **full** event list (the off-cone terms are `μ = 0`). -/
theorem localCurvature_full (es : List E) (prec : E → E → Bool) (x : E) :
    localCurvature es prec x = es.foldr (fun y a => mobius es prec y x + a) 0 := by
  rw [localCurvature_mask]
  apply foldr_int_congr
  intro y
  split
  · rfl
  · rename_i h
    simp only [Bool.not_eq_true] at h
    rw [mobius_zero_of_not_leqB es prec y x h]

/-- `rowCurvature` summed over the **full** event list (the off-cone terms are `μ = 0`). -/
theorem rowCurvature_full (es : List E) (prec : E → E → Bool) (x : E) :
    rowCurvature es prec x = es.foldr (fun y a => mobius es prec x y + a) 0 := by
  rw [rowCurvature_mask]
  apply foldr_int_congr
  intro y
  split
  · rfl
  · rename_i h
    simp only [Bool.not_eq_true] at h
    rw [mobius_zero_of_not_leqB es prec x y h]

/-! ## (B) The curvature tensor -/

/-- The **directional curvature tensor**: the retarded minus advanced Möbius weight between `x` and a
direction event `y`, `μ(y,x) − μ(x,y)`. The left/right Lambek residual defect resolved at a pair;
supported on the causal cone of `x`. -/
def curvatureTensor (es : List E) (prec : E → E → Bool) (x y : E) : Int :=
  mobius es prec y x - mobius es prec x y

/-- The **symmetric (Ricci-type) curvature** `μ(y,x) + μ(x,y)` — the symmetric companion of
`curvatureTensor`. -/
def symCurvature (es : List E) (prec : E → E → Bool) (x y : E) : Int :=
  mobius es prec y x + mobius es prec x y

/-- **The curvature tensor is antisymmetric.** `curvatureTensor x y = −curvatureTensor y x` — the
hallmark of a curvature 2-form. -/
theorem curvatureTensor_antisymm (es : List E) (prec : E → E → Bool) (x y : E) :
    curvatureTensor es prec x y = - curvatureTensor es prec y x := by
  unfold curvatureTensor; omega

/-- **The diagonal vanishes.** `curvatureTensor x x = 0` — no curvature along the trivial direction. -/
theorem curvatureTensor_diag (es : List E) (prec : E → E → Bool) (x : E) :
    curvatureTensor es prec x x = 0 := by
  unfold curvatureTensor; omega

/-- **Symmetric/antisymmetric decomposition.** `symCurvature + curvatureTensor = 2·μ(y,x)`: the raw
two-index Möbius curvature splits into its Ricci-type (symmetric) and 2-form (antisymmetric) parts. -/
theorem curvature_decomposition (es : List E) (prec : E → E → Bool) (x y : E) :
    symCurvature es prec x y + curvatureTensor es prec x y = 2 * mobius es prec y x := by
  unfold symCurvature curvatureTensor; omega

/-! ## (C) The scalar defect is the trace of the tensor -/

/-- **The scalar curvature is the trace of the directional tensor.**
`∑_y curvatureTensor x y = curvatureDefect x` — summing the directional defect over all direction
events recovers the scalar left/right defect, exactly as the Ricci scalar `R` is the metric trace of
the Ricci tensor. -/
theorem tensor_row_trace (es : List E) (prec : E → E → Bool) (x : E) :
    es.foldr (fun y a => curvatureTensor es prec x y + a) 0 = curvatureDefect es prec x := by
  unfold curvatureTensor curvatureDefect
  rw [localCurvature_full, rowCurvature_full]
  exact foldr_int_sub_split es (fun y => mobius es prec y x) (fun y => mobius es prec x y)

/-- **The curvature tensor sums to zero over all index pairs** — antisymmetry forced through
rectangular Fubini: `∑_x ∑_y curvatureTensor x y = 0`. The conservation law of the curvature 2-form,
sharper than the scalar Bianchi identity (which is its row-traced projection). -/
theorem tensor_total_zero (es : List E) (prec : E → E → Bool) :
    es.foldr (fun x a => es.foldr (fun y a' => curvatureTensor es prec x y + a') 0 + a) 0 = 0 := by
  have hinner : ∀ y, es.foldr (fun x a => curvatureTensor es prec x y + a) 0
      = - es.foldr (fun x a => curvatureTensor es prec y x + a) 0 := by
    intro y
    rw [foldr_int_congr es (fun x => curvatureTensor es prec x y)
          (fun x => - curvatureTensor es prec y x)
          (fun x => curvatureTensor_antisymm es prec x y)]
    exact foldr_int_neg es (fun x => curvatureTensor es prec y x)
  have hswap := foldr_rect_swap es es (fun y x => curvatureTensor es prec x y)
  have hneg : es.foldr (fun y acc => es.foldr (fun x a => curvatureTensor es prec x y + a) 0 + acc) 0
      = - es.foldr (fun x a => es.foldr (fun y a' => curvatureTensor es prec x y + a') 0 + a) 0 := by
    rw [foldr_int_congr es
          (fun y => es.foldr (fun x a => curvatureTensor es prec x y + a) 0)
          (fun y => - es.foldr (fun x a => curvatureTensor es prec y x + a) 0)
          hinner]
    exact foldr_int_neg es (fun y => es.foldr (fun x a => curvatureTensor es prec y x + a) 0)
  have hT : es.foldr (fun x a => es.foldr (fun y a' => curvatureTensor es prec x y + a') 0 + a) 0
      = - es.foldr (fun x a => es.foldr (fun y a' => curvatureTensor es prec x y + a') 0 + a) 0 :=
    hswap.trans hneg
  omega

/-! ## (D) The diamond — the curvature 2-form at the boundary -/

/-- **The diamond's curvature tensor on the boundary pair** is antisymmetric: `curvatureTensor 0 3 =
−1`, `curvatureTensor 3 0 = 1` — the past-to-future boundary direction carries the curvature, with the
opposite sign on the reversed direction. -/
theorem diamond_curvatureTensor_boundary :
    curvatureTensor fourEvents diamondPrec 0 3 = -1
    ∧ curvatureTensor fourEvents diamondPrec 3 0 = 1 := by
  refine ⟨by decide, by decide⟩

/-- **The diamond's row traces reproduce the scalar defect profile** `(1, 0, 0, −1)` — the trace of
the directional tensor at each event is the scalar curvature defect (`tensor_row_trace` made
concrete). -/
theorem diamond_tensor_trace :
    fourEvents.foldr (fun y a => curvatureTensor fourEvents diamondPrec 0 y + a) 0 = 1
    ∧ fourEvents.foldr (fun y a => curvatureTensor fourEvents diamondPrec 3 y + a) 0 = -1 := by
  refine ⟨by decide, by decide⟩

/-! ## (E) The symmetric Möbius trace (named `ricciScalar` — see the interpretation caveat in the
module header; the *geometric* Ricci reading is conjectural, only the identities here are green)

The antisymmetric trace is the Bianchi defect `local − row` (`tensor_row_trace`, `curvatureDefect`);
its **symmetric** companion is `local + row`. The two are the `±` gradings of the one Möbius double
sum. Everything in this section is an exact incidence-algebra identity; whether the symmetric trace is
a *Ricci scalar* is the open continuum question (module header). -/

/-- The **symmetric Möbius trace** at `x`: `∑_y symCurvature x y` (the `+`-companion of the
antisymmetric `curvatureDefect`). Where the defect is retarded *minus* advanced, this is retarded
*plus* advanced. (Named `ricciScalar` aspirationally — its identification with a Riemannian Ricci
scalar needs the unestablished continuum limit; see the module header. The definition and the lemmas
below are exact poset incidence sums.) -/
def ricciScalar (es : List E) (prec : E → E → Bool) (x : E) : Int :=
  es.foldr (fun y a => symCurvature es prec x y + a) 0

/-- **The Ricci scalar is retarded + advanced curvature.** `∑_y symCurvature x y = localCurvature x +
rowCurvature x` — the symmetric trace of the Ricci-type tensor is the sum of the column (retarded) and
row (advanced) Möbius curvatures, exactly as `curvatureDefect` is their difference. Mirrors
`tensor_row_trace` with `+` for `−`. -/
theorem ricciScalar_eq (es : List E) (prec : E → E → Bool) (x : E) :
    ricciScalar es prec x = localCurvature es prec x + rowCurvature es prec x := by
  unfold ricciScalar symCurvature
  rw [localCurvature_full, rowCurvature_full]
  exact foldr_int_add_split es (fun y => mobius es prec y x) (fun y => mobius es prec x y)

/-- **The bigraded decomposition.** The Ricci scalar (symmetric) and the Bianchi defect
(antisymmetric) are the two gradings of the Möbius curvature: their sum recovers twice the retarded
(column) curvature, their difference twice the advanced (row). Curvature read on the bigraded
diamond's two nuclei `(σ, Δ) = (retarded, advanced)` — the scalar and the defect *are* the bigrading. -/
theorem ricci_defect_bigrading (es : List E) (prec : E → E → Bool) (x : E) :
    ricciScalar es prec x + curvatureDefect es prec x = 2 * localCurvature es prec x
      ∧ ricciScalar es prec x - curvatureDefect es prec x = 2 * rowCurvature es prec x := by
  have hd : curvatureDefect es prec x = localCurvature es prec x - rowCurvature es prec x := rfl
  rw [ricciScalar_eq, hd]
  constructor <;> omega

/-- **The total symmetric Möbius trace is twice the action total.** `∑_x ricciScalar x = 2·bdAction`:
summing the symmetric trace over all events gives twice `bdAction` (the total column-Möbius sum),
because the retarded and advanced totals agree (`total_curvature_defect_zero`). This is an exact
incidence-algebra **identity**, green with no continuum limit. *(Its reading as the geometric `S ↔ R`
relation — action = half the scalar curvature, projection of `⟨S⟩ → −¼∫R√g` — is the conjectural
interpretation flagged in the module header, NOT established by this identity.)* -/
theorem total_ricciScalar_eq_two_bdAction (es : List E) (prec : E → E → Bool) :
    es.foldr (fun x a => ricciScalar es prec x + a) 0 = 2 * bdAction es prec := by
  have hsum : es.foldr (fun x a => ricciScalar es prec x + a) 0
      = es.foldr (fun x a => localCurvature es prec x + a) 0
        + es.foldr (fun x a => rowCurvature es prec x + a) 0 := by
    rw [foldr_int_congr es (fun x => ricciScalar es prec x)
          (fun x => localCurvature es prec x + rowCurvature es prec x)
          (fun x => ricciScalar_eq es prec x)]
    exact foldr_int_add_split es (fun x => localCurvature es prec x) (fun x => rowCurvature es prec x)
  have hb : bdAction es prec = es.foldr (fun x a => localCurvature es prec x + a) 0 := rfl
  rw [hsum, ← total_curvature_defect_zero, hb]; omega

/-- **The diamond's Ricci-scalar profile** `(1, 0, 0, 1)`: retarded `+1` at the minimal event, advanced
`+1` at the maximal, `0` inside — the symmetric companion of the defect profile `(1, 0, 0, −1)`. -/
theorem diamond_ricciScalar :
    ricciScalar fourEvents diamondPrec 0 = 1
    ∧ ricciScalar fourEvents diamondPrec 1 = 0
    ∧ ricciScalar fourEvents diamondPrec 2 = 0
    ∧ ricciScalar fourEvents diamondPrec 3 = 1 := by
  refine ⟨by decide, by decide, by decide, by decide⟩

/-- **The diamond's total Ricci scalar is `2`** `= 2 · bdAction` (the diamond's `S = 1`): the discrete
Einstein–Hilbert action is exactly half the total scalar curvature of the minimal causal diamond. -/
theorem diamond_total_ricciScalar :
    ricciScalar fourEvents diamondPrec 0 + ricciScalar fourEvents diamondPrec 1
      + ricciScalar fourEvents diamondPrec 2 + ricciScalar fourEvents diamondPrec 3 = 2 := by decide

end Relational.Spacetime.Curvature.Ricci
end Infomaterial
