import Obsmetrologia.Calculus.Order.SetNumberGraphTheory
import Obsmetrologia.Calculus.Order.AlgebraHierarchy

/-!
# NumberTheoryCombinatorics — factorial, Pascal, the binomial theorem, gcd & primes

This module formalizes the part of received **number theory / combinatorics** that the
spine's ℕ (`SetNumberGraphTheory.lean`'s `natAlg`) does not yet carry. As
with `SetNumberGraphTheory` and `AlgebraHierarchy`, the received material is a
**degenerate specialization**: it is the multiplicative/counting body that the predicate
morphism throws over the discrete carrier `Nat`. Every result here is *derived* over the
core `Nat` — nothing is re-postulated.

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
  `choose_succ_succ`) **and** the binomial theorem over `Nat`, the latter proven by
  induction on `n` using Pascal.
* `gcd_prime_theory` — gcd correctness (`gcd ∣ a`, `gcd ∣ b`, greatest), the gcd
  recurrence `gcd(a,b) = gcd(b, a mod b)`, the divisibility basics, **and Euclid's
  lemma** for primes. (See the module notes: Euclid's lemma is obtained via the
  Bézout/coprimality route, with `Nat.Coprime`/`Nat.Coprime.dvd_of_dvd_mul_right` the
  core primitives it collapses into.)

Section (H) welds the two: `choose_mul_factorial_mul_factorial` identifies the
Pascal-recurrence `choose` with the factorial quotient; `Prime.dvd_factorial` /
`Prime.not_dvd_factorial` locate a prime's divisibility of `n!` exactly at
`p ≤ n`; `Prime.dvd_choose_central` captures every prime of `(m+1, 2m+1]` in
the central entry `C(2m+1, m)`; and `prod_dvd_of_pairwise_primes_dvd` /
`primes_top_interval_prod_dvd_choose_central` embed the interval's primorial
in that entry.

Section (I) prices the capture: the binomial theorem at the discrete carrier
with `x = y = 1` is the Pascal row sum `Σ_k C(n,k) = 2^n` (`sum_choose`, over
the `Nat`-typed `natSum`), the two central entries of an odd row agree and
together are at most the row sum (`choose_central_symm`,
`choose_central_le_two_pow`), so distinct primes of `(m+1, 2m+1]` have product
at most `2^(2m)` (`primes_top_interval_prod_le`).
-/

namespace Obsmetrologia
namespace NumberTheory

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
    # (C) The binomial theorem over `Nat`
    # ===================================================================== -/

namespace CSR

/-- A **finite sum** `Σ_{k=0}^{m−1} f k` over a `List.range m` fold (`binomial-coefficient.md`:
the sum `Σ_{k=0}^n`). Right fold so `sum (m+1)` peels the `0` term off the front. -/
def sum (f : Nat → Nat) (m : Nat) : Nat :=
  (List.range m).foldr (fun k acc => f k + acc) 0

theorem sum_zero (f : Nat → Nat) : sum f 0 = 0 := rfl

/-- `Σ_{k=0}^{m} f k = f 0 + Σ_{k=0}^{m−1} f (k+1)` — peel the head off `range (m+1)`. -/
theorem sum_succ_front (f : Nat → Nat) (m : Nat) :
    sum f (m + 1) = f 0 + sum (fun k => f (k + 1)) m := by
  show (List.range (m + 1)).foldr _ _ = _
  rw [List.range_succ_eq_map, List.foldr_cons, List.foldr_map]
  rfl

/-- `Σ_{k=0}^{m} f k = Σ_{k=0}^{m−1} f k + f m` — peel the **last** term off `range (m+1)`. -/
theorem sum_succ_back (m : Nat) : ∀ (f : Nat → Nat),
    sum f (m + 1) = sum f m + f m := by
  induction m with
  | zero => intro f; rw [sum_succ_front, sum_zero, sum_zero, Nat.add_zero, Nat.zero_add]
  | succ m ih =>
    intro f
    rw [sum_succ_front, ih (fun k => f (k + 1)), sum_succ_front (f := f)]
    omega

/-- A finite sum of zeros is zero. -/
theorem sum_const_zero (m : Nat) : sum (fun _ => 0) m = 0 := by
  induction m with
  | zero => rfl
  | succ m ih => rw [sum_succ_back, ih]

