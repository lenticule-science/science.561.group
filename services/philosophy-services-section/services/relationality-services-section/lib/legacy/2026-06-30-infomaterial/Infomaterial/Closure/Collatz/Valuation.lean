import Infomaterial.Closure.Collatz.AffineTrace

/-!
# The 2-adic valuation as saturating-projection depth

The corpus node `two-adic-valuation-is-saturating-depth` records (status: verified) that in the
Collatz orbit, immediately after an expansion `n ↦ 3n+1` (odd `n`) the orbit takes a maximal run
of halvings before the next odd value, and that run length is exactly `v₂(3n+1)`. Equivalently,
the full shortcut successor `(3n+1)/2^{v₂(3n+1)}` is odd: the expansion is followed by a complete
saturating-projection run.

This module captures the deterministic core of that claim without a dedicated valuation function:
every positive number factors as `2^k` times an odd number (`two_adic_factor`), and for odd `n`
the factorization of `3n+1` has `k ≥ 1` with an odd cofactor (`shortcut_odd_part`) — so the run
is nonempty and collapsing it lands on an odd number. The accelerated step peels exactly one
halving (`AffineTrace.step_odd_eq`: `2·step n = 3n+1`); the full shortcut peels the whole run.

The probabilistic layer — `v₂(3n+1)` is geometrically distributed (`P = 1/2^k`) over random odd
`n`, with the observed trajectory-autocorrelation excess — is empirical/measure-theoretic and is
left to the blueprint frontier, not formalized here.

## Main results

* `two_adic_factor` — every positive `N` is `2^k · (odd)`.
* `shortcut_odd_part` — for odd `n`, `3n+1 = 2^k · m` with `k ≥ 1` and `m` odd.

## Tags

collatz, 2-adic valuation, saturating projection, shortcut map
-/

namespace Infomaterial
namespace Closure
namespace Collatz

/-- Every positive number factors as a power of two times an odd number. -/
theorem two_adic_factor : ∀ N, 0 < N → ∃ k m, m % 2 = 1 ∧ N = 2 ^ k * m := by
  intro N
  induction N using Nat.strongRecOn with
  | ind N ih =>
    intro hN
    rcases (by omega : N % 2 = 0 ∨ N % 2 = 1) with he | ho
    · have hlt : N / 2 < N := by omega
      have hpos : 0 < N / 2 := by omega
      obtain ⟨k, m, hm, heq⟩ := ih (N / 2) hlt hpos
      refine ⟨k + 1, m, hm, ?_⟩
      have hN2 : N = 2 * (N / 2) := by omega
      rw [hN2, heq, Nat.pow_succ, ← Nat.mul_assoc, Nat.mul_comm 2 (2 ^ k)]
    · exact ⟨0, N, ho, by rw [Nat.pow_zero, Nat.one_mul]⟩

/-- For odd `n`, the expansion `3n+1` factors as `2^k · m` with a nonempty halving run
(`k ≥ 1`) and an odd cofactor `m` — the full shortcut successor. -/
theorem shortcut_odd_part {n : Nat} (hn : n % 2 = 1) :
    ∃ k m, 1 ≤ k ∧ m % 2 = 1 ∧ 3 * n + 1 = 2 ^ k * m := by
  obtain ⟨k, m, hm, heq⟩ := two_adic_factor (3 * n + 1) (by omega)
  refine ⟨k, m, ?_, hm, heq⟩
  rcases Nat.eq_zero_or_pos k with hk | hk
  · exfalso
    rw [hk, Nat.pow_zero, Nat.one_mul] at heq
    omega
  · exact hk

end Collatz
end Closure
end Infomaterial
