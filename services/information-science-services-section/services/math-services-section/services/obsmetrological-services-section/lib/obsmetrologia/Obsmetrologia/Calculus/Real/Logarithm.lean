import Obsmetrologia.Calculus.Real.IVT

/-!
# `log_b` as a Bishop real, and entropy

The same construction that gave `√` (`Real.IVT`) gives `log`. For `√c` the approximation was
`⌊(k+1)√c⌋/(k+1)`, with `le_of_mul_self_le_mul_self` controlling the numerators. For `log_b N` it is
`⌊(k+1)·log_b N⌋/(k+1) = natLog b (N^(k+1)) / (k+1)` (since `b^(m/(k+1)) ≤ N ⟺ b^m ≤ N^(k+1)`), with
**power-monotonicity** (`Nat.pow_le_pow_iff_right`) in place of square-monotonicity. The denominator is
again linear, so the Cauchy modulus is `k`.

This is the "= information" half of the coloring memo: real logarithms turn entropy from a slogan into
theorems — `log₂ N` is the topological entropy of the full `N`-shift, `log₂(#colourings)/|V|` the
coloring entropy, `log₂ λ_PF` the inflation entropy.

This module first builds the **integer floor logarithm** `natLog` (defined here).
-/

namespace Obsmetrologia
namespace Real.Internal

/-- **`b^c ≤ b^(c+d)`** by induction on `d` (dependency-free; the core exponent-monotonicity lemmas
pull `Classical.choice`). -/
theorem pow_le_pow_exp {b : Nat} (hb : 1 ≤ b) (c : Nat) : ∀ d, b ^ c ≤ b ^ (c + d)
  | 0 => Nat.le_refl _
  | (d + 1) =>
      calc b ^ c ≤ b ^ (c + d) := pow_le_pow_exp hb c d
        _ ≤ b ^ (c + d) * b := Nat.le_mul_of_pos_right _ (by omega)
        _ = b ^ (c + d + 1) := (Nat.pow_succ b (c + d)).symm

/-- **`b^c < b^(c+d+1)`** (for `b ≥ 2`). -/
theorem pow_lt_pow_exp {b : Nat} (hb : 2 ≤ b) (c d : Nat) : b ^ c < b ^ (c + d + 1) := by
  have h1 : b ^ c ≤ b ^ (c + d) := pow_le_pow_exp (by omega) c d
  have hpos : 1 ≤ b ^ (c + d) := Nat.one_le_pow _ _ (by omega)
  have hge : b ^ (c + d) * 2 ≤ b ^ (c + d) * b := Nat.mul_le_mul_left _ hb
  rw [Nat.pow_succ]; omega

/-- **`n < b^(n+1)`** (for `b ≥ 2`) — fuel `n` always overshoots, so `natLog`'s floor is exact. -/
theorem lt_pow_succ {b : Nat} (hb : 2 ≤ b) : ∀ n, n < b ^ (n + 1)
  | 0 => by rw [Nat.pow_one]; omega
  | (n + 1) => by
      have ih := lt_pow_succ hb n
      have hge : b ^ (n + 1) * 2 ≤ b ^ (n + 1) * b := Nat.mul_le_mul_left _ hb
      have hpos : 1 ≤ b ^ (n + 1) := Nat.one_le_pow _ _ (by omega)
      rw [Nat.pow_succ]; omega

/-- **Power-monotone reflection:** `b^a ≤ b^c → a ≤ c` (for `b ≥ 2`) — the log analog of
`le_of_mul_self_le_mul_self`, controlling the `log` numerators. -/
theorem le_of_pow_le_pow {b a c : Nat} (hb : 2 ≤ b) (h : b ^ a ≤ b ^ c) : a ≤ c := by
  rcases Nat.lt_or_ge c a with hca | hac
  · exfalso
    obtain ⟨d, rfl⟩ : ∃ d, a = c + 1 + d := ⟨a - (c + 1), by omega⟩
    have hlt : b ^ c < b ^ (c + 1 + d) := by
      have h' := pow_lt_pow_exp hb c d
      rwa [show c + d + 1 = c + 1 + d from by omega] at h'
    omega
  · exact hac

/-- **Climbing floor logarithm** (division-free): the largest `e ≤ fuel` with `b^e ≤ n`. Structural
recursion on `fuel`, so it stays `Classical`-free (core `Nat` division does not). -/
def natLogFuel (b n : Nat) : Nat → Nat
  | 0 => 0
  | (e + 1) => if b ^ (e + 1) ≤ n then e + 1 else natLogFuel b n e

/-- **Floor logarithm** `⌊log_b n⌋` — fuel `n` always suffices (`log_b n ≤ n`). -/
def natLog (b n : Nat) : Nat := natLogFuel b n n

