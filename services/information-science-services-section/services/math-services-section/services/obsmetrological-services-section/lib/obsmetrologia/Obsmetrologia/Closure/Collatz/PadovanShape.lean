import Obsmetrologia.Closure.Collatz.Reduction
/-!
# The settlement spiral: Padovan growth in the strict-finite regime

The **plastic number** `ρ ≈ 1.3247` (root of `x³ = x + 1`) is the **smallest Pisot number** — the
infimum of the Pisot spectrum, with no Pisot number strictly between `1` and `ρ`. So the **Padovan**
substitution (corpus `padovan-substitution-settling`, the canonical step-3 instance) is the
*slowest-growing* nontrivial primitive substitution: it sits at the minimum of the Pisot
accumulation hierarchy, one rung below Fibonacci's golden `φ ≈ 1.6180`. Its integer-sequence certificate is the
**Padovan/Perrin** recurrence `P(k) = P(k-2) + P(k-3)`, which skips the immediately-prior term — the
signature of minimal-Pisot inflation.

A substitution settling is **aperiodic** (`κ = ω₁`): the Padovan and Fibonacci settlings are in the
*same* regime (corpus `benchmark-3-padovan`: "Aperiodic regime, same as Fibonacci"). The Pisot
ordering `ρ < φ < τ_trib < … → 2` is a tower *within* the aperiodic regime indexed by step/alphabet
size, **not** a map across the four closure-ordinal regimes. (The `settlement-spiral` node's
regime→Pisot table — strict-finite↔ρ, Scott↔φ — is a `hacking/`-flagged, unproven, and mistaken
identification; it is *not* used here.)

The Collatz orbit *per seed* is a **strict-finite** settlement under the green descent
hypothesis (`κ` = stopping time; corpus `collatz-settlement`, formalized in
`Settlement.lean` as `reachedQuiesces_iff_reachesTerminal_of_all_fall_below`).
That is a *different* settling from the shortcut-**shape substitution system**, which is the
aperiodic step-3 object whose count `S_k` is conjectured to grow by `ρ` — correcting the prior
programme's failed golden/Fibonacci guess (`collatz-padovan-shape-law`). That identification
`S_k ∼ ρ^k` is an open prediction (a red blueprint node); it is *not* asserted here, and it is not
inferred from the per-orbit regime.

What this module proves is the **extremal inequality** grounding "ρ is the smallest Pisot, the
slowest growth": `padovan k ≤ fibSeq k` for every `k`. The plastic sequence is everywhere
dominated by the golden one — the integer, kernel-checkable certificate of `ρ < φ`.

## Main definitions
* `padovan` — the Padovan/Perrin sequence `P(k) = P(k-2) + P(k-3)`, `P 0 = P 1 = P 2 = 1`.
* `fibSeq` — the Fibonacci sequence in the `1,1,2,3,5,…` convention.

## Main results
* `padovan_rec`, `fibSeq_rec` — the defining recurrences as rewrite lemmas.
* `fibSeq_mono` — Fibonacci is monotone.
* `padovan_le_fibSeq` — **the extremal slow-growth certificate:** `padovan k ≤ fibSeq k` for all `k`.

## References
Corpus: `settlement-spiral`, `regime-pisot-tower`, `substitution-universality-theorem`,
`collatz-padovan-shape-law`, `critical-exponents-at-step-n-fixed-point`.

## Tags
collatz, padovan, plastic number, pisot, settlement spiral, strict-finite regime
-/

namespace Obsmetrologia.Closure.Collatz.PadovanShape

/-- The **Padovan/Perrin** sequence `P(k) = P(k-2) + P(k-3)` with `P 0 = P 1 = P 2 = 1`:
`1,1,1,2,2,3,4,5,7,9,12,16,…`. The integer-sequence certificate of the plastic number `ρ` (smallest Pisot) —
the recurrence *skips* the previous term, the minimal-Pisot signature. -/
def padovan : Nat → Nat
  | 0 => 1
  | 1 => 1
  | 2 => 1
  | (n + 3) => padovan (n + 1) + padovan n

/-- The **Fibonacci** sequence in the `1,1,2,3,5,8,…` convention (`F 0 = F 1 = 1`): the integer
projection of the golden ratio `φ`, the next Pisot number above the plastic `ρ`. -/
def fibSeq : Nat → Nat
  | 0 => 1
  | 1 => 1
  | (n + 2) => fibSeq (n + 1) + fibSeq n

@[simp] theorem padovan_rec (n : Nat) : padovan (n + 3) = padovan (n + 1) + padovan n := rfl

@[simp] theorem fibSeq_rec (n : Nat) : fibSeq (n + 2) = fibSeq (n + 1) + fibSeq n := rfl

/-- Fibonacci is positive. -/
theorem fibSeq_pos : ∀ n, 0 < fibSeq n
  | 0 => by decide
  | 1 => by decide
  | (n + 2) => by
      have := fibSeq_pos (n + 1)
      rw [fibSeq_rec]; omega

/-- Each Fibonacci term dominates its predecessor. -/
theorem fibSeq_le_succ : ∀ n, fibSeq n ≤ fibSeq (n + 1)
  | 0 => by decide
  | (n + 1) => by
      have := fibSeq_pos n
      rw [fibSeq_rec]; omega

/-- Fibonacci is monotone. -/
theorem fibSeq_mono {m n : Nat} (h : m ≤ n) : fibSeq m ≤ fibSeq n := by
  induction h with
  | refl => exact Nat.le_refl _
  | step _ ih => exact Nat.le_trans ih (fibSeq_le_succ _)

/-- **The extremal slow-growth certificate.** The plastic (Padovan) sequence is everywhere dominated
by the golden (Fibonacci) sequence: `padovan k ≤ fibSeq k` for all `k`. This is the integer,
kernel-checkable form of `ρ < φ` — the plastic number is the smallest Pisot, so Padovan is the
slowest-growing nontrivial primitive substitution, at the bottom of the Pisot growth-rate ordering
(`substitution-universality-theorem`: the Pisot order runs slowest-growing → fastest-growing). -/
theorem padovan_le_fibSeq : ∀ n, padovan n ≤ fibSeq n := by
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    match n with
    | 0 => decide
    | 1 => decide
    | 2 => decide
    | (m + 3) =>
        have h1 : padovan (m + 1) ≤ fibSeq (m + 1) := ih (m + 1) (by omega)
        have h0 : padovan m ≤ fibSeq m := ih m (by omega)
        have hstep : fibSeq (m + 2) ≤ fibSeq (m + 3) := fibSeq_le_succ (m + 2)
        have hsum : fibSeq (m + 1) + fibSeq m = fibSeq (m + 2) := (fibSeq_rec m).symm
        rw [padovan_rec]
        omega

end Obsmetrologia.Closure.Collatz.PadovanShape
