import Obsmetrologia.CausalSets.Incidence.Mobius
import Obsmetrologia.Calculus.Real.Multiplication
import Obsmetrologia.Calculus.Probability.Measure

/-!
# The causal d'Alembertian as Möbius convolution over the reals

The **causal d'Alembertian** of a real scalar field `φ : E → ℝ` is the action of the causal order's
incidence-algebra Möbius function on `φ`, read over the past cone:
`□φ(x) = ∑_{y ≼ x} μ(y,x) · φ(y)`. It is **retarded** (it reaches only into the causal past of `x`)
and carries the alternating Möbius weights of `CausalSets.Incidence.Mobius` — the exact incidence
operator the layer-grouped Benincasa–Dowker form approximates. Values live in the corpus reals
`Real.Internal.RReal`.

This module supplies the operator and its linearity (`□` is additive and kills the zero field) — the
structural facts that make it a difference operator.

## Main definitions

* `ofIntR` — the integer Möbius weight as a real.
* `dalembertian` — `□φ(x) = ∑_{y ≼ x} μ(y,x) · φ(y)`, the retarded Möbius convolution.

## Main results

* `dalembertian_zero` — `□` annihilates the zero field.
* `dalembertian_add` — `□` is additive: `□(φ + ψ) = □φ + □ψ`.

## References

`content/.../lorentzian-causal-settling/content/causal-dalembertian`; the Möbius function of
`CausalSets.Incidence.Mobius` and the reals of `Real.Internal` / `Real.Multiplication`.

## Tags

causal d'Alembertian, Möbius convolution, retarded operator, discrete wave operator
-/

namespace Obsmetrologia
namespace CausalSets.Operator.DAlembertian

open Obsmetrologia.CausalSets.Incidence.Mobius
open Obsmetrologia.CausalSets.Causal.Interval
open Obsmetrologia.Real.Internal

variable {E : Type}

/-! ## (A) Real foldl helpers -/

/-- A constant-accumulator fold returns its seed. -/
theorem foldl_const_acc (L : List E) (c : RReal) :
    L.foldl (fun acc (_ : E) => acc) c = c := by
  induction L generalizing c with
  | nil => rfl
  | cons a t ih => simp only [List.foldl_cons]; exact ih c

/-- Folding `acc + f z` is congruent in `f` on the list's members. -/
theorem foldl_add_congrR (L : List E) (f g : E → RReal) (c : RReal)
    (h : ∀ z ∈ L, f z = g z) :
    L.foldl (fun acc z => acc + f z) c = L.foldl (fun acc z => acc + g z) c := by
  induction L generalizing c with
  | nil => rfl
  | cons a t ih =>
    simp only [List.foldl_cons]
    rw [h a (List.mem_cons_self ..)]
    exact ih (c + g a) (fun z hz => h z (List.mem_cons_of_mem a hz))

/-- Folding `acc + (f y + g y)` splits into the sum of the two folds. -/
theorem foldl_add_split (L : List E) (f g : E → RReal) (a b : RReal) :
    L.foldl (fun acc y => acc + (f y + g y)) (a + b)
    = L.foldl (fun acc y => acc + f y) a + L.foldl (fun acc y => acc + g y) b := by
  induction L generalizing a b with
  | nil => rfl
  | cons c t ih =>
    simp only [List.foldl_cons]
    have rearr : a + b + (f c + g c) = a + f c + (b + g c) := by
      rw [RReal.add_assoc, RReal.add_assoc, RReal.add_comm b (f c + g c),
        RReal.add_assoc, RReal.add_comm (g c) b]
    rw [rearr]
    exact ih (a + f c) (b + g c)

/-- The split at seed `0`. -/
theorem foldl_add_split_zero (L : List E) (f g : E → RReal) :
    L.foldl (fun acc y => acc + (f y + g y)) RReal.zero
    = L.foldl (fun acc y => acc + f y) RReal.zero
      + L.foldl (fun acc y => acc + g y) RReal.zero := by
  have h := foldl_add_split L f g RReal.zero RReal.zero
  rw [RReal.add_zero] at h
  exact h

/-! ## (B) The operator -/

variable [DecidableEq E]

/-- An integer Möbius weight embedded into the reals. -/
def ofIntR (n : Int) : RReal := RReal.ofRat (Real.Internal.Rat.ofInt n)

