import Obsmetrologia.Calculus.Real.Multiplication
import Obsmetrologia.Calculus.Real.MultiplicationOrder

/-!
# Real inverse: `ℝ` is a field on the positive-apart-from-zero fragment

`Real.Internal` already proves `ℚ` a field fragment (`Rat.preInv`/`Rat.mul_inv`: every nonzero
rational has an inverse) but leaves it at the `PreRat`-representative level, and `RReal` (the
Bishop/Cauchy-with-modulus reals) has no inverse or division at all — `Multiplication.lean` closes
the ring but not the field. This module closes both gaps, scoped: a **total** rational
inverse on the `Rat` quotient, and a **positive-apart-from-zero** real inverse (a real `a`
equipped with an explicit rational lower bound `1/(j+1) ≤ a.seq n` past an explicit index is
invertible, `a · inv a w = 1`). General nonzero-real inverse (via `abs` and a sign case split) is
not built here — every use so far (`GoldenFieldBridge`, tile gaps, metallic means) is of
manifestly positive reals built from concrete Cauchy sequences, so the positive fragment with an
*explicit* witness is what is needed; the general case is a mechanical follow-up.

**No `Classical.choice`.** `Real` carries its Cauchy modulus as explicit data (a `Nat → Nat` function, not an existence claim) precisely so downstream constructions never need
choice to extract an index. This module follows the same discipline throughout: `PosWitness`
bundles its positivity index `N` as data (never `Exists.choose`), and `RReal.inv` takes a chosen
`Real` representative directly rather than lifting off the `RReal` quotient via `Quotient.out`
(which is choice-dependent) — exactly how every other real in this library (`sqrtNat`, the
metallic-mean `z`, `doubledPhi`) is built: from an explicit Cauchy sequence, not by inverting an
already-quotiented `RReal`.

The construction mirrors `Multiplication.lean`'s idiom throughout: a `Rat`-level toolkit
(`Rat.inv`, its bound `Rat.abs_inv_bound_of_invNatP_le`) feeds a `Real`-level termwise reciprocal
whose Cauchy estimate uses the same bound-scaling lever (`Rat.ofNat_mul_invNatP_le`) that
`Real.mul`'s modulus already pulls, then descends to `RReal` by `Quotient.sound`.

## Main definitions

* `Rat.inv` — total inverse on `ℚ`, junk-valued `0` at `0`.
* `Real.PosWitness` — a real together with an explicit rational lower bound (index `j`, valid
  past explicit index `N`) witnessing it is positive and apart from zero.
* `Real.inv`, `RReal.inv` — the termwise-reciprocal real/`RReal` inverse, defined on a
  `PosWitness`.

## Main results

* `Rat.mul_inv_of_ne_zero` — `q ≠ 0 → q * inv q = 1`, the `ℚ`-field law lifted off `PreRat`.
* `Rat.inv_sub_inv` — the reciprocal-difference identity `1/x - 1/y = (y-x)·(1/x·1/y)`, the
  algebraic core of the Cauchy estimate below.
* `Rat.abs_inv_bound_of_invNatP_le` — if `1/(j+1) ≤ x` then `|1/x| ≤ j+1` exactly: the uniform
  Lipschitz bound the termwise reciprocal's modulus needs (the inverse analogue of `tailBound`).
* `Real.mul_inv` — the `Real`-level field law: `b * (inv b w) ≈ 1`.
* `RReal.mul_inv` — **the field law**: `mk a * inv a w = one` for `a : Real` with a `PosWitness`.

## References

Bishop, *Foundations of Constructive Analysis* (inverse of a real apart from zero); mirrors
`Real.Internal.Rat.preInv`/`mul_inv` and `Multiplication.lean`'s modulus-recompute pattern.

## Tags

field inverse, division, apartness from zero, Bishop reals, constructive analysis
-/

namespace Obsmetrologia
namespace Real.Internal

namespace Rat

