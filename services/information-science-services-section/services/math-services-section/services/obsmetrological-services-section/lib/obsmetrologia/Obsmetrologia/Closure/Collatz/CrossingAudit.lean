import Obsmetrologia.Closure.Collatz.Reduction

/-!
# Collatz crossing audit: a wide, near-linear kernel sweep

`Reduction.lean` records the crossing/no-stream frontier — `EveryNonterminalContracts`
(equivalently `NoPositiveInfiniteBarrierStream`, `EveryNonterminalHasCrossing`) —
as **open**, and gives it a first finite, kernel-checked witness,
`everyNonterminalContracts_below`, covering `2 < n < auditBound = 500` via `decide` on
the `Prop`-level bounded existential directly. That direct approach recomputes
`parityWord n k`/`traceOfWord (parityWord n k)` from scratch for each candidate `k`, an
`O(depth)` recomputation repeated `O(depth)` times per seed, i.e. `O(depth^2)` kernel work
per `n` — the reason `auditBound` stops at `500`.

This module supersedes `everyNonterminalContracts_below` **in range only**, leaving it and
`auditBound`/`auditSearchDepth` untouched. It replaces the `O(depth^2)`-per-seed `Prop`
sweep with a `Bool`-valued, tail-recursive verifier (`crossingBool`/`crossingSweep`) that
carries the running trace coefficients `(A, B)` forward one letter at a time — `O(1)` work
per step, `O(depth)` per seed, `O(bound · depth)` total — matching the `parityWord`/
`traceOfWord`/`CoeffContracting` semantics of `Reduction.lean` exactly, proved sound once
(`crossingSweep_sound`), and then invoked with `decide` **only** on the resulting `Bool`
equality, so the kernel evaluates a linear Nat/Bool computation rather than re-deriving a
`Decidable`-instance proof term at every candidate depth.

Everything here is checked by the Lean kernel's own `decide` — never `native_decide` — and
depends on no axiom beyond `propext`/`Quot.sound` (indeed the audit itself needs neither: it
is a closed `Bool` computation).

## Main definitions

* `crossingBool` — the tail-recursive `(seed, A, B, fuel) → Bool` core: advances one
  parity letter per call, reporting `true` as soon as the running trace contracts.
* `crossingVerify` — `crossingBool` seeded from the identity trace, matching `k = 0`.
* `crossingSweepFrom` / `crossingSweep` — the `Bool` sweep of `crossingVerify` across a
  contiguous range of seeds.
* `crossingAuditBound`, `crossingAuditDepth` — the audited range and search depth,
  chosen to comfortably supersede `auditBound = 500` from `Reduction.lean`.

## Main results

* `crossingBool_sound` — the core recursion's soundness: a running-coefficient-faithful
  `true` report yields an actual `CoeffContracting` prefix witness.
* `crossingVerify_sound`, `crossingSweep_sound` — soundness lifted through the seeding
  and the range sweep.
* `crossingSweep_holds` — the kernel-decided `Bool` fact for the audited range.
* `everyNonterminalContracts_below_wide` — the audit exposed in the exact shape of
  `EveryNonterminalContracts` restricted to `n < crossingAuditBound`, superseding
  `everyNonterminalContracts_below` in range.

## Tags

collatz, coefficient crossing, audit, decide, tail recursion
-/

namespace Obsmetrologia
namespace Closure
namespace Collatz

/-! ## The tail-recursive `Bool` verifier -/

/-- The core recursive step of the crossing verifier: `n` is the current orbit value,
`a`/`b` are the running trace coefficients (mirroring `(traceOfWord _).A`/`.B` of the
prefix already read), and `fuel` bounds how many further letters may be examined. No
`List` is ever built — a single `Nat`/`Bool` step per letter, so the kernel cost is
linear in `fuel`, matching `traceStep`'s per-letter update (`E` fixes `A`, doubles `B`;
`O` triples `A`, doubles `B`) without the `C`-offset, which `CoeffContracting` never
inspects. -/
def crossingBool : Nat → Nat → Nat → Nat → Bool
  | _, _, _, 0 => false
  | n, a, b, fuel + 1 =>
      if a < b then true
      else if n % 2 = 0 then crossingBool (n / 2) a (2 * b) fuel
      else crossingBool ((3 * n + 1) / 2) (3 * a) (2 * b) fuel

