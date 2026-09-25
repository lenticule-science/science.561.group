import Obsmetrologia.CausalSets.Curvature.Ricci

/-!
# The discrete action is the trace of the Möbius–Ricci curvature

The Einstein–Hilbert action `S = ∑_x □1(x)` ([CausalSets.Action.EinsteinHilbertAction.lean](CausalSets.Action.EinsteinHilbertAction.lean)) and the
direction-resolved curvature tensor `μ(y,x) ∓ μ(x,y)` ([CausalSets.Curvature.Ricci.lean](CausalSets.Curvature.Ricci.lean)) were
built apart: the action as a column Möbius sum, the curvature as a two-index residual defect, the
Ricci-type symmetric part `symCurvature x y = μ(y,x) + μ(x,y)`. This module wires them — the action
*is* a trace of the curvature, exactly, over any finite causal set, integer-valued and metric-free.

Two traces, the symmetric/antisymmetric split read at the action:

* **symmetric (Ricci-type) trace.** Summing `symCurvature x y` over directions `y` recovers
  `localCurvature x + rowCurvature x` (`sym_row_trace`) — the retarded *plus* advanced Möbius sum, the
  two-sided scalar curvature. Summed over events it is **twice the action**:
  `∑_{x,y} symCurvature x y = 2 · S` (`totalSymRicci_eq_two_bdAction`). The discrete Einstein–Hilbert
  action is **half the total symmetric Möbius curvature** — the internal, exact form of the `−¼∫R√g`
  normalization, free of the embedding metric.
* **antisymmetric (2-form) trace.** The retarded curvature decomposes as the directional 2-form trace
  plus the advanced term: `localCurvature x = (∑_y curvatureTensor x y) + rowCurvature x`
  (`localCurvature_eq_tensorTrace_add_row`), via `CausalSets.Curvature.Ricci.tensor_row_trace`. Its total is the
  discrete Bianchi vanishing (`CausalSets.Curvature.Lambek.total_defect_eq_zero`), so the action equals the total
  advanced curvature alone.

What stays the analytic frontier is only the embedding contraction — the constant `−¼` and the metric
`√g` relating this integer curvature to the Ricci scalar of a Riemannian manifold. The internal
identity *action = trace of curvature* needs none of it.

## Main definitions

* `totalSymRicci` — the total symmetric (Ricci-type) Möbius curvature `∑_{x,y} symCurvature x y`.

## Main results

* `sym_row_trace` — `∑_y symCurvature x y = localCurvature x + rowCurvature x`.
* `localCurvature_eq_tensorTrace_add_row` — retarded curvature = 2-form trace + advanced term.
* `totalSymRicci_eq_two_bdAction` — `∑_{x,y} symCurvature x y = 2 · S` (action = ½ total Ricci trace).
* `curvature_action_wiring` — the bundled headline.

## References

`content/.../causal-dalembertian/content/einstein-hilbert-action`; the action of
`CausalSets.Action.EinsteinHilbertAction`, the residual defect of `CausalSets.Curvature.Lambek`, the curvature
tensor of `CausalSets.Curvature.Ricci`.

## Tags

Einstein–Hilbert action, Ricci trace, Möbius curvature, residual defect, Bianchi, causal set
-/

namespace Obsmetrologia
namespace CausalSets.Curvature.ActionWiring

open Obsmetrologia.CausalSets.Incidence.Mobius
open Obsmetrologia.CausalSets.Action.EinsteinHilbertAction
open Obsmetrologia.CausalSets.Curvature.Lambek
open Obsmetrologia.CausalSets.Curvature.Ricci

variable {E : Type} [DecidableEq E]

/-! ## (A) The symmetric (Ricci-type) row trace -/

/-- **The symmetric Ricci trace.** Summing the symmetric curvature `symCurvature x y = μ(y,x) + μ(x,y)`
over all direction events `y` recovers `localCurvature x + rowCurvature x` — the retarded (column)
*plus* advanced (row) Möbius sum, the two-sided scalar curvature at `x`. The symmetric companion of
`tensor_row_trace` (whose antisymmetric trace is the *difference* `curvatureDefect`). -/
theorem sym_row_trace (es : List E) (prec : E → E → Bool) (x : E) :
    es.foldr (fun y a => symCurvature es prec x y + a) 0
    = localCurvature es prec x + rowCurvature es prec x := by
  rw [localCurvature_full, rowCurvature_full]
  unfold symCurvature
  exact foldr_int_add_split es (fun y => mobius es prec y x) (fun y => mobius es prec x y)

