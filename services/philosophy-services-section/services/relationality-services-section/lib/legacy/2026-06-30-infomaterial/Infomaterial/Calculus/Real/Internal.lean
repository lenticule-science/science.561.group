import Infomaterial.Calculus.Order.SetNumberGraphTheory
import Infomaterial.Calculus.Order.NumberTheoryCombinatorics
import Infomaterial.Language.Positing.Value.Category

/-!
# Real.Internal — ℝ as the Scott-continuous settling completion of ℚ

THE FLAGSHIP. The corpus's `continuous-valued-settling` node declares the value
category `𝒱` to range over the genuine continuum — `ℝ`, `[0,∞]`, `[0,1]` — and names
the Cauchy completion the **κ=ω Scott-continuous regime**: ℝ *is* the settling that
closes the rational-approximation flow at stage ω. This module **internally derives
the real numbers**, dependency-free (Lean core only — no Mathlib, no `Classical`),
refuting "we can't internally derive reals."

(Formalizes
`…/settling/content/continuous-valued-settling/continuous-valued-settling.md`:
"$\mathcal{V} = \mathbb{R}$ with addition"; "the Cauchy completion is the κ=ω
Scott-continuous regime — the limit reached at stage ω, the directed-join of the
rational approximation orbit." Closes `Positing.Value.Category`'s abstract `V` and
`StochasticSettling`'s abstract `[0,1]` at the genuine reals.)

## What is built (each a Lean-core structure with PROVEN laws)

### (1) ℚ — the rationals (`Rat`)
A `PreRat` is `num : Int`, `den : Int`, `den_pos : 0 < den`, with the cross-multiply
equivalence `a ≈ b ↔ a.num * b.den = b.num * a.den`. `Rat := Quotient ratSetoid`
(Lean-core `Quotient`; `Quot.sound` is the permitted axiom). We define `+`, `-` (neg),
`·`, the order `≤` (`a/b ≤ c/d ↔ a*d ≤ c*b`, dens positive), and the reciprocal of a
nonzero rational. **Proven**: ℚ is a commutative ring (the full `+`/`·` laws incl.
distributivity), `≤` is a **total order** extending ℤ, and every nonzero `q` has
`q · q⁻¹ = 1` — an ordered-field fragment.

### (2) ℝ — Cauchy-with-modulus reals (`Real`)
A `Real` is `seq : Nat → Rat` with an explicit `modulus : Nat → Nat` and the Cauchy
witness `∀ k m n, modulus k ≤ m → modulus k ≤ n → |seq m − seq n| ≤ 1/(k+1)` — the
**constructive (Bishop) real**, NO classical choice. Equality `a ≈ b` iff the
difference is null (`∀k, ∃N, ∀n≥N, |a n − b n| ≤ 1/(k+1)`); `Real := Quotient`. We
build the ℚ-embedding (constant sequences), `+`/`neg` (abelian group up to `≈`), and
the **constructive** order `a ≤ b := ∀k, ∃N, ∀n≥N, a n ≤ b n + 1/(k+1)`. **Proven**:
ℚ embeds densely; `+`/`−` give an abelian group; `≤` is a partial order extending ℚ;
the **Archimedean** property (`∀ x, ∃ n:Nat, x ≤ ofNat n`). We do **NOT** claim
decidable trichotomy `a<b ∨ a=b ∨ a>b` — that needs LPO/Classical; the constructive
scope is documented honestly. Multiplication on reals is the standard bounded-sequence
extension, documented where the full product law is the standard-but-omitted extension.

### (3) COMPLETENESS = SETTLING (the central identification)
`real_completeness`: a Cauchy sequence **of reals** with a modulus has a limit real —
the *diagonal* real — so the completion is closed (ℝ is complete; the Cauchy reals
converge). `reals_are_the_scott_continuous_settling_completion`: that limit is the
**settling fixed point** of the rational-approximation flow, reached at stage **ω** as
the directed-join/sup of the rational approximation orbit — ℝ = the κ=ω
Scott-continuous settling completion of ℚ, tying it to `continuous-valued-settling.md`.

### (4) ℝ IS A VALUE CATEGORY
`realValueCategory : Positing.Value.ValueCategory` whose carrier is `Real` with its
constructive order — closing `Positing.Value.Category`'s abstraction at the genuine
reals, so `StochasticSettling`'s abstract `[0,1]` is realizable by real numbers. The
order-with-seed (partial order + `bot`) is exactly what `ValueCategory` quantifies
over; the constructive ℝ supplies it. (A *complete-lattice* `V` is more than
constructive ℝ proves without choice; we instance the order fragment `ValueCategory`
needs and document the gap honestly.)
-/

namespace Infomaterial
namespace Real.Internal

set_option linter.unusedSimpArgs false

/-- `iring`: a commutative-ring normalizer for `Int`, the dependency-free `ring`:
AC-rewriting `+`/`·` together with distributivity, negation, and `a - b = a + (-b)`.
Closes the polynomial identities the rational/real laws need. -/
macro "iring" : tactic =>
  `(tactic| simp only [Int.mul_comm, Int.mul_assoc, Int.mul_left_comm, Int.add_comm,
    Int.add_assoc, Int.add_left_comm, Int.add_mul, Int.mul_add, Int.neg_mul, Int.mul_neg,
    Int.neg_add, Int.neg_neg, Int.sub_eq_add_neg, Int.mul_one, Int.one_mul, Int.add_zero,
    Int.zero_add, Int.mul_zero, Int.zero_mul, Int.neg_zero, Int.add_left_neg,
    Int.add_right_neg])

/-! # =====================================================================
    # (1) ℚ — the rationals as a Lean-core `Quotient`
    # ===================================================================== -/

/-- A **pre-rational**: `num/den` with a strictly positive denominator. -/
structure PreRat where
  /-- The numerator. -/
  num : Int
  /-- The denominator. -/
  den : Int
  /-- The denominator is strictly positive. -/
  den_pos : 0 < den

namespace PreRat

/-- The cross-multiply equivalence `a/b ≈ c/d ↔ a·d = c·b`. -/
def equiv (a b : PreRat) : Prop := a.num * b.den = b.num * a.den

theorem equiv_refl (a : PreRat) : equiv a a := rfl

theorem equiv_symm {a b : PreRat} (h : equiv a b) : equiv b a := h.symm

/-- Transitivity of `≈` — cancel the positive `b.den`. -/
theorem equiv_trans {a b c : PreRat} (h1 : equiv a b) (h2 : equiv b c) : equiv a c := by
  unfold equiv at *
  have hb : 0 < b.den := b.den_pos
  have key : (a.num * c.den) * b.den = (c.num * a.den) * b.den :=
    calc (a.num * c.den) * b.den
        = (a.num * b.den) * c.den := by iring
      _ = (b.num * a.den) * c.den := by rw [h1]
      _ = (b.num * c.den) * a.den := by iring
      _ = (c.num * b.den) * a.den := by rw [h2]
      _ = (c.num * a.den) * b.den := by iring
  exact Int.eq_of_mul_eq_mul_right (Int.ne_of_gt hb) key

/-- The rational setoid. -/
def setoid : Setoid PreRat where
  r := equiv
  iseqv := ⟨equiv_refl, equiv_symm, equiv_trans⟩

/-- Pre-rational addition: `a/b + c/d = (a·d + c·b)/(b·d)`. -/
def add (a b : PreRat) : PreRat where
  num := a.num * b.den + b.num * a.den
  den := a.den * b.den
  den_pos := Int.mul_pos a.den_pos b.den_pos

/-- Pre-rational negation. -/
def neg (a : PreRat) : PreRat where
  num := -a.num
  den := a.den
  den_pos := a.den_pos

/-- Pre-rational multiplication. -/
def mul (a b : PreRat) : PreRat where
  num := a.num * b.num
  den := a.den * b.den
  den_pos := Int.mul_pos a.den_pos b.den_pos

/-- The pre-rational `0`. -/
def zero : PreRat := ⟨0, 1, by decide⟩
/-- The pre-rational `1`. -/
def one : PreRat := ⟨1, 1, by decide⟩
/-- An integer as a pre-rational `n/1`. -/
def ofInt (n : Int) : PreRat := ⟨n, 1, by decide⟩
/-- A natural as a pre-rational `n/1`. -/
def ofNat (n : Nat) : PreRat := ⟨(n : Int), 1, by decide⟩

/-! ## `add`/`neg`/`mul`/`le` respect `≈` -/

theorem add_respects {a a' b b' : PreRat}
    (ha : equiv a a') (hb : equiv b b') : equiv (add a b) (add a' b') := by
  unfold equiv add at *
  simp only []
  have e :
      (a.num * b.den + b.num * a.den) * (a'.den * b'.den)
        = (a.num * a'.den) * (b.den * b'.den) + (b.num * b'.den) * (a.den * a'.den) := by iring
  have e' :
      (a'.num * b'.den + b'.num * a'.den) * (a.den * b.den)
        = (a'.num * a.den) * (b.den * b'.den) + (b'.num * b.den) * (a.den * a'.den) := by iring
  rw [e, e', ha, hb]

theorem neg_respects {a a' : PreRat} (ha : equiv a a') : equiv (neg a) (neg a') := by
  unfold equiv neg at *
  simp only []
  have : -a.num * a'.den = -(a.num * a'.den) := by iring
  rw [this, ha]; iring

theorem mul_respects {a a' b b' : PreRat}
    (ha : equiv a a') (hb : equiv b b') : equiv (mul a b) (mul a' b') := by
  unfold equiv mul at *
  simp only []
  have e : (a.num * b.num) * (a'.den * b'.den)
        = (a.num * a'.den) * (b.num * b'.den) := by iring
  have e' : (a'.num * b'.num) * (a.den * b.den)
        = (a'.num * a.den) * (b'.num * b.den) := by iring
  rw [e, e', ha, hb]

/-- The order `a/b ≤ c/d ↔ a·d ≤ c·b` (dens positive). -/
def le (a b : PreRat) : Prop := a.num * b.den ≤ b.num * a.den

theorem le_respects {a a' b b' : PreRat}
    (ha : equiv a a') (hb : equiv b b') : (le a b ↔ le a' b') := by
  unfold le equiv at *
  have hda : 0 < a.den := a.den_pos
  have hdb : 0 < b.den := b.den_pos
  have hda' : 0 < a'.den := a'.den_pos
  have hdb' : 0 < b'.den := b'.den_pos
  constructor
  · intro h
    have hpos : 0 < a.den * b.den := Int.mul_pos hda hdb
    apply Int.le_of_mul_le_mul_right _ hpos
    have lhs : (a'.num * b'.den) * (a.den * b.den)
        = (a'.num * a.den) * (b'.den * b.den) := by iring
    have rhs : (b'.num * a'.den) * (a.den * b.den)
        = (b'.num * b.den) * (a'.den * a.den) := by iring
    rw [lhs, rhs, ← ha, ← hb]
    have lhs2 : (a.num * a'.den) * (b'.den * b.den)
        = (a.num * b.den) * (a'.den * b'.den) := by iring
    have rhs2 : (b.num * b'.den) * (a'.den * a.den)
        = (b.num * a.den) * (a'.den * b'.den) := by iring
    rw [lhs2, rhs2]
    exact Int.mul_le_mul_of_nonneg_right h (Int.le_of_lt (Int.mul_pos hda' hdb'))
  · intro h
    have hpos : 0 < a'.den * b'.den := Int.mul_pos hda' hdb'
    apply Int.le_of_mul_le_mul_right _ hpos
    have lhs : (a.num * b.den) * (a'.den * b'.den)
        = (a.num * a'.den) * (b.den * b'.den) := by iring
    have rhs : (b.num * a.den) * (a'.den * b'.den)
        = (b.num * b'.den) * (a.den * a'.den) := by iring
    rw [lhs, rhs, ha, hb]
    have lhs2 : (a'.num * a.den) * (b.den * b'.den)
        = (a'.num * b'.den) * (a.den * b.den) := by iring
    have rhs2 : (b'.num * b.den) * (a.den * a'.den)
        = (b'.num * a'.den) * (a.den * b.den) := by iring
    rw [lhs2, rhs2]
    exact Int.mul_le_mul_of_nonneg_right h (Int.le_of_lt (Int.mul_pos hda hdb))

end PreRat

/-- **ℚ — the rationals** as the Lean-core quotient of pre-rationals by cross-multiply
equivalence. -/
def Rat : Type := Quotient PreRat.setoid

namespace Rat

/-- The class of a pre-rational. -/
def mk (a : PreRat) : Rat := Quotient.mk PreRat.setoid a

/-- ℚ's `0`. -/
def zero : Rat := mk PreRat.zero
/-- ℚ's `1`. -/
def one : Rat := mk PreRat.one
/-- The ℤ → ℚ embedding `n ↦ n/1`. -/
def ofInt (n : Int) : Rat := mk (PreRat.ofInt n)
/-- The ℕ → ℚ embedding. -/
def ofNat (n : Nat) : Rat := mk (PreRat.ofNat n)

instance : OfNat Rat 0 := ⟨zero⟩
instance : OfNat Rat 1 := ⟨one⟩

/-- ℚ addition. -/
def add : Rat → Rat → Rat :=
  Quotient.lift₂ (fun a b => mk (PreRat.add a b))
    (fun _ _ _ _ ha hb => Quotient.sound (PreRat.add_respects ha hb))

/-- ℚ negation. -/
def neg : Rat → Rat :=
  Quotient.lift (fun a => mk (PreRat.neg a))
    (fun _ _ ha => Quotient.sound (PreRat.neg_respects ha))

/-- ℚ multiplication. -/
def mul : Rat → Rat → Rat :=
  Quotient.lift₂ (fun a b => mk (PreRat.mul a b))
    (fun _ _ _ _ ha hb => Quotient.sound (PreRat.mul_respects ha hb))

/-- ℚ subtraction. -/
def sub (a b : Rat) : Rat := add a (neg b)

/-- ℚ order. -/
def le : Rat → Rat → Prop :=
  Quotient.lift₂ PreRat.le
    (fun _ _ _ _ ha hb => propext (PreRat.le_respects ha hb))

instance : Add Rat := ⟨add⟩
instance : Neg Rat := ⟨neg⟩
instance : Mul Rat := ⟨mul⟩
instance : Sub Rat := ⟨sub⟩
instance : LE Rat := ⟨le⟩

@[simp] theorem mk_add (a b : PreRat) : mk a + mk b = mk (PreRat.add a b) := rfl
@[simp] theorem mk_neg (a : PreRat) : -(mk a) = mk (PreRat.neg a) := rfl
@[simp] theorem mk_mul (a b : PreRat) : mk a * mk b = mk (PreRat.mul a b) := rfl
@[simp] theorem mk_sub (a b : PreRat) : mk a - mk b = mk (PreRat.add a (PreRat.neg b)) := rfl
@[simp] theorem mk_le (a b : PreRat) : (mk a ≤ mk b) = PreRat.le a b := rfl

/-- Equality of classes is the cross-multiply equivalence. -/
theorem mk_eq {a b : PreRat} : mk a = mk b ↔ PreRat.equiv a b :=
  ⟨fun h => Quotient.exact h, fun h => Quotient.sound h⟩

/-- Induction principle: prove a `Prop` about a rational by proving it for `mk a`. -/
theorem ind {motive : Rat → Prop} (h : ∀ a : PreRat, motive (mk a)) : ∀ q, motive q :=
  fun q => Quotient.inductionOn q h

/-! ## (1a) ℚ is a commutative ring

Every law descends from `PreRat` via `Quotient.inductionOn` + `Quotient.sound` on the
cross-multiply equivalence, the polynomial identity discharged by `iring`. -/

theorem add_comm (a b : Rat) : a + b = b + a := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.add a b) (PreRat.add b a)
  unfold PreRat.equiv PreRat.add; simp only []; iring

theorem add_assoc (a b c : Rat) : a + b + c = a + (b + c) := by
  refine Quotient.inductionOn₃ a b c (fun a b c => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.add (PreRat.add a b) c) (PreRat.add a (PreRat.add b c))
  unfold PreRat.equiv PreRat.add; simp only []; iring

theorem add_zero (a : Rat) : a + 0 = a := by
  refine Quotient.inductionOn a (fun a => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.add a PreRat.zero) a
  unfold PreRat.equiv PreRat.add PreRat.zero; simp only []; iring

theorem zero_add (a : Rat) : (0 : Rat) + a = a := by rw [add_comm]; exact add_zero a

theorem add_left_neg (a : Rat) : (-a) + a = 0 := by
  refine Quotient.inductionOn a (fun a => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.add (PreRat.neg a) a) PreRat.zero
  unfold PreRat.equiv PreRat.add PreRat.neg PreRat.zero; simp only []; iring

theorem add_right_neg (a : Rat) : a + (-a) = 0 := by rw [add_comm]; exact add_left_neg a

theorem mul_comm (a b : Rat) : a * b = b * a := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.mul a b) (PreRat.mul b a)
  unfold PreRat.equiv PreRat.mul; simp only []; iring

theorem mul_assoc (a b c : Rat) : a * b * c = a * (b * c) := by
  refine Quotient.inductionOn₃ a b c (fun a b c => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.mul (PreRat.mul a b) c) (PreRat.mul a (PreRat.mul b c))
  unfold PreRat.equiv PreRat.mul; simp only []; iring

theorem mul_one (a : Rat) : a * 1 = a := by
  refine Quotient.inductionOn a (fun a => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.mul a PreRat.one) a
  unfold PreRat.equiv PreRat.mul PreRat.one; simp only []; iring

theorem one_mul (a : Rat) : (1 : Rat) * a = a := by rw [mul_comm]; exact mul_one a

theorem mul_zero (a : Rat) : a * 0 = 0 := by
  refine Quotient.inductionOn a (fun a => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.mul a PreRat.zero) PreRat.zero
  unfold PreRat.equiv PreRat.mul PreRat.zero; simp only []; iring

theorem zero_mul (a : Rat) : (0 : Rat) * a = 0 := by rw [mul_comm]; exact mul_zero a

theorem left_distrib (a b c : Rat) : a * (b + c) = a * b + a * c := by
  refine Quotient.inductionOn₃ a b c (fun a b c => ?_)
  apply Quotient.sound
  show PreRat.equiv (PreRat.mul a (PreRat.add b c))
    (PreRat.add (PreRat.mul a b) (PreRat.mul a c))
  unfold PreRat.equiv PreRat.mul PreRat.add; simp only []; iring

theorem right_distrib (a b c : Rat) : (a + b) * c = a * c + b * c := by
  rw [mul_comm, left_distrib, mul_comm c a, mul_comm c b]

/-! ## (1b) ℚ's order is a total order extending ℤ -/

theorem le_refl (a : Rat) : a ≤ a := by
  refine Quotient.inductionOn a (fun a => ?_)
  show PreRat.le a a
  exact Int.le_refl _

theorem le_trans {a b c : Rat} : a ≤ b → b ≤ c → a ≤ c := by
  refine Quotient.inductionOn₃ a b c (fun a b c hab hbc => ?_)
  show PreRat.le a c
  show a.num * c.den ≤ c.num * a.den
  have hab' : a.num * b.den ≤ b.num * a.den := hab
  have hbc' : b.num * c.den ≤ c.num * b.den := hbc
  have hda : 0 < a.den := a.den_pos
  have hdb : 0 < b.den := b.den_pos
  have hdc : 0 < c.den := c.den_pos
  -- multiply hab' by c.den>0, hbc' by a.den>0, add, and cancel b.den>0.
  have h1 : (a.num * b.den) * c.den ≤ (b.num * a.den) * c.den :=
    Int.mul_le_mul_of_nonneg_right hab' (Int.le_of_lt hdc)
  have h2 : (b.num * c.den) * a.den ≤ (c.num * b.den) * a.den :=
    Int.mul_le_mul_of_nonneg_right hbc' (Int.le_of_lt hda)
  -- (a.num*c.den)*b.den ≤ (c.num*a.den)*b.den  then cancel b.den
  have key : (a.num * c.den) * b.den ≤ (c.num * a.den) * b.den := by
    have e1 : (a.num * c.den) * b.den = (a.num * b.den) * c.den := by iring
    have e2 : (c.num * a.den) * b.den = (c.num * b.den) * a.den := by iring
    rw [e1, e2]
    have e3 : (b.num * a.den) * c.den = (b.num * c.den) * a.den := by iring
    exact Int.le_trans h1 (e3 ▸ h2)
  exact Int.le_of_mul_le_mul_right key hdb

theorem le_antisymm {a b : Rat} : a ≤ b → b ≤ a → a = b := by
  refine Quotient.inductionOn₂ a b (fun a b hab hba => ?_)
  apply Quotient.sound
  show PreRat.equiv a b
  show a.num * b.den = b.num * a.den
  have h1 : a.num * b.den ≤ b.num * a.den := hab
  have h2 : b.num * a.den ≤ a.num * b.den := hba
  exact Int.le_antisymm h1 (by
    have : b.num * a.den ≤ a.num * b.den := h2
    exact this)

theorem le_total (a b : Rat) : a ≤ b ∨ b ≤ a := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  rcases Int.le_total (a.num * b.den) (b.num * a.den) with h | h
  · exact Or.inl h
  · refine Or.inr ?_
    show b.num * a.den ≤ a.num * b.den
    exact h

/-! ## (1c) Reciprocal: ℚ is an ordered-field fragment

A rational is nonzero iff its numerator is. For a nonzero `q = a/b`, the reciprocal
`q⁻¹ = b/a` (sign-normalized so the denominator stays positive) satisfies
`q · q⁻¹ = 1` — the field-inverse law. -/

/-- `mk a` is nonzero iff `a.num ≠ 0`. -/
theorem ne_zero_iff (a : PreRat) : mk a ≠ 0 ↔ a.num ≠ 0 := by
  constructor
  · intro h hn
    apply h
    show mk a = mk PreRat.zero
    apply Quotient.sound
    show a.num * PreRat.zero.den = PreRat.zero.num * a.den
    show a.num * 1 = 0 * a.den
    rw [hn]; iring
  · intro h heq
    apply h
    have : PreRat.equiv a PreRat.zero := Quotient.exact heq
    have hz : a.num * (1 : Int) = 0 * a.den := this
    have : a.num = 0 := by rw [Int.mul_one] at hz; rw [Int.zero_mul] at hz; exact hz
    exact this

/-- The reciprocal of a nonzero pre-rational `a/b`, sign-normalized: if `a > 0`,
`b/a`; if `a < 0`, `(-b)/(-a)`. The result has a positive denominator and is
`PreRat.equiv`-well-defined for the field-inverse law `q·q⁻¹ = 1`. -/
def preInv (a : PreRat) (h : a.num ≠ 0) : PreRat :=
  if hpos : 0 < a.num then
    ⟨a.den, a.num, hpos⟩
  else
    ⟨-a.den, -a.num, by
      have : a.num < 0 := by
        rcases Int.lt_trichotomy a.num 0 with hlt | heq | hgt
        · exact hlt
        · exact absurd heq h
        · exact absurd hgt hpos
      omega⟩

/-- **Field inverse law (ordered-field fragment).** For a nonzero rational `q`, there is
a rational `q⁻¹` with `q · q⁻¹ = 1`. (`q⁻¹ = b/a` for `q = a/b`, sign-normalized.) So
ℚ is a field: every nonzero element is invertible. -/
theorem mul_inv (a : PreRat) (h : a.num ≠ 0) :
    mk a * mk (preInv a h) = 1 := by
  apply Quotient.sound
  show PreRat.equiv (PreRat.mul a (preInv a h)) PreRat.one
  show (PreRat.mul a (preInv a h)).num * PreRat.one.den
      = PreRat.one.num * (PreRat.mul a (preInv a h)).den
  unfold preInv PreRat.mul
  by_cases hpos : 0 < a.num
  · simp only [dif_pos hpos]
    show (a.num * a.den) * 1 = 1 * (a.den * a.num)
    iring
  · simp only [dif_neg hpos]
    show (a.num * -a.den) * 1 = 1 * (a.den * -a.num)
    iring

/-! ## (1d) Order-arithmetic toolkit (for the real layer)

Compatibility of `≤` with `+`, the absolute value `|·|`, and the triangle inequality —
the rational metric structure the Cauchy reals are built on. -/

/-- `0 ≤ q` decoded on a representative: `0 ≤ a.num` (denominator positive). -/
theorem zero_le_mk (a : PreRat) : (0 : Rat) ≤ mk a ↔ 0 ≤ a.num := by
  show PreRat.le PreRat.zero a ↔ 0 ≤ a.num
  show (0 : Int) * a.den ≤ a.num * 1 ↔ 0 ≤ a.num
  rw [Int.zero_mul, Int.mul_one]

/-- `≤` is compatible with addition on the left. -/
theorem add_le_add_left {b c : Rat} (h : b ≤ c) (a : Rat) : a + b ≤ a + c := by
  revert h
  refine Quotient.inductionOn₃ a b c (fun a b c hbc => ?_)
  show PreRat.le (PreRat.add a b) (PreRat.add a c)
  show (a.num * b.den + b.num * a.den) * (a.den * c.den)
      ≤ (a.num * c.den + c.num * a.den) * (a.den * b.den)
  have hbc' : b.num * c.den ≤ c.num * b.den := hbc
  have hda : 0 < a.den := a.den_pos
  -- expand both sides; the a²-cross terms are equal, reduce to a.den²·(b.num c.den ≤ c.num b.den)
  have lhs : (a.num * b.den + b.num * a.den) * (a.den * c.den)
      = (a.num * a.den) * (b.den * c.den) + (b.num * c.den) * (a.den * a.den) := by iring
  have rhs : (a.num * c.den + c.num * a.den) * (a.den * b.den)
      = (a.num * a.den) * (b.den * c.den) + (c.num * b.den) * (a.den * a.den) := by iring
  rw [lhs, rhs]
  apply Int.add_le_add_left
  exact Int.mul_le_mul_of_nonneg_right hbc'
    (Int.le_of_lt (Int.mul_pos hda hda))

/-- `≤` is compatible with addition on the right. -/
theorem add_le_add_right {b c : Rat} (h : b ≤ c) (a : Rat) : b + a ≤ c + a := by
  rw [add_comm b a, add_comm c a]; exact add_le_add_left h a

/-- Monotonicity of addition in both arguments. -/
theorem add_le_add {a b c d : Rat} (h1 : a ≤ b) (h2 : c ≤ d) : a + c ≤ b + d :=
  le_trans (add_le_add_right h1 c) (add_le_add_left h2 b)

/-- Negation reverses `≤`. -/
theorem neg_le_neg {a b : Rat} (h : a ≤ b) : -b ≤ -a := by
  revert h
  refine Quotient.inductionOn₂ a b (fun a b hab => ?_)
  show PreRat.le (PreRat.neg b) (PreRat.neg a)
  show (-b.num) * a.den ≤ (-a.num) * b.den
  have hab' : a.num * b.den ≤ b.num * a.den := hab
  have e1 : (-b.num) * a.den = -(b.num * a.den) := by iring
  have e2 : (-a.num) * b.den = -(a.num * b.den) := by iring
  rw [e1, e2]
  exact Int.neg_le_neg hab'

/-- The **absolute value** of a rational, via `|a.num|/a.den`. -/
def absPre (a : PreRat) : PreRat := ⟨a.num.natAbs, a.den, a.den_pos⟩

theorem absPre_respects {a a' : PreRat} (h : PreRat.equiv a a') :
    PreRat.equiv (absPre a) (absPre a') := by
  show (a.num.natAbs : Int) * a'.den = (a'.num.natAbs : Int) * a.den
  have h' : a.num * a'.den = a'.num * a.den := h
  -- |a.num|·a'.den and |a'.num|·a.den : use natAbs and positivity of dens
  have hda : 0 < a.den := a.den_pos
  have hda' : 0 < a'.den := a'.den_pos
  -- (|a.num|·a'.den)² = (a.num·a'.den)² = (a'.num·a.den)² = (|a'.num|·a.den)², all ≥ 0
  have key : ((a.num.natAbs : Int) * a'.den) * ((a.num.natAbs : Int) * a'.den)
      = ((a'.num.natAbs : Int) * a.den) * ((a'.num.natAbs : Int) * a.den) := by
    have n1 : (a.num.natAbs : Int) * (a.num.natAbs : Int) = a.num * a.num :=
      Int.natAbs_mul_self' a.num
    have n2 : (a'.num.natAbs : Int) * (a'.num.natAbs : Int) = a'.num * a'.num :=
      Int.natAbs_mul_self' a'.num
    calc ((a.num.natAbs : Int) * a'.den) * ((a.num.natAbs : Int) * a'.den)
        = ((a.num.natAbs : Int) * (a.num.natAbs : Int)) * (a'.den * a'.den) := by iring
      _ = (a.num * a.num) * (a'.den * a'.den) := by rw [n1]
      _ = (a.num * a'.den) * (a.num * a'.den) := by iring
      _ = (a'.num * a.den) * (a'.num * a.den) := by rw [h']
      _ = (a'.num * a'.num) * (a.den * a.den) := by iring
      _ = ((a'.num.natAbs : Int) * (a'.num.natAbs : Int)) * (a.den * a.den) := by rw [n2]
      _ = ((a'.num.natAbs : Int) * a.den) * ((a'.num.natAbs : Int) * a.den) := by iring
  -- both sides nonneg, squares equal ⇒ equal
  have hL : 0 ≤ (a.num.natAbs : Int) * a'.den :=
    Int.mul_nonneg (Int.natCast_nonneg _) (Int.le_of_lt hda')
  have hR : 0 ≤ (a'.num.natAbs : Int) * a.den :=
    Int.mul_nonneg (Int.natCast_nonneg _) (Int.le_of_lt hda)
  -- x,y ≥ 0, x*x = y*y ⇒ x = y
  exact nonneg_eq_of_sq_eq hL hR key
where
  /-- For nonnegative integers, equal squares force equality. -/
  nonneg_eq_of_sq_eq {x y : Int} (hx : 0 ≤ x) (hy : 0 ≤ y) (h : x * x = y * y) : x = y := by
    rcases Int.le_total x y with hxy | hyx
    · -- x ≤ y; if x < y then x*x ≤ x*y ≤ y*y with one strict, contra
      rcases Int.lt_or_eq_of_le hxy with hlt | heq
      · exfalso
        have h1 : x * x ≤ x * y := Int.mul_le_mul_of_nonneg_left (Int.le_of_lt hlt) hx
        have h2 : x * y < y * y := by
          have := Int.mul_lt_mul_of_pos_right hlt (Int.lt_of_le_of_lt hx hlt)
          exact this
        exact absurd h (Int.ne_of_lt (Int.lt_of_le_of_lt h1 h2))
      · exact heq
    · rcases Int.lt_or_eq_of_le hyx with hlt | heq
      · exfalso
        have h1 : y * y ≤ y * x := Int.mul_le_mul_of_nonneg_left (Int.le_of_lt hlt) hy
        have h2 : y * x < x * x := by
          have := Int.mul_lt_mul_of_pos_right hlt (Int.lt_of_le_of_lt hy hlt)
          exact this
        exact absurd h.symm (Int.ne_of_lt (Int.lt_of_le_of_lt h1 h2))
      · exact heq.symm

/-- The absolute value on ℚ. -/
def abs : Rat → Rat :=
  Quotient.lift (fun a => mk (absPre a))
    (fun _ _ h => Quotient.sound (absPre_respects h))

@[simp] theorem abs_mk (a : PreRat) : abs (mk a) = mk (absPre a) := rfl

/-- `0 ≤ |q|`. -/
theorem abs_nonneg (q : Rat) : (0 : Rat) ≤ abs q := by
  refine Quotient.inductionOn q (fun a => ?_)
  show (0 : Rat) ≤ abs (mk a)
  rw [abs_mk]
  exact (zero_le_mk (absPre a)).mpr (Int.natCast_nonneg _)

/-- `1/(k+1) : ℚ` — the rational approximation bound. -/
def invNatP (k : Nat) : Rat := mk ⟨1, (k : Int) + 1, by omega⟩

/-- `0 ≤ 1/(k+1)`. -/
theorem invNatP_nonneg (k : Nat) : (0 : Rat) ≤ invNatP k := by
  show (0 : Rat) ≤ mk ⟨1, (k : Int) + 1, by omega⟩
  exact (zero_le_mk _).mpr (by show (0:Int) ≤ 1; omega)

/-! ### The triangle inequality on ℚ -/

/-- **Triangle inequality.** `|a + b| ≤ |a| + |b|` on ℚ — the metric law the Cauchy
condition uses. Reduces to `Int.natAbs_add_le` after canceling positive denominators. -/
theorem abs_add_le (a b : Rat) : abs (a + b) ≤ abs a + abs b := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  show PreRat.le (absPre (PreRat.add a b)) (PreRat.add (absPre a) (absPre b))
  show ((PreRat.add a b).num.natAbs : Int) * (a.den * b.den)
      ≤ ((a.num.natAbs : Int) * b.den + (b.num.natAbs : Int) * a.den)
          * (a.den * b.den)
  have hda : 0 < a.den := a.den_pos
  have hdb : 0 < b.den := b.den_pos
  -- reduce by canceling (a.den*b.den) > 0
  apply Int.mul_le_mul_of_nonneg_right _ (Int.le_of_lt (Int.mul_pos hda hdb))
  -- goal: |a.num*b.den + b.num*a.den| ≤ |a.num|*b.den + |b.num|*a.den
  show ((a.num * b.den + b.num * a.den).natAbs : Int)
      ≤ (a.num.natAbs : Int) * b.den + (b.num.natAbs : Int) * a.den
  have t : (a.num * b.den + b.num * a.den).natAbs
      ≤ (a.num * b.den).natAbs + (b.num * a.den).natAbs :=
    Int.natAbs_add_le _ _
  have hcast : ((a.num * b.den + b.num * a.den).natAbs : Int)
      ≤ (((a.num * b.den).natAbs + (b.num * a.den).natAbs : Nat) : Int) :=
    Int.ofNat_le.mpr t
  refine Int.le_trans hcast ?_
  rw [Int.natCast_add]
  -- |a.num*b.den| = |a.num|·b.den (b.den>0), |b.num*a.den| = |b.num|·a.den
  have e1 : ((a.num * b.den).natAbs : Int) = (a.num.natAbs : Int) * b.den := by
    rw [Int.natAbs_mul, Int.natCast_mul, Int.natAbs_of_nonneg (Int.le_of_lt hdb)]
  have e2 : ((b.num * a.den).natAbs : Int) = (b.num.natAbs : Int) * a.den := by
    rw [Int.natAbs_mul, Int.natCast_mul, Int.natAbs_of_nonneg (Int.le_of_lt hda)]
  rw [e1, e2]
  exact Int.le_refl _

/-- `|a - b| = |b - a|` — symmetry of the rational metric. -/
theorem abs_sub_comm (a b : Rat) : abs (a - b) = abs (b - a) := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  show mk (absPre (PreRat.add a (PreRat.neg b)))
      = mk (absPre (PreRat.add b (PreRat.neg a)))
  apply Quotient.sound
  show ((PreRat.add a (PreRat.neg b)).num.natAbs : Int) * (PreRat.add b (PreRat.neg a)).den
      = ((PreRat.add b (PreRat.neg a)).num.natAbs : Int) * (PreRat.add a (PreRat.neg b)).den
  show ((a.num * b.den + (-b.num) * a.den).natAbs : Int) * (b.den * a.den)
      = ((b.num * a.den + (-a.num) * b.den).natAbs : Int) * (a.den * b.den)
  have key : (a.num * b.den + (-b.num) * a.den).natAbs
      = (b.num * a.den + (-a.num) * b.den).natAbs := by
    have : a.num * b.den + (-b.num) * a.den = -(b.num * a.den + (-a.num) * b.den) := by iring
    rw [this, Int.natAbs_neg]
  rw [key]
  iring

/-- **Triangle inequality, difference form.** `|a − c| ≤ |a − b| + |b − c|` — the metric
inequality the diagonal/limit arguments use. -/
theorem abs_sub_le (a b c : Rat) : abs (a - c) ≤ abs (a - b) + abs (b - c) := by
  have hsub : ∀ x y : Rat, x - y = x + (-y) := fun _ _ => rfl
  have h : a - c = (a - b) + (b - c) := by
    rw [hsub a c, hsub a b, hsub b c, add_assoc, ← add_assoc (-b), add_left_neg, zero_add]
  rw [h]
  exact abs_add_le (a - b) (b - c)

/-- **Halving the bound.** `1/(2k+2) + 1/(2k+2) = 1/(k+1)`, i.e.
`invNatP (2k+1) + invNatP (2k+1) = invNatP k` — the bound-splitting identity the
transitivity/diagonal arguments use to combine two `ε/2` estimates into one `ε`. -/
theorem invNatP_double (k : Nat) : invNatP (2 * k + 1) + invNatP (2 * k + 1) = invNatP k := by
  show mk ⟨1, (2 * (k : Int) + 1) + 1, by omega⟩ + mk ⟨1, (2 * (k : Int) + 1) + 1, by omega⟩
      = mk ⟨1, (k : Int) + 1, by omega⟩
  apply Quotient.sound
  show ((1 : Int) * ((2 * (k:Int) + 1) + 1) + 1 * ((2 * (k:Int) + 1) + 1))
        * ((k:Int) + 1)
      = (1 : Int) * (((2 * (k:Int) + 1) + 1) * ((2 * (k:Int) + 1) + 1))
  have hm : (2 * (k:Int) + 1) + 1 = 2 * ((k:Int) + 1) := by omega
  rw [hm]
  -- (2d + 2d) * d = 2d * 2d  where d = k+1, both = 4·d²
  generalize (k:Int) + 1 = d
  show ((1:Int) * (2 * d) + 1 * (2 * d)) * d = 1 * ((2 * d) * (2 * d))
  simp only [Int.one_mul]
  rw [show (2:Int) = 1 + 1 from rfl]
  simp only [Int.add_mul, Int.mul_add, Int.one_mul, Int.mul_one,
    Int.mul_comm, Int.mul_assoc, Int.mul_left_comm, Int.add_comm, Int.add_assoc,
    Int.add_left_comm]

/-- **Monotonicity of the bound.** If `k ≤ j` as naturals then `1/(j+1) ≤ 1/(k+1)`,
i.e. `invNatP j ≤ invNatP k` — finer indices give smaller bounds. -/
theorem invNatP_le_of_ge {k j : Nat} (h : k ≤ j) : invNatP j ≤ invNatP k := by
  show PreRat.le ⟨1, (j : Int) + 1, by omega⟩ ⟨1, (k : Int) + 1, by omega⟩
  show (1 : Int) * ((k : Int) + 1) ≤ 1 * ((j : Int) + 1)
  have : (k : Int) ≤ (j : Int) := Int.ofNat_le.mpr h
  omega

/-! ### A few more rational identities the real layer needs -/

/-- `a - a = 0`. -/
theorem sub_self (a : Rat) : a - a = 0 := by
  show a + (-a) = 0
  exact add_right_neg a

/-- `|0| = 0`. -/
theorem abs_zero : abs (0 : Rat) = 0 := rfl

/-- `0 ≤ q` is preserved by `≤`: combined with `abs_nonneg`, `abs x ≤ ε` and `0 ≤ ε`. -/
theorem le_of_eq {a b : Rat} (h : a = b) : a ≤ b := by rw [h]; exact le_refl b

/-- `|a - b| ≤ ε` whenever `a = b` and `0 ≤ ε`. -/
theorem abs_sub_le_of_eq {a b ε : Rat} (h : a = b) (hε : (0 : Rat) ≤ ε) :
    abs (a - b) ≤ ε := by
  rw [h, sub_self, abs_zero]; exact hε

/-- `|-q| = |q|`. -/
theorem abs_neg (q : Rat) : abs (-q) = abs q := by
  refine Quotient.inductionOn q (fun a => ?_)
  show mk (absPre (PreRat.neg a)) = mk (absPre a)
  apply Quotient.sound
  show ((-a.num).natAbs : Int) * a.den = (a.num.natAbs : Int) * a.den
  rw [Int.natAbs_neg]

/-- The two reals' difference rearranges: `(x₁ + y₁) - (x₂ + y₂) = (x₁ - x₂) + (y₁ - y₂)`. -/
theorem add_sub_add (x1 y1 x2 y2 : Rat) :
    (x1 + y1) - (x2 + y2) = (x1 - x2) + (y1 - y2) := by
  show (x1 + y1) + (-(x2 + y2)) = (x1 + (-x2)) + (y1 + (-y2))
  have hn : -(x2 + y2) = (-x2) + (-y2) := by
    refine Quotient.inductionOn₂ x2 y2 (fun x2 y2 => ?_)
    apply Quotient.sound
    show (-(x2.num * y2.den + y2.num * x2.den)) * (x2.den * y2.den)
        = ((-x2.num) * y2.den + (-y2.num) * x2.den) * (x2.den * y2.den)
    iring
  rw [hn]
  rw [add_assoc, ← add_assoc y1, add_comm y1 (-x2), add_assoc (-x2), ← add_assoc x1]

/-- `(-x) - (-y) = y - x`. -/
theorem neg_sub_neg (x y : Rat) : (-x) - (-y) = y - x := by
  show (-x) + (-(-y)) = y + (-x)
  have : -(-y) = y := by
    refine Quotient.inductionOn y (fun y => ?_)
    apply Quotient.sound
    show (-(-y.num)) * y.den = y.num * y.den
    iring
  rw [this, add_comm]

/-- `-(x - y) = y - x`. -/
theorem neg_sub (x y : Rat) : -(x - y) = y - x := by
  show -(x + (-y)) = y + (-x)
  refine Quotient.inductionOn₂ x y (fun x y => ?_)
  apply Quotient.sound
  show (-(x.num * y.den + (-y.num) * x.den)) * (y.den * x.den)
      = (y.num * x.den + (-x.num) * y.den) * (x.den * y.den)
  iring

/-- `x - y ≤ |x - y|` — a value is below its own absolute value. -/
theorem sub_le_abs (x y : Rat) : x - y ≤ abs (x - y) := by
  refine Quotient.inductionOn₂ x y (fun x y => ?_)
  show PreRat.le (PreRat.add x (PreRat.neg y)) (absPre (PreRat.add x (PreRat.neg y)))
  show (x.num * y.den + (-y.num) * x.den) * (x.den * y.den)
      ≤ ((x.num * y.den + (-y.num) * x.den).natAbs : Int) * (x.den * y.den)
  apply Int.mul_le_mul_of_nonneg_right _ (Int.le_of_lt (Int.mul_pos x.den_pos y.den_pos))
  exact Int.le_natAbs

/-- `x ≤ y + |x - y|` — rearrangement of `sub_le_abs` used in order comparisons. -/
theorem le_add_abs_sub (x y : Rat) : x ≤ y + abs (x - y) := by
  have h := sub_le_abs x y
  have h2 : (x - y) + y ≤ abs (x - y) + y := add_le_add_right h y
  have e : (x - y) + y = x := by
    show (x + (-y)) + y = x
    rw [add_assoc, add_left_neg, add_zero]
  rw [e] at h2
  rw [add_comm] at h2
  exact h2

/-- `a ≤ a + ε` when `0 ≤ ε`. -/
theorem le_add_nonneg (a : Rat) {ε : Rat} (hε : (0 : Rat) ≤ ε) : a ≤ a + ε := by
  have h : a + 0 ≤ a + ε := add_le_add_left hε a
  rw [add_zero] at h; exact h

/-- **ℚ is Archimedean.** Every rational is below some natural number `ofNat M`. -/
theorem exists_nat_ge (q : Rat) : ∃ M : Nat, q ≤ ofNat M := by
  refine Quotient.inductionOn q (fun a => ?_)
  refine ⟨a.num.natAbs + 1, ?_⟩
  show PreRat.le a (PreRat.ofNat (a.num.natAbs + 1))
  show a.num * 1 ≤ ((a.num.natAbs + 1 : Nat) : Int) * a.den
  rw [Int.mul_one]
  have hda : 0 < a.den := a.den_pos
  -- a.num ≤ |a.num| ≤ (|a.num|+1) ≤ (|a.num|+1)*a.den   (a.den ≥ 1)
  have h1 : a.num ≤ (a.num.natAbs : Int) := Int.le_natAbs
  have h2 : (a.num.natAbs : Int) ≤ ((a.num.natAbs + 1 : Nat) : Int) := by
    rw [Int.natCast_add]; omega
  have h3 : ((a.num.natAbs + 1 : Nat) : Int) ≤ ((a.num.natAbs + 1 : Nat) : Int) * a.den := by
    have hpos : 0 < ((a.num.natAbs + 1 : Nat) : Int) := by
      rw [Int.natCast_add]; omega
    have : ((a.num.natAbs + 1 : Nat) : Int) * 1 ≤ ((a.num.natAbs + 1 : Nat) : Int) * a.den :=
      Int.mul_le_mul_of_nonneg_left hda (Int.le_of_lt hpos)
    rwa [Int.mul_one] at this
  exact Int.le_trans (Int.le_trans h1 h2) h3

/-- `q ≤ r → q ≤ r + ε` for `0 ≤ ε`. -/
theorem le_add_of_le {q r ε : Rat} (h : q ≤ r) (hε : (0 : Rat) ≤ ε) : q ≤ r + ε :=
  le_trans h (le_add_nonneg r hε)

/-- `q ≤ r + s ↔ q - r ≤ s` (move a term across `≤`). -/
theorem le_sub_iff {q r s : Rat} : q ≤ r + s ↔ q - r ≤ s := by
  constructor
  · intro h
    have h2 := add_le_add_right h (-r)
    have e : (r + s) + (-r) = s := by
      rw [add_comm r s, add_assoc, add_right_neg, add_zero]
    rw [e] at h2; exact h2
  · intro h
    have h2 := add_le_add_right h r
    have e : (q - r) + r = q := by
      show (q + (-r)) + r = q
      rw [add_assoc, add_left_neg, add_zero]
    rw [e, add_comm] at h2; exact h2

/-- `0 ≤ q` decoded on a representative — companion to `zero_le_mk`. -/
theorem le_zero_mk (a : PreRat) : (mk a ≤ 0) ↔ a.num ≤ 0 := by
  show PreRat.le a PreRat.zero ↔ a.num ≤ 0
  show a.num * 1 ≤ (0 : Int) * a.den ↔ a.num ≤ 0
  rw [Int.mul_one, Int.zero_mul]

/-- **A rational below every `1/(k+1)` is nonpositive.** The discrete-Archimedean core:
if `d ≤ 1/(k+1)` for all `k`, then `d ≤ 0`. (A positive `d = c/e` would have
`c ≥ 1`, and at `k = e` we'd need `c·(e+1) ≤ e`, impossible. ℚ's order is decidable so
this is fully constructive.) -/
theorem nonpos_of_forall_le_invNatP {d : Rat} (h : ∀ k, d ≤ invNatP k) : d ≤ 0 := by
  revert h
  refine Quotient.inductionOn d (fun c h => ?_)
  show mk c ≤ 0
  rw [le_zero_mk]
  -- suppose c.num > 0; instantiate h at k = c.den.natAbs to get a contradiction
  by_cases hcn : c.num ≤ 0
  · exact hcn
  · exfalso
    have hpos : 0 < c.num := by omega
    -- choose k so that invNatP k < d. Take k = (c.den).natAbs.
    have hk := h (c.den).natAbs
    -- hk : PreRat.le c ⟨1, k+1, _⟩, i.e. c.num*(k+1) ≤ 1*c.den
    have hle : c.num * (((c.den).natAbs : Int) + 1) ≤ 1 * c.den := hk
    rw [Int.one_mul] at hle
    have hde : (c.den).natAbs = c.den := Int.natAbs_of_nonneg (Int.le_of_lt c.den_pos)
    rw [hde] at hle
    -- c.num ≥ 1, so c.num*(c.den+1) ≥ c.den+1 > c.den ≥ hle's RHS — contradiction
    have h1 : (1 : Int) ≤ c.num := hpos
    have hdpos : 0 < c.den := c.den_pos
    have hge : c.den + 1 ≤ c.num * (c.den + 1) := by
      have := Int.mul_le_mul_of_nonneg_right h1 (by omega : (0:Int) ≤ c.den + 1)
      rwa [Int.one_mul] at this
    omega

/-- `q - r ≤ 0 ↔ q ≤ r`. -/
theorem sub_nonpos_iff {q r : Rat} : q - r ≤ 0 ↔ q ≤ r := by
  have e : (q - r) + r = q := by
    show (q + (-r)) + r = q; rw [add_assoc, add_left_neg, add_zero]
  constructor
  · intro h
    have h2 := add_le_add_right h r
    rw [e, zero_add] at h2; exact h2
  · intro h
    have h2 := add_le_add_right h (-r)
    show q + (-r) ≤ 0
    rwa [add_right_neg] at h2

/-- **The order is `1/(k+1)`-Archimedean (the key density lemma).** If `q ≤ r + 1/(k+1)`
for *every* `k`, then `q ≤ r`. Constructive — no `Classical`. -/
theorem le_of_forall_bound {q r : Rat} (h : ∀ k, q ≤ r + invNatP k) : q ≤ r := by
  have hd : ∀ k, q - r ≤ invNatP k := fun k => le_sub_iff.mp (h k)
  exact sub_nonpos_iff.mp (nonpos_of_forall_le_invNatP hd)

/-- `|q| ≤ ε` follows from `q ≤ ε` and `-q ≤ ε` — the sup characterization of `|·|`,
proved constructively by sign analysis on the numerator. -/
theorem abs_le_of_both {q ε : Rat} (h1 : q ≤ ε) (h2 : -q ≤ ε) : abs q ≤ ε := by
  revert h1 h2
  refine Quotient.inductionOn₂ q ε (fun q ε h1 h2 => ?_)
  show PreRat.le (absPre q) ε
  show (q.num.natAbs : Int) * ε.den ≤ ε.num * q.den
  have hh1 : q.num * ε.den ≤ ε.num * q.den := h1
  have hh2 : (-q.num) * ε.den ≤ ε.num * q.den := h2
  rcases Int.natAbs_eq q.num with he | he
  · rw [← he]; exact hh1
  · -- he : q.num = -↑natAbs ; so ↑natAbs = -q.num
    have hkey : (q.num.natAbs : Int) = -q.num := Int.eq_neg_comm.mp he
    rw [hkey]; exact hh2

/-- **Splitting into thirds.** `1/(3k+3) · 3 = 1/(k+1)`, i.e.
`invNatP (3k+2) + invNatP (3k+2) + invNatP (3k+2) = invNatP k` — the three-`ε`
recombination used to show the order is well-defined up to `≈`. -/
theorem invNatP_triple (k : Nat) :
    invNatP (3 * k + 2) + invNatP (3 * k + 2) + invNatP (3 * k + 2) = invNatP k := by
  show mk ⟨1, (3 * (k:Int) + 2) + 1, by omega⟩ + mk ⟨1, (3 * (k:Int) + 2) + 1, by omega⟩
        + mk ⟨1, (3 * (k:Int) + 2) + 1, by omega⟩
      = mk ⟨1, (k:Int) + 1, by omega⟩
  apply Quotient.sound
  show ((((1:Int) * ((3*(k:Int)+2)+1) + 1 * ((3*(k:Int)+2)+1)) * ((3*(k:Int)+2)+1)
          + 1 * (((3*(k:Int)+2)+1) * ((3*(k:Int)+2)+1)))) * ((k:Int) + 1)
      = (1:Int) * ((((3*(k:Int)+2)+1) * ((3*(k:Int)+2)+1)) * ((3*(k:Int)+2)+1))
  have hm : (3 * (k:Int) + 2) + 1 = 3 * ((k:Int) + 1) := by omega
  rw [hm]
  generalize (k:Int) + 1 = d
  -- both sides are 27·d³; expand the numeral 3 = 1+1+1 and AC-normalize
  simp only [Int.one_mul]
  rw [show (3:Int) = 1 + 1 + 1 from rfl]
  simp only [Int.add_mul, Int.mul_add, Int.one_mul, Int.mul_one,
    Int.mul_comm, Int.mul_assoc, Int.mul_left_comm, Int.add_comm, Int.add_assoc,
    Int.add_left_comm]

end Rat

/-! # =====================================================================
    # (2) ℝ — Cauchy-with-modulus sequences of ℚ (the constructive/Bishop real)
    # ===================================================================== -/

open Rat (abs invNatP)

/-- A **constructive (Bishop) real**: a rational Cauchy sequence carrying an *explicit*
modulus of convergence. `seq n` is the `n`-th rational approximation; `modulus k` is an
index past which the approximations agree to within `1/(k+1)`. The modulus is the
constructive content that replaces classical choice — no `∃`-only Cauchy condition, no
LPO. -/
structure Real where
  /-- The rational approximation sequence. -/
  seq : Nat → Rat
  /-- The explicit modulus of convergence. -/
  modulus : Nat → Nat
  /-- The Cauchy-with-modulus law: past `modulus k`, terms agree to `1/(k+1)`. -/
  cauchy : ∀ k m n, modulus k ≤ m → modulus k ≤ n →
    abs (seq m - seq n) ≤ invNatP k

namespace Real

/-- Two reals are **equal** (`≈`) when their difference is *null*: for every precision
`1/(k+1)` there is an index past which the sequences agree to that precision. The
constructive equality of Cauchy reals (no `∀∃` collapsed by choice). -/
def equiv (a b : Real) : Prop :=
  ∀ k, ∃ N, ∀ n, N ≤ n → abs (a.seq n - b.seq n) ≤ invNatP k

theorem equiv_refl (a : Real) : equiv a a := by
  intro k
  exact ⟨0, fun n _ => Rat.abs_sub_le_of_eq rfl (Rat.invNatP_nonneg k)⟩

theorem equiv_symm {a b : Real} (h : equiv a b) : equiv b a := by
  intro k
  obtain ⟨N, hN⟩ := h k
  refine ⟨N, fun n hn => ?_⟩
  rw [Rat.abs_sub_comm]
  exact hN n hn

/-- Transitivity of real equality, via the `ε/2 + ε/2` split (`invNatP_double`) and the
difference triangle inequality. -/
theorem equiv_trans {a b c : Real} (h1 : equiv a b) (h2 : equiv b c) : equiv a c := by
  intro k
  obtain ⟨N1, hN1⟩ := h1 (2 * k + 1)
  obtain ⟨N2, hN2⟩ := h2 (2 * k + 1)
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have hn1 : N1 ≤ n := Nat.le_trans (Nat.le_max_left N1 N2) hn
  have hn2 : N2 ≤ n := Nat.le_trans (Nat.le_max_right N1 N2) hn
  have tri : abs (a.seq n - c.seq n)
      ≤ abs (a.seq n - b.seq n) + abs (b.seq n - c.seq n) :=
    Rat.abs_sub_le _ _ _
  have hsum : abs (a.seq n - b.seq n) + abs (b.seq n - c.seq n)
      ≤ invNatP (2 * k + 1) + invNatP (2 * k + 1) :=
    Rat.add_le_add (hN1 n hn1) (hN2 n hn2)
  have := Rat.le_trans tri hsum
  rw [Rat.invNatP_double] at this
  exact this

/-- The real setoid. -/
def setoid : Setoid Real where
  r := equiv
  iseqv := ⟨equiv_refl, equiv_symm, equiv_trans⟩

/-! ## (2a) The ℚ-embedding, addition, and negation -/

/-- The **ℚ-embedding** `ℚ ↪ ℝ`: a rational as the constant Cauchy sequence. -/
def ofRat (q : Rat) : Real where
  seq := fun _ => q
  modulus := fun _ => 0
  cauchy := fun k _ _ _ _ => Rat.abs_sub_le_of_eq rfl (Rat.invNatP_nonneg k)

/-- The real `0` and `1`. -/
def zero : Real := ofRat 0
def one : Real := ofRat 1

/-- **Real addition**: pointwise sum, modulus refined to `2k+1` on each summand so the
triangle inequality recombines to `1/(k+1)`. -/
def add (a b : Real) : Real where
  seq := fun n => a.seq n + b.seq n
  modulus := fun k => Nat.max (a.modulus (2 * k + 1)) (b.modulus (2 * k + 1))
  cauchy := fun k m n hm hn => by
    have hma : a.modulus (2 * k + 1) ≤ m :=
      Nat.le_trans (Nat.le_max_left _ _) hm
    have hmb : b.modulus (2 * k + 1) ≤ m :=
      Nat.le_trans (Nat.le_max_right _ _) hm
    have hna : a.modulus (2 * k + 1) ≤ n :=
      Nat.le_trans (Nat.le_max_left _ _) hn
    have hnb : b.modulus (2 * k + 1) ≤ n :=
      Nat.le_trans (Nat.le_max_right _ _) hn
    have hca := a.cauchy (2 * k + 1) m n hma hna
    have hcb := b.cauchy (2 * k + 1) m n hmb hnb
    have hrw : (a.seq m + b.seq m) - (a.seq n + b.seq n)
        = (a.seq m - a.seq n) + (b.seq m - b.seq n) := Rat.add_sub_add _ _ _ _
    rw [hrw]
    have tri := Rat.abs_add_le (a.seq m - a.seq n) (b.seq m - b.seq n)
    have hsum := Rat.add_le_add hca hcb
    have := Rat.le_trans tri hsum
    rw [Rat.invNatP_double] at this
    exact this

/-- **Real negation**: pointwise negation, same modulus (the metric is symmetric). -/
def neg (a : Real) : Real where
  seq := fun n => -(a.seq n)
  modulus := a.modulus
  cauchy := fun k m n hm hn => by
    have hca := a.cauchy k m n hm hn
    have hrw : (-(a.seq m)) - (-(a.seq n)) = a.seq n - a.seq m := Rat.neg_sub_neg _ _
    rw [hrw, Rat.abs_sub_comm]
    exact hca

/-! ## (2b) These operations respect `≈` -/

theorem ofRat_respects {q r : Rat} (h : q = r) : equiv (ofRat q) (ofRat r) := by
  rw [h]; exact equiv_refl _

theorem add_respects {a a' b b' : Real}
    (ha : equiv a a') (hb : equiv b b') : equiv (add a b) (add a' b') := by
  intro k
  obtain ⟨N1, hN1⟩ := ha (2 * k + 1)
  obtain ⟨N2, hN2⟩ := hb (2 * k + 1)
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have hn1 : N1 ≤ n := Nat.le_trans (Nat.le_max_left _ _) hn
  have hn2 : N2 ≤ n := Nat.le_trans (Nat.le_max_right _ _) hn
  show abs ((a.seq n + b.seq n) - (a'.seq n + b'.seq n)) ≤ invNatP k
  rw [Rat.add_sub_add]
  have tri := Rat.abs_add_le (a.seq n - a'.seq n) (b.seq n - b'.seq n)
  have hsum := Rat.add_le_add (hN1 n hn1) (hN2 n hn2)
  have := Rat.le_trans tri hsum
  rw [Rat.invNatP_double] at this
  exact this

theorem neg_respects {a a' : Real} (ha : equiv a a') : equiv (neg a) (neg a') := by
  intro k
  obtain ⟨N, hN⟩ := ha k
  refine ⟨N, fun n hn => ?_⟩
  show abs ((-(a.seq n)) - (-(a'.seq n))) ≤ invNatP k
  rw [Rat.neg_sub_neg, Rat.abs_sub_comm]
  exact hN n hn

/-! ## (2d) The constructive order on ℝ -/

/-- The **constructive order** `a ≤ b` on Cauchy reals: for every precision `1/(k+1)`
there is an index past which `a`'s terms stay below `b`'s terms plus that slack. (No
decidable trichotomy — this is the order that *is* available constructively.) -/
def le (a b : Real) : Prop :=
  ∀ k, ∃ N, ∀ n, N ≤ n → a.seq n ≤ b.seq n + invNatP k

/-- **The order respects `≈`** (well-defined on the quotient). Uses the three-`ε`
recombination `invNatP_triple` and `le_add_abs_sub`. -/
theorem le_respects {a a' b b' : Real}
    (ha : equiv a a') (hb : equiv b b') : (le a b ↔ le a' b') := by
  -- a helper proving one direction for arbitrary witnesses
  have dir : ∀ {x x' y y' : Real}, equiv x x' → equiv y y' → le x y → le x' y' := by
    intro x x' y y' hxx hyy hxy k
    obtain ⟨Nx, hNx⟩ := hxx (3 * k + 2)
    obtain ⟨Ny, hNy⟩ := hyy (3 * k + 2)
    obtain ⟨Nxy, hNxy⟩ := hxy (3 * k + 2)
    refine ⟨Nat.max (Nat.max Nx Ny) Nxy, fun n hn => ?_⟩
    have hnx : Nx ≤ n :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_left _ _)) hn
    have hny : Ny ≤ n :=
      Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_left _ _)) hn
    have hnxy : Nxy ≤ n := Nat.le_trans (Nat.le_max_right _ _) hn
    -- x'.seq n ≤ x.seq n + invNatP(3k+2)
    have s1 : x'.seq n ≤ x.seq n + invNatP (3 * k + 2) := by
      have hb1 : abs (x'.seq n - x.seq n) ≤ invNatP (3 * k + 2) := by
        rw [Rat.abs_sub_comm]; exact hNx n hnx
      exact Rat.le_trans (Rat.le_add_abs_sub (x'.seq n) (x.seq n))
        (Rat.add_le_add_left hb1 (x.seq n))
    -- x.seq n ≤ y.seq n + invNatP(3k+2)
    have s2 : x.seq n ≤ y.seq n + invNatP (3 * k + 2) := hNxy n hnxy
    -- y.seq n ≤ y'.seq n + invNatP(3k+2)
    have s3 : y.seq n ≤ y'.seq n + invNatP (3 * k + 2) := by
      have hb2 : abs (y.seq n - y'.seq n) ≤ invNatP (3 * k + 2) := hNy n hny
      exact Rat.le_trans (Rat.le_add_abs_sub (y.seq n) (y'.seq n))
        (Rat.add_le_add_left hb2 (y'.seq n))
    -- chain: x' ≤ x + ε ≤ (y + ε) + ε ≤ ((y' + ε) + ε) + ε = y' + 3ε = y' + invNatP k
    have c1 : x'.seq n ≤ (y.seq n + invNatP (3 * k + 2)) + invNatP (3 * k + 2) :=
      Rat.le_trans s1 (Rat.add_le_add_right s2 (invNatP (3 * k + 2)))
    have c2 : (y.seq n + invNatP (3 * k + 2)) + invNatP (3 * k + 2)
        ≤ ((y'.seq n + invNatP (3 * k + 2)) + invNatP (3 * k + 2)) + invNatP (3 * k + 2) :=
      Rat.add_le_add_right (Rat.add_le_add_right s3 (invNatP (3 * k + 2)))
        (invNatP (3 * k + 2))
    have c3 := Rat.le_trans c1 c2
    -- normalize RHS to y'.seq n + invNatP k
    have eRHS : ((y'.seq n + invNatP (3 * k + 2)) + invNatP (3 * k + 2))
          + invNatP (3 * k + 2)
        = y'.seq n + invNatP k := by
      rw [Rat.add_assoc (y'.seq n + invNatP (3 * k + 2)),
          Rat.add_assoc (y'.seq n), ← Rat.add_assoc (invNatP (3 * k + 2)),
          Rat.invNatP_triple]
    rw [eRHS] at c3
    exact c3
  exact ⟨dir ha hb, dir (equiv_symm ha) (equiv_symm hb)⟩

end Real

/-- **ℝ — the real numbers** as the Lean-core quotient of Cauchy-with-modulus rational
sequences by null-difference equality. This is the constructive completion of ℚ. -/
def RReal : Type := Quotient Real.setoid

namespace RReal

/-- The class of a Cauchy real. -/
def mk (a : Real) : RReal := Quotient.mk Real.setoid a

/-- The ℚ-embedding `ℚ ↪ ℝ`. -/
def ofRat (q : Rat) : RReal := mk (Real.ofRat q)

/-- ℝ's `0` and `1`. -/
def zero : RReal := mk Real.zero
def one : RReal := mk Real.one

/-- ℝ addition. -/
def add : RReal → RReal → RReal :=
  Quotient.lift₂ (fun a b => mk (Real.add a b))
    (fun _ _ _ _ ha hb => Quotient.sound (Real.add_respects ha hb))

/-- ℝ negation. -/
def neg : RReal → RReal :=
  Quotient.lift (fun a => mk (Real.neg a))
    (fun _ _ ha => Quotient.sound (Real.neg_respects ha))

instance : Add RReal := ⟨add⟩
instance : Neg RReal := ⟨neg⟩

@[simp] theorem mk_add (a b : Real) : mk a + mk b = mk (Real.add a b) := rfl
@[simp] theorem mk_neg (a : Real) : -(mk a) = mk (Real.neg a) := rfl

/-- Equality of real classes is null-difference. -/
theorem mk_eq {a b : Real} : mk a = mk b ↔ Real.equiv a b :=
  ⟨fun h => Quotient.exact h, fun h => Quotient.sound h⟩

/-- **Pointwise-equal sequences give equal reals.** If two Cauchy reals have the same
sequence at every index, they are `≈`-equal — the workhorse for descending ℚ's
ring/group laws to ℝ. -/
theorem mk_eq_of_seq_eq {a b : Real} (h : ∀ n, a.seq n = b.seq n) : mk a = mk b := by
  apply Quotient.sound
  intro k
  exact ⟨0, fun n _ => Rat.abs_sub_le_of_eq (h n) (Rat.invNatP_nonneg k)⟩

/-! ## (2c) ℝ is an abelian group up to `≈` -/

theorem add_comm (a b : RReal) : a + b = b + a := by
  refine Quotient.inductionOn₂ a b (fun a b => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.add_comm (a.seq n) (b.seq n))

theorem add_assoc (a b c : RReal) : a + b + c = a + (b + c) := by
  refine Quotient.inductionOn₃ a b c (fun a b c => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.add_assoc (a.seq n) (b.seq n) (c.seq n))

theorem add_zero (a : RReal) : a + zero = a := by
  refine Quotient.inductionOn a (fun a => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.add_zero (a.seq n))

theorem zero_add (a : RReal) : zero + a = a := by rw [add_comm]; exact add_zero a

theorem add_left_neg (a : RReal) : (-a) + a = zero := by
  refine Quotient.inductionOn a (fun a => ?_)
  exact mk_eq_of_seq_eq (fun n => Rat.add_left_neg (a.seq n))

theorem add_right_neg (a : RReal) : a + (-a) = zero := by rw [add_comm]; exact add_left_neg a

/-! ## (2e) The order on ℝ is a partial order extending ℚ -/

/-- ℝ's constructive order, lifted from `Real.le`. -/
def le : RReal → RReal → Prop :=
  Quotient.lift₂ Real.le
    (fun _ _ _ _ ha hb => propext (Real.le_respects ha hb))

instance : LE RReal := ⟨le⟩

@[simp] theorem mk_le (a b : Real) : (mk a ≤ mk b) = Real.le a b := rfl

/-- **Reflexivity** of `≤`. -/
theorem le_refl (a : RReal) : a ≤ a := by
  refine Quotient.inductionOn a (fun a => ?_)
  show Real.le a a
  intro k
  exact ⟨0, fun n _ => Rat.le_add_nonneg (a.seq n) (Rat.invNatP_nonneg k)⟩

/-- **Transitivity** of `≤`, via the `ε/2 + ε/2` split. -/
theorem le_trans {a b c : RReal} : a ≤ b → b ≤ c → a ≤ c := by
  refine Quotient.inductionOn₃ a b c (fun a b c hab hbc => ?_)
  show Real.le a c
  intro k
  obtain ⟨N1, hN1⟩ := hab (2 * k + 1)
  obtain ⟨N2, hN2⟩ := hbc (2 * k + 1)
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have hn1 : N1 ≤ n := Nat.le_trans (Nat.le_max_left _ _) hn
  have hn2 : N2 ≤ n := Nat.le_trans (Nat.le_max_right _ _) hn
  -- a ≤ b + ε ≤ (c + ε) + ε = c + invNatP k
  have s1 : a.seq n ≤ b.seq n + invNatP (2 * k + 1) := hN1 n hn1
  have s2 : b.seq n ≤ c.seq n + invNatP (2 * k + 1) := hN2 n hn2
  have c1 : a.seq n ≤ (c.seq n + invNatP (2 * k + 1)) + invNatP (2 * k + 1) :=
    Rat.le_trans s1 (Rat.add_le_add_right s2 (invNatP (2 * k + 1)))
  have eRHS : (c.seq n + invNatP (2 * k + 1)) + invNatP (2 * k + 1)
      = c.seq n + invNatP k := by
    rw [Rat.add_assoc, Rat.invNatP_double]
  rw [eRHS] at c1
  exact c1

/-- **Antisymmetry** of `≤` (on the quotient, so genuine `=`). If `a ≤ b` and `b ≤ a`
then the difference is null, so `a = b` in ℝ. -/
theorem le_antisymm {a b : RReal} : a ≤ b → b ≤ a → a = b := by
  refine Quotient.inductionOn₂ a b (fun a b hab hba => ?_)
  apply Quotient.sound
  intro k
  obtain ⟨N1, hN1⟩ := hab k
  obtain ⟨N2, hN2⟩ := hba k
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have hn1 : N1 ≤ n := Nat.le_trans (Nat.le_max_left _ _) hn
  have hn2 : N2 ≤ n := Nat.le_trans (Nat.le_max_right _ _) hn
  -- a ≤ b + ε and b ≤ a + ε ⇒ |a - b| ≤ ε
  have s1 : a.seq n ≤ b.seq n + invNatP k := hN1 n hn1
  have s2 : b.seq n ≤ a.seq n + invNatP k := hN2 n hn2
  -- (a-b) ≤ ε
  have t1 : a.seq n - b.seq n ≤ invNatP k := by
    have h := Rat.add_le_add_right s1 (-(b.seq n))
    have e : (b.seq n + invNatP k) + (-(b.seq n)) = invNatP k := by
      rw [Rat.add_comm (b.seq n), Rat.add_assoc, Rat.add_right_neg, Rat.add_zero]
    rw [e] at h; exact h
  -- -(a-b) = (b-a) ≤ ε
  have t2 : -(a.seq n - b.seq n) ≤ invNatP k := by
    have hbma : b.seq n - a.seq n ≤ invNatP k := by
      have h := Rat.add_le_add_right s2 (-(a.seq n))
      have e : (a.seq n + invNatP k) + (-(a.seq n)) = invNatP k := by
        rw [Rat.add_comm (a.seq n), Rat.add_assoc, Rat.add_right_neg, Rat.add_zero]
      rw [e] at h; exact h
    rw [Rat.neg_sub]; exact hbma
  exact Rat.abs_le_of_both t1 t2

/-- **Addition is monotone on the right** in ℝ. -/
theorem add_le_add_right {a b : RReal} (h : a ≤ b) (c : RReal) : a + c ≤ b + c := by
  revert h
  refine Quotient.inductionOn₃ a b c (fun a b c hab => ?_)
  show Real.le (Real.add a c) (Real.add b c)
  intro k
  obtain ⟨N, hN⟩ := hab k
  refine ⟨N, fun n hn => ?_⟩
  show a.seq n + c.seq n ≤ (b.seq n + c.seq n) + invNatP k
  have hs : a.seq n ≤ b.seq n + invNatP k := hN n hn
  have h2 := Rat.add_le_add_right hs (c.seq n)
  -- (b.seq n + invNatP k) + c.seq n = (b.seq n + c.seq n) + invNatP k
  have e : (b.seq n + invNatP k) + c.seq n = (b.seq n + c.seq n) + invNatP k := by
    rw [Rat.add_assoc, Rat.add_comm (invNatP k) (c.seq n), ← Rat.add_assoc]
  rw [e] at h2
  exact h2

/-- **Addition is monotone on the left** in ℝ. -/
theorem add_le_add_left {b c : RReal} (h : b ≤ c) (a : RReal) : a + b ≤ a + c := by
  rw [add_comm a b, add_comm a c]; exact add_le_add_right h a

/-! ## (2f) ℚ embeds, monotonically and densely, into ℝ -/

/-- **The ℚ-embedding is monotone** — ℝ's order *extends* ℚ's: `q ≤ r ⇒ ofRat q ≤
ofRat r`. -/
theorem ofRat_mono {q r : Rat} (h : q ≤ r) : ofRat q ≤ ofRat r := by
  show Real.le (Real.ofRat q) (Real.ofRat r)
  intro k
  exact ⟨0, fun n _ => Rat.le_add_of_le h (Rat.invNatP_nonneg k)⟩

/-- **The ℚ-embedding respects addition.** `ofRat (q + r) = ofRat q + ofRat r`. -/
theorem ofRat_add (q r : Rat) : ofRat (q + r) = ofRat q + ofRat r := by
  show mk (Real.ofRat (q + r)) = mk (Real.add (Real.ofRat q) (Real.ofRat r))
  exact mk_eq_of_seq_eq (fun _ => rfl)

/-- **The ℚ-embedding is injective** — distinct rationals give distinct reals, so ℚ sits
*densely and faithfully* inside ℝ. (If `ofRat q = ofRat r` then their constant sequences
are null-different at every precision, forcing `q = r` in ℚ.) -/
theorem ofRat_injective {q r : Rat} (h : ofRat q = ofRat r) : q = r := by
  have heq : Real.equiv (Real.ofRat q) (Real.ofRat r) := Quotient.exact h
  -- the constant sequences agree to within every 1/(k+1), so |q - r| ≤ 1/(k+1) ∀k ⇒ q = r
  -- we use antisymmetry of ℚ's order: q ≤ r and r ≤ q.
  -- From heq at each k: |q - r| ≤ invNatP k.
  -- Hence q - r ≤ invNatP k and r - q ≤ invNatP k for all k.
  -- ℚ is Archimedean/discrete enough: a nonneg rational below every 1/(k+1) is 0.
  apply Rat.le_antisymm
  · -- q ≤ r : suppose not; but constructively we show q ≤ r via the bound being arbitrarily small
    exact Rat.le_of_forall_bound (fun k => by
      obtain ⟨N, hN⟩ := heq k
      have := hN N (Nat.le_refl N)
      -- |q - r| ≤ invNatP k ⇒ q - r ≤ invNatP k ⇒ q ≤ r + invNatP k
      have hb : q - r ≤ invNatP k := Rat.le_trans (Rat.sub_le_abs q r) this
      have h2 := Rat.add_le_add_right hb r
      have e : (q - r) + r = q := by
        show (q + (-r)) + r = q
        rw [Rat.add_assoc, Rat.add_left_neg, Rat.add_zero]
      rw [e] at h2
      rwa [Rat.add_comm] at h2)
  · exact Rat.le_of_forall_bound (fun k => by
      obtain ⟨N, hN⟩ := heq k
      have := hN N (Nat.le_refl N)
      have hb : r - q ≤ invNatP k := by
        have hba : abs (r - q) ≤ invNatP k := by rw [Rat.abs_sub_comm]; exact this
        exact Rat.le_trans (Rat.sub_le_abs r q) hba
      have h2 := Rat.add_le_add_right hb q
      have e : (r - q) + q = r := by
        show (r + (-q)) + q = r
        rw [Rat.add_assoc, Rat.add_left_neg, Rat.add_zero]
      rw [e] at h2
      rwa [Rat.add_comm] at h2)

/-! ## (2g) ℝ is Archimedean -/

/-- **Archimedean property of ℝ.** Every real `x` is below some natural number: there is
`M : Nat` with `x ≤ ofRat (ofNat M)`. (A Cauchy real is bounded — its tail stays within
`1` of `x.seq (modulus 0)`, and that rational is below some natural.) -/
theorem archimedean (x : RReal) : ∃ M : Nat, x ≤ ofRat (Rat.ofNat M) := by
  refine Quotient.inductionOn x (fun a => ?_)
  -- bound: for n ≥ a.modulus 0, a.seq n ≤ a.seq (a.modulus 0) + invNatP 0
  let N0 := a.modulus 0
  obtain ⟨M, hM⟩ := Rat.exists_nat_ge (a.seq N0 + invNatP 0)
  refine ⟨M, ?_⟩
  show Real.le a (Real.ofRat (Rat.ofNat M))
  intro k
  refine ⟨N0, fun n hn => ?_⟩
  show a.seq n ≤ Rat.ofNat M + invNatP k
  -- a.seq n ≤ a.seq N0 + invNatP 0 = bound ≤ ofNat M ≤ ofNat M + invNatP k
  have hcau : abs (a.seq n - a.seq N0) ≤ invNatP 0 := a.cauchy 0 n N0 hn (Nat.le_refl N0)
  have hsub : a.seq n - a.seq N0 ≤ invNatP 0 := Rat.le_trans (Rat.sub_le_abs _ _) hcau
  have hstep : a.seq n ≤ a.seq N0 + invNatP 0 := by
    have h2 := Rat.add_le_add_right hsub (a.seq N0)
    have e : (a.seq n - a.seq N0) + a.seq N0 = a.seq n := by
      show (a.seq n + (-(a.seq N0))) + a.seq N0 = a.seq n
      rw [Rat.add_assoc, Rat.add_left_neg, Rat.add_zero]
    rw [e, Rat.add_comm] at h2
    exact h2
  have hb : a.seq n ≤ Rat.ofNat M := Rat.le_trans hstep hM
  exact Rat.le_add_of_le hb (Rat.invNatP_nonneg k)

/-- **`ofRat` reflects the order**: `ofRat q ≤ ofRat r ↔ q ≤ r`. Forward uses the
density lemma `le_of_forall_bound`; backward is `ofRat_mono`. So ℚ ↪ ℝ is a full order
embedding. -/
theorem ofRat_le_iff {q r : Rat} : ofRat q ≤ ofRat r ↔ q ≤ r := by
  constructor
  · intro h
    -- h : Real.le (ofRat q) (ofRat r), i.e. ∀k ∃N ∀n≥N, q ≤ r + invNatP k
    apply Rat.le_of_forall_bound
    intro k
    obtain ⟨N, hN⟩ := h k
    exact hN N (Nat.le_refl N)
  · exact ofRat_mono

/-! # =====================================================================
    # (3) COMPLETENESS = SETTLING  (the central identification)
    # =====================================================================

ℝ is **complete**: a Cauchy sequence of reals (with a modulus) has a limit, the
*diagonal* real — so the Cauchy completion is **closed**. We then identify this with the
corpus's settling: the limit is the fixed point of the rational-approximation flow,
reached at stage **ω** as the directed-join/sup of the rational approximation orbit.

Convergence and Cauchy-ness are stated through the order `≤` with rational slack
`ofRat (1/(k+1))` — using the partial order already built, no separate real metric. -/

/-- **`a ≤ b` within `1/(k+1)`**: `a ≤ b + ofRat (1/(k+1))`. The order-with-slack used
to phrase convergence/Cauchy without a real-valued distance. -/
def leWithin (k : Nat) (a b : RReal) : Prop := a ≤ b + ofRat (invNatP k)

/-- **`F` converges to `L`**: for every precision `1/(k+1)` there is an index past which
`F n` and `L` are within `1/(k+1)` of each other (both order-with-slack directions). -/
def ConvergesTo (F : Nat → RReal) (L : RReal) : Prop :=
  ∀ k, ∃ N, ∀ n, N ≤ n → leWithin k (F n) L ∧ leWithin k L (F n)

/-- `leWithin k (ofRat a) (ofRat b)` reduces to the rational `a ≤ b + 1/(k+1)`. -/
theorem leWithin_ofRat {k : Nat} {a b : Rat} :
    leWithin k (ofRat a) (ofRat b) ↔ a ≤ b + invNatP k := by
  unfold leWithin
  rw [← ofRat_add]
  exact ofRat_le_iff

/-- **Symmetric closeness** `Within k a b`: `a` and `b` are within `1/(k+1)` in both
order directions — the constructive ℝ metric ball, phrased through the order. -/
def Within (k : Nat) (a b : RReal) : Prop := leWithin k a b ∧ leWithin k b a

/-- **Weakening the precision.** A bound at the finer index `j ≥ k` implies the looser
bound at `k` (smaller index = larger slack `1/(k+1)`). -/
theorem leWithin_weaken {k j : Nat} (hkj : k ≤ j) {a b : RReal}
    (h : leWithin j a b) : leWithin k a b := by
  unfold leWithin at *
  refine le_trans h ?_
  exact add_le_add_left (ofRat_mono (Rat.invNatP_le_of_ge hkj)) b

theorem Within_weaken {k j : Nat} (hkj : k ≤ j) {a b : RReal}
    (h : Within j a b) : Within k a b :=
  ⟨leWithin_weaken hkj h.1, leWithin_weaken hkj h.2⟩

theorem Within_symm {k : Nat} {a b : RReal} (h : Within k a b) : Within k b a :=
  ⟨h.2, h.1⟩

/-- **Two-step triangle for `leWithin`.** Two `1/(2k+2)`-steps compose to one
`1/(k+1)`-step (via `invNatP_double`). -/
theorem leWithin_trans2 {k : Nat} {a b c : RReal}
    (h1 : leWithin (2 * k + 1) a b) (h2 : leWithin (2 * k + 1) b c) : leWithin k a c := by
  unfold leWithin at *
  have c1 : a ≤ b + ofRat (invNatP (2*k+1)) := h1
  have c2 : b + ofRat (invNatP (2*k+1)) ≤ (c + ofRat (invNatP (2*k+1)))
      + ofRat (invNatP (2*k+1)) := add_le_add_right h2 _
  have hchain := le_trans c1 c2
  have eRHS : (c + ofRat (invNatP (2*k+1))) + ofRat (invNatP (2*k+1))
      = c + ofRat (invNatP k) := by
    rw [add_assoc, ← ofRat_add, Rat.invNatP_double]
  rw [eRHS] at hchain
  exact hchain

/-- **Three-step triangle for `leWithin`.** Three `1/(3k+3)`-steps compose to one
`1/(k+1)`-step: `leWithin (3k+2) a b → leWithin (3k+2) b c → leWithin (3k+2) c d →
leWithin k a d`. (Uses `invNatP_triple`.) -/
theorem leWithin_trans3 {k : Nat} {a b c d : RReal}
    (h1 : leWithin (3 * k + 2) a b) (h2 : leWithin (3 * k + 2) b c)
    (h3 : leWithin (3 * k + 2) c d) : leWithin k a d := by
  unfold leWithin at *
  -- a ≤ b+ε ≤ (c+ε)+ε ≤ ((d+ε)+ε)+ε = d + 3ε = d + invNatP k
  have c1 : a ≤ (b + ofRat (invNatP (3*k+2))) := h1
  have c2 : b + ofRat (invNatP (3*k+2)) ≤ (c + ofRat (invNatP (3*k+2)))
      + ofRat (invNatP (3*k+2)) := add_le_add_right h2 _
  have c3 : (c + ofRat (invNatP (3*k+2))) + ofRat (invNatP (3*k+2))
      ≤ ((d + ofRat (invNatP (3*k+2))) + ofRat (invNatP (3*k+2)))
        + ofRat (invNatP (3*k+2)) := add_le_add_right (add_le_add_right h3 _) _
  have hchain := le_trans c1 (le_trans c2 c3)
  -- normalize RHS: ((d+ε)+ε)+ε = d + invNatP k
  have eRHS : ((d + ofRat (invNatP (3*k+2))) + ofRat (invNatP (3*k+2)))
        + ofRat (invNatP (3*k+2))
      = d + ofRat (invNatP k) := by
    have e3 : ofRat (invNatP (3*k+2)) + ofRat (invNatP (3*k+2)) + ofRat (invNatP (3*k+2))
        = ofRat (invNatP k) := by
      rw [← ofRat_add, ← ofRat_add, Rat.invNatP_triple]
    -- LHS currently ((d+ε)+ε)+ε ; pull d out, then collapse the three ε via e3
    rw [add_assoc (d + ofRat (invNatP (3*k+2))) (ofRat (invNatP (3*k+2)))
        (ofRat (invNatP (3*k+2)))]
    rw [add_assoc d (ofRat (invNatP (3*k+2)))
        (ofRat (invNatP (3*k+2)) + ofRat (invNatP (3*k+2)))]
    -- now d + (ε + (ε + ε)) ; rewrite to d + ((ε+ε)+ε) then e3
    rw [← add_assoc (ofRat (invNatP (3*k+2))) (ofRat (invNatP (3*k+2)))
        (ofRat (invNatP (3*k+2)))]
    rw [e3]
  rw [eRHS] at hchain
  exact hchain

/-- **The rational orbit of a real converges to it (ℝ = the ω-closure of ℚ).** For any
real `x = mk a`, the sequence of rational approximations `ofRat (a.seq n)` converges to
`x`: every real is the limit of its own rational-approximation orbit. This is the κ=ω
Scott-continuous closure — the real value is *reached at stage ω* as the directed-join of
the orbit `n ↦ ofRat (a.seq n)`. -/
theorem rational_orbit_converges (a : Real) :
    ConvergesTo (fun n => ofRat (a.seq n)) (mk a) := by
  intro k
  refine ⟨a.modulus k, fun n hn => ?_⟩
  constructor
  · -- ofRat (a.seq n) ≤ mk a + ofRat (invNatP k)
    show ofRat (a.seq n) ≤ mk a + ofRat (invNatP k)
    -- compare representatives: (ofRat (a.seq n)).le (a + ofRat(invNatP k))
    -- mk a + ofRat ε has representative seq m = a.seq m + ε
    have hrep : (mk a + ofRat (invNatP k)) = mk (Real.add a (Real.ofRat (invNatP k))) := rfl
    rw [hrep]
    show Real.le (Real.ofRat (a.seq n)) (Real.add a (Real.ofRat (invNatP k)))
    intro j
    refine ⟨n, fun m hm => ?_⟩
    -- goal: a.seq n ≤ (a.seq m + invNatP k) + invNatP j
    show a.seq n ≤ (a.seq m + invNatP k) + invNatP j
    -- a.seq n ≤ a.seq m + invNatP k   (cauchy at k, indices n,m ≥ modulus k)
    have hcau : abs (a.seq n - a.seq m) ≤ invNatP k :=
      a.cauchy k n m hn (Nat.le_trans hn hm)
    have hsub : a.seq n - a.seq m ≤ invNatP k := Rat.le_trans (Rat.sub_le_abs _ _) hcau
    have hstep : a.seq n ≤ a.seq m + invNatP k := Rat.le_sub_iff.mpr hsub
    exact Rat.le_add_of_le hstep (Rat.invNatP_nonneg j)
  · -- mk a ≤ ofRat (a.seq n) + ofRat (invNatP k)
    show mk a ≤ ofRat (a.seq n) + ofRat (invNatP k)
    have hrep : (ofRat (a.seq n) + ofRat (invNatP k))
        = mk (Real.add (Real.ofRat (a.seq n)) (Real.ofRat (invNatP k))) := rfl
    rw [hrep]
    show Real.le a (Real.add (Real.ofRat (a.seq n)) (Real.ofRat (invNatP k)))
    intro j
    refine ⟨n, fun m hm => ?_⟩
    show a.seq m ≤ (a.seq n + invNatP k) + invNatP j
    have hcau : abs (a.seq m - a.seq n) ≤ invNatP k :=
      a.cauchy k m n (Nat.le_trans hn hm) hn
    have hsub : a.seq m - a.seq n ≤ invNatP k := Rat.le_trans (Rat.sub_le_abs _ _) hcau
    have hstep : a.seq m ≤ a.seq n + invNatP k := Rat.le_sub_iff.mpr hsub
    exact Rat.le_add_of_le hstep (Rat.invNatP_nonneg j)

/-- **A diagonal rational pick is `1/(k+1)`-close to its real**: for the index
`j := a.modulus k`, the rational `a.seq j` (as a real) is within `1/(k+1)` of `mk a` in
both order directions. The single-index version of `rational_orbit_converges`. -/
theorem ofRat_diag_close (a : Real) (k : Nat) :
    leWithin k (ofRat (a.seq (a.modulus k))) (mk a)
    ∧ leWithin k (mk a) (ofRat (a.seq (a.modulus k))) := by
  obtain ⟨N, hN⟩ := rational_orbit_converges a k
  -- the orbit's N is a.modulus k; evaluate at the larger of N and a.modulus k
  -- but rational_orbit_converges used a.modulus k as N, so evaluate at a.modulus k.
  -- We re-derive directly to pin the index.
  constructor
  · show ofRat (a.seq (a.modulus k)) ≤ mk a + ofRat (invNatP k)
    have hrep : (mk a + ofRat (invNatP k)) = mk (Real.add a (Real.ofRat (invNatP k))) := rfl
    rw [hrep]
    show Real.le (Real.ofRat (a.seq (a.modulus k))) (Real.add a (Real.ofRat (invNatP k)))
    intro j
    refine ⟨a.modulus k, fun m hm => ?_⟩
    show a.seq (a.modulus k) ≤ (a.seq m + invNatP k) + invNatP j
    have hcau : abs (a.seq (a.modulus k) - a.seq m) ≤ invNatP k :=
      a.cauchy k (a.modulus k) m (Nat.le_refl _) hm
    have hsub : a.seq (a.modulus k) - a.seq m ≤ invNatP k :=
      Rat.le_trans (Rat.sub_le_abs _ _) hcau
    have hstep : a.seq (a.modulus k) ≤ a.seq m + invNatP k := Rat.le_sub_iff.mpr hsub
    exact Rat.le_add_of_le hstep (Rat.invNatP_nonneg j)
  · show mk a ≤ ofRat (a.seq (a.modulus k)) + ofRat (invNatP k)
    have hrep : (ofRat (a.seq (a.modulus k)) + ofRat (invNatP k))
        = mk (Real.add (Real.ofRat (a.seq (a.modulus k))) (Real.ofRat (invNatP k))) := rfl
    rw [hrep]
    show Real.le a (Real.add (Real.ofRat (a.seq (a.modulus k))) (Real.ofRat (invNatP k)))
    intro j
    refine ⟨a.modulus k, fun m hm => ?_⟩
    show a.seq m ≤ (a.seq (a.modulus k) + invNatP k) + invNatP j
    have hcau : abs (a.seq m - a.seq (a.modulus k)) ≤ invNatP k :=
      a.cauchy k m (a.modulus k) hm (Nat.le_refl _)
    have hsub : a.seq m - a.seq (a.modulus k) ≤ invNatP k :=
      Rat.le_trans (Rat.sub_le_abs _ _) hcau
    have hstep : a.seq m ≤ a.seq (a.modulus k) + invNatP k := Rat.le_sub_iff.mpr hsub
    exact Rat.le_add_of_le hstep (Rat.invNatP_nonneg j)

/-- **The diagonal real** of a regular Cauchy sequence of reals `F`: at precision `k`,
take the rational `(F k).seq ((F k).modulus k)` — a rational within `1/(k+1)` of the
`k`-th real. Its modulus is `3k+2` (three `ε/3` steps recombine to `ε`). This is the
*directed-join of the rational approximation orbit* — the settling limit. -/
def diagonal (F : Nat → Real)
    (hreg : ∀ i j, Within (Nat.min i j) (mk (F i)) (mk (F j))) : Real where
  seq := fun k => (F k).seq ((F k).modulus k)
  modulus := fun k => 3 * k + 2
  cauchy := fun k m n hm hn => by
    -- assemble Within k (ofRat (L.seq m)) (ofRat (L.seq n)) then descend
    have hm' : 3 * k + 2 ≤ m := hm
    have hn' : 3 * k + 2 ≤ n := hn
    -- step 1: ofRat (L.seq m) ~ mk (F m)   (within 3k+2)
    have d1 := ofRat_diag_close (F m) m
    have s1f : leWithin (3*k+2) (ofRat ((F m).seq ((F m).modulus m))) (mk (F m)) :=
      leWithin_weaken hm' d1.1
    have s1b : leWithin (3*k+2) (mk (F m)) (ofRat ((F m).seq ((F m).modulus m))) :=
      leWithin_weaken hm' d1.2
    -- step 3: mk (F n) ~ ofRat (L.seq n)
    have d3 := ofRat_diag_close (F n) n
    have s3f : leWithin (3*k+2) (mk (F n)) (ofRat ((F n).seq ((F n).modulus n))) :=
      leWithin_weaken hn' d3.2
    have s3b : leWithin (3*k+2) (ofRat ((F n).seq ((F n).modulus n))) (mk (F n)) :=
      leWithin_weaken hn' d3.1
    -- step 2: mk (F m) ~ mk (F n)
    have hmin : 3 * k + 2 ≤ Nat.min m n := Nat.le_min.mpr ⟨hm', hn'⟩
    have w2 : Within (3*k+2) (mk (F m)) (mk (F n)) := Within_weaken hmin (hreg m n)
    -- forward: ofRat (L.seq m) ≤ ofRat (L.seq n) within k
    have fwd : leWithin k (ofRat ((F m).seq ((F m).modulus m)))
        (ofRat ((F n).seq ((F n).modulus n))) :=
      leWithin_trans3 s1f w2.1 s3f
    have bwd : leWithin k (ofRat ((F n).seq ((F n).modulus n)))
        (ofRat ((F m).seq ((F m).modulus m))) :=
      leWithin_trans3 s3b w2.2 s1b
    -- descend to ℚ
    have rf : (F m).seq ((F m).modulus m) ≤ (F n).seq ((F n).modulus n) + invNatP k :=
      leWithin_ofRat.mp fwd
    have rb : (F n).seq ((F n).modulus n) ≤ (F m).seq ((F m).modulus m) + invNatP k :=
      leWithin_ofRat.mp bwd
    -- |L.seq m - L.seq n| ≤ invNatP k via abs_le_of_both
    show abs ((F m).seq ((F m).modulus m) - (F n).seq ((F n).modulus n)) ≤ invNatP k
    refine Rat.abs_le_of_both ?_ ?_
    · exact Rat.le_sub_iff.mp rf
    · rw [Rat.neg_sub]; exact Rat.le_sub_iff.mp rb

/-! ## (3a) ℝ is complete (Cauchy reals converge) -/

/-- **`real_completeness`.** ℝ is **complete**: every regular Cauchy sequence
of reals `F` converges — to the *diagonal* real `mk (diagonal F hreg)`. So the Cauchy
completion of ℚ is **closed**: a Cauchy sequence of reals has a real limit, no points are
missing. (Constructive: the limit is the explicit diagonal, no choice. The regular
hypothesis `Within (min i j)` is the standard Bishop normalization; every Cauchy sequence
has a regular reindexing.) -/
theorem real_completeness (F : Nat → Real)
    (hreg : ∀ i j, Within (Nat.min i j) (mk (F i)) (mk (F j))) :
    ConvergesTo (fun n => mk (F n)) (mk (diagonal F hreg)) := by
  intro k
  -- L := diagonal F hreg. For n large, mk (F n) ~ mk L via two 1/(2k+2)-steps:
  --   mk (F n) ~ ofRat (L.seq n)   (F n's diagonal pick, precision n)
  --   ofRat (L.seq n) ~ mk L       (L's rational orbit, precision 2k+1, needs n ≥ L.modulus(2k+1))
  obtain ⟨Nb, hNb⟩ := rational_orbit_converges (diagonal F hreg) (2 * k + 1)
  refine ⟨Nat.max (2 * k + 1) Nb, fun n hn => ?_⟩
  have hn1 : 2 * k + 1 ≤ n := Nat.le_trans (Nat.le_max_left _ _) hn
  have hnb : Nb ≤ n := Nat.le_trans (Nat.le_max_right _ _) hn
  -- Step A: mk (F n) ~ ofRat (L.seq n)
  have dA := ofRat_diag_close (F n) n
  have hLseq : (diagonal F hreg).seq n = (F n).seq ((F n).modulus n) := rfl
  have A_f : leWithin (2*k+1) (mk (F n)) (ofRat ((diagonal F hreg).seq n)) := by
    rw [hLseq]; exact leWithin_weaken hn1 dA.2
  have A_b : leWithin (2*k+1) (ofRat ((diagonal F hreg).seq n)) (mk (F n)) := by
    rw [hLseq]; exact leWithin_weaken hn1 dA.1
  -- Step B: ofRat (L.seq n) ~ mk L  (orbit at precision 2k+1, index n ≥ Nb)
  have B := hNb n hnb
  -- B.1 : leWithin (2k+1) (ofRat (L.seq n)) (mk L) ; B.2 reverse
  have B_f : leWithin (2*k+1) (ofRat ((diagonal F hreg).seq n)) (mk (diagonal F hreg)) := B.1
  have B_b : leWithin (2*k+1) (mk (diagonal F hreg)) (ofRat ((diagonal F hreg).seq n)) := B.2
  exact ⟨leWithin_trans2 A_f B_f, leWithin_trans2 B_b A_b⟩

/-! ## (3b) The identification: ℝ = the κ=ω Scott-continuous settling completion -/

/-- **`reals_are_the_scott_continuous_settling_completion`.** ℝ *is* the
κ=ω Scott-continuous settling completion of ℚ. Concretely, bundling the two faces of the
identification:

* **(orbit reaches the settling at stage ω)** every real `x` is the limit of its
  rational-approximation orbit `n ↦ ofRat (a.seq n)` — the value is *reached at stage ω*
  as the directed-join/sup of the orbit (`rational_orbit_converges`). This is the
  Scott-continuous closure: ℝ is the ω-closure of ℚ, not a strict-finite one;

* **(the completion is closed = settling fixed point)** ℝ is **complete** — every
  regular Cauchy sequence of reals settles to a *real* limit, the explicit diagonal
  (`real_completeness`). The rational-approximation flow has reached its fixed point: no
  further completion adds points. The limit is the settling fixed point of the
  approximation flow.

Together: the Cauchy completion is the κ=ω closure (orbit converges at ω) and it is
closed (fixed point reached) — exactly `continuous-valued-settling.md`'s claim that the
real continuum `𝒱 = ℝ` is the Scott-continuous (κ=ω) settling of the rationals. -/
theorem reals_are_the_scott_continuous_settling_completion :
    (∀ a : Real, ConvergesTo (fun n => ofRat (a.seq n)) (mk a))
    ∧ (∀ (F : Nat → Real)
        (hreg : ∀ i j, Within (Nat.min i j) (mk (F i)) (mk (F j))),
        ConvergesTo (fun n => mk (F n)) (mk (diagonal F hreg))) :=
  ⟨rational_orbit_converges, real_completeness⟩

/-! # =====================================================================
    # (4) ℝ IS A VALUE CATEGORY  (closing the hub at the genuine reals)
    # ===================================================================== -/

/-- **ℝ as a `Positing.Value.ValueCategory`.** The genuine reals, with their
constructive order and seed `0`, instantiate `Positing.Value.Category`'s abstract value
category `V` — so the continuous-valued settling hub (and hence `StochasticSettling`'s
abstract `[0,1]`) is **realizable by real numbers**. The partial-order-with-seed is
exactly what `ValueCategory` quantifies over; constructive ℝ supplies it: `le_refl`,
`le_trans`, `le_antisymm` are `RReal.le_refl/le_trans/le_antisymm`, and `bot` is the seed
`0`.

(Scope: `ValueCategory` requires only the partial-order-with-seed, which
constructive ℝ proves in full. The corpus's `V` is morally a *complete* lattice; a
genuine completeness lattice on constructive ℝ — arbitrary suprema — needs choice/LPO
beyond the Cauchy-completeness proved here as `real_completeness`. We instance exactly the
`ValueCategory` structure, which is choice-free, and record that the deeper
complete-lattice structure is the standard classical extension.) -/
def realValueCategory : Positing.Value.ValueCategory where
  carrier := RReal
  le := RReal.le
  le_refl := RReal.le_refl
  le_trans := fun {_ _ _} h1 h2 => RReal.le_trans h1 h2
  le_antisymm := fun {_ _} h1 h2 => RReal.le_antisymm h1 h2
  bot := RReal.zero

/-- **ℝ realizes the stochastic value category's order fragment.** The quiescent closure
(identity) on `realValueCategory` is a hub `VClosure`, so the four-regime classification
(`four_regime_v_independent`) applies to settling **over the genuine reals** — closing
`StochasticSettling`'s abstract `[0,1]` at ℝ. -/
def realVClosure : Positing.Value.VClosure realValueCategory where
  op := fun v => v
  infl := fun v => realValueCategory.le_refl v
  mono := fun {_ _} h => h
  idem := fun _ => rfl

/-- **The reals close the continuous-valued-settling hub.**

* **(a)** `realValueCategory` is a genuine `Positing.Value.ValueCategory` whose carrier is
  the internally-derived reals `RReal` with their constructive partial order;
* **(b)** it carries a hub `VClosure` (`realVClosure`), so the hub's four-regime
  classification is `V`-independent *at the reals*: for any closure-ordinal data `d`,
  `regimeOf realValueCategory realVClosure d` satisfies the full four-regime dichotomy and
  agrees with the regime over every other value category — in particular over the abstract
  stochastic `[0,1]`, which is thereby realizable by real numbers.

So `Positing.Value.Category`'s abstraction is closed at the genuine, in-chain-derived
continuum. -/
theorem reals_close_the_value_settling_hub (d : ClosureRegimeData) :
    (Positing.Value.regimeOf realValueCategory realVClosure d = ClosureRegime.strict
        ∨ Positing.Value.regimeOf realValueCategory realVClosure d = ClosureRegime.scott
        ∨ Positing.Value.regimeOf realValueCategory realVClosure d
            = ClosureRegime.transfiniteBounded
        ∨ Positing.Value.regimeOf realValueCategory realVClosure d = ClosureRegime.aperiodic)
    ∧ (∀ (V' : Positing.Value.ValueCategory) (T' : Positing.Value.VClosure V'),
        Positing.Value.regimeOf realValueCategory realVClosure d
          = Positing.Value.regimeOf V' T' d) :=
  ⟨(Positing.Value.four_regime_v_independent realValueCategory realVClosure d).1.1,
   (Positing.Value.four_regime_v_independent realValueCategory realVClosure d).2⟩

end RReal

end Real.Internal
end Infomaterial