@[simp] theorem crossingBool_zero (n a b : Nat) : crossingBool n a b 0 = false := rfl

theorem crossingBool_succ (n a b fuel : Nat) :
    crossingBool n a b (fuel + 1) =
      (if a < b then true
        else if n % 2 = 0 then crossingBool (n / 2) a (2 * b) fuel
        else crossingBool ((3 * n + 1) / 2) (3 * a) (2 * b) fuel) := rfl

/-- The verifier at a fresh seed: start the recursion from the identity trace's
coefficients (`A = B = 1`, matching `identityTrace`/`parityWord n 0`), searching to
depth `depth`. -/
def crossingVerify (n depth : Nat) : Bool := crossingBool n 1 1 depth

/-! ## A parity-word snoc lemma

`parityWord` is defined by prepending the current branch (`parityWord n (k+1) = branch n
:: parityWord (step n) k`); the verifier's soundness proof instead needs the *appended*
form, one step past a prefix already read. This is the same split `parityWord_append`
realizes in `CanonicalBarrierSeed.lean`, specialized to a single trailing letter and
reproved locally to keep this module's import footprint to `Reduction.lean` alone. -/
theorem parityWord_snoc (k : Nat) : ∀ n : Nat,
    parityWord n (k + 1) = parityWord n k ++ [branch (orbit n k)] := by
  induction k with
  | zero => intro n; simp [orbit_zero]
  | succ k ih =>
      intro n
      rw [parityWord_succ, ih (step n), parityWord_succ, orbit_step, List.cons_append]

/-! ## Soundness of the core recursion -/

/-- **Soundness of `crossingBool`.** If the running coefficients `a`/`b` faithfully
record the trace of the parity word already read from seed `n0` over `j` letters
(`a = A`, `b = B` of `parityWord n0 j`), and the verifier reports `true` from the
current orbit position `orbit n0 j`, then some finite extension of that prefix is
`CoeffContracting` — exactly the existential `Reduction.lean`'s crossing frontier
targets, with no depth bound carried into the conclusion. -/
theorem crossingBool_sound (fuel : Nat) : ∀ (j n0 a b : Nat),
    a = (traceOfWord (parityWord n0 j)).A →
    b = (traceOfWord (parityWord n0 j)).B →
    crossingBool (orbit n0 j) a b fuel = true →
    ∃ k, CoeffContracting (parityWord n0 (j + k)) := by
  induction fuel with
  | zero => intro j n0 a b _ _ h; simp [crossingBool_zero] at h
  | succ fuel ih =>
      intro j n0 a b ha hb h
      rw [crossingBool_succ] at h
      by_cases hlt : a < b
      · refine ⟨0, ?_⟩
        rw [Nat.add_zero]
        show (traceOfWord (parityWord n0 j)).A < (traceOfWord (parityWord n0 j)).B
        rw [← ha, ← hb]
        exact hlt
      · rw [if_neg hlt] at h
        by_cases he : orbit n0 j % 2 = 0
        · rw [if_pos he] at h
          have horbit : orbit n0 (j + 1) = orbit n0 j / 2 := by
            rw [orbit_succ]; unfold step; rw [if_pos he]
          have hword : parityWord n0 (j + 1) = parityWord n0 j ++ [Branch.E] := by
            rw [parityWord_snoc j n0, branch_even he]
          have ha' : a = (traceOfWord (parityWord n0 (j + 1))).A := by
            rw [hword, trace_append_E]
            show a = (traceStep (traceOfWord (parityWord n0 j)) Branch.E).A
            simp [traceStep, ← ha]
          have hb' : 2 * b = (traceOfWord (parityWord n0 (j + 1))).B := by
            rw [hword, trace_append_E]
            show 2 * b = (traceStep (traceOfWord (parityWord n0 j)) Branch.E).B
            simp [traceStep, ← hb]
          rw [← horbit] at h
          obtain ⟨k, hk⟩ := ih (j + 1) n0 a (2 * b) ha' hb' h
          exact ⟨k + 1, by rw [show j + (k + 1) = (j + 1) + k from by omega]; exact hk⟩
        · rw [if_neg he] at h
          have horbit : orbit n0 (j + 1) = (3 * orbit n0 j + 1) / 2 := by
            rw [orbit_succ]; unfold step; rw [if_neg he]
          have hword : parityWord n0 (j + 1) = parityWord n0 j ++ [Branch.O] := by
            rw [parityWord_snoc j n0, branch_odd he]
          have ha' : 3 * a = (traceOfWord (parityWord n0 (j + 1))).A := by
            rw [hword, trace_append_O]
            show 3 * a = (traceStep (traceOfWord (parityWord n0 j)) Branch.O).A
            simp [traceStep, ← ha]
          have hb' : 2 * b = (traceOfWord (parityWord n0 (j + 1))).B := by
            rw [hword, trace_append_O]
            show 2 * b = (traceStep (traceOfWord (parityWord n0 j)) Branch.O).B
            simp [traceStep, ← hb]
          rw [← horbit] at h
          obtain ⟨k, hk⟩ := ih (j + 1) n0 (3 * a) (2 * b) ha' hb' h
          exact ⟨k + 1, by rw [show j + (k + 1) = (j + 1) + k from by omega]; exact hk⟩