/-- **The retarded curvature splits as 2-form trace plus advanced term.** The Einstein–Hilbert local
curvature `localCurvature x = □1(x)` equals the directional curvature 2-form's row trace
`∑_y curvatureTensor x y` (which is the residual defect, `tensor_row_trace`) plus the advanced
`rowCurvature x`. The antisymmetric companion of `sym_row_trace`. -/
theorem localCurvature_eq_tensorTrace_add_row (es : List E) (prec : E → E → Bool) (x : E) :
    localCurvature es prec x
    = es.foldr (fun y a => curvatureTensor es prec x y + a) 0 + rowCurvature es prec x := by
  rw [tensor_row_trace]
  unfold curvatureDefect
  omega

/-! ## (B) The action is half the total symmetric curvature -/

/-- The **total symmetric (Ricci-type) Möbius curvature** `∑_{x,y} symCurvature x y` over the causal
set — the double trace of the symmetric curvature. -/
def totalSymRicci (es : List E) (prec : E → E → Bool) : Int :=
  es.foldr (fun x a => es.foldr (fun y a' => symCurvature es prec x y + a') 0 + a) 0

/-- **The discrete Einstein–Hilbert action is half the total symmetric Möbius curvature.**
`∑_{x,y} symCurvature x y = 2 · S`, where `S = bdAction` is the action. Summing the symmetric row
trace `localCurvature + rowCurvature` over events gives `∑localCurvature + ∑rowCurvature`, and the two
totals coincide by the discrete Bianchi identity (`total_curvature_defect_zero`), so both equal `S` —
the total symmetric curvature is `2S`. This is the internal, exact, metric-free form of the
`⟨S⟩ → −¼∫R√g` normalization: the action is half the total Ricci-type curvature. -/
theorem totalSymRicci_eq_two_bdAction (es : List E) (prec : E → E → Bool) :
    totalSymRicci es prec = 2 * bdAction es prec := by
  unfold totalSymRicci
  rw [foldr_int_congr es
        (fun x => es.foldr (fun y a' => symCurvature es prec x y + a') 0)
        (fun x => localCurvature es prec x + rowCurvature es prec x)
        (fun x => sym_row_trace es prec x),
      foldr_int_add_split es (fun x => localCurvature es prec x) (fun x => rowCurvature es prec x),
      ← total_curvature_defect_zero es prec]
  unfold bdAction
  omega

/-! ## (C) The diamond witness -/

/-- **The diamond's action is half its total symmetric curvature.** `S = 1` and the total symmetric
Möbius curvature is `2` — the boundary's retarded and advanced unit contributions. -/
theorem diamond_action_is_half_sym :
    totalSymRicci CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.diamondPrec = 2
    ∧ bdAction CausalSets.Dimension.OrderingFraction.fourEvents CausalSets.Dimension.OrderingFraction.diamondPrec = 1 := by
  refine ⟨?_, diamond_bdAction⟩
  rw [totalSymRicci_eq_two_bdAction, diamond_bdAction]; rfl

/-! ## (D) The bundled headline -/

/-- **Curvature–action wiring.** On any finite causal set the discrete action is a trace of the
Möbius–Ricci curvature:

* (symmetric trace) `∑_y symCurvature x y = localCurvature x + rowCurvature x` (`sym_row_trace`);
* (antisymmetric trace) `localCurvature x = ∑_y curvatureTensor x y + rowCurvature x`
  (`localCurvature_eq_tensorTrace_add_row`);
* (action = ½ total Ricci trace) `∑_{x,y} symCurvature x y = 2 · S`
  (`totalSymRicci_eq_two_bdAction`);
* (Bianchi) the total antisymmetric trace vanishes (`total_defect_eq_zero`), so `S` equals the total
  advanced curvature alone.

The embedding contraction (`−¼`, `√g`) to a Riemannian Ricci scalar is the remaining analytic
frontier; the internal identity needs none of it. -/
theorem curvature_action_wiring (es : List E) (prec : E → E → Bool) :
    (∀ x, es.foldr (fun y a => symCurvature es prec x y + a) 0
        = localCurvature es prec x + rowCurvature es prec x)
    ∧ (∀ x, localCurvature es prec x
        = es.foldr (fun y a => curvatureTensor es prec x y + a) 0 + rowCurvature es prec x)
    ∧ totalSymRicci es prec = 2 * bdAction es prec
    ∧ es.foldr (fun x a => curvatureDefect es prec x + a) 0 = 0 :=
  ⟨fun x => sym_row_trace es prec x,
   fun x => localCurvature_eq_tensorTrace_add_row es prec x,
   totalSymRicci_eq_two_bdAction es prec,
   total_defect_eq_zero es prec⟩

end CausalSets.Curvature.ActionWiring
end Obsmetrologia
