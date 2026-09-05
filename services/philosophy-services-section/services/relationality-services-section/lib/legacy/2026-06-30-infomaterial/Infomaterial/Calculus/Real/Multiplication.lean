import Infomaterial.Calculus.Real.Internal

/-!
# Toward the ring: real multiplication as the descending fusion

`Real.Internal` builds ℝ (`RReal`) as an ordered abelian **group** — `add`/`neg`/`le`/Archimedean/
completeness — and documents (its own header, §1) that *multiplication is "the standard bounded-sequence
extension"*, left as a socket. This module begins filling that socket. The mathematics: real
multiplication is the **tensor** descending through the value-settling completion the reals close
(`reals_close_the_value_settling_hub`) — the fusion `⊙` of the residuated structure
(`Order.TwistProductResiduation`, the `⊗ ⊣ ⇒` adjunction), whose Galois adjoint is residuation. The
hull accretes that residuation on its leaf (`Aperiodic.InverseHull`, the `hullLeaf ≅ Real` frontier),
so `mul` is not a posited primitive but the multiplicative half of the order/lattice already present.

The standard Bishop product `(a·b).seq n = a.seq n · b.seq n` is regular with a modulus recomputed from
a uniform bound on the factor tails. This file lays the **reusable analytic foundation** that recompute
needs — three `Rat` facts, all `iring`/`omega`-clean:

* `Rat.abs_mul` — `|x·y| = |x|·|y|` (the metric is multiplicative);
* `Rat.mul_le_mul_of_nonneg_left` — left multiplication by a nonnegative rational is monotone;
* `Rat.ofNat_mul_invNatP_le` — the **bound-scaling** law `B · 1/(m+1) ≤ 1/(j+1)` whenever
  `B·(j+1) ≤ m+1`: a finite bound `B` is absorbed by refining the modulus index, the exact lever the
  product's `cauchy` field pulls.

The remaining obligation to land `Real.mul` itself: assemble the modulus from these via a *constructive*
`Rat → Nat` ceiling for the factor bound (the one genuine subtlety — `exists_nat_ge`'s witness
`a.num.natAbs+1` is representative-dependent, fine inside an existential but not yet a well-defined
function), then `mul_respects` and the lift to `RReal` with the commutative-ring laws (those are
pointwise, hence `iring`-easy). Stated, not yet closed.
-/

namespace Infomaterial
namespace Real.Internal

namespace Rat

/-- **The metric is multiplicative:** `|x·y| = |x|·|y|` on ℚ. Reduces, after `mk`-unfolding, to
`Int.natAbs_mul` on the numerators (denominators are shared). -/
theorem abs_mul (x y : Rat) : abs (x * y) = abs x * abs y := by
  refine Quotient.inductionOn₂ x y (fun a b => ?_)
  show abs (mk a * mk b) = abs (mk a) * abs (mk b)
  rw [mk_mul, abs_mk, abs_mk, abs_mk, mk_mul]
  apply mk_eq.mpr
  show ((a.num * b.num).natAbs : Int) * (a.den * b.den)
      = ((a.num.natAbs : Int) * (b.num.natAbs : Int)) * (a.den * b.den)
  rw [Int.natAbs_mul, Int.natCast_mul]

/-- **Left multiplication by a nonnegative rational is monotone:** `a ≤ b → 0 ≤ c → c·a ≤ c·b`. -/
theorem mul_le_mul_of_nonneg_left {a b c : Rat} (h : a ≤ b) (hc : (0 : Rat) ≤ c) :
    c * a ≤ c * b := by
  revert h hc
  refine Quotient.inductionOn₃ a b c (fun a b c h hc => ?_)
  have hcn : (0 : Int) ≤ c.num := (zero_le_mk c).mp hc
  have hab : a.num * b.den ≤ b.num * a.den := h
  show mk (PreRat.mul c a) ≤ mk (PreRat.mul c b)
  rw [mk_le]
  show (c.num * a.num) * (c.den * b.den) ≤ (c.num * b.num) * (c.den * a.den)
  have hccd : (0 : Int) ≤ c.num * c.den := Int.mul_nonneg hcn (Int.le_of_lt c.den_pos)
  have key : (c.num * c.den) * (a.num * b.den) ≤ (c.num * c.den) * (b.num * a.den) :=
    Int.mul_le_mul_of_nonneg_left hab hccd
  calc (c.num * a.num) * (c.den * b.den)
      = (c.num * c.den) * (a.num * b.den) := by iring
    _ ≤ (c.num * c.den) * (b.num * a.den) := key
    _ = (c.num * b.num) * (c.den * a.den) := by iring