/-- Two summands that agree pointwise have equal sums. -/
theorem sum_congr (m : Nat) {f g : Nat → Nat} (h : ∀ k, f k = g k) :
    sum f m = sum g m := by
  have : f = g := funext h
  rw [this]

/-- `Σ (f k + g k) = Σ f k + Σ g k` — the sum is additive. (`f`,`g` generalized so the
induction hypothesis applies to the shifted summands.) -/
theorem sum_add (m : Nat) : ∀ (f g : Nat → Nat),
    sum (fun k => f k + g k) m = sum f m + sum g m := by
  induction m with
  | zero => intro f g; rw [sum_zero, sum_zero, sum_zero]
  | succ m ih =>
    intro f g
    rw [sum_succ_front, sum_succ_front, sum_succ_front, ih (fun k => f (k + 1)) (fun k => g (k + 1))]
    omega

/-- Pull a right multiplication through a finite sum: `(Σ f k)·b = Σ (f k · b)`. -/
theorem sum_mul (b : Nat) (m : Nat) : ∀ (f : Nat → Nat),
    (sum f m) * b = sum (fun k => f k * b) m := by
  induction m with
  | zero => intro f; rw [sum_zero, sum_zero, Nat.zero_mul]
  | succ m ih =>
    intro f
    rw [sum_succ_front, sum_succ_front, Nat.add_mul, ih (fun k => f (k + 1))]

/-- Pull a left multiplication through a finite sum: `a·(Σ f k) = Σ (a · f k)`. -/
theorem mul_sum (a : Nat) (m : Nat) : ∀ (f : Nat → Nat),
    a * (sum f m) = sum (fun k => a * f k) m := by
  induction m with
  | zero => intro f; rw [sum_zero, sum_zero, Nat.mul_zero]
  | succ m ih =>
    intro f
    rw [sum_succ_front, sum_succ_front, Nat.mul_add, ih (fun k => f (k + 1))]

/-- The `k`-th **binomial term** of `(x+y)^n`: `C(n,k) · x^k · y^{n−k}`. -/
def binTerm (x y n k : Nat) : Nat :=
  choose n k * (x ^ k * y ^ (n - k))

/-- The right-hand side of the binomial theorem: `Σ_{k=0}^{n} C(n,k) x^k y^{n−k}`. -/
def binSum (x y n : Nat) : Nat :=
  sum (binTerm x y n) (n + 1)

/-! ### The Pascal recurrence on the binomial sum -/

variable (x y : Nat)