/-- Soundness of `crossingVerify`: a `true` report at a fresh seed yields an actual
coefficient-contracting prefix. -/
theorem crossingVerify_sound (n depth : Nat) (h : crossingVerify n depth = true) :
    ∃ k, CoeffContracting (parityWord n k) := by
  have h0 : crossingBool (orbit n 0) 1 1 depth = true := by rwa [orbit_zero]
  obtain ⟨k, hk⟩ := crossingBool_sound depth 0 n 1 1
    (by simp [parityWord_zero, trace_empty, identityTrace])
    (by simp [parityWord_zero, trace_empty, identityTrace]) h0
  exact ⟨k, by rwa [Nat.zero_add] at hk⟩

/-! ## The range sweep -/

/-- Sweep the crossing verifier across `fuel` consecutive seeds starting at `n`, each
searched to depth `depth`; seeds `≤ 2` are skipped (vacuously `true` — they carry no
crossing obligation, mirroring the `2 < n` guard of `EveryNonterminalContracts`). Purely
tail-recursive `Nat`/`Bool` arithmetic, no `List` intermediate: linear in `fuel · depth`. -/
def crossingSweepFrom : Nat → Nat → Nat → Bool
  | _, 0, _ => true
  | n, fuel + 1, depth =>
      ((if n ≤ 2 then true else crossingVerify n depth) &&
        crossingSweepFrom (n + 1) fuel depth)

@[simp] theorem crossingSweepFrom_zero (n depth : Nat) :
    crossingSweepFrom n 0 depth = true := rfl

theorem crossingSweepFrom_succ (n fuel depth : Nat) :
    crossingSweepFrom n (fuel + 1) depth =
      ((if n ≤ 2 then true else crossingVerify n depth) &&
        crossingSweepFrom (n + 1) fuel depth) := rfl

/-- Soundness of the range sweep: a `true` report over `[n, n + fuel)` yields a
coefficient-contracting prefix for every seed `m` in that range with `2 < m`. -/
theorem crossingSweepFrom_sound (fuel : Nat) : ∀ (n depth m : Nat),
    crossingSweepFrom n fuel depth = true →
    n ≤ m → m < n + fuel → 2 < m →
    ∃ k, CoeffContracting (parityWord m k) := by
  induction fuel with
  | zero => intro n depth m _ hnm hmn _; exfalso; omega
  | succ fuel ih =>
      intro n depth m h hnm hmn hm2
      rw [crossingSweepFrom_succ, Bool.and_eq_true_iff] at h
      obtain ⟨h1, h2⟩ := h
      rcases Nat.eq_or_lt_of_le hnm with heq | hlt
      · subst heq
        have hn2 : ¬ n ≤ 2 := by omega
        rw [if_neg hn2] at h1
        exact crossingVerify_sound n depth h1
      · exact ih (n + 1) depth m h2 (by omega) (by omega) hm2

