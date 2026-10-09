import Obsmetrologia.AperiodicOrder.Tiling.StepN.MetallicMean
import Obsmetrologia.Calculus.Real.Multiplication

/-!
# The metallic mean as a real eigenvalue

`MetallicMean` builds the integer engine — the recurrence `metallicNum` (`F`), the companion-matrix
bridge (`metallicMatrix_pow_succ`), and `metallicNum_pos`. `RealMultiplication` makes `RReal` a
commutative ring. This module joins them toward the analytic cap: the n-th metallic mean
`μ = (n + √(n²+4))/2` as a real, the larger root of `x² − nx − 1`.

The first certificate is the **Cassini determinant identity**: the substitution matrix has determinant
`−1`, so `det(Mᵏ) = (−1)ᵏ`, i.e.
`F_{k+2}·F_k − F_{k+1}² = (−1)^{k+1}` — magnitude exactly `1`. This is the integer witness that `μ` is a
**quadratic-irrational unit** and, decisively, that the convergent gaps are exactly
`|F_{k+1}/F_k − F_{k+2}/F_{k+1}| = 1/(F_k·F_{k+1})` — the explicit handle the Cauchy modulus of the
convergent sequence needs. It is the nonlinear integer identity that was out of reach until `iring`
(the dependency-free `Int` ring-normalizer) was in scope.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling.StepN

/-- The **Cassini value** `C k = F_{k+2}·F_k − F_{k+1}²` — the determinant of the `k`-th matrix power
`Mᵏ⁺¹`'s `[[F_{k+2},F_{k+1}],[F_{k+1},F_k]]` block, which is `(det M)^… = (−1)^{k+1}`. -/
def cassiniVal (n : Int) (k : Nat) : Int :=
  metallicNum n (k + 2) * metallicNum n k - metallicNum n (k + 1) * metallicNum n (k + 1)

/-- **The Cassini value flips sign each step:** `C (k+1) = −C k`. The determinant of `Mᵏ⁺²` is
`(det M)·det(Mᵏ⁺¹) = −det(Mᵏ⁺¹)`. Proved by substituting the recurrence and `iring`. -/
theorem cassini_step (n : Int) (k : Nat) : cassiniVal n (k + 1) = -(cassiniVal n k) := by
  unfold cassiniVal
  have h3 : metallicNum n (k + 1 + 2) = n * metallicNum n (k + 1 + 1) + metallicNum n (k + 1) := rfl
  have ha : metallicNum n (k + 1 + 1) = n * metallicNum n (k + 1) + metallicNum n k := rfl
  rw [h3, ha]; iring; omega

/-- **Base case:** `C 0 = F_2·F_0 − F_1² = n·0 − 1 = −1` (`det M = −1`). -/
theorem cassini_base (n : Int) : cassiniVal n 0 = -1 := by
  show metallicNum n 2 * 0 - 1 * 1 = -1
  iring

/-- **The Cassini identity, magnitude form:** `F_{k+2}·F_k − F_{k+1}² = ±1` for every `k` — the
substitution matrix's powers are unimodular. So `μ` is a quadratic-irrational *unit*, and the convergent
gaps have numerator of magnitude exactly `1`. -/
theorem metallic_cassini (n : Int) (k : Nat) :
    cassiniVal n k = 1 ∨ cassiniVal n k = -1 := by
  induction k with
  | zero => exact Or.inr (cassini_base n)
  | succ k ih =>
    rw [cassini_step]
    omega

/-- **The metallic counts grow at least linearly:** `(k : Int) ≤ F_{k+1}` for `n ≥ 1`. So `F_k → ∞`
and `1/(F_k·F_{k+1}) → 0` — the growth that makes the convergent sequence `F_{k+1}/F_k` Cauchy and the
eigenvalue exist as a real limit. A two-step window induction (`k ≤ F_{k+1}` and `k+1 ≤ F_{k+2}`). -/
theorem metallicNum_ge {n : Int} (hn : 1 ≤ n) : ∀ (k : Nat), (k : Int) ≤ metallicNum n (k + 1) := by
  have key : ∀ (k : Nat), (k : Int) ≤ metallicNum n (k + 1)
      ∧ ((k : Int) + 1) ≤ metallicNum n (k + 2) := by
    intro k
    induction k with
    | zero => exact ⟨by simp [metallicNum], by simpa [metallicNum] using hn⟩
    | succ k ih =>
        obtain ⟨h1, h2⟩ := ih
        have hpos1 : 1 ≤ metallicNum n (k + 1) := metallicNum_pos hn k
        have hpos2 : 1 ≤ metallicNum n (k + 2) := metallicNum_pos hn (k + 1)
        have hrec : metallicNum n (k + 1 + 2)
            = n * metallicNum n (k + 2) + metallicNum n (k + 1) := rfl
        have hnn : metallicNum n (k + 2) ≤ n * metallicNum n (k + 2) := by
          have := Int.mul_le_mul_of_nonneg_right hn (by omega : (0 : Int) ≤ metallicNum n (k + 2))
          simpa using this
        refine ⟨by exact_mod_cast h2, ?_⟩
        rw [hrec]
        have hcast : ((k + 1 : Nat) : Int) = (k : Int) + 1 := by exact_mod_cast rfl
        omega
  exact fun k => (key k).1

