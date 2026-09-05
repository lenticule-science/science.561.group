import Infomaterial.Calculus.Order.SetNumberGraphTheory
import Infomaterial.Calculus.Order.AlgebraHierarchy

/-!
# NumberTheoryCombinatorics — factorial, Pascal, the binomial theorem, gcd & primes

This module formalizes the part of received **number theory / combinatorics** that the
spine's ℕ (`SetNumberGraphTheory.lean`'s `natAlg`/`natSemiring`) does not yet carry. As
with `SetNumberGraphTheory` and `AlgebraHierarchy`, the received material is a
**degenerate specialization**: it is the multiplicative/counting body that the predicate
morphism throws over the discrete carrier `Nat`. Every result here is *derived* over the
core `Nat` and over the already-built `Discrete.CommSemiring` — nothing is re-postulated.

Corpus nodes read (under
`content/_archive/library/science/mathematics/_archive/from-discourse-domain-locus-math/`):

* `number-theory/permutation/permutation.md` — `n!` counts arrangements; the
  `k`-permutation count `P(n,k) = n!/(n−k)!`.
* `number-theory/combination/combination.md`,
  `number-theory/binomial-coefficient/binomial-coefficient.md` — `C(n,k)` ("n choose k")
  counts unordered selections; the **Pascal recurrence**
  `C(n,k) = C(n−1,k−1) + C(n−1,k)` "generates Pascal's triangle"; the **binomial
  theorem** `(x+y)^n = Σ_{k=0}^n C(n,k) x^k y^{n−k}`.
* `number-theory/divisibility/divisibility.md` — `a ∣ b := ∃k, b = a·k`; reflexive,
  transitive, antisymmetric (a partial order under "fits into").
* `number-theory/greatest-common-divisor/greatest-common-divisor.md` — the Euclidean
  algorithm and the recurrence `gcd(a,b) = gcd(b, a mod b)`; `gcd` is the **meet** under
  divisibility (divides both; greatest such); Bézout.
* `number-theory/prime/prime.md` — `p > 1` whose only divisors are `1` and `p`;
  **Euclid's lemma** `p ∣ a·b → p ∣ a ∨ p ∣ b`, the seed of unique factorization.
* `number-theory/congruence/congruence.md`, `algebra/congruence/congruence.md` —
  `a ≡ b (mod n) := n ∣ (a − b)`; an equivalence relation that **respects `+` and `·`**
  (a ring-congruence) — modular arithmetic.

We define `choose` directly by the **Pascal recurrence** (`Nat.rec`, no division), so it
is manifestly a `Nat`; the factorial `n!` is the ordinary product recursion. The two
Theorems:

* `pascal_and_binomial_theorem` — the Pascal recurrence (`choose_zero`, `choose_self`,
  `choose_succ_succ`) **and** the binomial theorem over a `Discrete.CommSemiring`, the
  latter proven by induction on `n` using Pascal.
* `gcd_prime_theory` — gcd correctness (`gcd ∣ a`, `gcd ∣ b`, greatest), the gcd
  recurrence `gcd(a,b) = gcd(b, a mod b)`, the divisibility basics, **and Euclid's
  lemma** for primes. (See the module notes: Euclid's lemma is obtained via the
  Bézout/coprimality route, with `Nat.Coprime`/`Nat.Coprime.dvd_of_dvd_mul_right` the
  core primitives it collapses into.)
-/

namespace Infomaterial
namespace NumberTheory

open Infomaterial.Discrete (CommSemiring)

/-! # =====================================================================
    # (A) Factorial and permutation counts
    # ===================================================================== -/

/-- The **factorial** `n! = n·(n−1)·⋯·1`, with `0! = 1`. The number of permutations of
`n` distinct objects (`permutation.md`). Plain product recursion over `Nat`. -/
def factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n

@[inherit_doc] scoped notation:10000 n "!" => factorial n

theorem factorial_zero : factorial 0 = 1 := rfl
theorem factorial_succ (n : Nat) : factorial (n + 1) = (n + 1) * factorial n := rfl

/-- Factorials are positive — never zero (`permutation.md`: factorials grow). -/
theorem factorial_pos : ∀ n, 0 < factorial n
  | 0 => Nat.zero_lt_one
  | n + 1 => Nat.mul_pos (Nat.succ_pos n) (factorial_pos n)

/-- The **k-permutation count** `P(n,k) = n·(n−1)·⋯·(n−k+1)` — an ordered selection of
`k` objects from `n` (`permutation.md`). Defined by the falling-product recursion, so it
is manifestly a `Nat` (no division by `(n−k)!`). -/
def perm : Nat → Nat → Nat
  | _, 0 => 1
  | n, k + 1 => (n - k) * perm n k

