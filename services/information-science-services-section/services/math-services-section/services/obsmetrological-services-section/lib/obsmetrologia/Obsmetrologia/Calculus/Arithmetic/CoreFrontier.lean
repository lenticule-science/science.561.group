/-!
# Arithmetic.CoreFrontier — the core-`Nat` laws that cost `propext`, re-derived

Lean core's `Nat` is very nearly axiom-free: `add_comm`, `add_assoc`, `mul_comm`,
`left_distrib`, `mul_succ`, and the *entire* order theory (`le_refl`, `le_trans`,
`le_antisymm`, `le_total`, `le_zero`, `lt_or_ge`, `succ_le_succ`, `decLe`) all discharge
with no axioms at all. Exactly five of the laws this corpus needs do not:

| core lemma                  | cost        |
|-----------------------------|-------------|
| `Nat.add_left_cancel`       | `[propext]` |
| `Nat.add_right_cancel`      | `[propext]` |
| `Nat.le_of_add_le_add_left` | `[propext]` |
| `Nat.mul_assoc`             | `[propext]` |
| `Nat.right_distrib`         | `[propext]` |

That is the whole frontier — not a general defect in core arithmetic but five specific
proofs that route through propositional rewriting. Each is re-derived below by plain
induction, and each discharges with **no axioms whatsoever**. Every numeric module in the
corpus stands on these five; taken from core they import `propext` before a line of
corpus mathematics is written, which is why `Charge`, `Record`, `Ord`, and the rational
tower all inherited it.

`Nat` is not this corpus's ℕ — `Ord.Natural`, the finite fragment of the ordinal
generated at settling, is (`Closure/OrdinalCore.lean` §E). This module is the frontier
across which core `Nat` facts are admitted to justify that identification; it is
deliberately import-free so it sits upstream of everything numeric.
-/

namespace Obsmetrologia
namespace Arithmetic

/-! ## Cancellation -/

/-- **Left cancellation for `Nat` addition**, by induction on the cancelled summand.
Core's `Nat.add_left_cancel` proves the same statement through `propext`. -/
theorem nat_add_left_cancel : ∀ (n m k : Nat), n + m = n + k → m = k
  | 0, _, _, h => by rw [Nat.zero_add, Nat.zero_add] at h; exact h
  | n + 1, m, k, h =>
      nat_add_left_cancel n m k
        (Nat.succ.inj (by rw [← Nat.succ_add, ← Nat.succ_add]; exact h))

/-- **Right cancellation for `Nat` addition**, from left cancellation and commutativity
(both `propext`-free). Core's `Nat.add_right_cancel` costs `propext`. -/
theorem nat_add_right_cancel (m n k : Nat) (h : m + n = k + n) : m = k :=
  nat_add_left_cancel n m k (by rw [Nat.add_comm n m, Nat.add_comm n k]; exact h)

/-- **Order cancellation for `Nat` addition**, by induction on the cancelled summand.
Core's `Nat.le_of_add_le_add_left` costs `propext`. -/
theorem nat_le_of_add_le_add_left : ∀ (n m k : Nat), n + m ≤ n + k → m ≤ k
  | 0, _, _, h => by rw [Nat.zero_add, Nat.zero_add] at h; exact h
  | n + 1, m, k, h =>
      nat_le_of_add_le_add_left n m k
        (Nat.le_of_succ_le_succ (by rw [← Nat.succ_add, ← Nat.succ_add]; exact h))

/-! ## Multiplication -/

/-- **Associativity of `Nat` multiplication**, by induction on the right factor.
Core's `Nat.mul_assoc` costs `propext`. -/
theorem nat_mul_assoc (a b c : Nat) : a * b * c = a * (b * c) := by
  induction c with
  | zero => rw [Nat.mul_zero, Nat.mul_zero, Nat.mul_zero]
  | succ c ih => rw [Nat.mul_succ, Nat.mul_succ, Nat.mul_add, ih]

/-- **Right distributivity over `Nat`**, from `Nat.left_distrib` and commutativity (both
`propext`-free). Core's `Nat.right_distrib` and `Nat.add_mul` both cost `propext`. -/
theorem nat_right_distrib (a b c : Nat) : (a + b) * c = a * c + b * c := by
  rw [Nat.mul_comm (a + b) c, Nat.left_distrib, Nat.mul_comm c a, Nat.mul_comm c b]

/-! ## Rearrangement

The two four-term shuffles a difference-quotient needs. Both are pure `add_assoc` /
`add_comm` chains, hence axiom-free; they are stated once here because the quotient
constructions downstream use them constantly and `omega` — the usual way to discharge
such goals — is itself a `propext` pump. -/

/-- **Interchange**: sums pair up across the two brackets. -/
theorem nat_interchange (a b c d : Nat) : (a + b) + (c + d) = (a + c) + (b + d) := by
  calc (a + b) + (c + d)
      = a + (b + (c + d)) := Nat.add_assoc a b (c + d)
    _ = a + ((b + c) + d) := by rw [Nat.add_assoc b c d]
    _ = a + ((c + b) + d) := by rw [Nat.add_comm b c]
    _ = a + (c + (b + d)) := by rw [Nat.add_assoc c b d]
    _ = (a + c) + (b + d) := (Nat.add_assoc a c (b + d)).symm

/-- **Crosswise**: the outer and inner terms of the two brackets swap partners. This is
the shuffle that makes a cross-sum equivalence transitive. -/
theorem nat_crosswise (a b c d : Nat) : (a + b) + (c + d) = (a + d) + (c + b) := by
  calc (a + b) + (c + d)
      = a + (b + (c + d)) := Nat.add_assoc a b (c + d)
    _ = a + ((b + c) + d) := by rw [Nat.add_assoc b c d]
    _ = a + ((c + b) + d) := by rw [Nat.add_comm b c]
    _ = a + (d + (c + b)) := by rw [Nat.add_comm (c + b) d]
    _ = (a + d) + (c + b) := (Nat.add_assoc a d (c + b)).symm

end Arithmetic
end Obsmetrologia