/-- The reciprocal of a nonzero pre-rational, well-defined on the quotient: equivalent
representatives have equivalent inverses. Both branches of `preInv` (positive/negative
numerator) reduce to the same cross-multiplication identity as the original `equiv`. -/
theorem preInv_respects {a b : PreRat} (ha : a.num ≠ 0) (hb : b.num ≠ 0)
    (heq : PreRat.equiv a b) : PreRat.equiv (preInv a ha) (preInv b hb) := by
  have hda : 0 < a.den := a.den_pos
  have hdb : 0 < b.den := b.den_pos
  have heq' : a.num * b.den = b.num * a.den := heq
  unfold PreRat.equiv
  by_cases hap : 0 < a.num <;> by_cases hbp : 0 < b.num
  · simp only [preInv, dif_pos hap, dif_pos hbp]
    show a.den * b.num = b.den * a.num
    rw [Int.mul_comm a.den b.num, Int.mul_comm b.den a.num]
    exact heq'.symm
  · exfalso
    have hbneg : b.num < 0 := by omega
    have hpos1 : 0 < a.num * b.den := Int.mul_pos hap hdb
    have hneg1 : b.num * a.den < 0 := Int.mul_neg_of_neg_of_pos hbneg hda
    omega
  · exfalso
    have haneg : a.num < 0 := by omega
    have hneg1 : a.num * b.den < 0 := Int.mul_neg_of_neg_of_pos haneg hdb
    have hpos1 : 0 < b.num * a.den := Int.mul_pos hbp hda
    omega
  · have haneg : a.num < 0 := by omega
    have hbneg : b.num < 0 := by omega
    simp only [preInv, dif_neg hap, dif_neg hbp]
    show (-a.den) * (-b.num) = (-b.den) * (-a.num)
    have e1 : (-a.den) * (-b.num) = a.den * b.num := by iring
    have e2 : (-b.den) * (-a.num) = b.den * a.num := by iring
    rw [e1, e2, Int.mul_comm a.den b.num, Int.mul_comm b.den a.num]
    exact heq'.symm

/-- Equivalence preserves whether the numerator is zero (the sign/zero-ness of a fraction does
not depend on its representative). -/
theorem PreRat.equiv_num_eq_zero_iff {a b : PreRat} (h : PreRat.equiv a b) :
    a.num = 0 ↔ b.num = 0 := by
  have hda : 0 < a.den := a.den_pos
  have hdb : 0 < b.den := b.den_pos
  have h' : a.num * b.den = b.num * a.den := h
  constructor
  · intro ha0
    rw [ha0, Int.zero_mul] at h'
    rcases Int.mul_eq_zero.mp h'.symm with hb | had
    · exact hb
    · omega
  · intro hb0
    rw [hb0, Int.zero_mul] at h'
    rcases Int.mul_eq_zero.mp h' with ha | hbd
    · exact ha
    · omega

/-- **Total inverse on `ℚ`**, the quotient-level lift of `preInv`: `0` at `0` (junk value; `ℚ`
has no field-inverse there), the reciprocal everywhere else. -/
def inv : Rat → Rat :=
  Quotient.lift
    (fun a => if h : a.num = 0 then (0 : Rat) else mk (preInv a h))
    (by
      intro a b hab
      by_cases ha0 : a.num = 0
      · have hb0 : b.num = 0 := (PreRat.equiv_num_eq_zero_iff hab).mp ha0
        simp only [dif_pos ha0, dif_pos hb0]
      · have hb0 : b.num ≠ 0 := fun hc => ha0 ((PreRat.equiv_num_eq_zero_iff hab).mpr hc)
        simp only [dif_neg ha0, dif_neg hb0]
        exact Quotient.sound (preInv_respects ha0 hb0 hab))

theorem inv_mk (a : PreRat) (h : a.num ≠ 0) : inv (mk a) = mk (preInv a h) := by
  show (if h' : a.num = 0 then (0:Rat) else mk (preInv a h')) = mk (preInv a h)
  rw [dif_neg h]

/-- **The `ℚ`-field law**, lifted off `Rat.mul_inv`: `q · (inv q) = 1` for `q ≠ 0`. -/
theorem mul_inv_of_ne_zero {q : Rat} (h : q ≠ 0) : q * inv q = 1 := by
  refine Quotient.inductionOn q (fun a => ?_) h
  intro h
  have ha : a.num ≠ 0 := (ne_zero_iff a).mp h
  show mk a * inv (mk a) = 1
  rw [inv_mk a ha]
  exact mul_inv a ha

/-- The commuted field law: `(inv q) · q = 1` for `q ≠ 0`. -/
theorem inv_mul_of_ne_zero {q : Rat} (h : q ≠ 0) : inv q * q = 1 := by
  rw [mul_comm]; exact mul_inv_of_ne_zero h

