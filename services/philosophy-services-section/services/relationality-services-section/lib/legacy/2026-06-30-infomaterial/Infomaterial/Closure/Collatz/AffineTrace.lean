/-!
# Collatz affine traces — the arithmetic projection of a strict-finite settlement

The corpus realizes the Collatz orbit as a **strict-finite settlement** (the node
`…/settling/.../collatz-settlement`): the monotone quantity is not the bouncing
integer but the knowledge order, and the closure ordinal `κ < ω` *is* the total
stopping time — the well-founded weight that arithmetic alone could never exhibit,
because it lives in the descent, not in the integers.

This module formalizes the **arithmetic projection** of that descent: once a finite
parity word `w` is fixed, the accelerated Collatz iterate is governed by an *affine
trace* `⟨A, B, C⟩` satisfying

  `B · T^{|w|}(n) = A · n + C`,

with `A = 3^{oddCount w}` and `B = 2^{|w|}`. Fixing the parity word turns the
nonlinear branching dynamics into a single affine relation — the first lawful
finite probe of the orbit. Nothing here proves Collatz; the descent obstruction
(first-passage / semigroup gap) is built on top of this foundation in later modules.

## Main definitions

* `Branch`        — the two-letter parity alphabet (`E` even, `O` odd).
* `step`, `orbit` — the accelerated map `T` and its iterate.
* `parityWord`    — the finite branch record of an orbit segment.
* `AffineTrace`   — the bundle `⟨A, B, C⟩` with relation `B·y = A·x + C`.
* `traceOfWord`   — the affine trace accumulated along a parity word.

## Main results

* `AffineTrace.comp_correct` — affine relations compose to the composite trace.
* `trace_A_eq_three_pow_oddCount`, `trace_B_eq_two_pow_length` — the closed forms.
* `affine_trace_parityWord` — the keystone: `B·orbit n k = A·n + C` along any orbit.

## Implementation notes

`traceOfWord` is a left fold from the identity trace `⟨1,1,0⟩`; the keystone is
proved by a fold-accumulator generalization (`affine_trace_aux`) threading the
running input/output relation, since the per-letter recurrence reassociates the
accumulator. All arithmetic is over `Nat` with `omega` for the parity/division
facts and explicit `Nat.mul`/`Nat.add` rewriting for the bilinear identities
(dependency-free: no `ring` tactic, normalized by hand).

## References

`content/.../positing/.../valuation/.../settling/_archive/collatz-settlement.md`;
the affine-trace / first-passage architecture in `_triage/collatz_*`.

## Tags

collatz, affine trace, parity word, accelerated map, strict-finite settlement
-/

namespace Infomaterial
namespace Closure
namespace Collatz

/-! ## The accelerated map and its parity words -/

/-- The parity alphabet: `E` is the even branch `n ↦ n/2`, `O` the odd branch
`n ↦ (3n+1)/2`. -/
inductive Branch
  | E
  | O
  deriving DecidableEq, Repr

/-- The accelerated (shortcut) Collatz map `T`. -/
def step (n : Nat) : Nat :=
  if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

/-- The branch taken from `n`. -/
def branch (n : Nat) : Branch :=
  if n % 2 = 0 then Branch.E else Branch.O

/-- The orbit `orbit n k = T^k(n)`. -/
def orbit (n : Nat) : Nat → Nat
  | 0 => n
  | k + 1 => step (orbit n k)

/-- The parity word of the first `k` steps of the orbit of `n`. -/
def parityWord : Nat → Nat → List Branch
  | _, 0 => []
  | n, k + 1 => branch n :: parityWord (step n) k

@[simp] theorem orbit_zero (n : Nat) : orbit n 0 = n := rfl
@[simp] theorem orbit_succ (n k : Nat) : orbit n (k + 1) = step (orbit n k) := rfl
@[simp] theorem parityWord_zero (n : Nat) : parityWord n 0 = [] := rfl
@[simp] theorem parityWord_succ (n k : Nat) :
    parityWord n (k + 1) = branch n :: parityWord (step n) k := rfl

@[simp] theorem parityWord_length (n k : Nat) : (parityWord n k).length = k := by
  induction k generalizing n with
  | zero => rfl
  | succ k ih => rw [parityWord_succ, List.length_cons, ih (step n)]

/-- The orbit shifts: one outer step equals starting from `step n`. -/
theorem orbit_step (n k : Nat) : orbit n (k + 1) = orbit (step n) k := by
  induction k with
  | zero => rfl
  | succ k ih => rw [orbit_succ, ih, orbit_succ]

