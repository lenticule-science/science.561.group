import Infomaterial.Language.Settling

/-!
# Truth-order closure — the bilattice's second order

`Settling` derived the **knowledge** order `≤ₖ` as a bounded lattice and its
closure (adding *information*: cells move ⊥ → t/f → ⊤). The bilattice carries a
second, orthogonal order on the *same* four charges — the **truth** order `≤ₜ`
(adding *truthfulness*: cells move f → ⊥/⊤ → t):

* `≤ₖ` (knowledge): `⊥ ≤ₖ t,f ≤ₖ ⊤`   (bottom = no info, top = contradiction)
* `≤ₜ` (truth):     `f ≤ₜ ⊥,⊤ ≤ₜ t`   (bottom = false, top = true)

This module proves `≤ₜ` is itself a **bounded lattice** (`∨ₜ`/`∧ₜ` its lub/glb,
`f`/`t` its bounds), derives the parallel **truth-order closure** `T_t`, and shows
**negation is the duality** linking the two orders: it reverses `≤ₜ` while
preserving `≤ₖ`. Both orders are bounded lattices on the four-point FOUR — that is
what makes it a bilattice.
-/

namespace Infomaterial
namespace Charge

/-! ## The truth order as a partial order -/

/-- The truth order as a `Prop` relation (reducible, for `decide`). -/
abbrev TLE (a b : Charge) : Prop := leT a b = true

theorem tle_refl (a : Charge) : TLE a a := by cases a <;> rfl
theorem tle_trans (a b c : Charge) : TLE a b → TLE b c → TLE a c := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> cases c <;> decide
theorem tle_antisymm (a b : Charge) : TLE a b → TLE b a → a = b := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> decide

/-! ## `∨ₜ` is the lub, `∧ₜ` the glb, with bounds f/t -/

theorem le_joinT_left (a b : Charge) : TLE a (joinT a b) := by cases a <;> cases b <;> rfl
theorem le_joinT_right (a b : Charge) : TLE b (joinT a b) := by cases a <;> cases b <;> rfl
theorem joinT_le (a b c : Charge) : TLE a c → TLE b c → TLE (joinT a b) c := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> cases c <;> decide

theorem meetT_le_left (a b : Charge) : TLE (meetT a b) a := by cases a <;> cases b <;> rfl
theorem meetT_le_right (a b : Charge) : TLE (meetT a b) b := by cases a <;> cases b <;> rfl
theorem le_meetT (a b c : Charge) : TLE c a → TLE c b → TLE c (meetT a b) := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> cases c <;> decide

/-- `f` (truth-bottom) is the least element; `t` (truth-top) the greatest. -/
theorem tBot_le (a : Charge) : TLE tBot a := by cases a <;> rfl
theorem le_tTop (a : Charge) : TLE a tTop := by cases a <;> rfl

/-- `f` is the identity of `∨ₜ`, `t` the identity of `∧ₜ`. -/
@[simp] theorem joinT_tBot (a : Charge) : joinT a tBot = a := by cases a <;> rfl
@[simp] theorem meetT_tTop (a : Charge) : meetT a tTop = a := by cases a <;> rfl

/-! ## Negation is the duality between the two orders -/

/-- Negation **reverses** the truth order. -/
theorem negate_tle (a b : Charge) : TLE (negate a) (negate b) ↔ TLE b a := by
  simp only [TLE, negate_leT]

/-- Negation **preserves** the knowledge order (companion fact, restated as an
order iff). -/
theorem negate_kle (a b : Charge) : KLE (negate a) (negate b) ↔ KLE a b := by
  simp only [KLE, negate_leK]

/-! ## The truth-order closure operator `T_t` -/

/-- A **truth-order closure operator**: inflationary, monotone, idempotent in `≤ₜ`
— the parallel of `Closure` for the second order. -/
structure TClosure where
  op : Charge → Charge
  infl : ∀ a, TLE a (op a)
  mono : ∀ a b, TLE a b → TLE (op a) (op b)
  idem : ∀ a, op (op a) = op a

namespace TClosure

/-- Knaster–Tarski (truth form): `op a` is a fixed point. -/
theorem op_fixed (c : TClosure) (a : Charge) : c.op (c.op a) = c.op a := c.idem a

/-- `op a` is the least fixed point above `a` in `≤ₜ`. -/
theorem op_least (c : TClosure) (a x : Charge)
    (hax : TLE a x) (hfx : c.op x = x) : TLE (c.op a) x := by
  have h := c.mono a x hax
  rw [hfx] at h; exact h

end TClosure

/-- The canonical truth-order closure: raise toward a truth bound `k` by `∨ₜ`. -/
def joinTClosure (k : Charge) : TClosure where
  op a := joinT k a
  infl a := by
    have : TLE a (joinT a k) := le_joinT_left a k
    have e : joinT a k = joinT k a := joinT_comm a k
    rw [e] at this; exact this
  mono a b h := by revert h; cases k <;> cases a <;> cases b <;> decide
  idem a := by cases k <;> cases a <;> rfl

/-- **Truth-order settling**: the fixed point reached from a seed under a truth
closure. -/
def settleT (c : TClosure) (seed : Charge) : Charge := c.op seed

theorem settleT_fixed (c : TClosure) (seed : Charge) :
    c.op (settleT c seed) = settleT c seed := c.idem seed

/-- Truth-settling the truth-least charge `f` toward a bound `k` lands on `k` —
the mirror of `settle_kBot`. -/
@[simp] theorem settleT_tBot (k : Charge) : settleT (joinTClosure k) tBot = k := by
  cases k <;> rfl

end Charge

end Infomaterial
