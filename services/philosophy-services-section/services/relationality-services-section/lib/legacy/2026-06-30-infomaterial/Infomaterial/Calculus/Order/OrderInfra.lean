import Infomaterial.Language.Settling

/-!
# OrderInfra — the order-theory interface as first-class objects (DERIVED, L0)

Received order theory is a **degenerate specialization** of the settling chain: order is what
settling generates. The spine built the knowledge order ad hoc inside `Settling` and a
Heyting algebra inside `Positing.Bigraded`; this module gives the **standalone** order
hierarchy the rest of the backlog (KnasterTarski, ResiduatedLattice, the application
algebras) builds on — dependency-free, in `namespace Order`.

`Preorder → PartialOrder` (relational); `Lattice → BoundedLattice → DistributiveLattice`
(algebraic, order `a ≤ b := a ⊓ b = a`, with `∧`/`∨` proven glb/lub and the two orders
shown to agree); `CompleteLattice` (arbitrary `sSup`/`sInf` with universal properties —
the substrate for Knaster–Tarski); `Monotone`. No free data.
-/

namespace Infomaterial
namespace Order

/-! ## Relational hierarchy -/

/-- A preorder: reflexive, transitive. -/
structure Preorder where
  carrier : Type
  le : carrier → carrier → Prop
  le_refl : ∀ a, le a a
  le_trans : ∀ {a b c}, le a b → le b c → le a c

/-- A partial order adds antisymmetry. -/
structure PartialOrder extends Preorder where
  le_antisymm : ∀ {a b}, le a b → le b a → a = b

/-- A monotone map between preorders. -/
structure Monotone (P Q : Preorder) where
  map : P.carrier → Q.carrier
  mono : ∀ {a b}, P.le a b → Q.le (map a) (map b)

/-! ## Algebraic lattice, with derived order -/

/-- A lattice given algebraically (commutative/associative/idempotent `∧`,`∨` linked by
absorption). Order: `a ≤ b := a ⊓ b = a`. -/
structure Lattice where
  carrier : Type
  meet : carrier → carrier → carrier
  join : carrier → carrier → carrier
  meet_comm : ∀ a b, meet a b = meet b a
  meet_assoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  meet_idem : ∀ a, meet a a = a
  join_comm : ∀ a b, join a b = join b a
  join_assoc : ∀ a b c, join (join a b) c = join a (join b c)
  join_idem : ∀ a, join a a = a
  absorb_mj : ∀ a b, meet a (join a b) = a
  absorb_jm : ∀ a b, join a (meet a b) = a

namespace Lattice
variable (L : Lattice)

/-- The lattice order `a ≤ b ⇔ a ⊓ b = a`. -/
def le (a b : L.carrier) : Prop := L.meet a b = a

theorem le_refl (a : L.carrier) : L.le a a := L.meet_idem a
theorem le_trans {a b c : L.carrier} (h1 : L.le a b) (h2 : L.le b c) : L.le a c := by
  show L.meet a c = a
  calc L.meet a c = L.meet (L.meet a b) c := by rw [h1]
    _ = L.meet a (L.meet b c) := L.meet_assoc a b c
    _ = L.meet a b := by rw [h2]
    _ = a := h1
theorem le_antisymm {a b : L.carrier} (h1 : L.le a b) (h2 : L.le b a) : a = b := by
  rw [← h1, L.meet_comm]; exact h2

/-- `∧` is the greatest lower bound. -/
theorem meet_le_left (a b : L.carrier) : L.le (L.meet a b) a := by
  show L.meet (L.meet a b) a = L.meet a b
  rw [L.meet_assoc, L.meet_comm b a, ← L.meet_assoc, L.meet_idem]
theorem meet_le_right (a b : L.carrier) : L.le (L.meet a b) b := by
  rw [L.meet_comm a b]; exact L.meet_le_left b a
theorem le_meet {a b c : L.carrier} (h1 : L.le c a) (h2 : L.le c b) :
    L.le c (L.meet a b) := by
  show L.meet c (L.meet a b) = c; rw [← L.meet_assoc, h1, h2]

