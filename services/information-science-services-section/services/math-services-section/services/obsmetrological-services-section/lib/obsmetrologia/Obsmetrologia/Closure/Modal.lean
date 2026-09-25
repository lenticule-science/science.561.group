import Obsmetrologia.Language.Predicating.Quantifying
import Obsmetrologia.Language.Settling
import Obsmetrologia.Closure.Monad

/-!
# ModalPairAdjunction — the modal pair ◇⊣□ on valuations, and its closure

This module derives the **modal pair** of the valuation, exactly as the corpus
states it in `positing/.../valuation/{possibilizing,necessitating}`:

* **possibilizing** (`possibilize`, ◇) raises each cell's charge to the
  *knowledge-join* of the charges across the valuation's fiber — the bilattice
  join `∨ₖ` aggregated over a fiber. **Inflationary** ("what *could* become
  known"): `v ≤ₖ ◇v`.
* **necessitating** (`necessitate`, □) lowers each cell's charge to the
  *knowledge-meet* of the charges across the fiber — `∧ₖ` aggregated over a
  fiber. **Deflationary** ("what *must* hold"): `□v ≤ₖ v`.

These are literally `Quantifying.existsF` / `Quantifying.forallF` — the fiber
knowledge-join / knowledge-meet — over a **modal frame**: a `FiniteFibration`
whose fiber relation is an *accessibility* relation. We do not re-derive the
quantifiers; the modal operators ARE the fiber quantifiers, and the modal laws
are proven *about* them.

The corpus's modal pair lives at the regime where `commutating` becomes
invertible (`◇□ = □◇`) — the **equivalence-relation** (S5) frame: reflexive,
symmetric, transitive. Reflexivity makes ◇ inflationary / □ deflationary;
symmetry makes ◇ ⊣ □; the equivalence shape makes the composite a **closure / nucleus**.

We prove, faithful to the named corpus nodes:

1. **Galois adjunction ◇ ⊣ □** in the valuation knowledge order
   (`possibilize_adjoint_necessitate`): `leK (◇ v) w ↔ leK v (□ w)` — from
   *symmetry*. (The corpus's `ModalPair_adjoint` / `ModalAdjunction`.)
2. **◇ inflationary**, **□ deflationary** (from *reflexivity*).
3. **commutating** as the 2-cell `◇□v ≤ₖ □◇v` (`necessitate_possibilize_le`
   is the lax direction), invertible exactly on the settled fixed points.
4. The composite **settling** iterates — *possibilize then necessitate*,
   `closureOp v = necessitate (possibilize v)` — is a closure on the valuation
   knowledge order: **extensive** (`v ≤ₖ cl v`), **monotone**, **idempotent**.
   We show `settle` of it is its **least fixed point** above the seed — tying
   directly to `Settling.Closure` and the `ClosureMonad` / Knaster–Tarski
   machinery.
-/

namespace Obsmetrologia
namespace Valuation

open Charge

/-! ## Pointwise knowledge order on valuations — the order ◇/□ move along -/

/-- The pointwise knowledge order is **reflexive**. -/
theorem leK_refl (v : Valuation) : leK v v := fun φ => Charge.kle_refl (v φ)

/-- The pointwise knowledge order is **transitive**. -/
theorem leK_trans {u v w : Valuation} (h1 : leK u v) (h2 : leK v w) : leK u w :=
  fun φ => Charge.kle_trans _ _ _ (h1 φ) (h2 φ)

/-- The pointwise knowledge order is **antisymmetric** — a partial order
on valuations, lifting `Charge.kle_antisymm`. -/
theorem leK_antisymm {v w : Valuation} (h1 : leK v w) (h2 : leK w v) : v = w := by
  funext φ; exact Charge.kle_antisymm _ _ (h1 φ) (h2 φ)

/-! ## The modal frame — an accessibility relation as a finite fibration -/

/-- A **modal frame**: a `FiniteFibration` whose fiber `R φ` is the set of cells
*accessible from* `φ`, carrying the S5 shape under which the corpus's modal pair
lives — reflexive, symmetric, transitive. Reflexivity makes ◇ inflationary and □
deflationary; symmetry makes ◇ ⊣ □; the equivalence shape makes the composite a closure (the regime where `commutating` `◇□ = □◇` is invertible). -/
structure ModalFrame extends FiniteFibration where
  /-- Reflexive: every cell accesses itself. -/
  refl : ∀ φ, φ ∈ fiber φ
  /-- Symmetric: accessibility runs both ways. -/
  symm : ∀ φ ψ, ψ ∈ fiber φ → φ ∈ fiber ψ
  /-- Transitive: accessibility composes. -/
  trans : ∀ φ ψ χ, ψ ∈ fiber φ → χ ∈ fiber ψ → χ ∈ fiber φ

namespace ModalFrame

variable (M : ModalFrame)

/-- **Possibilizing** `◇` — the diamond: raise each cell to the *knowledge-join*
of the charges over its fiber. Exactly `existsF` over the frame. -/
def possibilize (v : Valuation) : Valuation := existsF M.toFiniteFibration v

/-- **Necessitating** `□` — the box: lower each cell to the *knowledge-meet* of
the charges over its fiber. Exactly `forallF` over the frame. -/
def necessitate (v : Valuation) : Valuation := forallF M.toFiniteFibration v

theorem possibilize_apply (v : Valuation) (φ : PredicationCell) :
    possibilize M v φ = Charge.joinList ((M.fiber φ).map v) := rfl

theorem necessitate_apply (v : Valuation) (φ : PredicationCell) :
    necessitate M v φ = Charge.meetList ((M.fiber φ).map v) := rfl

/-! ### ◇ inflationary, □ deflationary (from reflexivity) -/

/-- **◇ is inflationary** — `v ≤ₖ ◇v`. Possibilizing only moves a charge *up*
the knowledge order (each cell is one of its own fiber's joinands). -/
theorem le_possibilize (v : Valuation) : leK v (possibilize M v) := by
  intro φ
  exact Charge.le_joinList (v φ) _ (List.mem_map.2 ⟨φ, M.refl φ, rfl⟩)

/-- **□ is deflationary** — `□v ≤ₖ v`. Necessitating keeps each cell only to the
floor its fellow assignments force (the cell's own charge is a meetand). -/
theorem necessitate_le (v : Valuation) : leK (necessitate M v) v := by
  intro φ
  exact Charge.meetList_le (v φ) _ (List.mem_map.2 ⟨φ, M.refl φ, rfl⟩)

/-! ### Monotonicity of the modal operators -/

/-- **◇ is monotone** in the knowledge order. -/
theorem possibilize_mono {v w : Valuation} (h : leK v w) :
    leK (possibilize M v) (possibilize M w) := by
  intro φ
  refine Charge.joinList_le _ _ ?_
  intro a ha
  rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
  exact Charge.kle_trans _ _ _ (h ψ)
    (Charge.le_joinList (w ψ) _ (List.mem_map.2 ⟨ψ, hψ, rfl⟩))

/-- **□ is monotone** in the knowledge order. -/
theorem necessitate_mono {v w : Valuation} (h : leK v w) :
    leK (necessitate M v) (necessitate M w) := by
  intro φ
  refine Charge.le_meetList _ _ ?_
  intro a ha
  rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
  exact Charge.kle_trans _ _ _
    (Charge.meetList_le (v ψ) _ (List.mem_map.2 ⟨ψ, hψ, rfl⟩)) (h ψ)

/-! ## The Galois adjunction ◇ ⊣ □ -/

/-- **The modal pair adjunction `◇ ⊣ □`** in the valuation knowledge order:
`leK (◇ v) w ↔ leK v (□ w)`. This is the corpus's `ModalPair_adjoint`: the left
adjoint diamond is below `w` exactly when `v` is below the right adjoint box. It
holds precisely because accessibility is **symmetric** — `ψ ∈ R φ ↔ φ ∈ R ψ`. -/
theorem possibilize_adjoint_necessitate (v w : Valuation) :
    leK (possibilize M v) w ↔ leK v (necessitate M w) := by
  constructor
  · intro H ψ
    refine Charge.le_meetList (v ψ) _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨φ, hφ, rfl⟩
    have hψφ : ψ ∈ M.fiber φ := M.symm ψ φ hφ
    have h1 : Charge.KLE (v ψ) (possibilize M v φ) :=
      Charge.le_joinList (v ψ) _ (List.mem_map.2 ⟨ψ, hψφ, rfl⟩)
    exact Charge.kle_trans _ _ _ h1 (H φ)
  · intro H φ
    refine Charge.joinList_le (w φ) _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    have hφψ : φ ∈ M.fiber ψ := M.symm φ ψ hψ
    have h1 : Charge.KLE (necessitate M w ψ) (w φ) :=
      Charge.meetList_le (w φ) _ (List.mem_map.2 ⟨φ, hφψ, rfl⟩)
    exact Charge.kle_trans _ _ _ (H ψ) h1

/-- **Unit** `v ≤ₖ □◇v` of the Galois connection `◇ ⊣ □`. -/
theorem adjunction_unit (v : Valuation) : leK v (necessitate M (possibilize M v)) :=
  (possibilize_adjoint_necessitate M v (possibilize M v)).1 (leK_refl _)

/-- **Counit** `◇□w ≤ₖ w` of the Galois connection `◇ ⊣ □`. -/
theorem adjunction_counit (w : Valuation) : leK (possibilize M (necessitate M w)) w :=
  (possibilize_adjoint_necessitate M (necessitate M w) w).2 (leK_refl _)

/-! ## Commutating — the 2-cell `◇□ ≤ₖ □◇` of this regime -/

/-- On the equivalence-relation (S5) frame, the fiber is constant along
accessibility: `ψ ∈ R φ → (χ ∈ R ψ ↔ χ ∈ R φ)`. The structural fact behind both
`commutating` and the closure collapse. -/
theorem fiber_mem_iff {φ ψ : PredicationCell} (h : ψ ∈ M.fiber φ) (χ : PredicationCell) :
    χ ∈ M.fiber ψ ↔ χ ∈ M.fiber φ := by
  constructor
  · intro hχ; exact M.trans φ ψ χ h hχ
  · intro hχ; exact M.trans ψ φ χ (M.symm φ ψ h) hχ

/-- **The S5 collapse for the box**: `□v ψ = □v φ` whenever `ψ ∈ R φ` — the box is
constant on accessibility classes. -/
theorem necessitate_const {v : Valuation} {φ ψ : PredicationCell}
    (h : ψ ∈ M.fiber φ) : necessitate M v ψ = necessitate M v φ := by
  show Charge.meetList ((M.fiber ψ).map v) = Charge.meetList ((M.fiber φ).map v)
  apply Charge.kle_antisymm
  · refine Charge.le_meetList _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨χ, hχ, rfl⟩
    exact Charge.meetList_le (v χ) _
      (List.mem_map.2 ⟨χ, (fiber_mem_iff M h χ).2 hχ, rfl⟩)
  · refine Charge.le_meetList _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨χ, hχ, rfl⟩
    exact Charge.meetList_le (v χ) _
      (List.mem_map.2 ⟨χ, (fiber_mem_iff M h χ).1 hχ, rfl⟩)

/-- **The S5 collapse for the diamond**: `◇v ψ = ◇v φ` whenever `ψ ∈ R φ`. -/
theorem possibilize_const {v : Valuation} {φ ψ : PredicationCell}
    (h : ψ ∈ M.fiber φ) : possibilize M v ψ = possibilize M v φ := by
  show Charge.joinList ((M.fiber ψ).map v) = Charge.joinList ((M.fiber φ).map v)
  apply Charge.kle_antisymm
  · refine Charge.joinList_le _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨χ, hχ, rfl⟩
    exact Charge.le_joinList (v χ) _
      (List.mem_map.2 ⟨χ, (fiber_mem_iff M h χ).1 hχ, rfl⟩)
  · refine Charge.joinList_le _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨χ, hχ, rfl⟩
    exact Charge.le_joinList (v χ) _
      (List.mem_map.2 ⟨χ, (fiber_mem_iff M h χ).2 hχ, rfl⟩)

/-- **commutating** — the lax 2-cell `◇□v ≤ₖ □◇v`. The two ways of composing the
modal pair are coherent up to this comparison (one half of the corpus's
`commutating`); it becomes the equality `◇□ = □◇` exactly on the settled fixed
points, where each class is constant. -/
theorem necessitate_possibilize_le (v : Valuation) :
    leK (possibilize M (necessitate M v)) (necessitate M (possibilize M v)) := by
  intro φ
  show Charge.KLE (Charge.joinList ((M.fiber φ).map (necessitate M v)))
      (Charge.meetList ((M.fiber φ).map (possibilize M v)))
  refine Charge.joinList_le _ _ ?_
  intro a ha
  rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
  refine Charge.le_meetList _ _ ?_
  intro b hb
  rcases List.mem_map.1 hb with ⟨χ, hχ, rfl⟩
  -- `□v ψ ≤ v φ ≤ ◇v χ` : φ ∈ Rψ and φ ∈ Rχ by symmetry.
  have hφψ : φ ∈ M.fiber ψ := M.symm φ ψ hψ
  have hφχ : φ ∈ M.fiber χ := M.symm φ χ hχ
  have h1 : Charge.KLE (necessitate M v ψ) (v φ) :=
    Charge.meetList_le (v φ) _ (List.mem_map.2 ⟨φ, hφψ, rfl⟩)
  have h2 : Charge.KLE (v φ) (possibilize M v χ) :=
    Charge.le_joinList (v φ) _ (List.mem_map.2 ⟨φ, hφχ, rfl⟩)
  exact Charge.kle_trans _ _ _ h1 h2

/-! ## The closure settling iterates — *possibilize then necessitate* -/

/-- The operator **settling** iterates: *possibilize then necessitate*,
`cl v = □(◇ v)`. On the S5 frame this is the closure of the valuation under
its accessibility classes (each cell raised to its class knowledge-join). -/
def closureOp (v : Valuation) : Valuation := necessitate M (possibilize M v)

/-- On the S5 frame the closure equals the diamond: `□◇v = ◇v`. Necessitating a
diamond is vacuous because `◇v` is already constant on each class. -/
theorem closureOp_eq_possibilize (v : Valuation) :
    closureOp M v = possibilize M v := by
  funext φ
  show necessitate M (possibilize M v) φ = possibilize M v φ
  apply Charge.kle_antisymm
  · exact necessitate_le M (possibilize M v) φ
  · -- `◇v φ ≤ □◇v φ = ⨅_{ψ∈Rφ} ◇v ψ`; and `◇v ψ = ◇v φ` for ψ ∈ Rφ.
    refine Charge.le_meetList _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    rw [possibilize_const M hψ]
    exact Charge.kle_refl _

/-- **The closure is extensive** — `v ≤ₖ cl v`. (It is `◇`, which is
inflationary.) -/
theorem closureOp_infl (v : Valuation) : leK v (closureOp M v) := by
  rw [show closureOp M v = possibilize M v from closureOp_eq_possibilize M v]
  exact le_possibilize M v

/-- **The closure is monotone**. -/
theorem closureOp_mono {v w : Valuation} (h : leK v w) :
    leK (closureOp M v) (closureOp M w) :=
  necessitate_mono M (possibilize_mono M h)

/-- **The closure is idempotent** — `cl (cl v) = cl v`. Because `cl = ◇` here and
`◇` is constant on classes, possibilizing a possibilized valuation adds nothing. -/
theorem closureOp_idem (v : Valuation) : closureOp M (closureOp M v) = closureOp M v := by
  rw [closureOp_eq_possibilize M (closureOp M v),
      show closureOp M v = possibilize M v from closureOp_eq_possibilize M v]
  -- goal: `◇(◇v) = ◇v`
  funext φ
  show possibilize M (possibilize M v) φ = possibilize M v φ
  apply Charge.kle_antisymm
  · -- `◇◇v φ = ⨆_{ψ∈Rφ} ◇v ψ ≤ ◇v φ` since `◇v ψ = ◇v φ`.
    refine Charge.joinList_le _ _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    rw [possibilize_const M hψ]
    exact Charge.kle_refl _
  · exact le_possibilize M (possibilize M v) φ

/-! ## Tie to `Settling` / Knaster–Tarski — the closure as least fixed point -/

/-- The pointwise-charge form of the closure, so it slots into the `Charge`-level
settling machinery. On a frame this is the cell's class knowledge-join. -/
theorem closureOp_apply (v : Valuation) (φ : PredicationCell) :
    closureOp M v φ = Charge.joinList ((M.fiber φ).map v) :=
  congrFun (closureOp_eq_possibilize M v) φ

/-- **Settling**: the fixed point reached from a seed valuation by the modal
closure — for a closure the orbit stabilizes, so the settled value is `cl seed`.
Mirrors `Charge.settle` lifted to valuations. -/
def settle (v : Valuation) : Valuation := closureOp M v

/-- **The settled valuation is a fixed point** — nothing left to descend.
(Knaster–Tarski, closure form, lifted from `Settling.Closure.op_fixed`.) -/
theorem settle_fixed (v : Valuation) : closureOp M (settle M v) = settle M v :=
  closureOp_idem M v

/-- **The settled valuation is the least fixed point above the seed**: any fixed
point `x ≥ₖ v` of the closure lies above `settle v`. The least-upper-bound
character of the settled valuation — the same statement as `Settling.settle_least`
/ the `ClosureMonad` lfp, lifted to valuations. -/
theorem settle_least (v x : Valuation) (hvx : leK v x) (hfx : closureOp M x = x) :
    leK (settle M v) x := by
  have h := closureOp_mono M hvx
  rw [hfx] at h
  exact h

/-- The modal closure is a *closure operator* in precisely the `Settling.Closure`
sense — extensive, monotone, idempotent — so the modal pair's composite is
literally an instance of the operator `ClosureMonad` / Knaster–Tarski iterates. -/
theorem closureOp_is_closure :
    (∀ v, leK v (closureOp M v)) ∧
    (∀ v w, leK v w → leK (closureOp M v) (closureOp M w)) ∧
    (∀ v, closureOp M (closureOp M v) = closureOp M v) :=
  ⟨closureOp_infl M, fun _ _ h => closureOp_mono M h, closureOp_idem M⟩

end ModalFrame
end Valuation
end Obsmetrologia