/-- **Bound-scaling.** A finite bound `B : ℕ` against the approximation step `1/(m+1)` is dominated by
the coarser step `1/(j+1)` once the modulus index is refined enough that `B·(j+1) ≤ m+1`:
`B · invNatP m ≤ invNatP j`. This is the lever the product modulus pulls — absorbing the factor bound
by refining precision. -/
theorem ofNat_mul_invNatP_le {c j m : Nat} (h : c * (j + 1) ≤ m + 1) :
    ofNat c * invNatP m ≤ invNatP j := by
  show ofNat c * mk ⟨1, (m : Int) + 1, by omega⟩ ≤ mk ⟨1, (j : Int) + 1, by omega⟩
  show mk (PreRat.ofNat c) * mk ⟨1, (m : Int) + 1, by omega⟩ ≤ mk ⟨1, (j : Int) + 1, by omega⟩
  rw [mk_mul, mk_le]
  show ((c : Int) * 1) * ((j : Int) + 1) ≤ 1 * ((1 : Int) * ((m : Int) + 1))
  have hc : (c : Int) * ((j : Int) + 1) ≤ (m : Int) + 1 := by exact_mod_cast h
  simp only [Int.mul_one, Int.one_mul]
  exact hc

/-- **Right multiplication by a nonnegative rational is monotone.** -/
theorem mul_le_mul_of_nonneg_right {a b c : Rat} (h : a ≤ b) (hc : (0 : Rat) ≤ c) :
    a * c ≤ b * c := by
  have := mul_le_mul_of_nonneg_left h hc
  rwa [mul_comm c a, mul_comm c b] at this

