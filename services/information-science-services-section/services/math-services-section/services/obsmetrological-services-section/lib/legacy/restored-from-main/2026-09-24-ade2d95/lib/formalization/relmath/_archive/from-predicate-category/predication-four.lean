import PredicationCategories.Homebrew.Algebra.TwistProduct

/-!
# The two-element Boolean lattice `Two` and the four-element bilattice `FOUR`

`Two` is the two-element Boolean lattice — an integral commutative residuated
lattice with `· = ⊓`, `1 = ⊤`, and residuum `→` classical implication.

`FOUR := TwistProduct Two` is the smallest non-trivial bilattice, with
canonical elements:
- `FOUR.t` (told true)   `= ⟨one, zero⟩`
- `FOUR.f` (told false)  `= ⟨zero, one⟩`
- `(⊥ : FOUR)` (told nothing) `= ⟨zero, zero⟩`
- `(⊤ : FOUR)` (told both)    `= ⟨one, one⟩`

Everything here is computable: `#eval` works on bilattice operations and the
residuation theorem reduces by `rfl` on ground instances.
-/

inductive Two : Type
  | zero : Two
  | one  : Two
  deriving DecidableEq, Repr

namespace Two

protected def le : Two → Two → Prop
  | .zero, _     => True
  | .one,  .zero => False
  | .one,  .one  => True

protected def inf : Two → Two → Two
  | .one, .one => .one
  | _,    _    => .zero

protected def sup : Two → Two → Two
  | .zero, .zero => .zero
  | _,     _     => .one

protected def residuum : Two → Two → Two
  | .zero, _ => .one
  | .one,  b => b

end Two

instance : LE  Two := ⟨Two.le⟩

instance decLe : ∀ a b : Two, Decidable (a ≤ b)
  | .zero, _    => isTrue trivial
  | .one,  .zero => isFalse id
  | .one,  .one  => isTrue trivial
instance : Inf Two := ⟨Two.inf⟩
instance : Sup Two := ⟨Two.sup⟩
instance : Mul Two := ⟨Two.inf⟩
instance : One Two := ⟨Two.one⟩
instance : HasTop Two := ⟨Two.one⟩
instance : HasBot Two := ⟨Two.zero⟩

instance : Preorder Two where
  le_refl a := by cases a <;> trivial
  le_trans {a b c} h₁ h₂ := by
    cases a <;> cases b <;> cases c <;>
      first | trivial | (cases h₁; done) | (cases h₂; done)

instance : PartialOrder Two where
  le_antisymm {a b} h₁ h₂ := by
    cases a <;> cases b
    · rfl
    · cases h₂
    · cases h₁
    · rfl

instance : SemilatticeInf Two where
  inf_le_left  a b := by cases a <;> cases b <;> trivial
  inf_le_right a b := by cases a <;> cases b <;> trivial
  le_inf {a b c} h₁ h₂ := by
    cases a <;> cases b <;> cases c <;>
      first | trivial | (cases h₁; done) | (cases h₂; done)

instance : SemilatticeSup Two where
  le_sup_left  a b := by cases a <;> cases b <;> trivial
  le_sup_right a b := by cases a <;> cases b <;> trivial
  sup_le {a b c} h₁ h₂ := by
    cases a <;> cases b <;> cases c <;>
      first | trivial | (cases h₁; done) | (cases h₂; done)

instance : Lattice Two where

instance : OrderTop Two where
  le_top a := by cases a <;> trivial

instance : OrderBot Two where
  bot_le a := by cases a <;> trivial

instance : BoundedOrder Two where

instance : ResiduatedLattice Two where
  mul_assoc a b c := by cases a <;> cases b <;> cases c <;> rfl
  one_mul   a     := by cases a <;> rfl
  mul_comm  a b   := by cases a <;> cases b <;> rfl
  residuum := Two.residuum
  mul_le_residuum {x y z} := by
    cases x <;> cases y <;> cases z <;> exact Iff.rfl

instance : IntegralResiduatedLattice Two where
  one_eq_top := rfl

/-! ## FOUR — the four-element bilattice -/

/-- The four-element bilattice, as the twist product of the Boolean lattice. -/
abbrev FOUR := TwistProduct Two

namespace FOUR

/-- Told true. -/
def t : FOUR := ⟨.one,  .zero⟩

/-- Told false. -/
def f : FOUR := ⟨.zero, .one⟩

end FOUR

/-- Knowledge top of `FOUR`: told both (conflict). -/
instance : HasTop FOUR := ⟨⟨.one, .one⟩⟩

/-- Knowledge bottom of `FOUR`: told nothing. -/
instance : HasBot FOUR := ⟨⟨.zero, .zero⟩⟩

/-! ## Worked example: Belnap's three-agent epistemic predication settling

From `examples/multi-agent-epistemic-settling.md`. Three agents report on
"Paris is the capital of France": A1 yes, A2 yes, A3 no. The settling
collects evidence via the knowledge-order join `∨_k = supK`.

Each step is `rfl`-decidable on `FOUR`. -/

-- τ=1: ⊥ ∨ₖ t = t
example : TwistProduct.supK (⊥ : FOUR) FOUR.t = FOUR.t := rfl

-- τ=2: t ∨ₖ t = t (no change)
example : TwistProduct.supK FOUR.t FOUR.t = FOUR.t := rfl

-- τ=3: t ∨ₖ f = ⊤  — the community is inconsistent
example : TwistProduct.supK FOUR.t FOUR.f = (⊤ : FOUR) := rfl

/-- The full Belnap settling collapses to ⊤. -/
example :
    TwistProduct.supK
      (TwistProduct.supK
        (TwistProduct.supK (⊥ : FOUR) FOUR.t)
        FOUR.t)
      FOUR.f
    = (⊤ : FOUR) := rfl

/-! ## Negation behaviour on FOUR -/

example : TwistProduct.negation FOUR.t = FOUR.f := rfl
example : TwistProduct.negation FOUR.f = FOUR.t := rfl
example : TwistProduct.negation (⊥ : FOUR) = (⊥ : FOUR) := rfl
example : TwistProduct.negation (⊤ : FOUR) = (⊤ : FOUR) := rfl