theorem perm_zero (n : Nat) : perm n 0 = 1 := rfl

/-- `P(n,0) = 1` and the falling step `P(n,k+1) = (n−k)·P(n,k)`. -/
theorem perm_succ (n k : Nat) : perm n (k + 1) = (n - k) * perm n k := rfl

/-! # =====================================================================
    # (B) The binomial coefficient by the Pascal recurrence
    # ===================================================================== -/

/-- The **binomial coefficient** `C(n,k)` ("n choose k"), defined **directly by the
Pascal recurrence** so it is manifestly a `Nat` with no division (`binomial-coefficient.md`,
`combination.md`):

* `C(n,0) = 1`
* `C(0,k+1) = 0`
* `C(n+1,k+1) = C(n,k) + C(n,k+1)`.

This is the rule that "generates Pascal's triangle: each entry is the sum of the two
entries above it." -/
def choose : Nat → Nat → Nat
  | _, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, k + 1 => choose n k + choose n (k + 1)

/-- `C(n,0) = 1`. -/
@[simp] theorem choose_zero_right (n : Nat) : choose n 0 = 1 := by cases n <;> rfl

/-- `C(0,k+1) = 0` — you cannot choose a nonempty subset of the empty set. -/
@[simp] theorem choose_zero_succ (k : Nat) : choose 0 (k + 1) = 0 := rfl

/-- **Pascal's recurrence.** `C(n+1,k+1) = C(n,k) + C(n,k+1)` — the triangle rule. -/
theorem choose_succ_succ (n k : Nat) :
    choose (n + 1) (k + 1) = choose n k + choose n (k + 1) := rfl

/-- **Over-choosing vanishes.** `k > n ⇒ C(n,k) = 0`: you cannot select more than you
have. Induction on `n` with `k`. -/
theorem choose_eq_zero_of_lt : ∀ {n k : Nat}, n < k → choose n k = 0
  | 0, k + 1, _ => rfl
  | n + 1, k + 1, h => by
    rw [choose_succ_succ,
        choose_eq_zero_of_lt (Nat.lt_of_succ_lt_succ h),
        choose_eq_zero_of_lt (Nat.lt_of_succ_lt h)]

/-- `C(n,n) = 1` — there is exactly one way to choose everything. Proven by induction on
`n` using Pascal and `choose_eq_zero_of_lt` (the over-choosing vanishing). -/
theorem choose_self : ∀ n, choose n n = 1
  | 0 => rfl
  | n + 1 => by
    rw [choose_succ_succ, choose_self n, choose_eq_zero_of_lt (Nat.lt_succ_self n)]

/-! # =====================================================================
    # (C) The binomial theorem over a commutative semiring
    # ===================================================================== -/

namespace CSR
variable (R : CommSemiring)

/-- Powers in a commutative semiring: `x^0 = 1`, `x^(n+1) = x · x^n`. -/
def pow (x : R.carrier) : Nat → R.carrier
  | 0 => R.one
  | n + 1 => R.mul x (pow x n)

theorem pow_zero (x : R.carrier) : pow R x 0 = R.one := rfl
theorem pow_succ (x : R.carrier) (n : Nat) : pow R x (n + 1) = R.mul x (pow R x n) := rfl

/-- Scalar multiplication by a `Nat` `c`: `c • a = a + a + ⋯ + a` (`c` copies). This is
how a `Nat` binomial coefficient acts on a ring element. -/
def nsmul (c : Nat) (a : R.carrier) : R.carrier :=
  Nat.rec R.zero (fun _ acc => R.add a acc) c

theorem nsmul_zero (a : R.carrier) : nsmul R 0 a = R.zero := rfl
theorem nsmul_succ (c : Nat) (a : R.carrier) :
    nsmul R (c + 1) a = R.add a (nsmul R c a) := rfl

/-- `(c + d) • a = c • a + d • a` — the scalar action is additive in the `Nat` index. -/
theorem nsmul_add (c d : Nat) (a : R.carrier) :
    nsmul R (c + d) a = R.add (nsmul R c a) (nsmul R d a) := by
  induction c with
  | zero => rw [Nat.zero_add, nsmul_zero, R.zero_add]
  | succ c ih =>
    show nsmul R (c + 1 + d) a = _
    rw [Nat.succ_add, nsmul_succ, nsmul_succ, ih, R.add_assoc]

/-- The scalar action distributes over `R.mul` on the right: `(c • a)·b = c • (a·b)`. -/
theorem nsmul_mul (c : Nat) (a b : R.carrier) :
    R.mul (nsmul R c a) b = nsmul R c (R.mul a b) := by
  induction c with
  | zero => rw [nsmul_zero, nsmul_zero, R.zero_mul]
  | succ c ih => rw [nsmul_succ, nsmul_succ, R.right_distrib, ih]