/-- The whole-range `Bool` sweep: seeds `0 ≤ n < bound`, each searched to `depth`. -/
def crossingSweep (bound depth : Nat) : Bool := crossingSweepFrom 0 bound depth

/-- Soundness of the whole-range sweep, in the exact shape needed to instantiate
`EveryNonterminalContracts` restricted to `n < bound`. -/
theorem crossingSweep_sound (bound depth : Nat) (h : crossingSweep bound depth = true)
    (n : Nat) (hn : 2 < n) (hN : n < bound) :
    ∃ k, CoeffContracting (parityWord n k) :=
  crossingSweepFrom_sound bound 0 depth n h (by omega) (by omega) hn

/-! ## The wide audit

Empirically (a plain arithmetic replay of `crossingBool`'s recursion, outside Lean), the
slowest crossing below `crossingAuditBound = 50000` occurs at `n = 35655`, whose first
contracting prefix has length `135`; `crossingAuditDepth = 145` gives working room while
staying kernel-fast (the whole sweep, `50000 × 145` linear steps, checks by kernel
`decide` in a little over two minutes). This strictly supersedes `Reduction.lean`'s
`auditBound = 500` / `auditSearchDepth = 62` in range — a hundredfold widening — without
touching that section. -/

/-- The audited range: seeds `n` with `2 < n < crossingAuditBound` are covered by
`crossingSweep_holds` below. A hundred times `Reduction.lean`'s `auditBound = 500`. -/
def crossingAuditBound : Nat := 50000

/-- The audited search depth: every covered seed's crossing is found within a prefix
shorter than `crossingAuditDepth`. -/
def crossingAuditDepth : Nat := 145

set_option maxRecDepth 1000000 in
set_option maxHeartbeats 4000000 in
/-- **The kernel-decided wide audit.** A closed `Bool` computation, evaluated by the
Lean kernel itself via `decide` (never `native_decide`): every seed below
`crossingAuditBound` (skipping `n ≤ 2`) realizes a coefficient-contracting prefix within
`crossingAuditDepth` letters. Tail-recursive `Nat`/`Bool` arithmetic throughout, so this
is near-linear kernel work rather than the `O(depth^2)`-per-seed cost of deciding the
`Prop`-level existential directly. -/
theorem crossingSweep_holds :
    crossingSweep crossingAuditBound crossingAuditDepth = true := by decide

/-- **The wide crossing audit**, stated in the exact shape of the open frontier
hypothesis `EveryNonterminalContracts` (`∃ k, CoeffContracting (parityWord n k)`, no
depth bound in the statement) restricted to `n < crossingAuditBound = 50000`: this is
`EveryNonterminalContracts` proved, by the Lean kernel, on a hundred times the range of
`Reduction.lean`'s `everyNonterminalContracts_below` (`auditBound = 500`), which it
supersedes in range while leaving untouched. It does **not** close
`EveryNonterminalContracts` itself — that remains the open crossing/no-stream frontier
named in `Reduction.lean` (equivalently `NoPositiveInfiniteBarrierStream`,
`EveryNonterminalHasCrossing`) — it is finite, kernel-checked evidence for a wider
bounded range, produced by a near-linear verifier instead of a quadratic one. -/
theorem everyNonterminalContracts_below_wide (n : Nat) (hn : 2 < n) (hN : n < crossingAuditBound) :
    ∃ k, CoeffContracting (parityWord n k) :=
  crossingSweep_sound crossingAuditBound crossingAuditDepth crossingSweep_holds n hn hN

end Collatz
end Closure
end Obsmetrologia