/-- The number of odd (`O`) branches in a word. -/
def oddCount : List Branch → Nat
  | [] => 0
  | Branch.E :: xs => oddCount xs
  | Branch.O :: xs => oddCount xs + 1

/-! ## Branch equations -/

/-- On the even branch the step doubles back: `2 · step n = n`. -/
theorem step_even_eq {n : Nat} (h : n % 2 = 0) : 2 * step n = n := by
  unfold step; rw [if_pos h]; omega

/-- On the odd branch: `2 · step n = 3n + 1`. -/
theorem step_odd_eq {n : Nat} (h : n % 2 ≠ 0) : 2 * step n = 3 * n + 1 := by
  unfold step; rw [if_neg h]; omega

theorem branch_even {n : Nat} (h : n % 2 = 0) : branch n = Branch.E := by
  unfold branch; rw [if_pos h]

theorem branch_odd {n : Nat} (h : n % 2 ≠ 0) : branch n = Branch.O := by
  unfold branch; rw [if_neg h]

/-! ## The affine trace object -/

/-- An affine trace `⟨A, B, C⟩` encodes the relation `B · y = A · x + C` between an
input `x` and an output `y`. -/
structure AffineTrace where
  A : Nat
  B : Nat
  C : Nat
  deriving DecidableEq, Repr

/-- The even branch trace: `2·y = 1·x + 0`. -/
def evenTrace : AffineTrace := ⟨1, 2, 0⟩
/-- The odd branch trace: `2·y = 3·x + 1`. -/
def oddTrace : AffineTrace := ⟨3, 2, 1⟩

/-- Composition of affine traces: `g.comp f` realizes "`f` then `g`". -/
def AffineTrace.comp (g f : AffineTrace) : AffineTrace :=
  { A := g.A * f.A
    B := g.B * f.B
    C := g.A * f.C + f.B * g.C }

/-- The composite trace realizes the composite affine relation. -/
theorem AffineTrace.comp_correct (f g : AffineTrace) {x y z : Nat}
    (hf : f.B * y = f.A * x + f.C) (hg : g.B * z = g.A * y + g.C) :
    (g.comp f).B * z = (g.comp f).A * x + (g.comp f).C := by
  show g.B * f.B * z = g.A * f.A * x + (g.A * f.C + f.B * g.C)
  have e1 : g.B * f.B * z = f.B * (g.B * z) := by
    rw [Nat.mul_comm g.B f.B, Nat.mul_assoc]
  rw [e1, hg, Nat.mul_add]
  have e2 : f.B * (g.A * y) = g.A * (f.B * y) := by
    rw [← Nat.mul_assoc, Nat.mul_comm f.B g.A, Nat.mul_assoc]
  rw [e2, hf, Nat.mul_add, ← Nat.mul_assoc, Nat.add_assoc]

/-- One letter advances a trace: `E` doubles `B`, `O` triples `A`, doubles `B`,
and pumps `C`. -/
def traceStep (t : AffineTrace) : Branch → AffineTrace
  | Branch.E => { A := t.A,     B := 2 * t.B, C := t.C }
  | Branch.O => { A := 3 * t.A, B := 2 * t.B, C := 3 * t.C + t.B }

/-- The affine trace accumulated along a parity word, read left to right. -/
def traceOfWord (w : List Branch) : AffineTrace :=
  w.foldl traceStep ⟨1, 1, 0⟩

@[simp] theorem trace_empty : traceOfWord [] = ⟨1, 1, 0⟩ := rfl

/-! ## Closed forms for the trace coefficients -/

/-- A single letter always doubles the `B` coefficient. -/
theorem traceStep_B (t : AffineTrace) (b : Branch) : (traceStep t b).B = 2 * t.B := by
  cases b <;> rfl

/-- Fold form of the `B` coefficient over any accumulator. -/
theorem foldl_traceStep_B (w : List Branch) :
    ∀ t : AffineTrace, (w.foldl traceStep t).B = 2 ^ w.length * t.B := by
  induction w with
  | nil => intro t; simp
  | cons b w ih =>
      intro t
      rw [List.foldl_cons, ih (traceStep t b), traceStep_B, List.length_cons,
        Nat.pow_succ, Nat.mul_assoc]

/-- Fold form of the `A` coefficient over any accumulator. -/
theorem foldl_traceStep_A (w : List Branch) :
    ∀ t : AffineTrace, (w.foldl traceStep t).A = 3 ^ oddCount w * t.A := by
  induction w with
  | nil => intro t; simp [oddCount]
  | cons b w ih =>
      intro t
      cases b with
      | E => rw [List.foldl_cons, ih (traceStep t Branch.E)]; simp [traceStep, oddCount]
      | O =>
          rw [List.foldl_cons, ih (traceStep t Branch.O)]
          simp only [traceStep, oddCount]
          rw [Nat.pow_succ, Nat.mul_assoc]

