import Obsmetrologia.Closure.Collatz.AffineTrace

/-!
# The halving/transferring projections and the modular-frontier commuting claim

The blueprint (`thm:collatz-mod6-commute`, `settlement-reading/02-modular-frontier.tex`) states,
without a `\lean` tag: "the even branch is the saturating nucleus-projection `σ` (contraction),
the odd branch the transferring projection `Δ` (expansion); the two commute on residue classes
once the modulus is `lcm(2, 3-1) = 6`". This module formalizes `σ` and `Δ` exactly as the
corpus's `step` (`AffineTrace.lean`) already realizes them branchwise (`step_even_eq`,
`step_odd_eq`), then settles the commuting claim.

## The correction

Read literally — `∀ n, σ (Δ n) = Δ (σ n)` for the everywhere-defined arithmetic formulas
`σ n = n / 2`, `Δ n = (3 * n + 1) / 2` — the claim **does not typecheck as a domain-respecting
square** and **is not true at modulus 6**:

* `σ`'s proper domain is the even naturals, `Δ`'s the odd naturals (`AffineTrace.branch_even`,
  `branch_odd`). The branch-consistent composite `σ ∘ Δ` (realizing the parity word `[O, E]`,
  i.e. `parityWord n 2 = [Branch.O, Branch.E]`) needs `n` odd *and* `Δ n` even, which happens
  exactly on `n ≡ 1 (mod 4)`. The branch-consistent composite `Δ ∘ σ` (word `[E, O]`) needs `n`
  even *and* `σ n` odd, exactly `n ≡ 2 (mod 4)`. These domains are **disjoint** residue classes
  mod 4, so no single `n` ever puts both composites in their proper branch domain at once — the
  "commuting square" `σΔ = Δσ` has no shared point to commute at, read that way.
* Read as the raw, everywhere-defined `Nat`-division formulas (dropping the domain restriction,
  which is the only way the two sides become comparable at a common `n`), the honest closed form
  is `sigma_Delta_comm_iff_mod4` below: equality holds **exactly on `n ≡ 0` or `n ≡ 3 (mod 4)`**,
  a period-**4** phenomenon, not period 6. `mod6_does_not_determine_comm` exhibits `n = 1` and
  `n = 7` (both `≡ 1 mod 6`) with opposite truth values, so **no refinement at modulus 6 suffices**
  to determine the equality — the modulus that governs a length-2 parity word is `2^2 = 4`
  (`AffineTrace.trace_B_eq_two_pow_length`), matching the corpus's existing power-of-two moduli
  (`ResidueGap.parentM_eq_pow`), not the `lcm(2, 3 - 1)` arithmetic of the blueprint prose.

The closest faithful theorem to the blueprint's stated square is therefore
`sigma_Delta_comm_iff_mod4`, proved by finite case analysis on `n mod 4` in the same
`omega`/`decide` style as `ResidueGap.branch_mod` / `parityWord_mod`.

## Main results

* `sigma`, `Delta`                    — the halving and transferring projections.
* `sigma_eq_step_of_even`, `Delta_eq_step_of_odd` — they agree with `step` on their proper domain.
* `sigmaDelta_domain_iff`, `DeltaSigma_domain_iff` — the two branch-consistent composite domains,
  each pinned to a residue class mod 4.
* `sigma_Delta_not_forall_comm`        — the literal blueprint square fails at `n = 1`.
* `sigma_Delta_comm_iff_mod4`          — the exact correction: commutes iff `n % 4 ∈ {0, 3}`.
* `mod6_does_not_determine_comm`       — modulus 6 is witnessed insufficient (`n = 1, 7`).

## Tags

collatz, modular frontier, halving projection, transferring projection, commuting square
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-! ## The two projections -/

/-- The **halving (saturating nucleus) projection** `σ`, the even branch of `step`. -/
def sigma (n : Nat) : Nat := n / 2

/-- The **transferring projection** `Δ`, the odd branch of `step` (`(3n+1)/2`). -/
def Delta (n : Nat) : Nat := (3 * n + 1) / 2

/-- On an even input, `σ` agrees with `step`. -/
theorem sigma_eq_step_of_even {n : Nat} (h : n % 2 = 0) : sigma n = step n := by
  have hs := step_even_eq h
  unfold sigma; omega

/-- On an odd input, `Δ` agrees with `step`. -/
theorem Delta_eq_step_of_odd {n : Nat} (h : n % 2 ≠ 0) : Delta n = step n := by
  have hs := step_odd_eq h
  unfold Delta; omega

