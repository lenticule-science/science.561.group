/-
# ResiduatedLatticeStandalone — the integral commutative residuated lattice

The corpus node `…/positing/content/residuated-lattice` defines a **commutative
residuated lattice** as an algebra `⟨L, ∨, ∧, ·, →, 1⟩` where `⟨L,∨,∧⟩` is a
lattice, `⟨L,·,1⟩` a commutative monoid, and the *fusion* `·` and *residual* `→`
satisfy the **residuation adjunction**

>  `x · y ≤ z  ⟺  x ≤ (y → z)`

(`content/.../residuated-lattice/residuated-lattice.md`). It is **integral** when
`1` is the top element of the lattice. The explanation
`from-lattices-to-residuated-lattices.md` reads the two sides as *combination*
(`x·y ≤ z`) and *constraint* (`x ≤ y→z`) — "the two sides of one adjunction" — and
names the lattice→residuated step as the one "that makes the algebra capable of
modeling predication."

A bare lattice "compares but cannot combine"; fusion `·` adds combination, the
residual `→` adds its constraint, and integrality (`1 = ⊤`) forces fusion *below*
meet — the regime in which `Two` (Boolean, `·=∧`, `x→y := ¬x∨y`) lives. The corpus
flags exactly that algebra as the canonical integral commutative residuated
lattice and as a sibling of the [pre-bilattice] under `positing` — it is the
**universal residuated base** the twist-product / FOUR construction stands on.

This module builds the structure **standalone on `Order.BoundedLattice`** (which
already carries the lattice laws, the derived order `a ≤ b := a ⊓ b = a`, and
`⊤`/`⊥`), then *derives* — never posits — fusion's two-sided monotonicity,
integrality `a ≤ 1`, modus ponens `(a→b)·a ≤ b`, and the integral collapse
`a·b ≤ a⊓b`. It then instantiates `Two`, the 2-element Boolean residuated lattice,
and discharges every axiom by `decide`. No free data.
-/
import RelMath.OrderInfra

namespace RelMath
namespace Order

/-- An **integral commutative residuated lattice** `⟨L, ∨, ∧, ·, →, 1⟩`
(`…/positing/content/residuated-lattice`). It extends a `BoundedLattice` — so the
lattice `⟨∧,∨⟩`, the derived order `a ≤ b := a ⊓ b = a`, and the bounds `⊤`/`⊥`
come for free — and adds:

* a commutative monoid `⟨fuse, one⟩` (the *fusion product* `·`, unit `1`);
* a residual `imp` (the *residual implication* `→`);
* the **residuation adjunction** `fuse a b ≤ c ⟺ a ≤ imp b c`;
* **integrality** `one = top`.

`le` below is the inherited lattice order `toLattice.le`. -/
structure ResiduatedLattice extends BoundedLattice where
  /-- The fusion product `·` — *combination*. -/
  fuse : carrier → carrier → carrier
  /-- The residual implication `→` — *constraint*. -/
  imp : carrier → carrier → carrier
  /-- The monoid unit `1`. -/
  one : carrier
  fuse_comm : ∀ a b, fuse a b = fuse b a
  fuse_assoc : ∀ a b c, fuse (fuse a b) c = fuse a (fuse b c)
  fuse_one : ∀ a, fuse a one = a
  /-- The residuation adjunction `a·b ≤ c ⟺ a ≤ (b→c)`, `≤` unfolded to a meet. -/
  fuse_imp_adj : ∀ a b c,
    (meet (fuse a b) c = fuse a b) ↔ (meet a (imp b c) = a)
  /-- **Integrality**: the monoid unit is the lattice top. -/
  one_eq_top : one = top

namespace ResiduatedLattice
variable (R : ResiduatedLattice)

/-- The inherited lattice order `a ≤ b ⇔ a ⊓ b = a`. -/
def le (a b : R.carrier) : Prop := R.toLattice.le a b

theorem le_refl (a : R.carrier) : R.le a a := R.toLattice.le_refl a
theorem le_trans {a b c : R.carrier} (h1 : R.le a b) (h2 : R.le b c) : R.le a c :=
  R.toLattice.le_trans h1 h2
theorem le_antisymm {a b : R.carrier} (h1 : R.le a b) (h2 : R.le b a) : a = b :=
  R.toLattice.le_antisymm h1 h2

/-- The adjunction, restated with `le` (unfolds to the `meet` form). -/
theorem fuse_le_iff (a b c : R.carrier) : R.le (R.fuse a b) c ↔ R.le a (R.imp b c) :=
  R.fuse_imp_adj a b c

/-- The top is the greatest element. -/
theorem le_top (a : R.carrier) : R.le a R.top := R.toBoundedLattice.le_top a

/-! ## Derived: fusion is monotone in both arguments -/