/-- `B_w = 2^{|w|}`. -/
theorem trace_B_eq_two_pow_length (w : List Branch) :
    (traceOfWord w).B = 2 ^ w.length := by
  unfold traceOfWord; rw [foldl_traceStep_B]; simp

/-- `A_w = 3^{oddCount w}`. -/
theorem trace_A_eq_three_pow_oddCount (w : List Branch) :
    (traceOfWord w).A = 3 ^ oddCount w := by
  unfold traceOfWord; rw [foldl_traceStep_A]; simp

theorem trace_B_pos (w : List Branch) : 0 < (traceOfWord w).B := by
  rw [trace_B_eq_two_pow_length]; exact Nat.pow_pos (by decide)

theorem trace_A_pos (w : List Branch) : 0 < (traceOfWord w).A := by
  rw [trace_A_eq_three_pow_oddCount]; exact Nat.pow_pos (by decide)

/-! ## The keystone: affine trace of an orbit -/

/-- Fold-accumulator generalization of the affine trace law: if the accumulator `t`
already realizes the relation from the original input `x` to the current value `n`,
then folding the next `k` parity letters realizes it from `x` to `orbit n k`. -/
theorem affine_trace_aux (k : Nat) :
    ∀ (n : Nat) (t : AffineTrace) (x : Nat),
      t.B * n = t.A * x + t.C →
      ((parityWord n k).foldl traceStep t).B * orbit n k
        = ((parityWord n k).foldl traceStep t).A * x
          + ((parityWord n k).foldl traceStep t).C := by
  induction k with
  | zero => intro n t x h; simpa using h
  | succ k ih =>
      intro n t x h
      by_cases he : n % 2 = 0
      · have hstep : (2 * t.B) * step n = t.A * x + t.C := by
          have e1 : (2 * t.B) * step n = t.B * (2 * step n) := by
            rw [Nat.mul_comm 2 t.B, Nat.mul_assoc]
          rw [e1, step_even_eq he]; exact h
        rw [parityWord_succ, branch_even he, List.foldl_cons, orbit_step]
        exact ih (step n) (traceStep t Branch.E) x hstep
      · have hstep : (2 * t.B) * step n = (3 * t.A) * x + (3 * t.C + t.B) := by
          have e1 : (2 * t.B) * step n = t.B * (2 * step n) := by
            rw [Nat.mul_comm 2 t.B, Nat.mul_assoc]
          rw [e1, step_odd_eq he, Nat.mul_add, Nat.mul_one]
          have e2 : t.B * (3 * n) = 3 * (t.B * n) := by
            rw [← Nat.mul_assoc, Nat.mul_comm t.B 3, Nat.mul_assoc]
          rw [e2, h, Nat.mul_add, ← Nat.mul_assoc, Nat.add_assoc]
        rw [parityWord_succ, branch_odd he, List.foldl_cons, orbit_step]
        exact ih (step n) (traceStep t Branch.O) x hstep

/-- **Keystone.** Along any orbit, the trace of its parity word realizes the affine
relation between the seed and the iterate: `B_w · T^k(n) = A_w · n + C_w`. -/
theorem affine_trace_parityWord (n k : Nat) :
    (traceOfWord (parityWord n k)).B * orbit n k
      = (traceOfWord (parityWord n k)).A * n
        + (traceOfWord (parityWord n k)).C := by
  unfold traceOfWord
  exact affine_trace_aux k n ⟨1, 1, 0⟩ n (by simp)

/-! ## Terminal cycle, positivity, and orbit addition -/

theorem step_one : step 1 = 2 := by decide
theorem step_two : step 2 = 1 := by decide

/-- The accelerated map's terminal cycle `1 → 2 → 1`. -/
def Terminal (n : Nat) : Prop := n = 1 ∨ n = 2

/-- The terminal cycle is closed under `step`. -/
theorem terminal_step {n : Nat} (h : Terminal n) : Terminal (step n) := by
  rcases h with rfl | rfl
  · exact Or.inr step_one
  · exact Or.inl step_two

/-- `n` reaches the terminal cycle. -/
def ReachesTerminal (n : Nat) : Prop := ∃ k, Terminal (orbit n k)

/-- `n` eventually drops strictly below itself. -/
def FallsBelowSelf (n : Nat) : Prop := ∃ k, orbit n k < n

/-- The step map preserves positivity. -/
theorem step_pos {n : Nat} (h : 0 < n) : 0 < step n := by
  unfold step
  by_cases he : n % 2 = 0
  · rw [if_pos he]; omega
  · rw [if_neg he]; omega

