/-
# Settling — the generative home of order

Settling is the morphism out of the *knowledge-least valuation* that brings a
trace to its **fixed point**: it iterates the modal closure
`possibilize ∘ necessitate` (◇∘□) until the last valuation stops changing.
Termination is **Knaster–Tarski**: each step is monotone in the bounded knowledge
lattice, so the orbit stabilizes.

> Because the closure is monotone, the fixed point a least upper bound, and the
> trace a graded chain, **this is the morphism that generates order.** Order is not
> filed near settling by resemblance; order is the structure settling *is*.

So this module *derives order theory itself* at the point the chain first produces
it: the knowledge relation `≤ₖ` is proven a **partial order**, and `∨ₖ`/`∧ₖ` are
proven its lub/glb, making `Charge` a **bounded lattice**. Then the closure
operator and its **least fixed point** (Knaster–Tarski for closures) are derived;
at the finite regime the closure is idempotent — the confluence ◇□ = □◇ that makes
the residue drain to zero (H¹ = 0), so settling stabilizes in one step.
-/
import RelMath.Positing

namespace RelMath
namespace Charge

/-! ## Order — generated here, as a partial order on charges -/

/-- The knowledge order as a `Prop` relation: the order settling generates.
Reducible so the underlying decidable `leK a b = true` is visible to `decide`. -/
abbrev KLE (a b : Charge) : Prop := leK a b = true

/-- Reflexive. -/
theorem kle_refl (a : Charge) : KLE a a := by cases a <;> rfl
/-- Transitive. -/
theorem kle_trans (a b c : Charge) : KLE a b → KLE b c → KLE a c := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> cases c <;> decide
/-- Antisymmetric — so `≤ₖ` is a genuine partial order, not a preorder. -/
theorem kle_antisymm (a b : Charge) : KLE a b → KLE b a → a = b := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> decide

/-! ## Lattice — `∨ₖ` is the lub, `∧ₖ` the glb, with bounds ⊥ₖ/⊤ₖ -/

theorem le_joinK_left (a b : Charge) : KLE a (joinK a b) := by cases a <;> cases b <;> rfl
theorem le_joinK_right (a b : Charge) : KLE b (joinK a b) := by cases a <;> cases b <;> rfl
/-- `∨ₖ` is the **least** upper bound. -/
theorem joinK_le (a b c : Charge) : KLE a c → KLE b c → KLE (joinK a b) c := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> cases c <;> decide

theorem meetK_le_left (a b : Charge) : KLE (meetK a b) a := by cases a <;> cases b <;> rfl
theorem meetK_le_right (a b : Charge) : KLE (meetK a b) b := by cases a <;> cases b <;> rfl
/-- `∧ₖ` is the **greatest** lower bound. -/
theorem le_meetK (a b c : Charge) : KLE c a → KLE c b → KLE c (meetK a b) := by
  intro h1 h2; revert h1 h2; cases a <;> cases b <;> cases c <;> decide

/-- ⊥ₖ is the least element — the seed settling climbs from. -/
theorem kBot_le (a : Charge) : KLE kBot a := kBot_leK a
/-- ⊤ₖ is the greatest element. -/
theorem le_kTop (a : Charge) : KLE a kTop := leK_kTop a

/-! ## Closure operator and its least fixed point (Knaster–Tarski) -/

/-- A **closure operator** on the knowledge order: inflationary, monotone, and
idempotent. (At the finite regime settling's modal closure ◇∘□ is one.) -/
structure Closure where
  op : Charge → Charge
  infl : ∀ a, KLE a (op a)
  mono : ∀ a b, KLE a b → KLE (op a) (op b)
  idem : ∀ a, op (op a) = op a

namespace Closure

/-- **Knaster–Tarski (closure form).** `op a` is a fixed point — settling stops
changing after it. -/
theorem op_fixed (c : Closure) (a : Charge) : c.op (c.op a) = c.op a := c.idem a

/-- `op a` is the **least** fixed point above `a`: any fixed point `x ≥ₖ a` lies
above `op a`. This is the least-upper-bound character of the settled value. -/
theorem op_least (c : Closure) (a x : Charge)
    (hax : KLE a x) (hfx : c.op x = x) : KLE (c.op a) x := by
  have h := c.mono a x hax
  rw [hfx] at h; exact h

end Closure

/-- The canonical settling closure: raise to a knowledge bound `k` by `∨ₖ`
(possibilize toward `k`). Settling from ⊥ₖ under `joinClosure k` reaches `k`. -/
def joinClosure (k : Charge) : Closure where
  op a := joinK k a
  infl a := by
    have : KLE a (joinK a k) := le_joinK_left a k
    have e : joinK a k = joinK k a := joinK_comm a k
    rw [e] at this; exact this
  mono a b h := by revert h; cases k <;> cases a <;> cases b <;> decide
  idem a := by cases k <;> cases a <;> rfl

/-- **Settling**: the fixed point reached from a seed under a closure. For a
closure the orbit stabilizes in one step (the finite-regime confluence
◇□ = □◇), so the settled value is `c.op seed`. -/
def settle (c : Closure) (seed : Charge) : Charge := c.op seed

/-- The settled value is a fixed point — nothing left to descend. -/
theorem settle_fixed (c : Closure) (seed : Charge) :
    c.op (settle c seed) = settle c seed := c.idem seed

/-- The settled value is the least fixed point above the seed. -/
theorem settle_least (c : Closure) (seed x : Charge)
    (h : KLE seed x) (hf : c.op x = x) : KLE (settle c seed) x :=
  c.op_least seed x h hf

/-- Worked instance: settling the knowledge-least charge ⊥ₖ toward a bound `k`
lands exactly on `k`. -/
@[simp] theorem settle_kBot (k : Charge) : settle (joinClosure k) kBot = k := by
  cases k <;> rfl

end Charge

/-! ## Lifting settling to valuations -/

namespace Valuation

/-- Settle a whole valuation pointwise under a charge-closure. -/
def settle (op : Charge → Charge) (v : Valuation) : Valuation := fun φ => op (v φ)

/-- Settling the knowledge-least valuation toward a target charge `k` yields the
constant-`k` valuation — the fixed point the modal dynamic climbs to from the seed
positing deposited. -/
@[simp] theorem settle_knowledgeLeast (k : Charge) :
    settle (Charge.joinClosure k).op knowledgeLeast = fun _ => k := by
  funext φ
  show Charge.joinK k Charge.kBot = k
  cases k <;> rfl

end Valuation

end RelMath