/-! ## The two branch-consistent composite domains, and why they are disjoint mod 4

`σ ∘ Δ` is a domain-respecting realization of the word `[Branch.O, Branch.E]` exactly when `n` is
odd (so `Δ n = step n`) and `Δ n` is even (so `σ (Δ n) = step (Δ n)`); dually for `Δ ∘ σ` and
`[Branch.E, Branch.O]`. -/

/-- The domain of the branch-consistent `σ ∘ Δ` composite (word `[O, E]`) is exactly `n ≡ 1
(mod 4)`. -/
theorem sigmaDelta_domain_iff (n : Nat) :
    (n % 2 = 1 ∧ Delta n % 2 = 0) ↔ n % 4 = 1 := by
  unfold Delta
  constructor
  · intro ⟨h1, h2⟩; omega
  · intro h; exact ⟨by omega, by omega⟩

/-- The domain of the branch-consistent `Δ ∘ σ` composite (word `[E, O]`) is exactly `n ≡ 2
(mod 4)`. -/
theorem DeltaSigma_domain_iff (n : Nat) :
    (n % 2 = 0 ∧ sigma n % 2 = 1) ↔ n % 4 = 2 := by
  unfold sigma
  constructor
  · intro ⟨h1, h2⟩; omega
  · intro h; exact ⟨by omega, by omega⟩

/-- **The two composite domains are disjoint.** No `n` ever puts both `σ ∘ Δ` and `Δ ∘ σ` in
their proper branch domain simultaneously — the literal "commuting square" has no point at which
both sides are branch-consistent instances of the accelerated map. This is the precise sense in
which the blueprint's square does not typecheck as a domain-respecting equality. -/
theorem sigmaDelta_composite_domains_disjoint (n : Nat) :
    ¬ ((n % 2 = 1 ∧ Delta n % 2 = 0) ∧ (n % 2 = 0 ∧ sigma n % 2 = 1)) := by
  unfold sigma Delta
  intro h
  omega

/-! ## The literal square, and its exact correction -/

/-- **The literal blueprint square fails.** Read as everywhere-defined `Nat`-division formulas,
`σ (Δ n) = Δ (σ n)` does not hold for all `n`: at `n = 1`, `σ (Δ 1) = σ 2 = 1` while
`Δ (σ 1) = Δ 0 = 0`. -/
theorem sigma_Delta_not_forall_comm : ¬ ∀ n : Nat, sigma (Delta n) = Delta (sigma n) := by
  intro h
  have h1 := h 1
  simp [sigma, Delta] at h1

/-- **The exact correction.** For the everywhere-defined formulas, `σ (Δ n) = Δ (σ n)` holds
exactly on the residue classes `n ≡ 0` and `n ≡ 3 (mod 4)` — a period-**4**, not period-6,
phenomenon. Proved by finite case analysis on `n mod 4` (`omega`, after splitting the remainder),
in the style of `ResidueGap.branch_mod` / `parityWord_mod`. -/
theorem sigma_Delta_comm_iff_mod4 (n : Nat) :
    sigma (Delta n) = Delta (sigma n) ↔ (n % 4 = 0 ∨ n % 4 = 3) := by
  unfold sigma Delta
  obtain ⟨q, r, hr, hn⟩ : ∃ q r, r < 4 ∧ n = 4 * q + r := ⟨n / 4, n % 4, by omega, by omega⟩
  subst hn
  rcases (show r = 0 ∨ r = 1 ∨ r = 2 ∨ r = 3 from by omega) with h | h | h | h <;>
    subst h <;> constructor <;> intro h <;> omega

/-- **Modulus 6 does not determine the commuting equality.** `n = 1` and `n = 7` agree mod 6, but
`σ (Δ 1) ≠ Δ (σ 1)` while `σ (Δ 7) = Δ (σ 7)`: no refinement at modulus 6 pins down the truth of
the equality, falsifying the blueprint's claimed modulus `lcm(2, 3 - 1) = 6`. The governing
modulus is `4 = 2^2` (`sigma_Delta_comm_iff_mod4`), matching the corpus's power-of-two moduli for
length-`2` parity words (`AffineTrace.trace_B_eq_two_pow_length`). -/
theorem mod6_does_not_determine_comm :
    ∃ n n' : Nat, n % 6 = n' % 6 ∧
      sigma (Delta n) = Delta (sigma n) ∧ sigma (Delta n') ≠ Delta (sigma n') :=
  ⟨7, 1, by decide, by decide, by decide⟩

end Collatz
end Closure
end Obsmetrologia
