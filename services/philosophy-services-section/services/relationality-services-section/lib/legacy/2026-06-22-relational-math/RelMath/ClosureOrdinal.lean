/-
# Closure ordinal — finite termination of settling

`Settling` modelled a settled value as the fixed point of an *idempotent* closure
(one step). The corpus's settling is more general: it **iterates** the closure
`T = ◇∘□` — a monotone, inflationary endomap that need not be idempotent — until
the orbit stops changing, at the **closure ordinal** κ:

  `κ(F, x) = least τ with F^{τ+1}(x) = F^τ(x)`.

This module derives the iteration `F^n` and proves that on the FOUR bilattice
**every inflationary endomap settles by step 3** — the closure ordinal is finite,
`κ ≤ 3` (one more than the knowledge-lattice height). This is the **strict-finite
regime**: the residue drains to zero in boundedly many steps, with no transfinite
tail. The other three regimes (Scott-continuous κ=ω, transfinite-bounded,
aperiodic κ≥ω₁) are the refinements that appear once the index set is infinite;
over the finite charge lattice the regime is always strict-finite.
-/
import RelMath.Settling

namespace RelMath
namespace Charge

/-- `iter f n x = fⁿ x` — the settling orbit. -/
def iter (f : Charge → Charge) : Nat → Charge → Charge
  | 0, x => x
  | n + 1, x => f (iter f n x)

/-- A fixed point stays fixed under all further iteration. -/
theorem iter_fixed_of (f : Charge → Charge) (a : Charge) (h : f a = a) :
    ∀ n, iter f n a = a
  | 0 => rfl
  | n + 1 => by rw [iter, iter_fixed_of f a h n, h]

/-- Iteration adds: `f^{n+m} x = f^m (f^n x)`. -/
theorem iter_add (f : Charge → Charge) (m n : Nat) (x : Charge) :
    iter f (n + m) x = iter f m (iter f n x) := by
  induction m with
  | zero => rfl
  | succ k ih =>
    calc iter f (n + (k + 1)) x = f (iter f (n + k) x) := rfl
      _ = f (iter f k (iter f n x)) := by rw [ih]
      _ = iter f (k + 1) (iter f n x) := rfl

/-- Each step climbs the knowledge order — the orbit is a `≤ₖ`-chain. -/
theorem iter_step_le (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) (n : Nat) :
    KLE (iter f n x) (iter f (n + 1) x) := hf (iter f n x)

/-- **No ascending chain of four distinct charges.** The knowledge order has height
two, so any `a ≤ₖ b ≤ₖ c ≤ₖ d` collapses somewhere — a finite check. -/
theorem kchain_height (a b c d : Charge) :
    KLE a b → KLE b c → KLE c d → a = b ∨ b = c ∨ c = d := by
  cases a <;> cases b <;> cases c <;> cases d <;> decide

/-- Once two consecutive iterates coincide at `k`, the orbit is constant from `k`. -/
theorem iter_propagate (f : Charge → Charge) (k : Nat) (x : Charge)
    (h : iter f k x = iter f (k + 1) x) (j : Nat) :
    iter f (k + j) x = iter f k x := by
  have hfix : f (iter f k x) = iter f k x := h.symm
  rw [iter_add]
  exact iter_fixed_of f (iter f k x) hfix j

/-- **Strict-finite termination.** Every inflationary endomap on the charge lattice
reaches its fixed point by step 3: `f³ x = f⁴ x`. The closure ordinal is `≤ 3`. -/
theorem settles_by_three (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    iter f 3 x = iter f 4 x := by
  have h01 := iter_step_le f hf x 0
  have h12 := iter_step_le f hf x 1
  have h23 := iter_step_le f hf x 2
  rcases kchain_height _ _ _ _ h01 h12 h23 with h | h | h
  · exact (iter_propagate f 0 x h 3).trans (iter_propagate f 0 x h 4).symm
  · exact (iter_propagate f 1 x h 2).trans (iter_propagate f 1 x h 3).symm
  · exact (iter_propagate f 2 x h 1).trans (iter_propagate f 2 x h 2).symm

/-! ## The settling bound and the strict-finite regime -/

/-- `f` settles `x` by step `n`: the orbit is fixed from `n` on. The least such `n`
is the closure ordinal κ; any such `n` is a settling bound λ. -/
def SettlesBy (f : Charge → Charge) (x : Charge) (n : Nat) : Prop :=
  iter f (n + 1) x = iter f n x

/-- **The strict-finite regime: κ ≤ 3.** Every inflationary endomap on the charge
lattice settles by step 3 — a uniform finite settling bound, no transfinite tail. -/
theorem strict_finite (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    SettlesBy f x 3 := (settles_by_three f hf x).symm

/-- The settled value is genuinely fixed: `f (f³ x) = f³ x`. -/
theorem settled_fixed (f : Charge → Charge) (hf : ∀ a, KLE a (f a)) (x : Charge) :
    f (iter f 3 x) = iter f 3 x := (settles_by_three f hf x).symm

/-- Every `Closure` (from `Settling`) is inflationary, so it too settles in `≤ 3`
steps — consistent with idempotent closures settling in one. -/
theorem closure_strict_finite (c : Closure) (x : Charge) : SettlesBy c.op x 3 :=
  strict_finite c.op c.infl x

end Charge

end RelMath