/-- `(-a)·b = -(a·b)` on `ℚ` (the companion of `Multiplication.lean`'s `mul_neg`). -/
theorem neg_mul (a b : Rat) : (-a) * b = -(a * b) := by
  rw [mul_comm (-a) b, mul_neg, mul_comm]

/-- **The reciprocal-difference identity**: `1/x - 1/y = (y - x)·(1/x·1/y)`. The algebraic core
of the termwise-reciprocal Cauchy estimate below — expand the right side using the two field
laws `x·(1/x) = 1`, `y·(1/y) = 1` and it collapses to the left side. -/
theorem inv_sub_inv {x y : Rat} (hx : x ≠ 0) (hy : y ≠ 0) :
    inv x - inv y = (y - x) * (inv x * inv y) := by
  have hxi : x * inv x = 1 := mul_inv_of_ne_zero hx
  have hyi : y * inv y = 1 := mul_inv_of_ne_zero hy
  have step1 : y * (inv x * inv y) = inv x := by
    rw [mul_comm (inv x) (inv y), ← mul_assoc, hyi, one_mul]
  have step2 : x * (inv x * inv y) = inv y := by
    rw [← mul_assoc, hxi, one_mul]
  show inv x - inv y = (y + (-x)) * (inv x * inv y)
  rw [right_distrib, step1]
  have step3 : (-x) * (inv x * inv y) = -(inv y) := by
    rw [neg_mul, step2]
  rw [step3]
  rfl

/-- `|q| = q` for `0 ≤ q`. -/
theorem abs_of_nonneg {q : Rat} (h : (0:Rat) ≤ q) : abs q = q := by
  refine Quotient.inductionOn q (fun a => ?_) h
  intro h
  have hnn : (0:Int) ≤ a.num := (zero_le_mk a).mp h
  show mk (absPre a) = mk a
  apply Quotient.sound
  show ((a.num.natAbs : Int)) * a.den = a.num * a.den
  have : (a.num.natAbs : Int) = a.num := Int.natAbs_of_nonneg hnn
  rw [this]

/-- If `x` is bounded below by `1/(j+1)`, `x` is nonzero, its inverse is nonnegative, and the
inverse is bounded **above** by `j+1` exactly — the inverse's uniform bound flips the direction
of the hypothesis bound, dual to how `tailBound` bounds a Cauchy sequence's tail above. -/
theorem inv_bound_of_invNatP_le {x : Rat} {j : Nat} (hxj : invNatP j ≤ x) :
    x ≠ 0 ∧ (0:Rat) ≤ inv x ∧ inv x ≤ ofNat (j + 1) := by
  refine Quotient.inductionOn x (fun a => ?_) hxj
  intro hxj
  have hle : (1 : Int) * a.den ≤ a.num * ((j : Int) + 1) := (PreRat.leB_iff _ _).mp hxj
  have hda : 0 < a.den := a.den_pos
  have hnum_pos : 0 < a.num := by
    rcases Int.lt_or_le 0 a.num with h | h
    · exact h
    · exfalso
      have hjpos : (0:Int) ≤ (j:Int) + 1 := by omega
      have hprod : a.num * ((j:Int) + 1) ≤ 0 := Int.mul_nonpos_of_nonpos_of_nonneg h hjpos
      omega
  have hnum_ne : a.num ≠ 0 := by omega
  refine ⟨(ne_zero_iff a).mpr hnum_ne, ?_, ?_⟩
  · show (0:Rat) ≤ inv (mk a)
    rw [inv_mk a hnum_ne]
    rw [zero_le_mk]
    simp only [preInv, dif_pos hnum_pos]
    omega
  · show inv (mk a) ≤ ofNat (j + 1)
    rw [inv_mk a hnum_ne]
    show mk (preInv a hnum_ne) ≤ mk (PreRat.ofNat (j + 1))
    rw [mk_le]
    simp only [preInv, dif_pos hnum_pos]
    show a.den * 1 ≤ ((j:Int) + 1) * a.num
    rw [Int.mul_one, Int.mul_comm ((j:Int)+1) a.num]
    omega

/-- **The uniform inverse bound.** If `1/(j+1) ≤ x` then `x ≠ 0` and `|1/x| ≤ j+1`: the Lipschitz
bound the termwise-reciprocal Cauchy estimate scales by, the exact inverse-side analogue of
`Multiplication.lean`'s `abs_seq_le_tailBound`. -/
theorem abs_inv_bound_of_invNatP_le {x : Rat} {j : Nat} (hxj : invNatP j ≤ x) :
    x ≠ 0 ∧ abs (inv x) ≤ ofNat (j + 1) := by
  obtain ⟨hx0, hnn, hle⟩ := inv_bound_of_invNatP_le hxj
  exact ⟨hx0, by rw [abs_of_nonneg hnn]; exact hle⟩

/-- `ofNat` is multiplicative: `ofNat c * ofNat d = ofNat (c*d)`. -/
theorem ofNat_mul (c d : Nat) : ofNat c * ofNat d = ofNat (c * d) := by
  show mk (PreRat.ofNat c) * mk (PreRat.ofNat d) = mk (PreRat.ofNat (c * d))
  rw [mk_mul]
  apply Quotient.sound
  show ((c : Int) * (d : Int)) * 1 = ((c * d : Nat) : Int) * (1 * 1)
  rw [Int.natCast_mul]
  iring

/-- `0 ≤ ofNat c` on `ℚ`. -/
theorem ofNat_nonneg (c : Nat) : (0:Rat) ≤ ofNat c := by
  show (0:Rat) ≤ mk (PreRat.ofNat c)
  rw [zero_le_mk]
  show (0:Int) ≤ (c:Int)
  omega

/-- **Combine three factor bounds into the scaled product bound the reciprocal Cauchy estimate
needs.** `A ≤ 1/(J+1)` (`J = (jj+1)²·(k+1)`), `B,C ≤ jj+1` (all nonneg) give `A·(B·C) ≤ 1/(k+1)` —
the same "one factor's bound times the other's tail" combination `Multiplication.lean`'s product
modulus performs, specialized to a single reciprocal rather than two independent factors. -/
theorem inv_cauchy_combine {A B C : Rat} {jj k : Nat}
    (hAnn : (0:Rat) ≤ A) (_hBnn : (0:Rat) ≤ B) (hCnn : (0:Rat) ≤ C)
    (hda : A ≤ invNatP (((jj + 1) * (jj + 1)) * (k + 1)))
    (hmb : B ≤ ofNat (jj + 1)) (hnb : C ≤ ofNat (jj + 1)) :
    A * (B * C) ≤ invNatP k := by
  have hjnn : (0:Rat) ≤ ofNat (jj + 1) := ofNat_nonneg (jj + 1)
  have step1 : B * C ≤ ofNat (jj + 1) * ofNat (jj + 1) :=
    le_trans (mul_le_mul_of_nonneg_right hmb hCnn) (mul_le_mul_of_nonneg_left hnb hjnn)
  have hstep1nn : (0:Rat) ≤ ofNat (jj + 1) * ofNat (jj + 1) := mul_nonneg hjnn hjnn
  have step2 : A * (B * C) ≤ A * (ofNat (jj + 1) * ofNat (jj + 1)) :=
    mul_le_mul_of_nonneg_left step1 hAnn
  have step3 : A * (ofNat (jj + 1) * ofNat (jj + 1))
      ≤ invNatP (((jj + 1) * (jj + 1)) * (k + 1)) * (ofNat (jj + 1) * ofNat (jj + 1)) :=
    mul_le_mul_of_nonneg_right hda hstep1nn
  have step4 : invNatP (((jj + 1) * (jj + 1)) * (k + 1)) * (ofNat (jj + 1) * ofNat (jj + 1))
      ≤ invNatP k := by
    rw [ofNat_mul, mul_comm (invNatP (((jj+1)*(jj+1))*(k+1))) (ofNat ((jj+1)*(jj+1)))]
    exact ofNat_mul_invNatP_le (by omega)
  exact le_trans (le_trans step2 step3) step4

end Rat

namespace Real

open Rat (abs invNatP ofNat)

/-- A witness that a Cauchy real `a` is positive, apart from zero by an explicit rational
bound: past index `N`, every term is at least `1/(j+1)`. Both `j` and `N` are data — no
`Exists.choose`, matching `Real`'s own explicit-modulus discipline. -/
structure PosWitness (a : Real) where
  /-- The precision index of the lower bound. -/
  j : Nat
  /-- The index past which the bound holds. -/
  N : Nat
  /-- The bound itself. -/
  bound : ∀ n, N ≤ n → invNatP j ≤ a.seq n

/-- **Real inverse (the Bishop termwise reciprocal).** `(inv a w).seq n = 1/(a.seq n)`, with
modulus refined past both the witness index `w.N` (so `Rat.abs_inv_bound_of_invNatP_le` applies)
and past `a.modulus J` for `J = (w.j+1)²·(k+1)` (so the reciprocal's local Lipschitz constant
`(w.j+1)²` is absorbed into the modulus, the same bound-scaling lever `Multiplication`'s product
modulus pulls). The Cauchy estimate is `Rat.inv_sub_inv` then `Rat.inv_cauchy_combine`. -/
def inv (a : Real) (w : PosWitness a) : Real where
  seq := fun n => Rat.inv (a.seq n)
  modulus := fun k =>
    Nat.max w.N (a.modulus (((w.j + 1) * (w.j + 1)) * (k + 1)))
  cauchy := fun k m n hm hn => by
    have hmN : w.N ≤ m := Nat.le_trans (Nat.le_max_left _ _) hm
    have hnN : w.N ≤ n := Nat.le_trans (Nat.le_max_left _ _) hn
    have hmJ : a.modulus (((w.j + 1) * (w.j + 1)) * (k + 1)) ≤ m :=
      Nat.le_trans (Nat.le_max_right _ _) hm
    have hnJ : a.modulus (((w.j + 1) * (w.j + 1)) * (k + 1)) ≤ n :=
      Nat.le_trans (Nat.le_max_right _ _) hn
    have hbm : invNatP w.j ≤ a.seq m := w.bound m hmN
    have hbn : invNatP w.j ≤ a.seq n := w.bound n hnN
    obtain ⟨hm0, hmb⟩ := Rat.abs_inv_bound_of_invNatP_le hbm
    obtain ⟨hn0, hnb⟩ := Rat.abs_inv_bound_of_invNatP_le hbn
    have hda : abs (a.seq n - a.seq m)
        ≤ invNatP (((w.j + 1) * (w.j + 1)) * (k + 1)) := by
      rw [Rat.abs_sub_comm]; exact a.cauchy _ m n hmJ hnJ
    show abs (Rat.inv (a.seq m) - Rat.inv (a.seq n)) ≤ invNatP k
    rw [Rat.inv_sub_inv hm0 hn0, Rat.abs_mul, Rat.abs_mul]
    exact Rat.inv_cauchy_combine (Rat.abs_nonneg _) (Rat.abs_nonneg _) (Rat.abs_nonneg _)
      hda hmb hnb

/-- **The `Real`-level field law.** `b * (inv b w) ≈ 1`: past the witness index, the product is
*exactly* `1` (`Rat.mul_inv_of_ne_zero`), not merely close — so the witness index itself is a
valid modulus for every precision `k`. -/
theorem mul_inv (b : Real) (w : PosWitness b) : equiv (Real.mul b (inv b w)) one := by
  intro k
  refine ⟨w.N, fun n hn => ?_⟩
  have hbn : invNatP w.j ≤ b.seq n := w.bound n hn
  obtain ⟨hne, -, -⟩ := Rat.inv_bound_of_invNatP_le hbn
  show abs ((Real.mul b (inv b w)).seq n - one.seq n) ≤ invNatP k
  show abs (b.seq n * Rat.inv (b.seq n) - 1) ≤ invNatP k
  rw [Rat.mul_inv_of_ne_zero hne]
  have h11 : (1:Rat) - 1 = 0 := Rat.add_right_neg 1
  rw [h11]
  exact Rat.invNatP_nonneg k

end Real

namespace RReal

/-- **`ℝ` inverse**, given a `Real` representative `a` and a `PosWitness` for it. Deliberately
takes the `Real` directly (not an already-quotiented `RReal`) — building a new real from an
explicit witnessed Cauchy sequence, exactly how `sqrtNat`/the metallic-mean `z`/`doubledPhi` are
each built, needs no quotient-lift well-definedness proof and no `Quotient.out` (choice). -/
def inv (a : Real) (w : Real.PosWitness a) : RReal := mk (Real.inv a w)

/-- **The field law.** `mk a * inv a w = one`. -/
theorem mul_inv (a : Real) (w : Real.PosWitness a) : mk a * inv a w = one := by
  show mk a * mk (Real.inv a w) = one
  rw [mk_mul]
  exact Quotient.sound (Real.mul_inv a w)

end RReal

end Real.Internal
end Obsmetrologia