/-- **Floor is representative-invariant.** For positive denominators `ediv` rounds toward `−∞`, and
equivalent fractions name the same rational, hence the same floor: from `a.num·b.den = b.num·a.den`,
`a.num.ediv a.den = b.num.ediv b.den`. The integer-witness argument: `D·(qa−qb)` lands in `(−D, D)`
for `D = a.den·b.den > 0`, so `qa = qb`. -/
theorem floor_inv {a b : PreRat} (h : PreRat.equiv a b) :
    a.num.ediv a.den = b.num.ediv b.den := by
  have hda : 0 < a.den := a.den_pos
  have hdb : 0 < b.den := b.den_pos
  have heq : a.num * b.den = b.num * a.den := h
  have hra0 : 0 ≤ a.num.emod a.den := Int.emod_nonneg _ (by omega)
  have hraL : a.num.emod a.den < a.den := Int.emod_lt_of_pos _ hda
  have hrb0 : 0 ≤ b.num.emod b.den := Int.emod_nonneg _ (by omega)
  have hrbL : b.num.emod b.den < b.den := Int.emod_lt_of_pos _ hdb
  have hae : a.num.emod a.den + a.den * a.num.ediv a.den = a.num := Int.emod_add_mul_ediv a.num a.den
  have hbe : b.num.emod b.den + b.den * b.num.ediv b.den = b.num := Int.emod_add_mul_ediv b.num b.den
  have hDpos : 0 < a.den * b.den := Int.mul_pos hda hdb
  have gen : ∀ (x d bd q r : Int), x = r + d * q → x * bd = r * bd + d * bd * q := by
    intro x d bd q r hx; rw [hx]; iring
  have e1 : a.num * b.den = a.num.emod a.den * b.den + a.den * b.den * a.num.ediv a.den :=
    gen a.num a.den b.den (a.num.ediv a.den) (a.num.emod a.den) hae.symm
  have e2 : b.num * a.den = b.num.emod b.den * a.den + b.den * a.den * b.num.ediv b.den :=
    gen b.num b.den a.den (b.num.ediv b.den) (b.num.emod b.den) hbe.symm
  have key : a.den * b.den * (a.num.ediv a.den - b.num.ediv b.den)
      = b.num.emod b.den * a.den - a.num.emod a.den * b.den := by
    have hfac : a.den * b.den * (a.num.ediv a.den - b.num.ediv b.den)
        = a.den * b.den * a.num.ediv a.den - b.den * a.den * b.num.ediv b.den := by iring
    rw [hfac]; omega
  have hub : b.num.emod b.den * a.den - a.num.emod a.den * b.den < a.den * b.den := by
    have h1 : b.num.emod b.den * a.den < b.den * a.den := Int.mul_lt_mul_of_pos_right hrbL hda
    have h2 : 0 ≤ a.num.emod a.den * b.den := Int.mul_nonneg hra0 (by omega)
    have h3 : b.den * a.den = a.den * b.den := by iring
    omega
  have hlb : -(a.den * b.den) < b.num.emod b.den * a.den - a.num.emod a.den * b.den := by
    have h1 : a.num.emod a.den * b.den < a.den * b.den := Int.mul_lt_mul_of_pos_right hraL hdb
    have h2 : 0 ≤ b.num.emod b.den * a.den := Int.mul_nonneg hrb0 (by omega)
    omega
  have hlt1 : a.den * b.den * (a.num.ediv a.den - b.num.ediv b.den) < a.den * b.den * 1 := by
    rw [key, Int.mul_one]; exact hub
  have hgt1 : a.den * b.den * (-1) < a.den * b.den * (a.num.ediv a.den - b.num.ediv b.den) := by
    rw [key]; have hneg : a.den * b.den * (-1) = -(a.den * b.den) := by iring
    rw [hneg]; exact hlb
  have hq1 : a.num.ediv a.den - b.num.ediv b.den < 1 :=
    Int.lt_of_mul_lt_mul_left hlt1 (Int.le_of_lt hDpos)
  have hq2 : -1 < a.num.ediv a.den - b.num.ediv b.den :=
    Int.lt_of_mul_lt_mul_left hgt1 (Int.le_of_lt hDpos)
  omega

/-- **The floor `⌊q⌋ : ℤ`** of a rational, as the well-defined lift of `num.ediv den`. -/
def floor : Rat → Int := Quotient.lift (fun a => a.num.ediv a.den) (fun _ _ h => floor_inv h)

@[simp] theorem floor_mk (a : PreRat) : floor (mk a) = a.num.ediv a.den := rfl

/-- **A constructive natural upper bound** for a rational: `⌊q⌋.toNat + 1 ≥ q`. A genuine *function*
(`floor` is computable), not a choice — the lever the product modulus needs. -/
def natGe (q : Rat) : Nat := (floor q).toNat + 1

/-- `q ≤ natGe q`. -/
theorem le_natGe (q : Rat) : q ≤ ofNat (natGe q) := by
  refine Quotient.inductionOn q (fun a => ?_)
  have hda : 0 < a.den := a.den_pos
  have hrL : a.num.emod a.den < a.den := Int.emod_lt_of_pos _ hda
  have hae : a.num.emod a.den + a.den * a.num.ediv a.den = a.num :=
    Int.emod_add_mul_ediv a.num a.den
  have htoNat : a.num.ediv a.den ≤ ((a.num.ediv a.den).toNat : Int) := Int.self_le_toNat _
  show a.num * 1 ≤ (((a.num.ediv a.den).toNat + 1 : Nat) : Int) * a.den
  have hmul : a.den * a.num.ediv a.den ≤ a.den * ((a.num.ediv a.den).toNat : Int) :=
    Int.mul_le_mul_of_nonneg_left htoNat (Int.le_of_lt hda)
  have hc1 : a.den * ((a.num.ediv a.den).toNat : Int)
      = ((a.num.ediv a.den).toNat : Int) * a.den := by iring
  have hc2 : (((a.num.ediv a.den).toNat + 1 : Nat) : Int) * a.den
      = ((a.num.ediv a.den).toNat : Int) * a.den + a.den := by
    rw [Int.natCast_add, Int.natCast_one]; iring
  omega