/-- **Positivity of the denominator** `0 < F_{k+1}` (for `n ≥ 1`), the form `conv` needs. -/
theorem metallicNum_den_pos {n : Int} (hn : 1 ≤ n) (k : Nat) : 0 < metallicNum n (k + 1) := by
  have := metallicNum_pos hn k; omega

/-- **The k-th convergent** `c_k = F_{k+2}/F_{k+1}` as a rational (denominator `F_{k+1} > 0`). Indexed
so the denominator is always positive: `c_0 = F_2/F_1 = n`, and `c_k → μ`. -/
def conv (n : Int) (hn : 1 ≤ n) (k : Nat) : Real.Internal.Rat :=
  Real.Internal.Rat.mk ⟨metallicNum n (k + 2), metallicNum n (k + 1), metallicNum_den_pos hn k⟩

open Real.Internal

/-- **The convergent gap is `cassiniVal/(F_{k+2}·F_{k+1})`.** `c_{k+1} − c_k =
(F_{k+3}F_{k+1} − F_{k+2}²)/(F_{k+2}F_{k+1})`, whose numerator is exactly `cassiniVal n (k+1) = ±1`. -/
theorem conv_diff (n : Int) (hn : 1 ≤ n) (k : Nat) :
    conv n hn (k + 1) - conv n hn k
      = Rat.mk ⟨cassiniVal n (k + 1), metallicNum n (k + 2) * metallicNum n (k + 1),
          Int.mul_pos (metallicNum_den_pos hn (k + 1)) (metallicNum_den_pos hn k)⟩ := by
  unfold conv
  rw [Rat.mk_sub]
  apply Rat.mk_eq.mpr
  unfold cassiniVal
  simp only [PreRat.add, PreRat.neg, PreRat.equiv]
  iring

/-- **The convergent gap has magnitude `1/(F_{k+2}·F_{k+1})`** — the numerator is the unimodular Cassini
value. This is the explicit step size the Cauchy modulus telescopes. -/
theorem abs_conv_diff (n : Int) (hn : 1 ≤ n) (k : Nat) :
    (conv n hn (k + 1) - conv n hn k).abs
      = Rat.mk ⟨1, metallicNum n (k + 2) * metallicNum n (k + 1),
          Int.mul_pos (metallicNum_den_pos hn (k + 1)) (metallicNum_den_pos hn k)⟩ := by
  rw [conv_diff, Real.Internal.Rat.abs_mk]
  apply Real.Internal.Rat.mk_eq.mpr
  simp only [Real.Internal.Rat.absPre, PreRat.equiv]
  rcases metallic_cassini n (k + 1) with h | h <;> rw [h] <;> rfl

/-- `1/d` as a rational, for `d > 0`. -/
def recip (d : Int) (hd : 0 < d) : Real.Internal.Rat := Real.Internal.Rat.mk ⟨1, d, hd⟩

/-- **Strict growth past the first step:** `F_{i+2} ≥ F_{i+1} + 1` for `i ≥ 1` (where `F_i ≥ 1`). This
is what makes the gap telescope; it fails only at `i = 0` for the golden mean (`F_1 = F_2 = 1`). -/
theorem metallicNum_strict {n : Int} (hn : 1 ≤ n) :
    ∀ i, 1 ≤ i → metallicNum n (i + 1) + 1 ≤ metallicNum n (i + 2)
  | (j + 1), _ => by
      have hFj : 1 ≤ metallicNum n (j + 1) := metallicNum_pos hn j
      have hrec : metallicNum n (j + 1 + 2)
          = n * metallicNum n (j + 1 + 1) + metallicNum n (j + 1) := rfl
      have hnn : metallicNum n (j + 1 + 1) ≤ n * metallicNum n (j + 1 + 1) := by
        have := Int.mul_le_mul_of_nonneg_right hn
          (by have := metallicNum_pos hn (j + 1); omega : (0 : Int) ≤ metallicNum n (j + 1 + 1))
        simpa using this
      rw [hrec]; omega