/-- The scalar action distributes over `R.mul` on the left: `a·(c • b) = c • (a·b)`. -/
theorem mul_nsmul (c : Nat) (a b : R.carrier) :
    R.mul a (nsmul R c b) = nsmul R c (R.mul a b) := by
  induction c with
  | zero => rw [nsmul_zero, nsmul_zero, R.mul_zero]
  | succ c ih => rw [nsmul_succ, nsmul_succ, R.left_distrib, ih]

/-- A **finite sum** `Σ_{k=0}^{m−1} f k` over a `List.range m` fold (`binomial-coefficient.md`:
the sum `Σ_{k=0}^n`). Right fold so `sum (m+1)` peels the `0` term off the front. -/
def sum (f : Nat → R.carrier) (m : Nat) : R.carrier :=
  (List.range m).foldr (fun k acc => R.add (f k) acc) R.zero

theorem sum_zero (f : Nat → R.carrier) : sum R f 0 = R.zero := rfl

/-- `Σ_{k=0}^{m} f k = f 0 + Σ_{k=0}^{m−1} f (k+1)` — peel the head off `range (m+1)`. -/
theorem sum_succ_front (f : Nat → R.carrier) (m : Nat) :
    sum R f (m + 1) = R.add (f 0) (sum R (fun k => f (k + 1)) m) := by
  show (List.range (m + 1)).foldr _ _ = _
  rw [List.range_succ_eq_map, List.foldr_cons, List.foldr_map]
  rfl

/-- `Σ_{k=0}^{m} f k = Σ_{k=0}^{m−1} f k + f m` — peel the **last** term off `range (m+1)`. -/
theorem sum_succ_back (m : Nat) : ∀ (f : Nat → R.carrier),
    sum R f (m + 1) = R.add (sum R f m) (f m) := by
  induction m with
  | zero => intro f; rw [sum_succ_front, sum_zero, R.add_zero, sum_zero, R.zero_add]
  | succ m ih =>
    intro f
    rw [sum_succ_front, ih (fun k => f (k + 1))]
    rw [sum_succ_front (f := f), R.add_assoc]

/-- A finite sum of zeros is zero. -/
theorem sum_const_zero (m : Nat) : sum R (fun _ => R.zero) m = R.zero := by
  induction m with
  | zero => rfl
  | succ m ih => rw [sum_succ_back, ih, R.add_zero]

/-- Two summands that agree pointwise have equal sums. -/
theorem sum_congr (m : Nat) {f g : Nat → R.carrier} (h : ∀ k, f k = g k) :
    sum R f m = sum R g m := by
  have : f = g := funext h
  rw [this]

/-- `Σ (f k + g k) = Σ f k + Σ g k` — the sum is additive. (`f`,`g` generalized so the
induction hypothesis applies to the shifted summands.) -/
theorem sum_add (m : Nat) : ∀ (f g : Nat → R.carrier),
    sum R (fun k => R.add (f k) (g k)) m = R.add (sum R f m) (sum R g m) := by
  induction m with
  | zero => intro f g; rw [sum_zero, sum_zero, sum_zero, R.add_zero]
  | succ m ih =>
    intro f g
    rw [sum_succ_front, sum_succ_front, sum_succ_front]
    show R.add (R.add (f 0) (g 0)) _ = _
    rw [ih (fun k => f (k + 1)) (fun k => g (k + 1))]
    -- (f0+g0) + (Σf' + Σg') = (f0 + Σf') + (g0 + Σg')
    rw [R.add_assoc, ← R.add_assoc (g 0), R.add_comm (g 0) (sum R (fun k => f (k+1)) m),
        R.add_assoc, ← R.add_assoc (f 0)]

/-- Pull a right multiplication through a finite sum: `(Σ f k)·b = Σ (f k · b)`. -/
theorem sum_mul (b : R.carrier) (m : Nat) : ∀ (f : Nat → R.carrier),
    R.mul (sum R f m) b = sum R (fun k => R.mul (f k) b) m := by
  induction m with
  | zero => intro f; rw [sum_zero, sum_zero, R.zero_mul]
  | succ m ih =>
    intro f
    rw [sum_succ_front, sum_succ_front, R.right_distrib, ih (fun k => f (k + 1))]

