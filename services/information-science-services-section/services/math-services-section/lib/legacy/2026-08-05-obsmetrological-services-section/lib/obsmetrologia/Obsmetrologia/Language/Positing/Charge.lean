import Obsmetrologia.Articulation.Articulating.Cell

/-!
# Positing — admitting value

Positing is the morphism out of the *potential predication cell* that **admits
value**. Predicating produced a value-free cell `φ = (s, p, o)`; positing says
*with what standing* it is asserted — and standing is a **bilattice charge**.

The spine of the design: the charge is **the same four-point object as the
articulation phases**, met here as *value* rather than as articulation status.
So the value carrier is literally `Articulating.Corner` — derived, not postulated:

| Charge            | positive | negative | reading                | phase     |
|-------------------|----------|----------|------------------------|-----------|
| knowledge-bottom  | ✗        | ✗        | told none               | absurd    |
| positive (true)   | ✓        | ✗        | told true               | potential |
| negative (false)  | ✗        | ✓        | told false              | active    |
| knowledge-top     | ✓        | ✓        | told both               | stable    |

The bilattice `L^twist` over the two-element residuated lattice **2** carries two
orders — **knowledge** `≤ₖ` (both slots increasing) and **truth** `≤ₜ` (positive
up, negative down) — with six operations. A **valuation** assigns a charge to each
predication cell; positing seeds the **knowledge-least** valuation (⊥ₖ everywhere).
-/

namespace Obsmetrologia

/-- A charge — the bilattice value. *The same four-point object as the articulation
phases* (`Articulating.Corner`), met as value. -/
abbrev Charge := Articulating.Corner

namespace Charge

/-- The positive (evidence-for) slot of a charge. -/
def pos (c : Charge) : Bool := (Articulating.Corner.toStatus c).1
/-- The negative (evidence-against) slot of a charge. -/
def neg (c : Charge) : Bool := (Articulating.Corner.toStatus c).2
/-- Build a charge from its two slots. -/
def ofSlots (p n : Bool) : Charge := Articulating.Corner.ofStatus p n

@[simp] theorem pos_ofSlots (p n : Bool) : pos (ofSlots p n) = p := by
  simp [pos, ofSlots, Articulating.Corner.toStatus_ofStatus]
@[simp] theorem neg_ofSlots (p n : Bool) : neg (ofSlots p n) = n := by
  simp [neg, ofSlots, Articulating.Corner.toStatus_ofStatus]
@[simp] theorem ofSlots_pos_neg (c : Charge) : ofSlots c.pos c.neg = c := by
  cases c <;> rfl

/-! ## The four distinguished charges -/

/-- Knowledge-bottom ⊥ₖ — told none. = absurd. -/
def kBot : Charge := Articulating.Corner.absurd
/-- Knowledge-top ⊤ₖ — told both; a held contradiction. = stable. -/
def kTop : Charge := Articulating.Corner.stable
/-- Truth-top t — told true only. = potential. -/
def tTop : Charge := Articulating.Corner.potential
/-- Truth-bottom f — told false only. = active. -/
def tBot : Charge := Articulating.Corner.active

/-! ## Six operations (Boolean slot algebra) -/

/-- Joining-knowledge ∨ₖ — presence-union; the ≤ₖ lub. -/
def joinK (a b : Charge) : Charge := ofSlots (a.pos || b.pos) (a.neg || b.neg)
/-- Meeting-knowledge ∧ₖ — presence-intersection; the ≤ₖ glb. -/
def meetK (a b : Charge) : Charge := ofSlots (a.pos && b.pos) (a.neg && b.neg)
/-- Joining-truth ∨ₜ — positive union, negative intersection. -/
def joinT (a b : Charge) : Charge := ofSlots (a.pos || b.pos) (a.neg && b.neg)
/-- Meeting-truth ∧ₜ — positive intersection, negative union. -/
def meetT (a b : Charge) : Charge := ofSlots (a.pos && b.pos) (a.neg || b.neg)
/-- Negating — swap the two slots: reverses truth, preserves knowledge, self-inverse. -/
def negate (a : Charge) : Charge := ofSlots a.neg a.pos
/-- Comparing-knowledge — the ≤ₖ witness. -/
def leK (a b : Charge) : Bool := (!a.pos || b.pos) && (!a.neg || b.neg)
/-- Comparing-truth — the ≤ₜ witness (positive up, negative down). -/
def leT (a b : Charge) : Bool := (!a.pos || b.pos) && (!b.neg || a.neg)

/-! ## Lattice laws for each order (proved by finite exhaustion) -/

