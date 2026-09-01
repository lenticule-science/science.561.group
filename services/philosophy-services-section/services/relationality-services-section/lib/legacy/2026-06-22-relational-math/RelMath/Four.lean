/-
# FOUR — the capstone

The number **four** recurs across the whole spine, and the corpus's claim is that
these are not analogies but **one four-element object met at successive depths**:

* the four **articulation phases** `Corner` — potential / active / stable / absurd;
* the four **bilattice charges** `Charge` — ⊥ₖ / t / f / ⊤ₖ (here `Charge := Corner`,
  so this identity is *definitional*: the same object, re-met as value);
* the four **status pairs** `Bool × Bool` — `(token, claim)` = `(positive, negative)`;
* the four **predicate generators** — specialization / converse / subject- and
  object-projection.

This module proves the identifications (a bijection `Corner ≃ Bool × Bool`, the
counts) and the **Klein-four symmetry** `K₄ = ⟨~, −⟩` of FOUR: negation `~` (swap)
and conflation `−` (complemented swap) are commuting involutions whose four
composites `{id, ~, −, ~∘−}` act as `ℤ/2 × ℤ/2`, with `~` preserving `≤ₖ` /
reversing `≤ₜ`, `−` preserving `≤ₜ` / reversing `≤ₖ`, and `~∘−` reversing both —
the two orders' duality made a group.
-/
import RelMath.TruthOrder

namespace RelMath

/-! ## The recurring four is one object -/

/-- A bare bijection (no Mathlib `Equiv`). -/
structure Bij (α β : Type) where
  to : α → β
  inv : β → α
  left : ∀ a, inv (to a) = a
  right : ∀ b, to (inv b) = b

/-- The four articulation phases are the four status pairs: `Corner ≃ Bool × Bool`,
via `(token-articulated, claim-articulated) = (positive, negative)`. -/
def cornerStatus : Bij Corner (Bool × Bool) where
  to c := c.toStatus
  inv := fun s => Corner.ofStatus s.1 s.2
  left c := by cases c <;> rfl
  right := fun s => by cases s with | mk p n => cases p <;> cases n <;> rfl

/-- The four predicate generators — the morphism classes of the predication
category. -/
inductive Generator
  | specialization
  | converse
  | subjectProjection
  | objectProjection
  deriving DecidableEq, Repr

namespace Generator
def all : List Generator := [specialization, converse, subjectProjection, objectProjection]
theorem mem_all (g : Generator) : g ∈ all := by cases g <;> decide
theorem card_eq_four : all.length = 4 := rfl
end Generator

/-- **The four-fold identity.** Every incarnation of the recurring four has exactly
four elements: the articulation phases, the predicate generators — and the charges
*are* the phases (`Charge := Corner`, definitionally). One object, met at depth. -/
theorem four_fold : Corner.all.length = 4 ∧ Generator.all.length = 4 := ⟨rfl, rfl⟩

/-- The charge/phase identity is definitional: a bilattice charge **is** an
articulation phase, re-met as value. -/
theorem charge_is_phase (c : Corner) : (c : Charge) = c := rfl

/-! ## The Klein-four symmetry K₄ = ⟨~, −⟩ -/

namespace Charge

/-- Conflation `−`: the knowledge-negation, `⟨a,b⟩ ↦ ⟨¬b, ¬a⟩`. Swaps ⊥↔⊤, fixes
t and f. (Negation `~` = `negate`, the coordinate swap, is in `Positing`.) -/
def conflate (a : Charge) : Charge := ofSlots (!a.neg) (!a.pos)

/-- `~∘−`: coordinatewise complement, `⟨a,b⟩ ↦ ⟨¬a, ¬b⟩` — the third nontrivial
element of K₄. -/
def negConf (a : Charge) : Charge := ofSlots (!a.pos) (!a.neg)

/-! ### The two generators are commuting involutions -/

@[simp] theorem conflate_conflate (a : Charge) : conflate (conflate a) = a := by cases a <;> rfl
/-- The generators **commute**: `~∘− = −∘~`. -/
theorem negate_conflate_comm (a : Charge) : negate (conflate a) = conflate (negate a) := by
  cases a <;> rfl
/-- Their composite is the coordinatewise complement. -/
theorem negate_conflate (a : Charge) : negate (conflate a) = negConf a := by cases a <;> rfl
@[simp] theorem negConf_negConf (a : Charge) : negConf (negConf a) = a := by cases a <;> rfl

/-! ### The action of K₄ on FOUR (the table) -/

@[simp] theorem conflate_kBot : conflate kBot = kTop := rfl
@[simp] theorem conflate_kTop : conflate kTop = kBot := rfl
@[simp] theorem conflate_tTop : conflate tTop = tTop := rfl
@[simp] theorem conflate_tBot : conflate tBot = tBot := rfl

/-- The `~`-orbit `{t, f}` is fixed by `−`; the `−`-orbit `{⊥, ⊤}` is fixed by `~`.
Each non-identity generator has exactly one 2-orbit and two fixed points — the
extreme pair of one order, the incomparable middle of the other. -/
theorem negate_orbit : negate tTop = tBot ∧ negate tBot = tTop
    ∧ negate kBot = kBot ∧ negate kTop = kTop := ⟨rfl, rfl, rfl, rfl⟩
theorem conflate_orbit : conflate kBot = kTop ∧ conflate kTop = kBot
    ∧ conflate tTop = tTop ∧ conflate tBot = tBot := ⟨rfl, rfl, rfl, rfl⟩

/-! ### Each generator's effect on the two orders -/

/-- `~` preserves the knowledge order. -/
theorem negate_preserves_kle (a b : Charge) : KLE (negate a) (negate b) ↔ KLE a b := by
  simp only [KLE, negate_leK]
/-- `~` reverses the truth order. -/
theorem negate_reverses_tle (a b : Charge) : TLE (negate a) (negate b) ↔ TLE b a := by
  simp only [TLE, negate_leT]
/-- `−` reverses the knowledge order. -/
theorem conflate_reverses_kle (a b : Charge) : KLE (conflate a) (conflate b) ↔ KLE b a := by
  cases a <;> cases b <;> decide
/-- `−` preserves the truth order. -/
theorem conflate_preserves_tle (a b : Charge) : TLE (conflate a) (conflate b) ↔ TLE a b := by
  cases a <;> cases b <;> decide
/-- `~∘−` reverses **both** orders. -/
theorem negConf_reverses_kle (a b : Charge) : KLE (negConf a) (negConf b) ↔ KLE b a := by
  cases a <;> cases b <;> decide
theorem negConf_reverses_tle (a b : Charge) : TLE (negConf a) (negConf b) ↔ TLE b a := by
  cases a <;> cases b <;> decide

/-- **The Klein-four group.** `{id, ~, −, ~∘−}` is closed and every element is an
involution: `K₄ ≅ ℤ/2 × ℤ/2`, the natural symmetry group of FOUR with both
negation and conflation. (Closure: the product of any two is again one of the
four — witnessed by `negate_conflate` and the involution laws.) -/
theorem klein_four (a : Charge) :
    negate (negate a) = a ∧ conflate (conflate a) = a ∧ negConf (negConf a) = a
      ∧ negate (conflate a) = negConf a ∧ conflate (negate a) = negConf a := by
  refine ⟨negate_negate a, conflate_conflate a, negConf_negConf a, negate_conflate a, ?_⟩
  rw [← negate_conflate_comm]; exact negate_conflate a

end Charge

end RelMath