/-- `natLogFuel` lands at `e' ≤ fuel` with `b^e' ≤ n`, and is the true floor once the fuel reaches
above `n` (`n < b^(fuel+1)`). -/
theorem natLogFuel_spec (b : Nat) (hb : 2 ≤ b) (n : Nat) (hn : 1 ≤ n) :
    ∀ fuel, b ^ natLogFuel b n fuel ≤ n
      ∧ (n < b ^ (fuel + 1) → n < b ^ (natLogFuel b n fuel + 1))
  | 0 => by
      refine ⟨?_, ?_⟩
      · rw [natLogFuel, Nat.pow_zero]; omega
      · intro h; rw [natLogFuel]; exact h
  | (e + 1) => by
      rw [natLogFuel]
      by_cases h : b ^ (e + 1) ≤ n
      · rw [if_pos h]; exact ⟨h, fun hh => hh⟩
      · rw [if_neg h]
        obtain ⟨hle, hlt⟩ := natLogFuel_spec b hb n hn e
        exact ⟨hle, fun _ => hlt (by omega)⟩

/-- **Correctness of `natLog`:** `b^⌊log_b n⌋ ≤ n < b^(⌊log_b n⌋ + 1)`. -/
theorem natLog_spec (b : Nat) (hb : 2 ≤ b) (n : Nat) (hn : 1 ≤ n) :
    b ^ natLog b n ≤ n ∧ n < b ^ (natLog b n + 1) := by
  obtain ⟨hle, hlt⟩ := natLogFuel_spec b hb n hn n
  exact ⟨hle, hlt (lt_pow_succ hb n)⟩

/-- The **`k`-th rational under-approximation of `log_b N`**: `⌊log_b(N^(k+1))⌋ / (k+1) =
⌊(k+1)·log_b N⌋ / (k+1)`, within `1/(k+1)` of `log_b N`. -/
def logSeq (b N : Nat) (k : Nat) : Rat :=
  Rat.mk ⟨(natLog b (N ^ (k + 1)) : Int), (k : Int) + 1, by omega⟩

/-- **The numerator cross-bound:** `⌊(m+1)log_b N⌋·(n+1) ≤ (⌊(n+1)log_b N⌋+1)·(m+1)`. The integer heart
of the `log` Cauchy modulus — via `le_of_pow_le_pow` and power-monotonicity (the exact analog of
`sqrtSeq_num_le`, with `b^·` for `·²`). -/
theorem logSeq_num_le (b N : Nat) (hb : 2 ≤ b) (hN : 1 ≤ N) (m n : Nat) :
    natLog b (N ^ (m + 1)) * (n + 1) ≤ (natLog b (N ^ (n + 1)) + 1) * (m + 1) := by
  apply le_of_pow_le_pow hb
  rw [Nat.pow_mul, Nat.pow_mul]
  have hAm : b ^ natLog b (N ^ (m + 1)) ≤ N ^ (m + 1) :=
    (natLog_spec b hb (N ^ (m + 1)) (Nat.one_le_pow _ _ (by omega))).1
  have hBn : N ^ (n + 1) < b ^ (natLog b (N ^ (n + 1)) + 1) :=
    (natLog_spec b hb (N ^ (n + 1)) (Nat.one_le_pow _ _ (by omega))).2
  calc (b ^ natLog b (N ^ (m + 1))) ^ (n + 1)
      ≤ (N ^ (m + 1)) ^ (n + 1) := Nat.pow_le_pow_left hAm (n + 1)
    _ = (N ^ (n + 1)) ^ (m + 1) := by
        rw [← Nat.pow_mul, ← Nat.pow_mul, Nat.mul_comm (m + 1) (n + 1)]
    _ ≤ (b ^ (natLog b (N ^ (n + 1)) + 1)) ^ (m + 1) :=
        Nat.pow_le_pow_left (Nat.le_of_lt hBn) (m + 1)

/-- The `Rat` directional Cauchy bound `logSeq b N m ≤ logSeq b N n + 1/(n+1)`. -/
theorem logSeq_le_succ (b N : Nat) (hb : 2 ≤ b) (hN : 1 ≤ N) (m n : Nat) :
    logSeq b N m ≤ logSeq b N n + Rat.invNatP n := by
  unfold logSeq Rat.invNatP
  rw [Rat.mk_add, Rat.mk_le]
  show (natLog b (N ^ (m + 1)) : Int) * (((n : Int) + 1) * ((n : Int) + 1))
      ≤ ((natLog b (N ^ (n + 1)) : Int) * ((n : Int) + 1) + 1 * ((n : Int) + 1)) * ((m : Int) + 1)
  have hnum : (natLog b (N ^ (m + 1)) : Int) * ((n : Int) + 1)
      ≤ ((natLog b (N ^ (n + 1)) : Int) + 1) * ((m : Int) + 1) := by
    exact_mod_cast logSeq_num_le b N hb hN m n
  have hmul := Int.mul_le_mul_of_nonneg_right hnum (by omega : (0 : Int) ≤ (n : Int) + 1)
  calc (natLog b (N ^ (m + 1)) : Int) * (((n : Int) + 1) * ((n : Int) + 1))
      = ((natLog b (N ^ (m + 1)) : Int) * ((n : Int) + 1)) * ((n : Int) + 1) := by iring
    _ ≤ (((natLog b (N ^ (n + 1)) : Int) + 1) * ((m : Int) + 1)) * ((n : Int) + 1) := hmul
    _ = ((natLog b (N ^ (n + 1)) : Int) * ((n : Int) + 1) + 1 * ((n : Int) + 1))
          * ((m : Int) + 1) := by iring