/-- Pull a left multiplication through a finite sum: `a·(Σ f k) = Σ (a · f k)`. -/
theorem mul_sum (a : R.carrier) (m : Nat) : ∀ (f : Nat → R.carrier),
    R.mul a (sum R f m) = sum R (fun k => R.mul a (f k)) m := by
  induction m with
  | zero => intro f; rw [sum_zero, sum_zero, R.mul_zero]
  | succ m ih =>
    intro f
    rw [sum_succ_front, sum_succ_front, R.left_distrib, ih (fun k => f (k + 1))]

/-- The `k`-th **binomial term** of `(x+y)^n`: `C(n,k) · x^k · y^{n−k}`. -/
def binTerm (x y : R.carrier) (n k : Nat) : R.carrier :=
  nsmul R (choose n k) (R.mul (pow R x k) (pow R y (n - k)))

/-- The right-hand side of the binomial theorem: `Σ_{k=0}^{n} C(n,k) x^k y^{n−k}`. -/
def binSum (x y : R.carrier) (n : Nat) : R.carrier :=
  sum R (binTerm R x y n) (n + 1)

/-! ### The Pascal recurrence on the binomial sum -/

variable (x y : R.carrier)

/-- Multiplying the binomial sum by `x` shifts each term's `x`-power up by one:
`x·binSum n = Σ_{k=0}^{n} C(n,k) · x^{k+1} · y^{n−k}`. -/
theorem x_mul_binSum (n : Nat) :
    R.mul x (binSum R x y n)
      = sum R (fun k => nsmul R (choose n k) (R.mul (pow R x (k + 1)) (pow R y (n - k))))
          (n + 1) := by
  unfold binSum
  rw [mul_sum]
  apply sum_congr
  intro k
  show R.mul x (nsmul R (choose n k) (R.mul (pow R x k) (pow R y (n - k)))) = _
  rw [mul_nsmul]
  congr 1
  rw [← R.mul_assoc, ← pow_succ]

/-- Multiplying the binomial sum by `y` shifts each term's `y`-power up by one: it equals
`Σ_{j=0}^{n+1} B j` where `B j = C(n,j) · x^j · y^{n+1−j}` (and `B (n+1) = 0`). -/
theorem y_mul_binSum (n : Nat) :
    R.mul y (binSum R x y n)
      = sum R (fun j => nsmul R (choose n j) (R.mul (pow R x j) (pow R y (n + 1 - j))))
          (n + 1) := by
  unfold binSum
  rw [mul_sum]
  apply sum_congr
  intro k
  show R.mul y (nsmul R (choose n k) (R.mul (pow R x k) (pow R y (n - k)))) = _
  rw [mul_nsmul]
  by_cases hkn : k ≤ n
  · -- k ≤ n: shift the y-power. y·(x^k y^{n-k}) = x^k y^{(n-k)+1} = x^k y^{n+1-k}.
    congr 1
    rw [← R.mul_assoc, R.mul_comm y (pow R x k), R.mul_assoc, ← pow_succ]
    have : n - k + 1 = n + 1 - k := by omega
    rw [this]
  · -- k > n: C(n,k) = 0, so both sides are nsmul 0 _ = zero.
    rw [choose_eq_zero_of_lt (Nat.lt_of_not_le hkn), nsmul_zero, nsmul_zero]