/-- **The causal d'Alembertian** `□φ(x) = ∑_{y ≼ x} μ(y,x) · φ(y)`: the retarded Möbius
convolution of `φ` over the past cone of `x`, weighted by the incidence Möbius function. -/
def dalembertian (es : List E) (prec : E → E → Bool) (φ : E → RReal) (x : E) : RReal :=
  (es.filter (fun y => leqB prec y x)).foldl
    (fun acc y => acc + ofIntR (mobius es prec y x) * φ y) RReal.zero

/-- **`□` annihilates the zero field.** -/
theorem dalembertian_zero (es : List E) (prec : E → E → Bool) (x : E) :
    dalembertian es prec (fun _ => RReal.zero) x = RReal.zero := by
  unfold dalembertian
  simp only [RReal.mul_zero, RReal.add_zero, foldl_const_acc]

/-- **`□` is additive.** `□(φ + ψ) = □φ + □ψ`. -/
theorem dalembertian_add (es : List E) (prec : E → E → Bool) (φ ψ : E → RReal) (x : E) :
    dalembertian es prec (fun y => φ y + ψ y) x
    = dalembertian es prec φ x + dalembertian es prec ψ x := by
  unfold dalembertian
  rw [foldl_add_congrR (es.filter (fun y => leqB prec y x))
        (fun y => ofIntR (mobius es prec y x) * (φ y + ψ y))
        (fun y => ofIntR (mobius es prec y x) * φ y + ofIntR (mobius es prec y x) * ψ y)
        RReal.zero (fun z _ => RReal.left_distrib _ _ _)]
  exact foldl_add_split_zero _ (fun y => ofIntR (mobius es prec y x) * φ y)
    (fun y => ofIntR (mobius es prec y x) * ψ y)

/-! ## (C) The coupling — expectation commutes with the d'Alembertian

The sprinkling expectation `E[·]` is the `RReal` linear functional `∑_ω (·)`. Because `□` is linear
(`dalembertian_add`, `dalembertian_zero`), the **expected operator equals the operator on the
expected field**: `⟨□ φ_ω⟩ = □ ⟨φ⟩`. This is the join of the operator and Poisson arcs — the form
the Benincasa–Dowker continuum average takes — and it needs no Fubini, only iterated linearity. -/

open Obsmetrologia.Probability.Measure

/-- The `RReal`-valued **expectation** over a sample space: `E[g] = ∑_{ω} g(ω)`. -/
def expValR {Ω : Type} (S : SampleSpace Ω) (g : Ω → RReal) : RReal :=
  S.outcomes.foldr (fun ω acc => g ω + acc) RReal.zero

/-- Expectation commutes with `□` over an explicit outcome list — by induction using `□`'s
linearity. -/
theorem dalembertian_expValR_list {Ω : Type} (es : List E) (prec : E → E → Bool)
    (φ : Ω → E → RReal) (x : E) (L : List Ω) :
    L.foldr (fun ω acc => dalembertian es prec (φ ω) x + acc) RReal.zero
    = dalembertian es prec (fun y => L.foldr (fun ω acc => φ ω y + acc) RReal.zero) x := by
  induction L with
  | nil => simp only [List.foldr_nil]; exact (dalembertian_zero es prec x).symm
  | cons a t ih => simp only [List.foldr_cons]; rw [ih, ← dalembertian_add]

/-- **Expectation commutes with the causal d'Alembertian:** `⟨□ φ_ω⟩ = □ ⟨φ⟩`. The expectation of
the operator applied to a random field equals the operator applied to the expected field — the
expected Benincasa–Dowker operator, assembled from `□`'s linearity and the sprinkling expectation
of `Probability.Measure`. -/
theorem dalembertian_expectation {Ω : Type} (S : SampleSpace Ω) (es : List E) (prec : E → E → Bool)
    (φ : Ω → E → RReal) (x : E) :
    expValR S (fun ω => dalembertian es prec (φ ω) x)
    = dalembertian es prec (fun y => expValR S (fun ω => φ ω y)) x :=
  dalembertian_expValR_list es prec φ x S.outcomes

end CausalSets.Operator.DAlembertian
end Obsmetrologia