/-- **The per-step telescoping bound:** `|c_{i+1} − c_i| ≤ 1/F_{i+1} − 1/F_{i+2}` for `i ≥ 1`. The exact
gap `1/(F_{i+2}F_{i+1})` is dominated by the telescoping difference once `F_{i+2} − F_{i+1} ≥ 1`. -/
theorem gap_step_bound {n : Int} (hn : 1 ≤ n) (i : Nat) (hi : 1 ≤ i) :
    (conv n hn (i + 1) - conv n hn i).abs
      ≤ recip (metallicNum n (i + 1)) (metallicNum_den_pos hn i)
          - recip (metallicNum n (i + 2)) (metallicNum_den_pos hn (i + 1)) := by
  rw [abs_conv_diff]
  show Real.Internal.Rat.mk _ ≤ Real.Internal.Rat.mk _ - Real.Internal.Rat.mk _
  rw [Real.Internal.Rat.mk_sub, Real.Internal.Rat.mk_le]
  simp only [PreRat.add, PreRat.neg, PreRat.le]
  have hstrict := metallicNum_strict hn i hi
  have hp1 : 0 < metallicNum n (i + 1) := metallicNum_den_pos hn i
  have hp2 : 0 < metallicNum n (i + 2) := metallicNum_den_pos hn (i + 1)
  have hge1 : (1 : Int) ≤ metallicNum n (i + 2) - metallicNum n (i + 1) := by omega
  have hPnn : 0 ≤ metallicNum n (i + 2) * metallicNum n (i + 1) :=
    Int.mul_nonneg (Int.le_of_lt hp2) (Int.le_of_lt hp1)
  have hmul := Int.mul_le_mul_of_nonneg_right hge1 hPnn
  calc 1 * (metallicNum n (i + 1) * metallicNum n (i + 2))
      = 1 * (metallicNum n (i + 2) * metallicNum n (i + 1)) := by iring
    _ ≤ (metallicNum n (i + 2) - metallicNum n (i + 1))
          * (metallicNum n (i + 2) * metallicNum n (i + 1)) := hmul
    _ = (1 * metallicNum n (i + 2) + -1 * metallicNum n (i + 1))
          * (metallicNum n (i + 2) * metallicNum n (i + 1)) := by iring

/-- **The convergents are Cauchy (telescoped):** for `1 ≤ N ≤ p`,
`|c_p − c_N| ≤ 1/F_{N+1} − 1/F_{p+1} ≤ 1/F_{N+1}`. The per-step gaps telescope. -/
theorem conv_telescope {n : Int} (hn : 1 ≤ n) (N : Nat) (hN : 1 ≤ N) :
    ∀ d, (conv n hn (N + d) - conv n hn N).abs
      ≤ recip (metallicNum n (N + 1)) (metallicNum_den_pos hn N)
          - recip (metallicNum n (N + d + 1)) (metallicNum_den_pos hn (N + d)) := by
  intro d
  induction d with
  | zero =>
      simp only [Nat.add_zero]
      rw [Real.Internal.Rat.sub_self, Real.Internal.Rat.abs_zero, Real.Internal.Rat.sub_self]
      exact Real.Internal.Rat.le_refl 0
  | succ d ih =>
      show (conv n hn (N + d + 1) - conv n hn N).abs
          ≤ recip (metallicNum n (N + 1)) (metallicNum_den_pos hn N)
              - recip (metallicNum n (N + d + 1 + 1)) (metallicNum_den_pos hn (N + d + 1))
      have htri : (conv n hn (N + d + 1) - conv n hn N).abs
          ≤ (conv n hn (N + d + 1) - conv n hn (N + d)).abs
              + (conv n hn (N + d) - conv n hn N).abs :=
        Real.Internal.Rat.abs_sub_le _ _ _
      have hgap := gap_step_bound hn (N + d) (Nat.le_trans hN (Nat.le_add_right N d))
      have hsum := Real.Internal.Rat.add_le_add hgap ih
      refine Real.Internal.Rat.le_trans htri (Real.Internal.Rat.le_trans hsum ?_)
      rw [Real.Internal.Rat.add_comm, Real.Internal.Rat.sub_add_sub_cancel]
      exact Real.Internal.Rat.le_refl _

end AperiodicOrder.Tiling.StepN
end Obsmetrologia