/-- The orbit of a positive seed stays positive. -/
theorem orbit_pos {n : Nat} (h : 0 < n) : ∀ k, 0 < orbit n k
  | 0 => h
  | k + 1 => by rw [orbit_succ]; exact step_pos (orbit_pos h k)

/-- Iterating adds: `orbit n (a + b) = orbit (orbit n a) b`. -/
theorem orbit_add (n a b : Nat) : orbit n (a + b) = orbit (orbit n a) b := by
  induction b with
  | zero => rfl
  | succ b ih => rw [Nat.add_succ, orbit_succ, ih, orbit_succ]

/-! ## Descent, non-descent, and cycles — corollaries of the keystone

These read the affine relation `B·orbit = A·n + C` as a sign condition on the
coefficients. Descent is exactly the coefficient surplus going negative; a
coefficient-noncontracting word can never descend; and a cycle pins `n` to the
trace exactly. -/

/-- Descent over `k` steps is equivalent to the affine coefficient surplus being
negative: `orbit n k < n ↔ A·n + C < B·n`. -/
theorem descent_iff_coeff (n k : Nat) :
    orbit n k < n ↔
      (traceOfWord (parityWord n k)).A * n + (traceOfWord (parityWord n k)).C
        < (traceOfWord (parityWord n k)).B * n := by
  have hkey := affine_trace_parityWord n k
  have hB := trace_B_pos (parityWord n k)
  constructor
  · intro hlt
    have h1 : (traceOfWord (parityWord n k)).B * (orbit n k + 1)
        ≤ (traceOfWord (parityWord n k)).B * n := Nat.mul_le_mul_left _ hlt
    rw [Nat.mul_add, Nat.mul_one] at h1
    omega
  · intro hlt
    rcases Nat.lt_or_ge (orbit n k) n with h | h
    · exact h
    · have h2 : (traceOfWord (parityWord n k)).B * n
          ≤ (traceOfWord (parityWord n k)).B * orbit n k := Nat.mul_le_mul_left _ h
      omega

/-- A coefficient-noncontracting word (`B ≤ A`) cannot descend, since `C ≥ 0`. -/
theorem noncontracting_no_descent (n k : Nat)
    (h : (traceOfWord (parityWord n k)).B ≤ (traceOfWord (parityWord n k)).A) :
    n ≤ orbit n k := by
  have hkey := affine_trace_parityWord n k
  have hB := trace_B_pos (parityWord n k)
  have hmul : (traceOfWord (parityWord n k)).B * n
      ≤ (traceOfWord (parityWord n k)).B * orbit n k := by
    rw [hkey]
    have : (traceOfWord (parityWord n k)).B * n ≤ (traceOfWord (parityWord n k)).A * n :=
      Nat.mul_le_mul_right n h
    omega
  exact Nat.le_of_mul_le_mul_left hmul hB

/-- A cycle word pins the seed to its trace: if `orbit n k = n` then
`B·n = A·n + C`. -/
theorem cycle_word_necessary (n k : Nat) (hcyc : orbit n k = n) :
    (traceOfWord (parityWord n k)).B * n
      = (traceOfWord (parityWord n k)).A * n + (traceOfWord (parityWord n k)).C := by
  have hkey := affine_trace_parityWord n k
  rw [hcyc] at hkey; exact hkey

/-! ## The reduction

`reachesTerminal_of_all_fall_below` is the proven reduction: if every seed above the
terminal cycle eventually drops below itself, every positive seed reaches the cycle
(strong induction, splicing orbits via `orbit_add`). Its hypothesis — universal
descent below self — is the analytic content of accelerated Collatz; it is discharged
from the parent-barrier gap and the coefficient-crossing hypothesis in
`Closure.Collatz.Reduction`. -/

/-- Universal descent below self reduces to reaching the terminal cycle. -/
theorem reachesTerminal_of_all_fall_below
    (hdesc : ∀ n, 2 < n → FallsBelowSelf n) :
    ∀ n, 0 < n → ReachesTerminal n := by
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro hpos
    by_cases hn : n ≤ 2
    · exact ⟨0, by rw [orbit_zero]; show n = 1 ∨ n = 2; omega⟩
    · have h2 : 2 < n := by omega
      obtain ⟨k, hk⟩ := hdesc n h2
      have hm : 0 < orbit n k := orbit_pos hpos k
      obtain ⟨j, hj⟩ := ih (orbit n k) hk hm
      exact ⟨k + j, by rw [orbit_add]; exact hj⟩

end Collatz
end Closure
end Infomaterial