/-- **The Pascal recurrence on the binomial sum.** `binSum (n+1) = (x+y)·binSum n`. This
is the one inductive step of the binomial theorem: it bundles Pascal's recurrence
(`choose_succ_succ`) with the `x`- and `y`-power shifts (`x_mul_binSum`, `y_mul_binSum`). -/
theorem binSum_succ (n : Nat) :
    binSum R x y (n + 1) = R.mul (R.add x y) (binSum R x y n) := by
  rw [R.right_distrib, x_mul_binSum, y_mul_binSum]
  -- LHS: peel head (k=0) and shift the tail by one.
  rw [show binSum R x y (n + 1)
        = sum R (binTerm R x y (n + 1)) (n + 2) from rfl, sum_succ_front]
  -- head term k=0 of binSum (n+1): C(n+1,0) x^0 y^{n+1} = y^{n+1}.
  -- Rewrite the tail's summand by Pascal, then split with sum_add.
  have htail : sum R (fun k => binTerm R x y (n + 1) (k + 1)) (n + 1)
      = R.add
          (sum R (fun k => nsmul R (choose n k) (R.mul (pow R x (k + 1)) (pow R y (n - k)))) (n + 1))
          (sum R (fun k => nsmul R (choose n (k + 1)) (R.mul (pow R x (k + 1)) (pow R y (n - k)))) (n + 1)) := by
    rw [← sum_add]
    apply sum_congr
    intro k
    show nsmul R (choose (n + 1) (k + 1)) (R.mul (pow R x (k + 1)) (pow R y (n + 1 - (k + 1)))) = _
    rw [choose_succ_succ, nsmul_add]
    have hsub : n + 1 - (k + 1) = n - k := by omega
    rw [hsub]
  rw [htail]
  -- Right side is X + Y; Y peeled at the head (k=0):  Y = y^{n+1} + Y',
  -- Y' = Σ_{k=0}^{n-1} C(n,k+1) x^{k+1} y^{n+1-(k+1)}.
  rw [sum_succ_front (f := fun k => nsmul R (choose n k) (R.mul (pow R x k) (pow R y (n + 1 - k))))]
  -- LHS: peel the *top* term of TC (k=n), which carries C(n,n+1) = 0, so it vanishes,
  -- shrinking TC's range from n+1 to n to match Y'.
  rw [sum_succ_back (f := fun k => nsmul R (choose n (k + 1)) (R.mul (pow R x (k + 1)) (pow R y (n - k))))]
  -- top term:  C(n, n+1) • _ = 0 • _ = 0
  rw [choose_eq_zero_of_lt (Nat.lt_succ_self n), nsmul_zero, R.add_zero]
  -- Now both sides are sums over range n / range (n+1); align the binTerm head and
  -- reassociate so X cancels against X.
  show R.add (binTerm R x y (n + 1) 0)
        (R.add
          (sum R (fun k => nsmul R (choose n k) (R.mul (pow R x (k + 1)) (pow R y (n - k)))) (n + 1))
          (sum R (fun k => nsmul R (choose n (k + 1)) (R.mul (pow R x (k + 1)) (pow R y (n - k)))) n))
      = R.add
          (sum R (fun k => nsmul R (choose n k) (R.mul (pow R x (k + 1)) (pow R y (n - k)))) (n + 1))
          (R.add
            (nsmul R (choose n 0) (R.mul (pow R x 0) (pow R y (n + 1 - 0))))
            (sum R (fun k => nsmul R (choose n (k + 1)) (R.mul (pow R x (k + 1)) (pow R y (n + 1 - (k + 1))))) n))
  rw [← R.add_assoc, R.add_comm (binTerm R x y (n + 1) 0)
        (sum R (fun k => nsmul R (choose n k) (R.mul (pow R x (k + 1)) (pow R y (n - k)))) (n + 1)),
      R.add_assoc]
  congr 1
  congr 1
  · -- head equality: binTerm (n+1) 0 = C(n,0) x^0 y^{n+1}
    show nsmul R (choose (n + 1) 0) (R.mul (pow R x 0) (pow R y (n + 1 - 0))) = _
    rw [choose_zero_right, choose_zero_right]
  · -- TC' = Y': termwise, with n+1-(k+1) = n-k
    apply sum_congr
    intro k
    have hsub : n + 1 - (k + 1) = n - k := by omega
    rw [hsub]

/-- **The binomial theorem.** In any commutative semiring `R`,
`(x+y)^n = Σ_{k=0}^{n} C(n,k) · x^k · y^{n−k}` (`binomial-coefficient.md`). Proven by
induction on `n`: the base case is `(x+y)^0 = 1`, and the step is the binomial-sum
recurrence `binSum_succ` (which packages Pascal). -/
theorem binomial_theorem (n : Nat) :
    pow R (R.add x y) n = binSum R x y n := by
  induction n with
  | zero =>
    show R.one = sum R (binTerm R x y 0) 1
    rw [sum_succ_front, sum_zero, R.add_zero]
    show R.one = nsmul R (choose 0 0) (R.mul (pow R x 0) (pow R y (0 - 0)))
    rw [choose_zero_right, pow_zero, pow_zero, R.mul_one, nsmul_succ, nsmul_zero, R.add_zero]
  | succ n ih =>
    rw [pow_succ, ih, binSum_succ]

end CSR

/-! # =====================================================================
    # (D) Divisibility — the "fits into" relation on `Nat`
    # ===================================================================== -/

/-- **Divisibility** `a ∣ b := ∃ c, b = a · c` (`divisibility.md`). This is exactly the
core `Nat` `Dvd` relation; we name it and prove the partial-order laws over `Nat`. -/
def Dvd (a b : Nat) : Prop := ∃ c, b = a * c

/-- Our `Dvd` agrees with core `∣` on `Nat`. -/
theorem dvd_iff (a b : Nat) : Dvd a b ↔ a ∣ b :=
  ⟨fun ⟨c, h⟩ => ⟨c, h⟩, fun ⟨c, h⟩ => ⟨c, h⟩⟩

/-- **Reflexivity** `a ∣ a` (`divisibility.md`: a divides itself). -/
theorem dvd_refl (a : Nat) : Dvd a a := ⟨1, (Nat.mul_one a).symm⟩