/-- Multiplying the binomial sum by `x` shifts each term's `x`-power up by one:
`x·binSum n = Σ_{k=0}^{n} C(n,k) · x^{k+1} · y^{n−k}`. -/
theorem x_mul_binSum (n : Nat) :
    x * (binSum x y n)
      = sum (fun k => choose n k * (x ^ (k + 1) * y ^ (n - k)))
          (n + 1) := by
  unfold binSum
  rw [mul_sum]
  apply sum_congr
  intro k
  show x * (choose n k * (x ^ k * y ^ (n - k))) = _
  rw [Nat.pow_succ', Nat.mul_left_comm, Nat.mul_assoc]

/-- Multiplying the binomial sum by `y` shifts each term's `y`-power up by one: it equals
`Σ_{j=0}^{n+1} B j` where `B j = C(n,j) · x^j · y^{n+1−j}` (and `B (n+1) = 0`). -/
theorem y_mul_binSum (n : Nat) :
    y * (binSum x y n)
      = sum (fun j => choose n j * (x ^ j * y ^ (n + 1 - j)))
          (n + 1) := by
  unfold binSum
  rw [mul_sum]
  apply sum_congr
  intro k
  show y * (choose n k * (x ^ k * y ^ (n - k))) = _
  by_cases hkn : k ≤ n
  · -- k ≤ n: shift the y-power. y·(x^k y^{n-k}) = x^k y^{(n-k)+1} = x^k y^{n+1-k}.
    have hsub : n - k + 1 = n + 1 - k := by omega
    rw [Nat.mul_left_comm, Nat.mul_left_comm y, ← Nat.pow_succ']
    show choose n k * (x ^ k * y ^ (n - k).succ) = choose n k * (x ^ k * y ^ (n + 1 - k))
    rw [Nat.succ_eq_add_one, hsub]
  · -- k > n: C(n,k) = 0, so both sides are 0 * _ = 0.
    rw [choose_eq_zero_of_lt (Nat.lt_of_not_le hkn), Nat.zero_mul, Nat.mul_zero, Nat.zero_mul]

/-- **The Pascal recurrence on the binomial sum.** `binSum (n+1) = (x+y)·binSum n`. This
is the one inductive step of the binomial theorem: it bundles Pascal's recurrence
(`choose_succ_succ`) with the `x`- and `y`-power shifts (`x_mul_binSum`, `y_mul_binSum`). -/
theorem binSum_succ (n : Nat) :
    binSum x y (n + 1) = (x + y) * (binSum x y n) := by
  rw [Nat.add_mul, x_mul_binSum, y_mul_binSum]
  -- LHS: peel head (k=0) and shift the tail by one.
  rw [show binSum x y (n + 1)
        = sum (binTerm x y (n + 1)) (n + 2) from rfl, sum_succ_front]
  -- head term k=0 of binSum (n+1): C(n+1,0) x^0 y^{n+1} = y^{n+1}.
  -- Rewrite the tail's summand by Pascal, then split with sum_add.
  have htail : sum (fun k => binTerm x y (n + 1) (k + 1)) (n + 1)
      = sum (fun k => choose n k * (x ^ (k + 1) * y ^ (n - k))) (n + 1)
          + sum (fun k => choose n (k + 1) * (x ^ (k + 1) * y ^ (n - k))) (n + 1) := by
    rw [← sum_add]
    apply sum_congr
    intro k
    show choose (n + 1) (k + 1) * (x ^ (k + 1) * y ^ (n + 1 - (k + 1))) = _
    rw [choose_succ_succ]
    have hsub : n + 1 - (k + 1) = n - k := by omega
    rw [hsub, Nat.add_mul]
  rw [htail]
  -- Right side is X + Y; Y peeled at the head (k=0):  Y = y^{n+1} + Y',
  -- Y' = Σ_{k=0}^{n-1} C(n,k+1) x^{k+1} y^{n+1-(k+1)}.
  rw [sum_succ_front (f := fun k => choose n k * (x ^ k * y ^ (n + 1 - k)))]
  -- LHS: peel the *top* term of TC (k=n), which carries C(n,n+1) = 0, so it vanishes,
  -- shrinking TC's range from n+1 to n to match Y'.
  rw [sum_succ_back (f := fun k => choose n (k + 1) * (x ^ (k + 1) * y ^ (n - k)))]
  -- top term:  C(n, n+1) * _ = 0 * _ = 0
  rw [choose_eq_zero_of_lt (Nat.lt_succ_self n), Nat.zero_mul, Nat.add_zero]
  -- Now both sides are sums over range n / range (n+1); align the binTerm head and
  -- reassociate so X cancels against X.
  show binTerm x y (n + 1) 0
        + (sum (fun k => choose n k * (x ^ (k + 1) * y ^ (n - k))) (n + 1)
          + sum (fun k => choose n (k + 1) * (x ^ (k + 1) * y ^ (n - k))) n)
      = sum (fun k => choose n k * (x ^ (k + 1) * y ^ (n - k))) (n + 1)
          + ((choose n 0 * (x ^ 0 * y ^ (n + 1 - 0)))
            + sum (fun k => choose n (k + 1) * (x ^ (k + 1) * y ^ (n + 1 - (k + 1)))) n)
  have hbin0 : binTerm x y (n + 1) 0 = choose n 0 * (x ^ 0 * y ^ (n + 1 - 0)) := by
    show choose (n + 1) 0 * (x ^ 0 * y ^ (n + 1 - 0)) = _
    rw [choose_zero_right, choose_zero_right]
  have htail2 : sum (fun k => choose n (k + 1) * (x ^ (k + 1) * y ^ (n - k))) n
      = sum (fun k => choose n (k + 1) * (x ^ (k + 1) * y ^ (n + 1 - (k + 1)))) n := by
    apply sum_congr
    intro k
    have hsub : n + 1 - (k + 1) = n - k := by omega
    rw [hsub]
  rw [hbin0, htail2]
  omega

/-- **The binomial theorem.** For `x y : Nat`,
`(x+y)^n = Σ_{k=0}^{n} C(n,k) · x^k · y^{n−k}` (`binomial-coefficient.md`). Proven by
induction on `n`: the base case is `(x+y)^0 = 1`, and the step is the binomial-sum
recurrence `binSum_succ` (which packages Pascal). -/
theorem binomial_theorem (n : Nat) :
    (x + y) ^ n = binSum x y n := by
  induction n with
  | zero =>
    show 1 = sum (binTerm x y 0) 1
    rw [sum_succ_front, sum_zero]
    show 1 = choose 0 0 * (x ^ 0 * y ^ (0 - 0))
    rw [choose_zero_right, Nat.pow_zero, Nat.pow_zero]
  | succ n ih =>
    rw [Nat.pow_succ, Nat.mul_comm ((x+y)^n) (x+y), ih, binSum_succ]

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
(`C(n+1,k+1) = C(n,k) + C(n,k+1)`) — together with the **binomial theorem** over `Nat`:
`(x+y)^n = Σ_{k=0}^n C(n,k) x^k y^{n−k}` (`binomial-coefficient.md`). The binomial
theorem is proven by induction on `n` using Pascal (via `binSum_succ`). -/
theorem pascal_and_binomial_theorem :
    (∀ n, choose n 0 = 1) ∧
    (∀ n, choose n n = 1) ∧
    (∀ n k, choose (n + 1) (k + 1) = choose n k + choose n (k + 1)) ∧
    (∀ (x y n : Nat), (x + y) ^ n = CSR.binSum x y n) :=
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

/-!
    # (H) The factorial–Pascal weld and prime capture in the central column
-/

/-- The Pascal-recurrence `choose` agrees with the factorial quotient, stated
multiplicatively: `C(n,k) · (k! · (n−k)!) = n!` for `k ≤ n`. -/
theorem choose_mul_factorial_mul_factorial :
    ∀ {n k : Nat}, k ≤ n →
      choose n k * (factorial k * factorial (n - k)) = factorial n := by
  intro n
  induction n with
  | zero =>
    intro k hk
    have hz : k = 0 := Nat.le_zero.mp hk
    subst hz
    rfl
  | succ n ih =>
    intro k hk
    match k with
    | 0 =>
      show 1 * (1 * factorial (n + 1)) = factorial (n + 1)
      rw [Nat.one_mul, Nat.one_mul]
    | k + 1 =>
      rcases Nat.lt_or_ge k n with hkn | hkn
      · -- interior column: Pascal splits, both halves rebuild `n!`
        have hsub : n + 1 - (k + 1) = n - k := by omega
        have hsplit : n - k = (n - (k + 1)) + 1 := by omega
        have hleft :
            choose n k * (factorial (k + 1) * factorial (n - k)) =
              (k + 1) * factorial n := by
          calc choose n k * (factorial (k + 1) * factorial (n - k))
              = choose n k * ((k + 1) * factorial k * factorial (n - k)) := by
                rw [factorial_succ]
            _ = choose n k * ((k + 1) * (factorial k * factorial (n - k))) := by
                rw [Nat.mul_assoc]
            _ = (k + 1) * (choose n k * (factorial k * factorial (n - k))) := by
                rw [Nat.mul_left_comm]
            _ = (k + 1) * factorial n := by rw [ih (Nat.le_of_lt hkn)]
        have hright :
            choose n (k + 1) * (factorial (k + 1) * factorial (n - k)) =
              (n - k) * factorial n := by
          calc choose n (k + 1) * (factorial (k + 1) * factorial (n - k))
              = choose n (k + 1) * (factorial (k + 1) *
                  ((n - k) * factorial (n - (k + 1)))) := by
                rw [hsplit, factorial_succ (n - (k + 1)), ← hsplit]
            _ = choose n (k + 1) * ((n - k) * (factorial (k + 1) *
                  factorial (n - (k + 1)))) := by
                rw [Nat.mul_left_comm (factorial (k + 1)) (n - k)]
            _ = (n - k) * (choose n (k + 1) * (factorial (k + 1) *
                  factorial (n - (k + 1)))) := by
                rw [Nat.mul_left_comm (choose n (k + 1)) (n - k)]
            _ = (n - k) * factorial n := by rw [ih hkn]
        calc choose (n + 1) (k + 1) *
            (factorial (k + 1) * factorial (n + 1 - (k + 1)))
            = (choose n k + choose n (k + 1)) *
                (factorial (k + 1) * factorial (n - k)) := by
              rw [choose_succ_succ, hsub]
          _ = choose n k * (factorial (k + 1) * factorial (n - k)) +
              choose n (k + 1) * (factorial (k + 1) * factorial (n - k)) := by
              rw [Nat.add_mul]
          _ = (k + 1) * factorial n + (n - k) * factorial n := by
              rw [hleft, hright]
          _ = (n + 1) * factorial n := by
              rw [← Nat.add_mul]
              congr 1
              omega
          _ = factorial (n + 1) := (factorial_succ n).symm
      · -- terminal column: `k = n`, both sides are `(n+1)!`
        have hkeq : k = n := by omega
        subst hkeq
        have hsub0 : k + 1 - (k + 1) = 0 := by omega
        rw [choose_self, hsub0]
        show 1 * (factorial (k + 1) * 1) = factorial (k + 1)
        rw [Nat.one_mul, Nat.mul_one]

/-- A prime at most `n` divides `n!`. -/
theorem Prime.dvd_factorial {p : Nat} (hp : Prime p) :
    ∀ {n : Nat}, p ≤ n → Dvd p (factorial n) := by
  intro n
  induction n with
  | zero =>
    intro h
    have h2 := hp.two_le
    exact absurd h (by omega)
  | succ n ih =>
    intro h
    rcases Nat.lt_or_ge n p with hlt | hle
    · have hpe : p = n + 1 := by omega
      refine ⟨factorial n, ?_⟩
      rw [factorial_succ, hpe]
    · obtain ⟨c, hc⟩ := ih hle
      refine ⟨(n + 1) * c, ?_⟩
      rw [factorial_succ, hc, Nat.mul_left_comm]

/-- A prime greater than `n` does not divide `n!`. -/
theorem Prime.not_dvd_factorial {p : Nat} (hp : Prime p) :
    ∀ {n : Nat}, n < p → ¬ Dvd p (factorial n) := by
  intro n
  induction n with
  | zero =>
    intro _ hdvd
    have hle := Nat.le_of_dvd (by omega) ((dvd_iff p 1).mp hdvd)
    have h2 := hp.two_le
    omega
  | succ n ih =>
    intro h hdvd
    rw [factorial_succ] at hdvd
    rcases hp.euclid hdvd with hhead | htail
    · have := Nat.le_of_dvd (by omega) ((dvd_iff p (n + 1)).mp hhead)
      omega
    · exact ih (by omega) htail

/-- **Prime capture in the central column.** A prime in the top half-interval
`(m+1, 2m+1]` divides the central entry `C(2m+1, m)` of the odd Pascal row:
it divides the numerator `(2m+1)!` once and misses both factorial cofactors. -/
theorem Prime.dvd_choose_central {p m : Nat} (hp : Prime p)
    (hlo : m + 1 < p) (hhi : p ≤ 2 * m + 1) :
    Dvd p (choose (2 * m + 1) m) := by
  have hm : m ≤ 2 * m + 1 := by omega
  have hid := choose_mul_factorial_mul_factorial hm
  have hsub : 2 * m + 1 - m = m + 1 := by omega
  rw [hsub] at hid
  have hnum : Dvd p (factorial (2 * m + 1)) := hp.dvd_factorial hhi
  rw [← hid] at hnum
  rcases hp.euclid hnum with hchoose | hcof
  · exact hchoose
  · rcases hp.euclid hcof with hlo' | hhi'
    · exact absurd hlo' (hp.not_dvd_factorial (by omega))
    · exact absurd hhi' (hp.not_dvd_factorial hlo)

/-- A prime dividing a product of naturals divides one of the factors
(Euclid's lemma iterated along the list). -/
theorem Prime.dvd_of_dvd_prod {p : Nat} (hp : Prime p) :
    ∀ {l : List Nat}, Dvd p l.prod → ∃ q ∈ l, Dvd p q := by
  intro l
  induction l with
  | nil =>
    intro hdvd
    exfalso
    have hle := Nat.le_of_dvd (by omega) ((dvd_iff p 1).mp hdvd)
    have h2 := hp.two_le
    omega
  | cons a l ih =>
    intro hdvd
    rw [List.prod_cons] at hdvd
    rcases hp.euclid hdvd with hhead | htail
    · exact ⟨a, List.mem_cons_self, hhead⟩
    · obtain ⟨q, hq, hpq⟩ := ih htail
      exact ⟨q, List.mem_cons_of_mem a hq, hpq⟩

/-- A prime dividing a prime equals it. -/
theorem Prime.eq_of_dvd_prime {p q : Nat} (hp : Prime p) (hq : Prime q)
    (h : Dvd p q) : p = q := by
  rcases hq.only_divisors p h with h1 | h1
  · have h2 := hp.two_le
    omega
  · exact h1

/-- **Distinct primes multiply into a common multiple.** A pairwise-distinct
list of primes, each dividing `N`, has product dividing `N`. -/
theorem prod_dvd_of_pairwise_primes_dvd :
    ∀ {l : List Nat}, l.Pairwise (· ≠ ·) → (∀ q ∈ l, Prime q) →
      ∀ {N : Nat}, (∀ q ∈ l, Dvd q N) → Dvd l.prod N := by
  intro l
  induction l with
  | nil =>
    intro _ _ N _
    exact one_dvd N
  | cons p l ih =>
    intro hdist hprime N hdvd
    have hp : Prime p := hprime p List.mem_cons_self
    have hpN : Dvd p N := hdvd p List.mem_cons_self
    have hlN : Dvd l.prod N :=
      ih hdist.of_cons
        (fun q hq => hprime q (List.mem_cons_of_mem p hq))
        (fun q hq => hdvd q (List.mem_cons_of_mem p hq))
    have hco : Coprime p l.prod := by
      have hnd : ¬ Dvd p l.prod := by
        intro hdp
        obtain ⟨q, hq, hpq⟩ := hp.dvd_of_dvd_prod hdp
        have hqprime : Prime q := hprime q (List.mem_cons_of_mem p hq)
        exact absurd (hp.eq_of_dvd_prime hqprime hpq)
          (List.rel_of_pairwise_cons hdist hq)
      exact hp.coprime_of_not_dvd hnd
    rw [List.prod_cons]
    exact (dvd_iff _ N).mpr
      (((coprime_iff p l.prod).mp hco).mul_dvd_of_dvd_of_dvd
        ((dvd_iff p N).mp hpN) ((dvd_iff l.prod N).mp hlN))

/-- **The top half-interval primorial embeds in Pascal's central column.**
Distinct primes in `(m+1, 2m+1]` have product dividing `C(2m+1, m)`. -/
theorem primes_top_interval_prod_dvd_choose_central {m : Nat} {l : List Nat}
    (hdist : l.Pairwise (· ≠ ·)) (hprime : ∀ q ∈ l, Prime q)
    (hrange : ∀ q ∈ l, m + 1 < q ∧ q ≤ 2 * m + 1) :
    Dvd l.prod (choose (2 * m + 1) m) :=
  prod_dvd_of_pairwise_primes_dvd hdist hprime
    (fun q hq =>
      (hprime q hq).dvd_choose_central (hrange q hq).1 (hrange q hq).2)

/-!
    # (I) The central column estimate: the row sum bounds the middle
-/

/-- The finite sum, `Nat`-typed: `natSum f m = Σ_{k=0}^{m-1} f k`. -/
def natSum (f : Nat → Nat) (m : Nat) : Nat :=
  CSR.sum f m

/-- Peeling the last summand off `natSum`. -/
theorem natSum_succ_back (f : Nat → Nat) (m : Nat) :
    natSum f (m + 1) = natSum f m + f m :=
  CSR.sum_succ_back m f

/-- The row sum of Pascal's triangle: `Σ_{k=0}^{n} C(n,k) = 2^n`, the binomial
theorem at `x = y = 1`. -/
theorem sum_choose (n : Nat) :
    natSum (fun k => choose n k) (n + 1) = 2 ^ n := by
  have hterm : ∀ k, CSR.binTerm 1 1 n k = choose n k := by
    intro k
    show choose n k * (1 ^ k * 1 ^ (n - k)) = choose n k
    simp
  have h1 : natSum (fun k => choose n k) (n + 1) = CSR.binSum 1 1 n :=
    (CSR.sum_congr (n + 1) hterm).symm
  have h2 : CSR.binSum 1 1 n = 2 ^ n := (CSR.binomial_theorem 1 1 n).symm
  rw [h1, h2]

/-- Every term is at most the whole row sum. -/
theorem le_natSum (f : Nat → Nat) :
    ∀ {m k : Nat}, k < m → f k ≤ natSum f m := by
  intro m
  induction m with
  | zero => intro k hk; exact absurd hk (Nat.not_lt_zero k)
  | succ m ih =>
    intro k hk
    rw [natSum_succ_back]
    rcases Nat.lt_or_ge k m with h | h
    · have := ih h
      omega
    · have hkm : k = m := by omega
      subst hkm
      omega

/-- Two adjacent terms together are at most the whole row sum. -/
theorem add_pair_le_natSum (f : Nat → Nat) :
    ∀ {m k : Nat}, k + 1 < m → f k + f (k + 1) ≤ natSum f m := by
  intro m
  induction m with
  | zero => intro k hk; exact absurd hk (Nat.not_lt_zero _)
  | succ m ih =>
    intro k hk
    rw [natSum_succ_back]
    rcases Nat.lt_or_ge (k + 1) m with h | h
    · have := ih h
      omega
    · have hkm : k + 1 = m := by omega
      rw [← hkm]
      have := le_natSum f (show k < k + 1 by omega)
      omega

/-- The Pascal-recurrence `choose` is positive on the triangle. -/
theorem choose_pos : ∀ {n k : Nat}, k ≤ n → 0 < choose n k := by
  intro n
  induction n with
  | zero =>
    intro k hk
    have hz : k = 0 := Nat.le_zero.mp hk
    subst hz
    exact Nat.one_pos
  | succ n ih =>
    intro k hk
    match k with
    | 0 =>
      rw [choose_zero_right]
      exact Nat.one_pos
    | k + 1 =>
      have hkn : k ≤ n := by omega
      rw [choose_succ_succ]
      have := ih hkn
      omega

/-- The two central entries of an odd Pascal row agree. -/
theorem choose_central_symm (m : Nat) :
    choose (2 * m + 1) m = choose (2 * m + 1) (m + 1) := by
  have h1 := choose_mul_factorial_mul_factorial
    (n := 2 * m + 1) (k := m) (by omega)
  have h2 := choose_mul_factorial_mul_factorial
    (n := 2 * m + 1) (k := m + 1) (by omega)
  have hs1 : 2 * m + 1 - m = m + 1 := by omega
  have hs2 : 2 * m + 1 - (m + 1) = m := by omega
  rw [hs1] at h1
  rw [hs2, Nat.mul_comm (factorial (m + 1)) (factorial m)] at h2
  exact Nat.eq_of_mul_eq_mul_right
    (Nat.mul_pos (factorial_pos m) (factorial_pos (m + 1)))
    (h1.trans h2.symm)

/-- The central entry of the odd row is at most the halved row sum:
`C(2m+1, m) ≤ 2^(2m)`. -/
theorem choose_central_le_two_pow (m : Nat) :
    choose (2 * m + 1) m ≤ 2 ^ (2 * m) := by
  have hrow := sum_choose (2 * m + 1)
  have hpair := add_pair_le_natSum
    (f := fun k => choose (2 * m + 1) k) (m := 2 * m + 1 + 1) (k := m)
    (by omega)
  rw [hrow, ← choose_central_symm] at hpair
  have hp : (2 : Nat) ^ (2 * m + 1) = 2 ^ (2 * m) * 2 := Nat.pow_succ 2 (2 * m)
  omega

/-- **The interval primorial estimate.** Distinct primes of `(m+1, 2m+1]` have
product at most `2^(2m)`: the product divides the central entry, which the row
sum bounds. -/
theorem primes_top_interval_prod_le {m : Nat} {l : List Nat}
    (hdist : l.Pairwise (· ≠ ·)) (hprime : ∀ q ∈ l, Prime q)
    (hrange : ∀ q ∈ l, m + 1 < q ∧ q ≤ 2 * m + 1) :
    l.prod ≤ 2 ^ (2 * m) :=
  Nat.le_trans
    (Nat.le_of_dvd (choose_pos (by omega))
      ((dvd_iff _ _).mp
        (primes_top_interval_prod_dvd_choose_central hdist hprime hrange)))
    (choose_central_le_two_pow m)

end NumberTheory
end Obsmetrologia
