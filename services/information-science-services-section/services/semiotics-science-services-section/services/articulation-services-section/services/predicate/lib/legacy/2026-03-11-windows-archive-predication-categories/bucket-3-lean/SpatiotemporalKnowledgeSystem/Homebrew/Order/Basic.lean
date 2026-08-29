/-!
# Minimal order-theoretic tower

`Preorder`, `PartialOrder`, `SemilatticeInf`, `SemilatticeSup`, `Lattice`,
`BoundedOrder`, `BoundedLattice`. Signatures mirror Mathlib's so a future
port would be mechanical, but this file has no Mathlib dependency.

The lattice meet/join `⊓`/`⊔` are `Inf`/`Sup`, kept distinct from the core
`Min`/`Max` typeclasses (which are about totally-ordered min/max).

`HasTop`/`HasBot` are deliberately *not* named `Top`/`Bot` to avoid
collision with mathlib's identically-shaped classes when downstream
(categorical) modules import both — the notation is identical, so
end-users see `⊤`/`⊥` either way.
-/

universe u

/-! ## Inf / Sup typeclasses -/

class Inf (α : Type u) where
  inf : α → α → α

class Sup (α : Type u) where
  sup : α → α → α

infixl:69 " ⊓ " => Inf.inf
infixl:68 " ⊔ " => Sup.sup

/-! ## Top / Bot typeclasses -/

class HasTop (α : Type u) where
  top : α

class HasBot (α : Type u) where
  bot : α

notation "⊤" => HasTop.top
notation "⊥" => HasBot.bot

/-! ## Preorder, PartialOrder -/

class Preorder (α : Type u) extends LE α where
  le_refl  : ∀ a : α, a ≤ a
  le_trans : ∀ {a b c : α}, a ≤ b → b ≤ c → a ≤ c

namespace Preorder
variable {α : Type u} [Preorder α]

theorem le_rfl {a : α} : a ≤ a := le_refl a

end Preorder

class PartialOrder (α : Type u) extends Preorder α where
  le_antisymm : ∀ {a b : α}, a ≤ b → b ≤ a → a = b

/-! ## Semilattices, Lattice -/

class SemilatticeInf (α : Type u) extends PartialOrder α, Inf α where
  inf_le_left  : ∀ a b : α, a ⊓ b ≤ a
  inf_le_right : ∀ a b : α, a ⊓ b ≤ b
  le_inf       : ∀ {a b c : α}, a ≤ b → a ≤ c → a ≤ b ⊓ c

class SemilatticeSup (α : Type u) extends PartialOrder α, Sup α where
  le_sup_left  : ∀ a b : α, a ≤ a ⊔ b
  le_sup_right : ∀ a b : α, b ≤ a ⊔ b
  sup_le       : ∀ {a b c : α}, a ≤ c → b ≤ c → a ⊔ b ≤ c

class Lattice (α : Type u) extends SemilatticeInf α, SemilatticeSup α

/-! ## Bounded order, bounded lattice -/

class OrderTop (α : Type u) [LE α] extends HasTop α where
  le_top : ∀ a : α, a ≤ (⊤ : α)

class OrderBot (α : Type u) [LE α] extends HasBot α where
  bot_le : ∀ a : α, (⊥ : α) ≤ a

class BoundedOrder (α : Type u) [LE α] extends OrderTop α, OrderBot α

class BoundedLattice (α : Type u) extends Lattice α, BoundedOrder α

/-! ## Field re-exports for unprefixed access

`le_refl a` instead of `Preorder.le_refl a`, etc. -/

export Preorder      (le_refl le_trans)
export PartialOrder  (le_antisymm)
export SemilatticeInf (inf_le_left inf_le_right le_inf)
export SemilatticeSup (le_sup_left le_sup_right sup_le)
export OrderTop      (le_top)
export OrderBot      (bot_le)
-- Equational consequences are exported below, after their definitions.

/-! ## Lattice equational consequences -/

namespace SemilatticeInf
variable {α : Type u} [SemilatticeInf α]

theorem inf_comm (a b : α) : a ⊓ b = b ⊓ a :=
  le_antisymm
    (le_inf (inf_le_right a b) (inf_le_left a b))
    (le_inf (inf_le_right b a) (inf_le_left b a))

theorem inf_assoc (a b c : α) : (a ⊓ b) ⊓ c = a ⊓ (b ⊓ c) :=
  le_antisymm
    (le_inf
      (le_trans (inf_le_left _ _) (inf_le_left _ _))
      (le_inf (le_trans (inf_le_left _ _) (inf_le_right _ _)) (inf_le_right _ _)))
    (le_inf
      (le_inf (inf_le_left _ _) (le_trans (inf_le_right _ _) (inf_le_left _ _)))
      (le_trans (inf_le_right _ _) (inf_le_right _ _)))

theorem inf_idem (a : α) : a ⊓ a = a :=
  le_antisymm (inf_le_left _ _) (le_inf (le_refl _) (le_refl _))

/-- `a ⊓ b = a ↔ a ≤ b`. -/
theorem inf_eq_left {a b : α} : a ⊓ b = a ↔ a ≤ b := by
  refine ⟨fun h => ?_, fun h => ?_⟩
  · exact h ▸ inf_le_right a b
  · exact le_antisymm (inf_le_left _ _) (le_inf (le_refl _) h)

end SemilatticeInf

namespace SemilatticeSup
variable {α : Type u} [SemilatticeSup α]

theorem sup_comm (a b : α) : a ⊔ b = b ⊔ a :=
  le_antisymm
    (sup_le (le_sup_right b a) (le_sup_left b a))
    (sup_le (le_sup_right a b) (le_sup_left a b))

theorem sup_assoc (a b c : α) : (a ⊔ b) ⊔ c = a ⊔ (b ⊔ c) :=
  le_antisymm
    (sup_le
      (sup_le (le_sup_left _ _) (le_trans (le_sup_left _ _) (le_sup_right _ _)))
      (le_trans (le_sup_right _ _) (le_sup_right _ _)))
    (sup_le
      (le_trans (le_sup_left _ _) (le_sup_left _ _))
      (sup_le (le_trans (le_sup_right _ _) (le_sup_left _ _)) (le_sup_right _ _)))

theorem sup_idem (a : α) : a ⊔ a = a :=
  le_antisymm (sup_le (le_refl _) (le_refl _)) (le_sup_left _ _)

/-- `a ⊔ b = a ↔ b ≤ a`. -/
theorem sup_eq_left {a b : α} : a ⊔ b = a ↔ b ≤ a := by
  refine ⟨fun h => ?_, fun h => ?_⟩
  · exact h ▸ le_sup_right a b
  · exact le_antisymm (sup_le (le_refl _) h) (le_sup_left _ _)

end SemilatticeSup

namespace Lattice
variable {α : Type u} [Lattice α]

theorem inf_sup_absorb (a b : α) : a ⊓ (a ⊔ b) = a :=
  le_antisymm (inf_le_left _ _) (le_inf (le_refl _) (le_sup_left _ _))

theorem sup_inf_absorb (a b : α) : a ⊔ (a ⊓ b) = a :=
  le_antisymm (sup_le (le_refl _) (inf_le_left _ _)) (le_sup_left _ _)

end Lattice

export SemilatticeInf (inf_comm inf_assoc inf_idem inf_eq_left)
export SemilatticeSup (sup_comm sup_assoc sup_idem sup_eq_left)
export Lattice (inf_sup_absorb sup_inf_absorb)