/-- `z - 0 = z` on ℚ. -/
theorem sub_zero (z : Rat) : z - 0 = z := by
  show z + (-(0 : Rat)) = z
  have : (-(0 : Rat)) = 0 := rfl
  rw [this, add_zero]

/-- `|z - 0| = |z|`. -/
theorem abs_sub_zero (z : Rat) : abs (z - 0) = abs z := by rw [sub_zero]

/-- `a·(−b) = −(a·b)` on ℚ. -/
theorem mul_neg (a b : Rat) : a * (-b) = -(a * b) := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  show mk a * -(mk b) = -(mk a * mk b)
  simp only [mk_neg, mk_mul]
  apply mk_eq.mpr
  show (a.num * -b.num) * (a.den * b.den) = -(a.num * b.num) * (a.den * b.den)
  iring

/-- `a·(b − c) = a·b − a·c` on ℚ. -/
theorem mul_sub (a b c : Rat) : a * (b - c) = a * b - a * c := by
  show a * (b + (-c)) = a * b + (-(a * c))
  rw [left_distrib, mul_neg]

/-- `(a − b) + (b − c) = a − c` on ℚ (additive-group telescoping). -/
theorem sub_add_sub_cancel (a b c : Rat) : (a - b) + (b - c) = a - c := by
  show (a + (-b)) + (b + (-c)) = a + (-c)
  rw [add_assoc a (-b) (b + -c), ← add_assoc (-b) b (-c), add_left_neg, zero_add]

/-- **The product-increment split** `w·x − y·z = w·(x − z) + z·(w − y)` — the algebraic identity the
bounded product's Cauchy estimate is built on (one factor times a difference, plus the cross term). -/
theorem mul_sub_split (w x y z : Rat) : w * x - y * z = w * (x - z) + z * (w - y) := by
  rw [mul_sub, mul_sub, mul_comm z w, mul_comm z y, sub_add_sub_cancel]

/-- `ofNat` is monotone: `m ≤ n → ofNat m ≤ ofNat n`. -/
theorem ofNat_le_ofNat {m n : Nat} (h : m ≤ n) : ofNat m ≤ ofNat n := by
  show ((m : Int) * 1 ≤ (n : Int) * 1)
  have : (m : Int) ≤ (n : Int) := by exact_mod_cast h
  omega

end Rat

namespace Real

open Rat (abs invNatP natGe ofNat)

/-- **The tail bound of a Cauchy real:** a natural number bounding `|a.seq n|` for all `n` past the
modulus `a.modulus 0`. Constructed from `|a.seq (a.modulus 0)| + 1` via `natGe`. -/
def tailBound (a : Real) : Nat := natGe (abs (a.seq (a.modulus 0)) + invNatP 0)