/-- **Fusion is monotone in its first argument.** `a ≤ a' ⟹ a·b ≤ a'·b`.
From the adjunction: `a' ≤ b → a'·b` (residuating `a'·b ≤ a'·b`), then `a ≤ a'`
transitively, then residuate back. -/
theorem fuse_mono_left {a a' : R.carrier} (b : R.carrier) (h : R.le a a') :
    R.le (R.fuse a b) (R.fuse a' b) := by
  apply (R.fuse_le_iff a b (R.fuse a' b)).mpr
  have hadj : R.le a' (R.imp b (R.fuse a' b)) :=
    (R.fuse_le_iff a' b (R.fuse a' b)).mp (R.le_refl (R.fuse a' b))
  exact R.le_trans h hadj

/-- **Fusion is monotone in its second argument.** `b ≤ b' ⟹ a·b ≤ a·b'`.
By commutativity from the first-argument law. -/
theorem fuse_mono_right (a : R.carrier) {b b' : R.carrier} (h : R.le b b') :
    R.le (R.fuse a b) (R.fuse a b') := by
  have hm := R.fuse_mono_left a h
  rw [R.fuse_comm b a, R.fuse_comm b' a] at hm
  exact hm

/-! ## Derived: integrality and its consequences -/

/-- **Integrality.** Every element is below the unit `1 = ⊤`. -/
theorem le_one (a : R.carrier) : R.le a R.one := by
  rw [R.one_eq_top]; exact R.le_top a

/-- `a·b ≤ a`: fuse `b ≤ 1` into `a`, landing on `a·1 = a`. -/
theorem fuse_le_left (a b : R.carrier) : R.le (R.fuse a b) a := by
  have h : R.le (R.fuse a b) (R.fuse a R.one) := R.fuse_mono_right a (R.le_one b)
  rw [R.fuse_one a] at h
  exact h

/-- `a·b ≤ b`: by commutativity from `fuse_le_left`. -/
theorem fuse_le_right (a b : R.carrier) : R.le (R.fuse a b) b := by
  rw [R.fuse_comm a b]; exact R.fuse_le_left b a

/-- **Modus ponens / the counit.** `(a→b)·a ≤ b`. This is just the adjunction's
backward direction at the reflexive witness `imp a b ≤ imp a b`. -/
theorem modus_ponens (a b : R.carrier) : R.le (R.fuse (R.imp a b) a) b :=
  (R.fuse_le_iff (R.imp a b) a b).mpr (R.le_refl (R.imp a b))

/-- **Integral collapse.** In an *integral* residuated lattice fusion sits below
meet: `a·b ≤ a ⊓ b`. (Equality holds iff `·` *is* `∧`, as for `Two`/Heyting.) -/
theorem fuse_le_meet (a b : R.carrier) : R.le (R.fuse a b) (R.meet a b) :=
  R.toLattice.le_meet (R.fuse_le_left a b) (R.fuse_le_right a b)

end ResiduatedLattice

/-! ## `Two` — the 2-element Boolean residuated lattice

The canonical integral commutative residuated lattice the corpus names: carrier
`Bool`, `∧ = &&`, `∨ = ||`, fusion `· = &&`, unit `1 = true`, and the classical
residual `a → b := ¬a ∨ b = !a || b`. Every axiom is finite, so `decide` settles
each. This is the universal residuated base for the twist-product / FOUR. -/

/-- Boolean residual: classical implication `a → b := ¬a ∨ b`. -/
def boolImp (a b : Bool) : Bool := (!a) || b

/-- The 2-element Boolean integral commutative residuated lattice. -/
def Two : ResiduatedLattice where
  carrier := Bool
  meet := (· && ·)
  join := (· || ·)
  meet_comm := by decide
  meet_assoc := by decide
  meet_idem := by decide
  join_comm := by decide
  join_assoc := by decide
  join_idem := by decide
  absorb_mj := by decide
  absorb_jm := by decide
  top := true
  bot := false
  meet_top := by decide
  join_bot := by decide
  fuse := (· && ·)
  imp := boolImp
  one := true
  fuse_comm := by decide
  fuse_assoc := by decide
  fuse_one := by decide
  fuse_imp_adj := by decide
  one_eq_top := by decide

/-! The general derivations specialize to `Two`; here we re-confirm them via the
finite Boolean computation. `Two.le x y` unfolds to `Two.meet x y = x`, a
decidable `Bool` equation, so each goal `decide`s after `show`. -/

example : ∀ a b : Bool, Two.le (Two.fuse a b) (Two.meet a b) :=
  fun a b => Two.fuse_le_meet a b
example : ∀ a b : Bool, Two.le (Two.fuse (Two.imp a b) a) b :=
  fun a b => Two.modus_ponens a b
example : ∀ a : Bool, Two.le a Two.one :=
  fun a => Two.le_one a

/-- The same three, discharged purely by the finite computation, confirming the
general proofs agree with `decide` on the concrete carrier. -/
example : ∀ a b : Bool, (Two.fuse a b && Two.meet a b) = Two.fuse a b := by decide
example : ∀ a b : Bool, (Two.fuse (Two.imp a b) a && b) = Two.fuse (Two.imp a b) a := by
  decide
example : ∀ a : Bool, (a && Two.one) = a := by decide

end Order
end RelMath