/-- **Transitivity** `a ∣ b → b ∣ c → a ∣ c` (`divisibility.md`: `c = akj`). -/
theorem dvd_trans {a b c : Nat} (h1 : Dvd a b) (h2 : Dvd b c) : Dvd a c := by
  obtain ⟨j, hj⟩ := h1
  obtain ⟨k, hk⟩ := h2
  exact ⟨j * k, by rw [hk, hj, Nat.mul_assoc]⟩

/-- **Antisymmetry on positives** `a ∣ b → b ∣ a → a = b` (`divisibility.md`: the
divisibility order is antisymmetric for positive integers). Stated over `Nat`, where it
holds outright (`Nat.dvd_antisymm`). -/
theorem dvd_antisymm {a b : Nat} (h1 : Dvd a b) (h2 : Dvd b a) : a = b :=
  Nat.dvd_antisymm ((dvd_iff a b).mp h1) ((dvd_iff b a).mp h2)

/-- `1 ∣ a` — one sits at the bottom of the divisibility order. -/
theorem one_dvd (a : Nat) : Dvd 1 a := ⟨a, (Nat.one_mul a).symm⟩

/-- `a ∣ 0` — zero sits at the top. -/
theorem dvd_zero (a : Nat) : Dvd a 0 := ⟨0, (Nat.mul_zero a).symm⟩

/-- Divisibility distributes over addition: `a ∣ b → a ∣ c → a ∣ (b + c)`. -/
theorem dvd_add {a b c : Nat} (h1 : Dvd a b) (h2 : Dvd a c) : Dvd a (b + c) := by
  obtain ⟨j, hj⟩ := h1
  obtain ⟨k, hk⟩ := h2
  exact ⟨j + k, by rw [hj, hk, Nat.mul_add]⟩

/-- Divisibility absorbs a factor: `a ∣ b → a ∣ (b · c)`. -/
theorem dvd_mul_right {a b : Nat} (h : Dvd a b) (c : Nat) : Dvd a (b * c) := by
  obtain ⟨j, hj⟩ := h
  exact ⟨j * c, by rw [hj, Nat.mul_assoc]⟩

/-! # =====================================================================
    # (E) Greatest common divisor — the Euclidean algorithm
    # ===================================================================== -/

/-- The **greatest common divisor**, computed by Euclid's algorithm. We reuse the core
`Nat.gcd` (which is exactly Euclid's recursion `gcd 0 b = b`,
`gcd (n+1) b = gcd (b % (n+1)) (n+1)`), and re-present its facts as the corpus states
them (`greatest-common-divisor.md`). -/
def gcd (a b : Nat) : Nat := Nat.gcd a b

/-- **`gcd` divides the first argument** (`greatest-common-divisor.md`: it divides both). -/
theorem gcd_dvd_left (a b : Nat) : Dvd (gcd a b) a :=
  (dvd_iff _ _).mpr (Nat.gcd_dvd_left a b)

/-- **`gcd` divides the second argument.** -/
theorem gcd_dvd_right (a b : Nat) : Dvd (gcd a b) b :=
  (dvd_iff _ _).mpr (Nat.gcd_dvd_right a b)

/-- **Greatestness.** Any common divisor `d` of `a` and `b` divides `gcd a b` — so the
gcd is the *greatest* common divisor under the divisibility order, i.e. the **meet**
(`greatest-common-divisor.md`: "the greatest lower bound under the divisibility
ordering"). -/
theorem gcd_greatest {a b d : Nat} (ha : Dvd d a) (hb : Dvd d b) : Dvd d (gcd a b) :=
  (dvd_iff _ _).mpr (Nat.dvd_gcd ((dvd_iff d a).mp ha) ((dvd_iff d b).mp hb))

/-- **The gcd recurrence** `gcd a b = gcd (a mod b) b` for `b > 0` — "replacing the
larger number with the remainder does not change the gcd" (`greatest-common-divisor.md`,
Euclid). This is the engine of the Euclidean algorithm. -/
theorem gcd_rec (a b : Nat) (hb : 0 < b) : gcd b a = gcd (a % b) b := by
  show Nat.gcd b a = Nat.gcd (a % b) b
  rw [Nat.gcd_rec b a]
  -- Nat.gcd_rec : Nat.gcd m n = Nat.gcd (n % m) m gives the goal directly.