/-- The meet-order and join-order agree: `a ≤ b ⇔ a ⊔ b = b`. -/
theorem le_iff_join (a b : L.carrier) : L.le a b ↔ L.join a b = b := by
  constructor
  · intro h
    calc L.join a b = L.join (L.meet a b) b := by rw [h]
      _ = L.join b (L.meet a b) := L.join_comm _ _
      _ = L.join b (L.meet b a) := by rw [L.meet_comm a b]
      _ = b := L.absorb_jm b a
  · intro h
    show L.meet a b = a
    calc L.meet a b = L.meet a (L.join a b) := by rw [h]
      _ = a := L.absorb_mj a b

/-- `∨` is the least upper bound. -/
theorem le_join_left (a b : L.carrier) : L.le a (L.join a b) := L.absorb_mj a b
theorem le_join_right (a b : L.carrier) : L.le b (L.join a b) := by
  show L.meet b (L.join a b) = b; rw [L.join_comm]; exact L.absorb_mj b a
theorem join_le {a b c : L.carrier} (h1 : L.le a c) (h2 : L.le b c) :
    L.le (L.join a b) c := by
  rw [L.le_iff_join]
  calc L.join (L.join a b) c = L.join a (L.join b c) := L.join_assoc a b c
    _ = L.join a c := by rw [(L.le_iff_join b c).1 h2]
    _ = c := (L.le_iff_join a c).1 h1

end Lattice

/-- A bounded lattice: `⊤`/`⊥` as `∧`/`∨` identities (hence greatest/least). -/
structure BoundedLattice extends Lattice where
  top : carrier
  bot : carrier
  meet_top : ∀ a, meet a top = a
  join_bot : ∀ a, join a bot = a

namespace BoundedLattice
variable (B : BoundedLattice)
theorem le_top (a : B.carrier) : B.toLattice.le a B.top := B.meet_top a
theorem bot_le (a : B.carrier) : B.toLattice.le B.bot a := by
  rw [B.toLattice.le_iff_join, B.join_comm]; exact B.join_bot a
end BoundedLattice

/-- A distributive lattice. -/
structure DistributiveLattice extends Lattice where
  meet_join_distrib : ∀ a b c, meet a (join b c) = join (meet a b) (meet a c)

/-! ## Complete lattice (the Knaster–Tarski substrate) -/

/-- A complete lattice: a partial order with an arbitrary supremum operator `sSup` over
predicate-indexed sets, satisfying the universal property. `sInf` and `⊤`/`⊥` derive. -/
structure CompleteLattice where
  carrier : Type
  le : carrier → carrier → Prop
  le_refl : ∀ a, le a a
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  le_antisymm : ∀ {a b}, le a b → le b a → a = b
  sSup : (carrier → Prop) → carrier
  le_sSup : ∀ (S : carrier → Prop) a, S a → le a (sSup S)
  sSup_le : ∀ (S : carrier → Prop) b, (∀ a, S a → le a b) → le (sSup S) b

namespace CompleteLattice
variable (C : CompleteLattice)

/-- The infimum: the greatest lower bound = sup of all lower bounds. -/
def sInf (S : C.carrier → Prop) : C.carrier := C.sSup (fun b => ∀ a, S a → C.le b a)
/-- The top and bottom. -/
def top : C.carrier := C.sSup (fun _ => True)
def bot : C.carrier := C.sSup (fun _ => False)

theorem le_top (a : C.carrier) : C.le a C.top := C.le_sSup _ a trivial
theorem bot_le (a : C.carrier) : C.le C.bot a := C.sSup_le _ a (fun _ h => h.elim)

/-- `sInf` is a lower bound. -/
theorem sInf_le (S : C.carrier → Prop) (a : C.carrier) (h : S a) : C.le (C.sInf S) a :=
  C.sSup_le _ a (fun b hb => hb a h)
/-- `sInf` is the greatest lower bound. -/
theorem le_sInf (S : C.carrier → Prop) (b : C.carrier) (h : ∀ a, S a → C.le b a) :
    C.le b (C.sInf S) := C.le_sSup _ b h

end CompleteLattice

end Order
end Infomaterial