/-- **Uniform tail bound.** For `n ≥ a.modulus 0`, `|a.seq n| ≤ tailBound a`: every late term is within
`1 = invNatP 0` of the anchor `a.seq (a.modulus 0)`, hence below the natural bound. -/
theorem abs_seq_le_tailBound (a : Real) {n : Nat} (hn : a.modulus 0 ≤ n) :
    abs (a.seq n) ≤ ofNat (tailBound a) := by
  have hcau : abs (a.seq n - a.seq (a.modulus 0)) ≤ invNatP 0 :=
    a.cauchy 0 n (a.modulus 0) hn (Nat.le_refl _)
  have htri : abs (a.seq n - 0)
      ≤ abs (a.seq n - a.seq (a.modulus 0)) + abs (a.seq (a.modulus 0) - 0) :=
    Rat.abs_sub_le (a.seq n) (a.seq (a.modulus 0)) 0
  rw [Rat.abs_sub_zero, Rat.abs_sub_zero] at htri
  have hstep : abs (a.seq n) ≤ abs (a.seq (a.modulus 0)) + invNatP 0 := by
    have h2 : abs (a.seq n - a.seq (a.modulus 0)) + abs (a.seq (a.modulus 0))
        ≤ invNatP 0 + abs (a.seq (a.modulus 0)) := Rat.add_le_add_right hcau _
    have := Rat.le_trans htri h2
    rwa [Rat.add_comm (invNatP 0) (abs (a.seq (a.modulus 0)))] at this
  exact Rat.le_trans hstep (Rat.le_natGe _)

/-- **Real multiplication (the Bishop bounded product).** `(a·b).seq n = a.seq n · b.seq n`, with the
modulus refined past both anchors `a.modulus 0`, `b.modulus 0` (so both tails are bounded by
`D = max (tailBound a) (tailBound b)`) and past `a.modulus J`, `b.modulus J` for `J = D·(2k+2)` (so each
factor difference is below `1/(J+1)`). The Cauchy estimate splits `aₘbₘ − aₙbₙ` into one factor times a
difference plus the cross term (`Rat.mul_sub_split`), bounds each by `D · 1/(J+1) ≤ 1/(2k+2)`
(`ofNat_mul_invNatP_le`), and recombines the two halves to `1/(k+1)` (`invNatP_double`). -/
def mul (a b : Real) : Real where
  seq := fun n => a.seq n * b.seq n
  modulus := fun k =>
    Nat.max (Nat.max (a.modulus 0) (b.modulus 0))
      (Nat.max (a.modulus (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)))
               (b.modulus (Nat.max (tailBound a) (tailBound b) * (2 * k + 2))))
  cauchy := fun k m n hm hn => by
    have ham0 : a.modulus 0 ≤ m :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_left _ _)) hm
    have han0 : a.modulus 0 ≤ n :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_left _ _)) hn
    have hbn0 : b.modulus 0 ≤ n :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_left _ _)) hn
    have haJm : a.modulus (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) ≤ m :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_right _ _)) hm
    have haJn : a.modulus (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) ≤ n :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_right _ _)) hn
    have hbJm : b.modulus (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) ≤ m :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_right _ _)) hm
    have hbJn : b.modulus (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) ≤ n :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_right _ _)) hn
    have hbam : abs (a.seq m) ≤ ofNat (Nat.max (tailBound a) (tailBound b)) :=
      Rat.le_trans (abs_seq_le_tailBound a ham0) (Rat.ofNat_le_ofNat (Nat.le_max_left _ _))
    have hbbn : abs (b.seq n) ≤ ofNat (Nat.max (tailBound a) (tailBound b)) :=
      Rat.le_trans (abs_seq_le_tailBound b hbn0) (Rat.ofNat_le_ofNat (Nat.le_max_right _ _))
    have hda : abs (a.seq m - a.seq n)
        ≤ invNatP (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) := a.cauchy _ m n haJm haJn
    have hdb : abs (b.seq m - b.seq n)
        ≤ invNatP (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) := b.cauchy _ m n hbJm hbJn
    have hDnn : (0 : Rat) ≤ ofNat (Nat.max (tailBound a) (tailBound b)) :=
      Rat.le_trans (Rat.abs_nonneg (a.seq m)) hbam
    show abs (a.seq m * b.seq m - a.seq n * b.seq n) ≤ invNatP k
    rw [Rat.mul_sub_split (a.seq m) (b.seq m) (a.seq n) (b.seq n)]
    refine Rat.le_trans (Rat.abs_add_le _ _) ?_
    rw [Rat.abs_mul, Rat.abs_mul]
    have t1 : abs (a.seq m) * abs (b.seq m - b.seq n)
        ≤ ofNat (Nat.max (tailBound a) (tailBound b))
            * invNatP (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) :=
      Rat.le_trans (Rat.mul_le_mul_of_nonneg_right hbam (Rat.abs_nonneg _))
        (Rat.mul_le_mul_of_nonneg_left hdb hDnn)
    have t2 : abs (b.seq n) * abs (a.seq m - a.seq n)
        ≤ ofNat (Nat.max (tailBound a) (tailBound b))
            * invNatP (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) :=
      Rat.le_trans (Rat.mul_le_mul_of_nonneg_right hbbn (Rat.abs_nonneg _))
        (Rat.mul_le_mul_of_nonneg_left hda hDnn)
    have hscale : ofNat (Nat.max (tailBound a) (tailBound b))
        * invNatP (Nat.max (tailBound a) (tailBound b) * (2 * k + 2)) ≤ invNatP (2 * k + 1) :=
      Rat.ofNat_mul_invNatP_le (Nat.le_succ _)
    refine Rat.le_trans (Rat.add_le_add t1 t2) ?_
    refine Rat.le_trans (Rat.add_le_add hscale hscale) ?_
    rw [Rat.invNatP_double]
    exact Rat.le_refl _