/-- **Bézout, the existence projection.** Coprimality `gcd a b = 1` is exactly the
`Nat.Coprime` predicate the core carries; it is the `gcd = 1` case in which Bézout gives
`s·a + t·b = 1`. We expose the coprimality interface (the part Euclid's lemma needs). -/
def Coprime (a b : Nat) : Prop := gcd a b = 1

theorem coprime_iff (a b : Nat) : Coprime a b ↔ Nat.Coprime a b := Iff.rfl

/-! # =====================================================================
    # (F) Primes and Euclid's lemma
    # ===================================================================== -/

/-- A **prime** `p`: at least `2`, and whose only divisors are `1` and `p`
(`prime.md`: "an integer `p > 1` whose only positive divisors are 1 and `p` itself").
The product-formulation `p ∣ a·b → p∣a ∨ p∣b` is *derived* (Euclid's lemma), not
posited — exactly as the corpus says the two formulations are equivalent. -/
structure Prime (p : Nat) : Prop where
  two_le : 2 ≤ p
  only_divisors : ∀ d, Dvd d p → d = 1 ∨ d = p

/-- A prime is positive. -/
theorem Prime.pos {p : Nat} (hp : Prime p) : 0 < p := Nat.lt_of_lt_of_le Nat.zero_lt_two hp.two_le

/-- **A prime is coprime to anything it does not divide.** If `p` is prime and `p ∤ a`,
then `gcd p a = 1`. Proof: `gcd p a` divides `p`, so by primality it is `1` or `p`; if it
were `p` then (since `gcd p a ∣ a`) `p ∣ a`, contradicting `p ∤ a`. This is the
coprimality route the gcd-node names as the key to Euclid's lemma. -/
theorem Prime.coprime_of_not_dvd {p a : Nat} (hp : Prime p) (hna : ¬ Dvd p a) :
    Coprime p a := by
  have hdvd_p : Dvd (gcd p a) p := gcd_dvd_left p a
  rcases hp.only_divisors (gcd p a) hdvd_p with h1 | hp'
  · exact h1
  · -- gcd p a = p ⇒ p ∣ a (since gcd ∣ a), contradiction.
    exact absurd (hp' ▸ gcd_dvd_right p a) hna

/-- **Euclid's lemma.** If a prime `p` divides a product `a·b`, then `p ∣ a` or `p ∣ b`
(`prime.md`: "if a prime divides a product, it must divide one of the factors" — the
lemma underlying the fundamental theorem of arithmetic). Proven by the coprimality
route: if `p ∤ a` then `p` is coprime to `a`, and a number coprime to `a` dividing `a·b`
must divide `b` (`Nat.Coprime.dvd_of_dvd_mul_left`, the Bézout primitive). -/
theorem Prime.euclid {p a b : Nat} (hp : Prime p) (h : Dvd p (a * b)) :
    Dvd p a ∨ Dvd p b := by
  -- Split on the *decidable* core relation `p ∣ a` (no excluded middle): `Nat`
  -- divisibility is decidable, so `Decidable.byCases` suffices.
  refine (inferInstance : Decidable (p ∣ a)).byCases (fun hda => Or.inl ((dvd_iff p a).mpr hda)) ?_
  intro hda
  refine Or.inr ?_
  have hna : ¬ Dvd p a := fun h' => hda ((dvd_iff p a).mp h')
  have hco : Nat.Coprime p a := (coprime_iff p a).mp (hp.coprime_of_not_dvd hna)
  exact (dvd_iff p b).mpr (hco.dvd_of_dvd_mul_left ((dvd_iff p (a * b)).mp h))

/-! # =====================================================================
    # (G) Congruence — modular arithmetic, a ring-congruence
    # ===================================================================== -/

/-- **Congruence modulo `n`**: `a ≡ b (mod n)` holds when `a` and `b` leave the same
remainder, equivalently `n ∣ (a − b)` (`congruence.md`). Over `Nat` we use the
remainder form `a % n = b % n` to avoid truncated subtraction; the two are equivalent
on `Nat` (`Nat. modEq_iff_dvd'`). -/
def ModEq (n a b : Nat) : Prop := a % n = b % n

@[inherit_doc] scoped notation:50 a " ≡ " b " [MOD " n "]" => ModEq n a b

/-- **Reflexivity** `a ≡ a (mod n)` (`congruence.md`: an equivalence relation). -/
theorem modEq_refl (n a : Nat) : ModEq n a a := rfl

/-- **Symmetry** `a ≡ b → b ≡ a`. -/
theorem modEq_symm {n a b : Nat} (h : ModEq n a b) : ModEq n b a := h.symm

/-- **Transitivity** `a ≡ b → b ≡ c → a ≡ c`. -/
theorem modEq_trans {n a b c : Nat} (h1 : ModEq n a b) (h2 : ModEq n b c) :
    ModEq n a c := h1.trans h2

/-- Congruence packaged as an `Discrete.EquivalenceRelation` on `Nat` (decidable, since
`%` and `=` on `Nat` are decidable) — the residue-class partition of `congruence.md`. -/
def modEqRel (n : Nat) : Discrete.EquivalenceRelation Nat where
  rel a b := decide (a % n = b % n)
  refl a := by simp
  symm {a b} h := by
    have : a % n = b % n := of_decide_eq_true h
    exact decide_eq_true this.symm
  trans {a b c} h1 h2 := by
    have e1 : a % n = b % n := of_decide_eq_true h1
    have e2 : b % n = c % n := of_decide_eq_true h2
    exact decide_eq_true (e1.trans e2)

/-- **Congruence respects addition** `a ≡ a' → b ≡ b' → a + b ≡ a' + b' (mod n)`
(`congruence.md`: "you can add congruences freely"). -/
theorem modEq_add {n a a' b b' : Nat}
    (ha : ModEq n a a') (hb : ModEq n b b') : ModEq n (a + b) (a' + b') := by
  show (a + b) % n = (a' + b') % n
  rw [Nat.add_mod, Nat.add_mod a' b', ha, hb]

/-- **Congruence respects multiplication** `a ≡ a' → b ≡ b' → a·b ≡ a'·b' (mod n)`
(`congruence.md`: "you can multiply congruences freely") — together with `modEq_add`
this makes `ModEq n` a **ring-congruence**, the `algebra/congruence.md` condition that
the residue classes `ℤ/nℤ` inherit well-defined `+` and `·`. -/
theorem modEq_mul {n a a' b b' : Nat}
    (ha : ModEq n a a') (hb : ModEq n b b') : ModEq n (a * b) (a' * b') := by
  show (a * b) % n = (a' * b') % n
  rw [Nat.mul_mod, Nat.mul_mod a' b', ha, hb]

/-! # =====================================================================
    # Theorems
    # ===================================================================== -/

/-- **`pascal_and_binomial_theorem`.** Bundles the **Pascal recurrence** —
`choose_zero` (`C(n,0)=1`), `choose_self` (`C(n,n)=1`), and `choose_succ_succ`
(`C(n+1,k+1) = C(n,k) + C(n,k+1)`) — together with the **binomial theorem** over an
arbitrary commutative semiring `R`: `(x+y)^n = Σ_{k=0}^n C(n,k) x^k y^{n−k}`
(`binomial-coefficient.md`). The binomial theorem is proven by induction on `n` using
Pascal (via `binSum_succ`). -/
theorem pascal_and_binomial_theorem :
    (∀ n, choose n 0 = 1) ∧
    (∀ n, choose n n = 1) ∧
    (∀ n k, choose (n + 1) (k + 1) = choose n k + choose n (k + 1)) ∧
    (∀ (R : CommSemiring) (x y : R.carrier) (n : Nat),
        CSR.pow R (R.add x y) n = CSR.binSum R x y n) :=
  ⟨choose_zero_right, choose_self, choose_succ_succ, CSR.binomial_theorem⟩

/-- **`gcd_prime_theory`.** Bundles, over `Nat`:
* the **divisibility basics** — reflexivity, transitivity, antisymmetry;
* **gcd correctness** — `gcd a b ∣ a`, `gcd a b ∣ b`, and the *greatest* property (any
  common divisor divides the gcd — the divisibility meet);
* the **gcd recurrence** `gcd b a = gcd (a mod b) b` (Euclid, for `b > 0`);
* **Euclid's lemma** for primes: `p ∣ a·b → p ∣ a ∨ p ∣ b`.

Euclid's lemma is obtained by the **coprimality route** the gcd-node names: a prime not
dividing `a` is coprime to `a` (`Prime.coprime_of_not_dvd`), and the Bézout primitive
`Nat.Coprime.dvd_of_dvd_mul_left` then forces `p ∣ b`. -/
theorem gcd_prime_theory :
    (∀ a, Dvd a a) ∧
    (∀ {a b c}, Dvd a b → Dvd b c → Dvd a c) ∧
    (∀ {a b}, Dvd a b → Dvd b a → a = b) ∧
    (∀ a b, Dvd (gcd a b) a) ∧
    (∀ a b, Dvd (gcd a b) b) ∧
    (∀ {a b d}, Dvd d a → Dvd d b → Dvd d (gcd a b)) ∧
    (∀ a b, 0 < b → gcd b a = gcd (a % b) b) ∧
    (∀ {p a b}, Prime p → Dvd p (a * b) → Dvd p a ∨ Dvd p b) :=
  ⟨dvd_refl, dvd_trans, dvd_antisymm,
   gcd_dvd_left, gcd_dvd_right, gcd_greatest, gcd_rec,
   fun hp h => hp.euclid h⟩

end NumberTheory
end Infomaterial