/-- **`log_b N` as a Bishop real** — the floor-approximation sequence, regular Cauchy with modulus `k`
(directional bounds recombine via `abs_le_of_both`, exactly as for `√`). -/
def logReal (b N : Nat) (hb : 2 ≤ b) (hN : 1 ≤ N) : Real where
  seq := logSeq b N
  modulus := fun k => k
  cauchy := fun k m n hm hn => by
    have h1 : logSeq b N m - logSeq b N n ≤ Rat.invNatP k :=
      Rat.le_trans (Rat.le_sub_iff.mp (logSeq_le_succ b N hb hN m n)) (Rat.invNatP_le_of_ge hn)
    have h2 : -(logSeq b N m - logSeq b N n) ≤ Rat.invNatP k := by
      rw [Rat.neg_sub]
      exact Rat.le_trans (Rat.le_sub_iff.mp (logSeq_le_succ b N hb hN n m)) (Rat.invNatP_le_of_ge hm)
    exact Rat.abs_le_of_both h1 h2

/-- **`log_b N : ℝ`** — a reusable real logarithm. The "= information" half of the coloring memo: with
this, entropy (`log₂ N`, `log₂(#colourings)/|V|`, `log₂ λ_PF`) is a real number, not a slogan. -/
def logNat (b N : Nat) (hb : 2 ≤ b) (hN : 1 ≤ N) : RReal := RReal.mk (logReal b N hb hN)

/-- `⌊log_b (b^e)⌋ = e` (for `b ≥ 2`) — the floor logarithm is exact on powers. -/
theorem natLog_pow (b : Nat) (hb : 2 ≤ b) (e : Nat) : natLog b (b ^ e) = e := by
  obtain ⟨hle, hlt⟩ := natLog_spec b hb (b ^ e) (Nat.one_le_pow _ _ (by omega))
  have h1 : natLog b (b ^ e) ≤ e := le_of_pow_le_pow hb hle
  have h2 : e < natLog b (b ^ e) + 1 := by
    rcases Nat.lt_or_ge e (natLog b (b ^ e) + 1) with he | he
    · exact he
    · exact absurd hlt (Nat.not_lt.mpr (Nat.pow_le_pow_right (by omega) he))
  omega

/-- Each approximation of `log_b b` is exactly `1`: `logSeq b b k = (k+1)/(k+1) = 1`. -/
theorem logSeq_self (b : Nat) (hb : 2 ≤ b) (k : Nat) : logSeq b b k = 1 := by
  unfold logSeq
  rw [natLog_pow b hb (k + 1)]
  apply Rat.mk_eq.mpr
  show ((k + 1 : Nat) : Int) * 1 = 1 * ((k : Int) + 1)
  omega

/-- **`log_b b = 1`** as a real. With `b = 2`: the full binary shift has topological entropy
`log₂ 2 = 1` bit — entropy is now a theorem about an actual real number, the "= information" half of the
coloring memo made concrete. -/
theorem logNat_self (b : Nat) (hb : 2 ≤ b) : logNat b b hb (by omega) = RReal.ofRat 1 := by
  show RReal.mk (logReal b b hb (by omega)) = RReal.mk (Real.ofRat 1)
  apply RReal.mk_eq_of_seq_eq
  intro n
  show logSeq b b n = 1
  exact logSeq_self b hb n

/-! ## Entropy -/

/-- **Topological entropy of the full `N`-shift** (the unconstrained shift on `N` symbols): `log₂ N`.
The base of the coloring memo's information thread — entropy as an actual real number. -/
def fullShiftEntropy (N : Nat) (hN : 1 ≤ N) : RReal := logNat 2 N (by decide) hN

/-- **The full binary shift carries `1` bit of entropy** — `log₂ 2 = 1`, the unit of information. -/
theorem fullShiftEntropy_two : fullShiftEntropy 2 (by decide) = RReal.ofRat 1 :=
  logNat_self 2 (by decide)

/-! ## Monotonicity: more symbols ⟹ more entropy -/

/-- **Pointwise `≤` lifts to `ℝ`**: `(∀ n, a.seq n ≤ b.seq n) → mk a ≤ mk b`. -/
theorem mk_le_of_seq_le {a b : Real} (h : ∀ n, a.seq n ≤ b.seq n) : RReal.mk a ≤ RReal.mk b := by
  rw [RReal.mk_le]
  intro k
  exact ⟨0, fun n _ => Rat.le_trans (h n) (Rat.le_add_nonneg _ (Rat.invNatP_nonneg k))⟩

/-- **Power-monotone reflection, strict:** `b^a < b^c → a < c` (for `b ≥ 2`). -/
theorem lt_of_pow_lt_pow {b a c : Nat} (hb : 2 ≤ b) (h : b ^ a < b ^ c) : a < c := by
  rcases Nat.lt_or_ge a c with hac | hca
  · exact hac
  · obtain ⟨d, rfl⟩ : ∃ d, a = c + d := ⟨a - c, by omega⟩
    have := pow_le_pow_exp (by omega : 1 ≤ b) c d
    omega