/-- **Real multiplication respects `≈`.** Same bounded-product estimate as `mul`'s `cauchy`, but using
the null-difference witnesses of `equiv a a'` / `equiv b b'` in place of the moduli — so `mul` descends
to the quotient `RReal`. -/
theorem mul_respects {a a' b b' : Real} (ha : equiv a a') (hb : equiv b b') :
    equiv (mul a b) (mul a' b') := by
  intro k
  obtain ⟨N1, hN1⟩ := hb (Nat.max (tailBound a) (tailBound b') * (2 * k + 2))
  obtain ⟨N2, hN2⟩ := ha (Nat.max (tailBound a) (tailBound b') * (2 * k + 2))
  refine ⟨Nat.max (Nat.max (a.modulus 0) (b'.modulus 0)) (Nat.max N1 N2), fun n hn => ?_⟩
  have han0 : a.modulus 0 ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_left _ _)) hn
  have hbn0 : b'.modulus 0 ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_left _ _)) hn
  have hN1n : N1 ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_right _ _)) hn
  have hN2n : N2 ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_right _ _)) hn
  have hbam : abs (a.seq n) ≤ ofNat (Nat.max (tailBound a) (tailBound b')) :=
    Rat.le_trans (abs_seq_le_tailBound a han0) (Rat.ofNat_le_ofNat (Nat.le_max_left _ _))
  have hbbn : abs (b'.seq n) ≤ ofNat (Nat.max (tailBound a) (tailBound b')) :=
    Rat.le_trans (abs_seq_le_tailBound b' hbn0) (Rat.ofNat_le_ofNat (Nat.le_max_right _ _))
  have hdb : abs (b.seq n - b'.seq n)
      ≤ invNatP (Nat.max (tailBound a) (tailBound b') * (2 * k + 2)) := hN1 n hN1n
  have hda : abs (a.seq n - a'.seq n)
      ≤ invNatP (Nat.max (tailBound a) (tailBound b') * (2 * k + 2)) := hN2 n hN2n
  have hDnn : (0 : Rat) ≤ ofNat (Nat.max (tailBound a) (tailBound b')) :=
    Rat.le_trans (Rat.abs_nonneg (a.seq n)) hbam
  show abs (a.seq n * b.seq n - a'.seq n * b'.seq n) ≤ invNatP k
  rw [Rat.mul_sub_split (a.seq n) (b.seq n) (a'.seq n) (b'.seq n)]
  refine Rat.le_trans (Rat.abs_add_le _ _) ?_
  rw [Rat.abs_mul, Rat.abs_mul]
  have t1 : abs (a.seq n) * abs (b.seq n - b'.seq n)
      ≤ ofNat (Nat.max (tailBound a) (tailBound b'))
          * invNatP (Nat.max (tailBound a) (tailBound b') * (2 * k + 2)) :=
    Rat.le_trans (Rat.mul_le_mul_of_nonneg_right hbam (Rat.abs_nonneg _))
      (Rat.mul_le_mul_of_nonneg_left hdb hDnn)
  have t2 : abs (b'.seq n) * abs (a.seq n - a'.seq n)
      ≤ ofNat (Nat.max (tailBound a) (tailBound b'))
          * invNatP (Nat.max (tailBound a) (tailBound b') * (2 * k + 2)) :=
    Rat.le_trans (Rat.mul_le_mul_of_nonneg_right hbbn (Rat.abs_nonneg _))
      (Rat.mul_le_mul_of_nonneg_left hda hDnn)
  have hscale : ofNat (Nat.max (tailBound a) (tailBound b'))
      * invNatP (Nat.max (tailBound a) (tailBound b') * (2 * k + 2)) ≤ invNatP (2 * k + 1) :=
    Rat.ofNat_mul_invNatP_le (Nat.le_succ _)
  refine Rat.le_trans (Rat.add_le_add t1 t2) ?_
  refine Rat.le_trans (Rat.add_le_add hscale hscale) ?_
  rw [Rat.invNatP_double]
  exact Rat.le_refl _

end Real

namespace RReal

/-- **ℝ multiplication** — the descent of the bounded product `Real.mul` to the quotient `RReal`. With
this, `Real.Internal`'s ordered abelian group becomes a commutative *ring*: the multiplicative half the
value-settling completion always carried, now made explicit. -/
def mul : RReal → RReal → RReal :=
  Quotient.lift₂ (fun a b => mk (Real.mul a b))
    (fun _ _ _ _ ha hb => Quotient.sound (Real.mul_respects ha hb))

instance : Mul RReal := ⟨mul⟩

@[simp] theorem mk_mul (a b : Real) : mk a * mk b = mk (Real.mul a b) := rfl

/-- `·` on ℝ is commutative (pointwise `Rat.mul_comm`). -/
theorem mul_comm (a b : RReal) : a * b = b * a := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.mul_comm (a.seq n) (b.seq n))

/-- `·` on ℝ is associative. -/
theorem mul_assoc (a b c : RReal) : a * b * c = a * (b * c) := by
  refine Quotient.inductionOn₃ a b c (fun a b c => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.mul_assoc (a.seq n) (b.seq n) (c.seq n))

/-- `1 · a = a`. -/
theorem one_mul (a : RReal) : one * a = a := by
  refine Quotient.inductionOn a (fun a => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.one_mul (a.seq n))

/-- `a · 1 = a`. -/
theorem mul_one (a : RReal) : a * one = a := by
  refine Quotient.inductionOn a (fun a => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.mul_one (a.seq n))

/-- `0 · a = 0`. -/
theorem zero_mul (a : RReal) : zero * a = zero := by
  refine Quotient.inductionOn a (fun a => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.zero_mul (a.seq n))

/-- `a · 0 = 0`. -/
theorem mul_zero (a : RReal) : a * zero = zero := by
  refine Quotient.inductionOn a (fun a => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.mul_zero (a.seq n))

/-- Left distributivity `a·(b+c) = a·b + a·c`. -/
theorem left_distrib (a b c : RReal) : a * (b + c) = a * b + a * c := by
  refine Quotient.inductionOn₃ a b c (fun a b c => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.left_distrib (a.seq n) (b.seq n) (c.seq n))

/-- Right distributivity `(a+b)·c = a·c + b·c`. -/
theorem right_distrib (a b c : RReal) : (a + b) * c = a * c + b * c := by
  refine Quotient.inductionOn₃ a b c (fun a b c => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.right_distrib (a.seq n) (b.seq n) (c.seq n))

end RReal

end Real.Internal
end Infomaterial
