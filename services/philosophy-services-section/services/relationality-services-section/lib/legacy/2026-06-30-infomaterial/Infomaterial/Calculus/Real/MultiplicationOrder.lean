import Infomaterial.Calculus.Real.Multiplication
import Infomaterial.Calculus.Algebra.Instances

/-! # Multiplicative order on ℝ — `mul_nonneg`

The internal reals carry their multiplicative order; it just had not been assembled.
The product `(a·b).seq n = a.seq n · b.seq n` is termwise, every Cauchy real is bounded
(`tailBound`), and the rationals have their multiplicative order. From
`0 ≤ a`, `0 ≤ b` (i.e. `a.seq n ≥ -p`, `b.seq n ≥ -p` for arbitrarily small `p`) the
identity `a·b = (a+p)(b+p) − p(a+b) − p²` with `(a+p)(b+p) ≥ 0` gives
`a·b ≥ −(2D+1)·p`, and refining `p` against the bound `D` drives the slack below any
`1/(k+1)`. So `0 ≤ a·b`.

## Main results

* `Rat.le_abs_self`, `Rat.mul_nonneg`, `Rat.invNatP_le_one` — the rational pieces.
* `Real.mul_nonneg`, `RReal.mul_nonneg` — products of nonnegatives are nonnegative.
* `RReal.mul_le_mul_of_nonneg_left/right` — monotonicity in a nonnegative factor.

## Tags

real numbers, Cauchy reals, multiplicative order, nonnegativity
-/

namespace Infomaterial
namespace Real.Internal

namespace Rat

/-- `q ≤ |q|` on ℚ. -/
theorem le_abs_self (q : Rat) : q ≤ abs q := by
  refine Quotient.inductionOn q (fun a => ?_)
  show mk a ≤ mk (absPre a)
  rw [mk_le]
  show a.num * a.den ≤ (a.num.natAbs : Int) * a.den
  exact Int.mul_le_mul_of_nonneg_right Int.le_natAbs (Int.le_of_lt a.den_pos)

/-- The product of two nonnegative rationals is nonnegative. -/
theorem mul_nonneg {a b : Rat} (ha : (0 : Rat) ≤ a) (hb : (0 : Rat) ≤ b) :
    (0 : Rat) ≤ a * b := by
  have h := mul_le_mul_of_nonneg_left ha hb
  rw [mul_zero] at h
  rwa [mul_comm] at h

/-- `1/(k+1) ≤ 1` on ℚ. -/
theorem invNatP_le_one (k : Nat) : invNatP k ≤ 1 := by
  have h : invNatP k ≤ invNatP 0 := invNatP_le_of_ge (Nat.zero_le k)
  have e : invNatP 0 = 1 := rfl
  rw [e] at h; exact h

/-- `1/(a+1) · 1/(b+1) = 1/((ab+a+b)+1)` — the product of two unit fractions. -/
theorem invNatP_mul (a b : Nat) : invNatP a * invNatP b = invNatP (a * b + a + b) := by
  show mk ⟨1, (a : Int) + 1, by omega⟩ * mk ⟨1, (b : Int) + 1, by omega⟩
      = mk ⟨1, ((a * b + a + b : Nat) : Int) + 1, by omega⟩
  rw [mk_mul]
  apply Quotient.sound
  show ((1 : Int) * 1) * (((a * b + a + b : Nat) : Int) + 1)
      = 1 * (((a : Int) + 1) * ((b : Int) + 1))
  have hc : ((a * b + a + b : Nat) : Int) = (a : Int) * (b : Int) + (a : Int) + (b : Int) := by
    simp only [Int.natCast_add, Int.natCast_mul]
  rw [hc]; iring

/-- A unit fraction is never zero. -/
theorem invNatP_ne_zero (k : Nat) : invNatP k ≠ 0 := by
  intro h
  have he : (1 : Int) * 1 = 0 * ((k : Int) + 1) := Quotient.exact h
  omega

/-- The rational binomial square `(a+x)^2 = a*a + (a*x + x*a) + x*x`. -/
theorem sq_add (a x : Rat) :
    (a + x) * (a + x) = a * a + (a * x + x * a) + x * x := by
  rw [mul_comm x a]
  exact Algebra.CommRing.sq_add Algebra.ratCommRing a x