/-- **`natLog` is monotone:** `m ≤ n → ⌊log_b m⌋ ≤ ⌊log_b n⌋`. -/
theorem natLog_mono (b : Nat) (hb : 2 ≤ b) {m n : Nat} (hm : 1 ≤ m) (hmn : m ≤ n) :
    natLog b m ≤ natLog b n := by
  obtain ⟨h1m, _⟩ := natLog_spec b hb m hm
  obtain ⟨_, h2n⟩ := natLog_spec b hb n (by omega)
  have hlt : b ^ natLog b m < b ^ (natLog b n + 1) := by omega
  have := lt_of_pow_lt_pow hb hlt
  omega

/-- `logSeq` is monotone in `N` at each level. -/
theorem logSeq_mono (b : Nat) (hb : 2 ≤ b) {M N : Nat} (hM : 1 ≤ M) (hMN : M ≤ N) (k : Nat) :
    logSeq b M k ≤ logSeq b N k := by
  unfold logSeq
  rw [Rat.mk_le]
  show (natLog b (M ^ (k + 1)) : Int) * ((k : Int) + 1)
      ≤ (natLog b (N ^ (k + 1)) : Int) * ((k : Int) + 1)
  have hlog : natLog b (M ^ (k + 1)) ≤ natLog b (N ^ (k + 1)) :=
    natLog_mono b hb (Nat.one_le_pow _ _ (by omega)) (Nat.pow_le_pow_left hMN (k + 1))
  have hc : (natLog b (M ^ (k + 1)) : Int) ≤ (natLog b (N ^ (k + 1)) : Int) := by exact_mod_cast hlog
  exact Int.mul_le_mul_of_nonneg_right hc (by omega)

/-- **More symbols ⟹ more entropy:** `M ≤ N → log_b M ≤ log_b N` as reals. -/
theorem logNat_mono (b : Nat) (hb : 2 ≤ b) {M N : Nat} (hM : 1 ≤ M) (hMN : M ≤ N) :
    logNat b M hb hM ≤ logNat b N hb (by omega) :=
  mk_le_of_seq_le (fun n => logSeq_mono b hb hM hMN n)

/-- **Entropy is monotone in the alphabet:** the full `M`-shift has no more entropy than the full
`N`-shift when `M ≤ N`. -/
theorem fullShiftEntropy_mono {M N : Nat} (hM : 1 ≤ M) (hMN : M ≤ N) :
    fullShiftEntropy M hM ≤ fullShiftEntropy N (by omega) :=
  logNat_mono 2 (by decide) hM hMN

/-! ## Additivity of entropy: `log_b(MN) = log_b M + log_b N` -/

/-- `b^e ≤ n → e ≤ ⌊log_b n⌋`. -/
theorem le_natLog {b n e : Nat} (hb : 2 ≤ b) (hn : 1 ≤ n) (h : b ^ e ≤ n) : e ≤ natLog b n := by
  obtain ⟨_, h2⟩ := natLog_spec b hb n hn
  have : b ^ e < b ^ (natLog b n + 1) := by omega
  have := lt_of_pow_lt_pow hb this; omega

/-- `n < b^(e+1) → ⌊log_b n⌋ ≤ e`. -/
theorem natLog_le {b n e : Nat} (hb : 2 ≤ b) (hn : 1 ≤ n) (h : n < b ^ (e + 1)) : natLog b n ≤ e := by
  obtain ⟨h1, _⟩ := natLog_spec b hb n hn
  have : b ^ natLog b n < b ^ (e + 1) := by omega
  have := lt_of_pow_lt_pow hb this; omega