@[simp] theorem joinK_comm (a b : Charge) : joinK a b = joinK b a := by
  cases a <;> cases b <;> rfl
@[simp] theorem meetK_comm (a b : Charge) : meetK a b = meetK b a := by
  cases a <;> cases b <;> rfl
theorem joinK_assoc (a b c : Charge) : joinK (joinK a b) c = joinK a (joinK b c) := by
  cases a <;> cases b <;> cases c <;> rfl
theorem meetK_assoc (a b c : Charge) : meetK (meetK a b) c = meetK a (meetK b c) := by
  cases a <;> cases b <;> cases c <;> rfl
@[simp] theorem joinK_idem (a : Charge) : joinK a a = a := by cases a <;> rfl
@[simp] theorem meetK_idem (a : Charge) : meetK a a = a := by cases a <;> rfl
theorem absorbK₁ (a b : Charge) : joinK a (meetK a b) = a := by cases a <;> cases b <;> rfl
theorem absorbK₂ (a b : Charge) : meetK a (joinK a b) = a := by cases a <;> cases b <;> rfl

/-- Joining-knowledge climbs: `a ≤ₖ a ∨ₖ b`. -/
theorem leK_joinK_left (a b : Charge) : leK a (joinK a b) = true := by
  cases a <;> cases b <;> decide

/-- Joining-knowledge climbs from the other side: `b ≤ₖ a ∨ₖ b`. -/
theorem leK_joinK_right (a b : Charge) : leK b (joinK a b) = true := by
  cases a <;> cases b <;> decide

theorem joinT_comm (a b : Charge) : joinT a b = joinT b a := by cases a <;> cases b <;> rfl
theorem meetT_comm (a b : Charge) : meetT a b = meetT b a := by cases a <;> cases b <;> rfl
theorem joinT_assoc (a b c : Charge) : joinT (joinT a b) c = joinT a (joinT b c) := by
  cases a <;> cases b <;> cases c <;> rfl
theorem meetT_assoc (a b c : Charge) : meetT (meetT a b) c = meetT a (meetT b c) := by
  cases a <;> cases b <;> cases c <;> rfl

/-! ## Bottom/top and distributivity -/

/-- ⊥ₖ is the identity of joining-knowledge — the value seeded before any
assertion. -/
@[simp] theorem joinK_kBot (a : Charge) : joinK kBot a = a := by cases a <;> rfl
/-- ⊤ₖ is the identity of meeting-knowledge. -/
@[simp] theorem meetK_kTop (a : Charge) : meetK kTop a = a := by cases a <;> rfl

/-- ⊥ₖ is the ≤ₖ-least charge — every charge sits above the seeded bottom. -/
theorem kBot_leK (a : Charge) : leK kBot a = true := by cases a <;> rfl
/-- ⊤ₖ is the ≤ₖ-greatest charge. -/
theorem leK_kTop (a : Charge) : leK a kTop = true := by cases a <;> rfl

/-- The bilattice is **distributive**: ∧ₖ over ∨ₖ (one of the twelve interlaced
distributive laws; the rest are the same finite check). -/
theorem meetK_joinK_distrib (a b c : Charge) :
    meetK a (joinK b c) = joinK (meetK a b) (meetK a c) := by
  cases a <;> cases b <;> cases c <;> rfl
/-- Truth meet distributes over knowledge join — an *interlaced* law crossing the
two orders, the hallmark of a distributive bilattice. -/
theorem meetT_joinK_distrib (a b c : Charge) :
    meetT a (joinK b c) = joinK (meetT a b) (meetT a c) := by
  cases a <;> cases b <;> cases c <;> rfl

/-! ## Negation: the link between the two orders -/

/-- Negating is self-inverse. -/
@[simp] theorem negate_negate (a : Charge) : negate (negate a) = a := by cases a <;> rfl
/-- Negating **preserves** the knowledge order. -/
theorem negate_leK (a b : Charge) : leK (negate a) (negate b) = leK a b := by
  cases a <;> cases b <;> rfl
/-- Negating **reverses** the truth order. -/
theorem negate_leT (a b : Charge) : leT (negate a) (negate b) = leT b a := by
  cases a <;> cases b <;> rfl
/-- Negation swaps the truth poles and fixes the knowledge poles — the four-point
geometry of FOUR. -/
@[simp] theorem negate_tTop : negate tTop = tBot := rfl
@[simp] theorem negate_tBot : negate tBot = tTop := rfl
@[simp] theorem negate_kBot : negate kBot = kBot := rfl
@[simp] theorem negate_kTop : negate kTop = kTop := rfl

end Charge

end Obsmetrologia