/-- The rational ring identity `(1+x)^2 = x*x + (x+x) + 1`. -/
theorem sq_one_add (x : Rat) : (1 + x) * (1 + x) = x * x + (x + x) + 1 := by
  exact Algebra.CommRing.sq_one_add Algebra.ratCommRing x

end Rat

namespace Real

open Rat (invNatP abs ofNat)

/-- The uniform tail bound shared by two reals (no `set` in Mathlib-free core, so this is
a named def to keep the value transparent for the index estimates). -/
private def boundD (a b : Real) : Nat := Nat.max (tailBound a) (tailBound b)

/-- The precision level `M = D·((3k+2)+1) + (3k+2)` driving each slack term below
`1/(3k+3)`. -/
private def precM (a b : Real) (k : Nat) : Nat :=
  boundD a b * ((3 * k + 2) + 1) + (3 * k + 2)

/-- **Products of nonnegative reals are nonnegative** (constructive, at the `Real`
level). The precision `precM` is chosen so each of the three slack terms `p·a`, `p·b`,
`p²` is below `1/(3k+3)`, recombining to `1/(k+1)` by `invNatP_triple`. -/
theorem mul_nonneg {a b : Real} (ha : le zero a) (hb : le zero b) : le zero (mul a b) := by
  intro k
  obtain ⟨Na, hNa⟩ := ha (precM a b k)
  obtain ⟨Nb, hNb⟩ := hb (precM a b k)
  refine ⟨Nat.max (Nat.max Na Nb) (Nat.max (a.modulus 0) (b.modulus 0)), fun n hn => ?_⟩
  -- the four index bounds
  have hna : Na ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_left _ _)) hn
  have hnb : Nb ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_left _ _)) hn
  have hma : a.modulus 0 ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_right _ _)) hn
  have hmb : b.modulus 0 ≤ n :=
    Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_right _ _)) hn
  -- positivity witnesses for a, b at precision precM a b k
  have hA : (0 : Rat) ≤ a.seq n + invNatP (precM a b k) := hNa n hna
  have hB : (0 : Rat) ≤ b.seq n + invNatP (precM a b k) := hNb n hnb
  -- termwise bounds from Cauchy boundedness
  have habs_a : abs (a.seq n) ≤ ofNat (boundD a b) :=
    Rat.le_trans (abs_seq_le_tailBound a hma) (Rat.ofNat_le_ofNat (Nat.le_max_left _ _))
  have habs_b : abs (b.seq n) ≤ ofNat (boundD a b) :=
    Rat.le_trans (abs_seq_le_tailBound b hmb) (Rat.ofNat_le_ofNat (Nat.le_max_right _ _))
  have hp0 : (0 : Rat) ≤ invNatP (precM a b k) := Rat.invNatP_nonneg _
  have hp1 : invNatP (precM a b k) ≤ 1 := Rat.invNatP_le_one _
  -- the nonnegative product (A+p)(B+p)
  have hprod : (0 : Rat)
      ≤ (a.seq n + invNatP (precM a b k)) * (b.seq n + invNatP (precM a b k)) :=
    Rat.mul_nonneg hA hB
  have identity : (a.seq n + invNatP (precM a b k)) * (b.seq n + invNatP (precM a b k))
      = a.seq n * b.seq n
        + (invNatP (precM a b k) * a.seq n + invNatP (precM a b k) * b.seq n
            + invNatP (precM a b k) * invNatP (precM a b k)) := by
    rw [Rat.left_distrib, Rat.right_distrib, Rat.right_distrib]
    simp only [Rat.mul_comm, Rat.add_assoc, Rat.add_comm]
  have hstep1 : (0 : Rat)
      ≤ a.seq n * b.seq n
        + (invNatP (precM a b k) * a.seq n + invNatP (precM a b k) * b.seq n
            + invNatP (precM a b k) * invNatP (precM a b k)) := by
    rw [← identity]; exact hprod
  -- the shared bound-scaling step `D · 1/(M+1) ≤ 1/(3k+3)`
  have hscale : ofNat (boundD a b) * invNatP (precM a b k) ≤ invNatP (3 * k + 2) :=
    Rat.ofNat_mul_invNatP_le (Nat.le_trans (Nat.le_add_right _ (3 * k + 2)) (Nat.le_succ _))
  -- bound each slack term by 1/(3k+3)
  have hb1 : invNatP (precM a b k) * a.seq n ≤ invNatP (3 * k + 2) := by
    refine Rat.le_trans (Rat.le_trans
      (Rat.mul_le_mul_of_nonneg_left (Rat.le_abs_self _) hp0)
      (Rat.mul_le_mul_of_nonneg_left habs_a hp0)) ?_
    rw [Rat.mul_comm]; exact hscale
  have hb2 : invNatP (precM a b k) * b.seq n ≤ invNatP (3 * k + 2) := by
    refine Rat.le_trans (Rat.le_trans
      (Rat.mul_le_mul_of_nonneg_left (Rat.le_abs_self _) hp0)
      (Rat.mul_le_mul_of_nonneg_left habs_b hp0)) ?_
    rw [Rat.mul_comm]; exact hscale
  have hb3 : invNatP (precM a b k) * invNatP (precM a b k) ≤ invNatP (3 * k + 2) := by
    have c1 : invNatP (precM a b k) * invNatP (precM a b k) ≤ invNatP (precM a b k) * 1 :=
      Rat.mul_le_mul_of_nonneg_left hp1 hp0
    rw [Rat.mul_one] at c1
    exact Rat.le_trans c1 (Rat.invNatP_le_of_ge (Nat.le_add_left _ _))
  -- recombine the three to 1/(k+1)
  have hsum' : invNatP (precM a b k) * a.seq n + invNatP (precM a b k) * b.seq n
        + invNatP (precM a b k) * invNatP (precM a b k) ≤ invNatP k :=
    Rat.le_trans (Rat.add_le_add (Rat.add_le_add hb1 hb2) hb3)
      (Rat.le_of_eq (Rat.invNatP_triple k))
  -- conclude: 0 ≤ a·b + 1/(k+1)
  show (0 : Rat) ≤ a.seq n * b.seq n + invNatP k
  exact Rat.le_trans hstep1 (Rat.add_le_add_left hsum' (a.seq n * b.seq n))

end Real

namespace RReal

/-- **Products of nonnegative reals are nonnegative.** -/
theorem mul_nonneg {a b : RReal} (ha : zero ≤ a) (hb : zero ≤ b) : zero ≤ a * b := by
  revert ha hb
  refine Quotient.inductionOn₂ a b (fun a b ha hb => ?_)
  exact Real.mul_nonneg ha hb

/-- `0 ≤ 1` in ℝ. -/
theorem zero_le_one : (zero : RReal) ≤ one := by
  have h01 : (0 : Rat) ≤ 1 := Rat.invNatP_nonneg 0
  exact ofRat_mono h01

/-- `c·(-a) = -(c·a)` — `c·(-a)` is the additive inverse of `c·a`. -/
theorem mul_neg (c a : RReal) : c * (-a) = -(c * a) := by
  have h : c * (-a) + c * a = zero := by
    rw [← left_distrib, add_left_neg, mul_zero]
  calc c * (-a) = c * (-a) + zero := (add_zero _).symm
    _ = c * (-a) + (c * a + -(c * a)) := by rw [add_right_neg]
    _ = (c * (-a) + c * a) + -(c * a) := (add_assoc _ _ _).symm
    _ = zero + -(c * a) := by rw [h]
    _ = -(c * a) := zero_add _

/-- **Left multiplication by a nonnegative real is monotone.** -/
theorem mul_le_mul_of_nonneg_left {a b c : RReal} (h : a ≤ b) (hc : zero ≤ c) :
    c * a ≤ c * b := by
  have hba : zero ≤ b + (-a) := by
    have h2 : a + (-a) ≤ b + (-a) := add_le_add_right h (-a)
    rwa [add_right_neg] at h2
  have hprod : zero ≤ c * b + (-(c * a)) := by
    have hcp := mul_nonneg hc hba
    rwa [left_distrib, mul_neg] at hcp
  have h3 : zero + c * a ≤ (c * b + (-(c * a))) + c * a := add_le_add_right hprod (c * a)
  rw [zero_add, add_assoc, add_left_neg, add_zero] at h3
  exact h3

/-- **Right multiplication by a nonnegative real is monotone.** -/
theorem mul_le_mul_of_nonneg_right {a b c : RReal} (h : a ≤ b) (hc : zero ≤ c) :
    a * c ≤ b * c := by
  rw [mul_comm a c, mul_comm b c]; exact mul_le_mul_of_nonneg_left h hc

/-- The ℚ-embedding respects multiplication. -/
theorem ofRat_mul (q r : Rat) : ofRat (q * r) = ofRat q * ofRat r := by
  show mk (Real.ofRat (q * r)) = mk (Real.mul (Real.ofRat q) (Real.ofRat r))
  exact mk_eq_of_seq_eq (fun _ => rfl)

/-- `(−a) · b = −(a · b)` in `ℝ`. -/
theorem neg_mul (a b : RReal) : (-a) * b = -(a * b) := by
  exact Algebra.Ring.neg_mul Algebra.rrealCommRing.toRing a b

/-- `−(−a) = a` in `ℝ`. -/
theorem neg_neg (a : RReal) : -(-a) = a := by
  exact Algebra.Ring.neg_neg Algebra.rrealCommRing.toRing a

/-- `(−a) · (−b) = a · b` in `ℝ`. -/
theorem neg_mul_neg (a b : RReal) : (-a) * (-b) = a * b := by
  exact Algebra.Ring.neg_mul_neg Algebra.rrealCommRing.toRing a b

/-- The real binomial square `(a+s)^2 = a*a + (a*s + s*a) + s*s`. -/
theorem sq_add (a s : RReal) :
    (a + s) * (a + s) = a * a + (a * s + s * a) + s * s := by
  rw [RReal.mul_comm s a]
  exact Algebra.CommRing.sq_add Algebra.rrealCommRing a s

/-- The real ring identity `(1+s)^2 = s*s + (s+s) + 1`. -/
theorem sq_one_add (s : RReal) :
    (RReal.one + s) * (RReal.one + s) = s * s + (s + s) + RReal.one := by
  exact Algebra.CommRing.sq_one_add Algebra.rrealCommRing s

/-- **Strict positivity** (Bishop): `a` is positive when bounded below by a positive
rational `1/(k+1)`. This is the constructive `0 < a` — no decidable trichotomy, an
explicit positive lower bound. -/
def Pos (a : RReal) : Prop := ∃ k : Nat, ofRat (Rat.invNatP k) ≤ a

/-- A positive real is nonnegative. -/
theorem nonneg_of_pos {a : RReal} (h : Pos a) : zero ≤ a := by
  obtain ⟨k, hk⟩ := h
  exact le_trans (ofRat_mono (Rat.invNatP_nonneg k)) hk

/-- **Products of positive reals are positive.** The lower bounds multiply: if
`1/(ka+1) ≤ a` and `1/(kb+1) ≤ b` then `1/((ka·kb+ka+kb)+1) = 1/(ka+1)·1/(kb+1) ≤ a·b`. -/
theorem mul_pos {a b : RReal} (ha : Pos a) (hb : Pos b) : Pos (a * b) := by
  obtain ⟨ka, hka⟩ := ha
  obtain ⟨kb, hkb⟩ := hb
  refine ⟨ka * kb + ka + kb, ?_⟩
  have hpa : zero ≤ ofRat (Rat.invNatP ka) := ofRat_mono (Rat.invNatP_nonneg ka)
  have hb0 : zero ≤ b := nonneg_of_pos ⟨kb, hkb⟩
  have step1 : ofRat (Rat.invNatP ka) * b ≤ a * b :=
    mul_le_mul_of_nonneg_right hka hb0
  have step2 : ofRat (Rat.invNatP ka) * ofRat (Rat.invNatP kb) ≤ ofRat (Rat.invNatP ka) * b :=
    mul_le_mul_of_nonneg_left hkb hpa
  have hle : ofRat (Rat.invNatP ka) * ofRat (Rat.invNatP kb) ≤ a * b :=
    le_trans step2 step1
  have heq : ofRat (Rat.invNatP (ka * kb + ka + kb))
      = ofRat (Rat.invNatP ka) * ofRat (Rat.invNatP kb) := by
    rw [← ofRat_mul, Rat.invNatP_mul]
  rw [heq]; exact hle

/-! ## The strict order `<` -/

/-- `-0 = 0` in ℝ. -/
theorem neg_zero : (-zero : RReal) = zero := by
  have h := add_right_neg (zero : RReal)
  rw [zero_add] at h; exact h

/-- **Strict order**: `a < b` when the difference `b − a` is (Bishop-)positive. -/
def lt (a b : RReal) : Prop := Pos (b + (-a))

instance : LT RReal := ⟨lt⟩

/-- `0 < a` is exactly Bishop positivity of `a`. -/
theorem zero_lt_iff_pos {a : RReal} : zero < a ↔ Pos a := by
  show Pos (a + (-zero)) ↔ Pos a
  rw [neg_zero, add_zero]

/-- `Pos` is upward-closed under `≤`. -/
theorem pos_mono {x y : RReal} (hx : Pos x) (hxy : x ≤ y) : Pos y := by
  obtain ⟨k, hk⟩ := hx; exact ⟨k, le_trans hk hxy⟩

/-- Negation reverses `≤`. -/
theorem neg_le_neg {a b : RReal} (h : a ≤ b) : -b ≤ -a := by
  have h1 : zero ≤ -a + b := by
    have h0 := add_le_add_left h (-a)
    rwa [add_left_neg] at h0
  have h2 := add_le_add_right h1 (-b)
  rw [zero_add, add_assoc, add_right_neg, add_zero] at h2
  exact h2

/-- A strict inequality entails the weak one. -/
theorem le_of_lt {a b : RReal} (h : a < b) : a ≤ b := by
  have hpos : zero ≤ b + (-a) := nonneg_of_pos h
  have h2 := add_le_add_right hpos a
  rw [zero_add, add_assoc, add_left_neg, add_zero] at h2
  exact h2

theorem lt_of_lt_of_le {a b c : RReal} (h1 : a < b) (h2 : b ≤ c) : a < c :=
  pos_mono h1 (add_le_add_right h2 (-a))

theorem lt_of_le_of_lt {a b c : RReal} (h1 : a ≤ b) (h2 : b < c) : a < c :=
  pos_mono h2 (add_le_add_left (neg_le_neg h1) c)

theorem lt_trans {a b c : RReal} (h1 : a < b) (h2 : b < c) : a < c :=
  lt_of_lt_of_le h1 (le_of_lt h2)

/-- **Products of positive reals are positive** (`<`-form). -/
theorem mul_pos' {a b : RReal} (ha : zero < a) (hb : zero < b) : zero < a * b :=
  zero_lt_iff_pos.mpr (mul_pos (zero_lt_iff_pos.mp ha) (zero_lt_iff_pos.mp hb))

/-- **Strict monotonicity of left multiplication by a positive real.** -/
theorem mul_lt_mul_of_pos_left {a b c : RReal} (h : a < b) (hc : zero < c) :
    c * a < c * b := by
  have hp : Pos (c * (b + (-a))) := mul_pos (zero_lt_iff_pos.mp hc) h
  show Pos (c * b + (-(c * a)))
  rwa [left_distrib, mul_neg] at hp

/-- **Strict monotonicity of right multiplication by a positive real.** -/
theorem mul_lt_mul_of_pos_right {a b c : RReal} (h : a < b) (hc : zero < c) :
    a * c < b * c := by
  rw [mul_comm a c, mul_comm b c]; exact mul_lt_mul_of_pos_left h hc

/-- Zero is not (Bishop-)positive — no positive rational sits below `0`. -/
theorem not_pos_zero : ¬ Pos (zero : RReal) := by
  rintro ⟨k, hk⟩
  have h0 : (zero : RReal) ≤ ofRat (Rat.invNatP k) := ofRat_mono (Rat.invNatP_nonneg k)
  have heq : ofRat (Rat.invNatP k) = zero := le_antisymm hk h0
  exact Rat.invNatP_ne_zero k (ofRat_injective heq)

/-- `<` is irreflexive. -/
theorem lt_irrefl (a : RReal) : ¬ a < a := by
  intro h
  have h' : Pos (a + (-a)) := h
  rw [add_right_neg] at h'
  exact not_pos_zero h'

/-- `<` is asymmetric. -/
theorem lt_asymm {a b : RReal} (h1 : a < b) (h2 : b < a) : False :=
  lt_irrefl a (lt_trans h1 h2)

/-- **Strict monotonicity of multiplication in both factors** (for positive bounds):
`a < b`, `c < d`, with `0 < c` and `0 < b`, give `a·c < b·d`. -/
theorem mul_lt_mul {a b c d : RReal} (h1 : a < b) (h2 : c < d) (hc : zero < c)
    (hb : zero < b) : a * c < b * d :=
  lt_trans (mul_lt_mul_of_pos_right h1 hc) (mul_lt_mul_of_pos_left h2 hb)

end RReal

end Real.Internal
end Infomaterial