/-- **`⌊log_b⌋ is additive up to 1**: `⌊log_b a⌋ + ⌊log_b c⌋ ≤ ⌊log_b (ac)⌋ ≤ ⌊log_b a⌋ + ⌊log_b c⌋ + 1`.
The floor's `±1` defect that vanishes in the real limit, giving exact additivity of `log`. -/
theorem natLog_mul_bounds {b a c : Nat} (hb : 2 ≤ b) (ha : 1 ≤ a) (hc : 1 ≤ c) :
    natLog b a + natLog b c ≤ natLog b (a * c)
      ∧ natLog b (a * c) ≤ natLog b a + natLog b c + 1 := by
  have hac : 1 ≤ a * c := by have := Nat.mul_le_mul ha hc; simpa using this
  obtain ⟨h1a, h2a⟩ := natLog_spec b hb a ha
  obtain ⟨h1c, h2c⟩ := natLog_spec b hb c hc
  refine ⟨?_, ?_⟩
  · apply le_natLog hb hac
    rw [Nat.pow_add]
    exact Nat.mul_le_mul h1a h1c
  · apply natLog_le hb hac
    have hlt : a * c < b ^ (natLog b a + 1) * b ^ (natLog b c + 1) :=
      Nat.mul_lt_mul'' h2a h2c
    rw [← Nat.pow_add] at hlt
    have heq : natLog b a + 1 + (natLog b c + 1) = natLog b a + natLog b c + 1 + 1 := by omega
    rwa [heq] at hlt

/-- `logSeq` of `M` plus `logSeq` of `N` over a common denominator `k+1`. -/
theorem logSeq_add (b M N k : Nat) :
    logSeq b M k + logSeq b N k
      = Rat.mk ⟨(natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int), (k : Int) + 1,
          by omega⟩ := by
  unfold logSeq
  rw [Rat.mk_add, Rat.mk_eq]
  show ((natLog b (M ^ (k + 1)) : Int) * ((k : Int) + 1)
        + (natLog b (N ^ (k + 1)) : Int) * ((k : Int) + 1)) * ((k : Int) + 1)
      = ((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int))
          * (((k : Int) + 1) * ((k : Int) + 1))
  iring

/-- **Entropy is additive — `log_b(MN) = log_b M + log_b N` as reals.** The floor's `±1` defect
(`natLog_mul_bounds`) is a null sequence `≤ 1/(k+1)`, so it vanishes in the limit and the real
logarithm is *exactly* additive. This is the extensivity of entropy: independent systems' information
adds. The defining functional equation of `log`, and the reason it is *the* information measure. -/
theorem logNat_mul (b M N : Nat) (hb : 2 ≤ b) (hM : 1 ≤ M) (hN : 1 ≤ N) :
    logNat b (M * N) hb (by have := Nat.mul_le_mul hM hN; simpa using this)
      = logNat b M hb hM + logNat b N hb hN := by
  unfold logNat
  rw [RReal.mk_add, RReal.mk_eq]
  intro j
  refine ⟨j, fun k hk => ?_⟩
  show Rat.abs (logSeq b (M * N) k - (logSeq b M k + logSeq b N k)) ≤ Rat.invNatP j
  rw [logSeq_add b M N k]
  have hA : 1 ≤ M ^ (k + 1) := Nat.one_le_pow _ _ (by omega)
  have hC : 1 ≤ N ^ (k + 1) := Nat.one_le_pow _ _ (by omega)
  obtain ⟨hlow, hupp⟩ := natLog_mul_bounds (a := M ^ (k + 1)) (c := N ^ (k + 1)) hb hA hC
  have hmulpow : (M * N) ^ (k + 1) = M ^ (k + 1) * N ^ (k + 1) := Nat.mul_pow M N (k + 1)
  refine Rat.le_trans ?_ (Rat.invNatP_le_of_ge hk)
  apply Rat.abs_le_of_both
  · -- logSeq(MN) − combined ≤ 1/(k+1)   (uses C ≤ A+B+1)
    unfold logSeq
    rw [hmulpow, Rat.mk_sub, Rat.invNatP, Rat.mk_le]
    show ((natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int) * ((k : Int) + 1)
          + -((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int)) * ((k : Int) + 1))
            * ((k : Int) + 1)
        ≤ 1 * (((k : Int) + 1) * ((k : Int) + 1))
    have hd : (natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int)
        - ((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int)) ≤ 1 := by
      have : (natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int)
          ≤ (natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int) + 1 := by exact_mod_cast hupp
      omega
    have hk0 : (0 : Int) ≤ ((k : Int) + 1) * ((k : Int) + 1) :=
      Int.mul_nonneg (by omega) (by omega)
    have hstep := Int.mul_le_mul_of_nonneg_right hd hk0
    calc ((natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int) * ((k : Int) + 1)
          + -((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int)) * ((k : Int) + 1))
            * ((k : Int) + 1)
        = ((natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int)
            - ((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int)))
            * (((k : Int) + 1) * ((k : Int) + 1)) := by iring
      _ ≤ 1 * (((k : Int) + 1) * ((k : Int) + 1)) := hstep
  · -- combined − logSeq(MN) ≤ 1/(k+1)   (uses A+B ≤ C, so this is ≤ 0)
    rw [Rat.neg_sub]
    unfold logSeq
    rw [hmulpow, Rat.mk_sub, Rat.invNatP, Rat.mk_le]
    show (((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int)) * ((k : Int) + 1)
          + -(natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int) * ((k : Int) + 1))
            * ((k : Int) + 1)
        ≤ 1 * (((k : Int) + 1) * ((k : Int) + 1))
    have hd : ((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int))
        - (natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int) ≤ 1 := by
      have : (natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int)
          ≤ (natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int) := by exact_mod_cast hlow
      omega
    have hk0 : (0 : Int) ≤ ((k : Int) + 1) * ((k : Int) + 1) :=
      Int.mul_nonneg (by omega) (by omega)
    have hstep := Int.mul_le_mul_of_nonneg_right hd hk0
    calc (((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int)) * ((k : Int) + 1)
          + -(natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int) * ((k : Int) + 1))
            * ((k : Int) + 1)
        = (((natLog b (M ^ (k + 1)) : Int) + (natLog b (N ^ (k + 1)) : Int))
            - (natLog b (M ^ (k + 1) * N ^ (k + 1)) : Int))
            * (((k : Int) + 1) * ((k : Int) + 1)) := by iring
      _ ≤ 1 * (((k : Int) + 1) * ((k : Int) + 1)) := hstep

/-! ## `log` of a positive rational `p/d` -/

/-- `-(a + b) = -b + -a` in the additive group `ℝ`. -/
theorem RReal.neg_add (a b : RReal) : -(a + b) = -b + -a := by
  have h : (a + b) + (-b + -a) = RReal.zero := by
    rw [RReal.add_assoc a b (-b + -a), ← RReal.add_assoc b (-b) (-a),
        RReal.add_right_neg b, RReal.zero_add, RReal.add_right_neg a]
  symm
  calc -b + -a
      = RReal.zero + (-b + -a) := (RReal.zero_add _).symm
    _ = (-(a + b) + (a + b)) + (-b + -a) := by rw [RReal.add_left_neg]
    _ = -(a + b) + ((a + b) + (-b + -a)) := RReal.add_assoc _ _ _
    _ = -(a + b) + RReal.zero := by rw [h]
    _ = -(a + b) := RReal.add_zero _

/-- **`log₂` of a positive rational `p/d`** (`p, d ≥ 1`): `log₂ p − log₂ d`, well-typed by the
additivity `logNat_mul`. The first step past `Nat`-valued arguments — `log₂(3/2)`, and the convergents
`log₂(F_{k+1}/F_k)` that bracket the golden inflation entropy `log₂ φ`, are now reals. -/
def logRatN (p d : Nat) (hp : 1 ≤ p) (hd : 1 ≤ d) : RReal :=
  logNat 2 p (by decide) hp + (- logNat 2 d (by decide) hd)

/-- **`log₂(p/d)` depends only on the ratio** — scaling numerator and denominator by `k ≥ 1` leaves it
fixed (`log₂(pk/dk) = log₂(p/d)`). This is the well-definedness of `log` on `ℚ`: the additivity
`logNat_mul` cancels the shared `log₂ k`. The rung from which `log` of a *real* (a limit of rationals)
is built. -/
theorem logRatN_scale (p d k : Nat) (hp : 1 ≤ p) (hd : 1 ≤ d) (hk : 1 ≤ k) :
    logRatN p d hp hd
      = logRatN (p * k) (d * k)
          (by have := Nat.mul_le_mul hp hk; simpa using this)
          (by have := Nat.mul_le_mul hd hk; simpa using this) := by
  unfold logRatN
  rw [logNat_mul 2 p k (by decide) hp hk, logNat_mul 2 d k (by decide) hd hk,
      RReal.neg_add (logNat 2 d (by decide) hd) (logNat 2 k (by decide) hk),
      RReal.add_assoc, ← RReal.add_assoc (logNat 2 k (by decide) hk),
      RReal.add_right_neg, RReal.zero_add]

/-- **`log₂(p/p) = 0`** — the rational `1` has zero information, `log₂ 1 = 0`. -/
theorem logRatN_self (p : Nat) (hp : 1 ≤ p) : logRatN p p hp hp = RReal.zero := by
  unfold logRatN
  exact RReal.add_right_neg _

/-- `a + b' ≤ a' + b → a − b ≤ a' − b'` (the cross-form of subtraction monotonicity in `ℝ`). -/
theorem RReal.add_neg_le_add_neg {a b a' b' : RReal} (h : a + b' ≤ a' + b) :
    a + -b ≤ a' + -b' := by
  have key := RReal.add_le_add_right h (-b + -b')
  have e1 : (a + b') + (-b + -b') = a + -b := by
    rw [RReal.add_assoc, RReal.add_comm (-b) (-b'), ← RReal.add_assoc b' (-b') (-b),
        RReal.add_right_neg, RReal.zero_add]
  have e2 : (a' + b) + (-b + -b') = a' + -b' := by
    rw [RReal.add_assoc, ← RReal.add_assoc b (-b) (-b'), RReal.add_right_neg, RReal.zero_add]
  rw [e1, e2] at key
  exact key

/-- **`log₂` is monotone on `ℚ`**: `p/d ≤ p'/d'` (cross-multiplied `p·d' ≤ p'·d`) gives
`log₂(p/d) ≤ log₂(p'/d')`. Additivity turns the cross-product into a `Nat`-argument comparison, closed
by `logNat_mono`. This is the property that makes the golden convergents `F_{k+1}/F_k` **squeeze**
`log₂ φ` from both sides — the monotone bracketing the limit construction rests on. -/
theorem logRatN_mono (p d p' d' : Nat) (hp : 1 ≤ p) (hd : 1 ≤ d) (hp' : 1 ≤ p') (hd' : 1 ≤ d')
    (h : p * d' ≤ p' * d) : logRatN p d hp hd ≤ logRatN p' d' hp' hd' := by
  unfold logRatN
  apply RReal.add_neg_le_add_neg
  rw [← logNat_mul 2 p d' (by decide) hp hd', ← logNat_mul 2 p' d (by decide) hp' hd]
  exact logNat_mono 2 (by decide) (by have := Nat.mul_le_mul hp hd'; simpa using this) h

/-! ## The golden inflation entropy `log₂ φ`, bracketed by convergents -/

/-- Lower convergents climb: `log₂(3/2) ≤ log₂(8/5)` (`3/2 ≤ 8/5`, i.e. `15 ≤ 16`). -/
theorem golden_log_lower :
    logRatN 3 2 (by decide) (by decide) ≤ logRatN 8 5 (by decide) (by decide) :=
  logRatN_mono 3 2 8 5 (by decide) (by decide) (by decide) (by decide) (by decide)

/-- The two convergent families meet around `φ`: `log₂(8/5) ≤ log₂(13/8)` (`8/5 ≤ 13/8`, i.e.
`64 ≤ 65`). The narrow interval `[8/5, 13/8]` (ratio-width `65/64`) brackets `φ`. -/
theorem golden_log_mid :
    logRatN 8 5 (by decide) (by decide) ≤ logRatN 13 8 (by decide) (by decide) :=
  logRatN_mono 8 5 13 8 (by decide) (by decide) (by decide) (by decide) (by decide)

/-- Upper convergents descend: `log₂(13/8) ≤ log₂(5/3)` (`13/8 ≤ 5/3`, i.e. `39 ≤ 40`). -/
theorem golden_log_upper :
    logRatN 13 8 (by decide) (by decide) ≤ logRatN 5 3 (by decide) (by decide) :=
  logRatN_mono 13 8 5 3 (by decide) (by decide) (by decide) (by decide) (by decide)

/-- **The golden inflation entropy `log₂ φ` is pinned to a real interval.** The Fibonacci convergents
nest around `φ = (1+√5)/2` as `3/2 ≤ 8/5 ≤ φ ≤ 13/8 ≤ 5/3`, and `logRatN_mono` carries the nesting to
`log₂`: the chain `log₂(3/2) ≤ log₂(8/5) ≤ log₂(13/8) ≤ log₂(5/3)` traps the inflation entropy in the
shrinking inner bracket `[log₂(8/5), log₂(13/8)]`. The single real these convergent-logarithms converge
to *is* `log₂ φ ≈ 0.694`; constructing it as one Bishop real (the diagonal limit) needs the
`log`-Lipschitz modulus — the bracket is what the limit settles into. -/
theorem golden_log_nested :
    logRatN 3 2 (by decide) (by decide) ≤ logRatN 8 5 (by decide) (by decide)
      ∧ logRatN 8 5 (by decide) (by decide) ≤ logRatN 13 8 (by decide) (by decide)
      ∧ logRatN 13 8 (by decide) (by decide) ≤ logRatN 5 3 (by decide) (by decide) :=
  ⟨golden_log_lower, golden_log_mid, golden_log_upper⟩

/-! ## Toward `log₂ φ` as a single real: the power law and the Lipschitz modulus core -/

/-- **The log power law (successor form)**: `log₂(Nᵉ⁺¹) = log₂(Nᵉ) + log₂ N`. A one-step corollary of
additivity (`logNat_mul`), since `Nᵉ⁺¹ = Nᵉ·N`. Iterated, `log₂(Nᵉ) = e·log₂ N` — the companion of the
additivity law, and the rung that turns a `Nat`-power bound into a real-log bound. -/
theorem logNat_pow_succ (N e : Nat) (hN : 1 ≤ N) :
    logNat 2 (N ^ (e + 1)) (by decide) (Nat.one_le_pow _ _ (by omega))
      = logNat 2 (N ^ e) (by decide) (Nat.one_le_pow _ _ (by omega)) + logNat 2 N (by decide) hN :=
  logNat_mul 2 (N ^ e) N (by decide) (Nat.one_le_pow _ _ (by omega)) hN

/-- The inductive step of the Bernoulli bound, factored through `a = Mⁿ`. -/
theorem bernoulli_step (M n a : Nat) (h : 2 * n ≤ M) :
    (M + 1) * (M * a + 2 * n * a) ≤ M * (M * a) + 2 * (n + 1) * (M * a) := by
  have e1 : (M + 1) * (M * a + 2 * n * a) = (M + 1) * (M + 2 * n) * a := by
    rw [Nat.mul_assoc (M + 1) (M + 2 * n) a, Nat.add_mul M (2 * n) a]
  have e2 : M * (M * a) + 2 * (n + 1) * (M * a) = (M * M + 2 * (n + 1) * M) * a := by
    rw [Nat.add_mul (M * M) (2 * (n + 1) * M) a, Nat.mul_assoc M M a,
        Nat.mul_assoc (2 * (n + 1)) M a]
  rw [e1, e2]
  apply Nat.mul_le_mul_right
  have hp1 : (M + 1) * (M + 2 * n) = M * M + M * (2 * n) + (M + 2 * n) := by
    rw [Nat.add_mul, Nat.one_mul, Nat.mul_add]
  have hp2 : 2 * (n + 1) * M = 2 * n * M + 2 * M := by rw [Nat.mul_succ, Nat.add_mul]
  have hcomm : M * (2 * n) = 2 * n * M := Nat.mul_comm _ _
  omega

/-- **Bernoulli bound** `(M+1)ⁿ ≤ 2·Mⁿ` whenever `2n ≤ M`. The arithmetic heart of the `log`-Lipschitz
modulus: it says `log₂((M+1)/M) ≤ 1/n` once `M` is large, which is what makes the golden convergent
logarithms a *regular* Cauchy sequence — the input `real_completeness` needs to settle them to the single
real `log₂ φ`. Proved by induction via `bernoulli_step`, then cancelling one `M`. -/
theorem pow_succ_le_two_mul_pow (M : Nat) :
    ∀ n, 2 * n ≤ M → (M + 1) ^ n ≤ 2 * M ^ n := by
  have aux : ∀ n, 2 * n ≤ M → M * (M + 1) ^ n ≤ M ^ (n + 1) + 2 * n * M ^ n := by
    intro n
    induction n with
    | zero => intro _; simp
    | succ n ih =>
        intro h
        have hih := ih (by omega)
        have hstep := bernoulli_step M n (M ^ n) (by omega)
        have hpow1 : M * M ^ n = M ^ (n + 1) := by rw [Nat.pow_succ, Nat.mul_comm]
        calc M * (M + 1) ^ (n + 1)
            = (M + 1) * (M * (M + 1) ^ n) := by
                rw [Nat.pow_succ, Nat.mul_comm ((M + 1) ^ n) (M + 1), ← Nat.mul_assoc,
                    Nat.mul_comm M (M + 1), Nat.mul_assoc]
          _ ≤ (M + 1) * (M ^ (n + 1) + 2 * n * M ^ n) := Nat.mul_le_mul_left _ hih
          _ = (M + 1) * (M * M ^ n + 2 * n * M ^ n) := by rw [hpow1]
          _ ≤ M * (M * M ^ n) + 2 * (n + 1) * (M * M ^ n) := hstep
          _ = M ^ (n + 1 + 1) + 2 * (n + 1) * M ^ (n + 1) := by
                rw [hpow1, Nat.pow_succ M (n + 1), Nat.mul_comm (M ^ (n + 1)) M]
  intro n hn
  rcases Nat.eq_zero_or_pos M with hM | hM
  · have : n = 0 := by omega
    subst this; simp
  · have h := aux n hn
    have hpow1 : M ^ (n + 1) = M * M ^ n := by rw [Nat.pow_succ, Nat.mul_comm]
    rw [hpow1] at h
    have key : 2 * n * M ^ n ≤ M * M ^ n := Nat.mul_le_mul_right _ hn
    have heq : M * (2 * M ^ n) = M * M ^ n + M * M ^ n := by
      rw [← Nat.mul_assoc M 2 (M ^ n), Nat.mul_comm M 2, Nat.mul_assoc 2 M (M ^ n), Nat.two_mul]
    have hle : M * (M + 1) ^ n ≤ M * (2 * M ^ n) := by omega
    exact Nat.le_of_mul_le_mul_left hle hM

/-- `log₂ 2 = 1` at the proof-arguments used below. -/
theorem logNat_two_eq : logNat 2 2 (by decide) (by decide) = RReal.ofRat 1 :=
  logNat_self 2 (by decide)

/-- **The power-level log-Lipschitz bound** (`(k+1)·log₂((M+1)/M) ≤ 1`, before dividing). When
`2(k+1) ≤ M`, the Bernoulli bound `(M+1)^(k+1) ≤ 2·M^(k+1)` becomes, under `log₂`,
`log₂((M+1)^(k+1)) ≤ 1 + log₂(M^(k+1))` — additivity turns the factor of `2` into the `+1`. Since the
left side is `(k+1)·log₂(M+1)` and the right `1 + (k+1)·log₂ M` (power law), this *is*
`(k+1)·log₂((M+1)/M) ≤ 1`. Dividing by `(k+1)` (the remaining step, needing scalar cancellation in `ℝ`)
gives `log₂((M+1)/M) ≤ 1/(k+1)` — the modulus that makes the golden convergent-logs regular Cauchy. -/
theorem logNat_pow_bernoulli (M k : Nat) (h : 2 * (k + 1) ≤ M) :
    logNat 2 ((M + 1) ^ (k + 1)) (by decide) (Nat.one_le_pow _ _ (by omega))
      ≤ RReal.ofRat 1
          + logNat 2 (M ^ (k + 1)) (by decide) (Nat.one_le_pow _ _ (by omega)) := by
  have hb : (M + 1) ^ (k + 1) ≤ 2 * M ^ (k + 1) := pow_succ_le_two_mul_pow M (k + 1) h
  calc logNat 2 ((M + 1) ^ (k + 1)) (by decide) (Nat.one_le_pow _ _ (by omega))
      ≤ logNat 2 (2 * M ^ (k + 1)) (by decide)
          (by have := Nat.one_le_pow (k + 1) M (by omega); omega) :=
        logNat_mono 2 (by decide) (Nat.one_le_pow _ _ (by omega)) hb
    _ = logNat 2 2 (by decide) (by decide)
          + logNat 2 (M ^ (k + 1)) (by decide) (Nat.one_le_pow _ _ (by omega)) :=
        logNat_mul 2 2 (M ^ (k + 1)) (by decide) (by decide) (Nat.one_le_pow _ _ (by omega))
    _ = RReal.ofRat 1 + logNat 2 (M ^ (k + 1)) (by decide) (Nat.one_le_pow _ _ (by omega)) := by
        rw [logNat_two_eq]

end Real.Internal
end Obsmetrologia
