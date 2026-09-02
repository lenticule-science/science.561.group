import SpatiotemporalKnowledgeSystem.Homebrew.Settling.SKP

/-!
# Closure operators

A **closure operator** on a (pre-)bilattice is a function `cl : α → α`
that is monotone in the knowledge order, inflationary (`v ≤ₖ cl v`), and
idempotent. (The naturality-in-`𝒞` axiom from the corpus is at the
categorical layer; this 1-truncated form has just the three lattice-
theoretic axioms.)

The headline algebraic fact about closure operators is the **closure-merge
commutation lemma**:
$$\mathrm{cl}(\mathrm{cl}(X) \vee_k Y) = \mathrm{cl}(X \vee_k Y).$$

This is what makes the CRDT convergence theorem go through: receiving a
delta `Y` after locally applying closure to `X` gives the same final
state as receiving `Y` first and then applying closure to the merged
state.
-/

universe u

open scoped PreBilattice

/-- A closure operator on a pre-bilattice carrier. Acts on a single
algebra; for the family case (one operator per predicate) take a
function `P → ClosureOperator (PredicationFiberAlgebra L E)`. -/
structure ClosureOperator (α : Type u) [PreBilattice α] where
  /-- The closure map. -/
  cl : α → α
  /-- Closure is monotone in the knowledge order. -/
  monotone : ∀ {v w : α}, v ≤ₖ w → cl v ≤ₖ cl w
  /-- Closure is inflationary: every value sits below its closure. -/
  inflationary : ∀ v : α, v ≤ₖ cl v
  /-- Closure is idempotent. -/
  idempotent : ∀ v : α, cl (cl v) = cl v

namespace ClosureOperator
variable {α : Type u} [PreBilattice α] (c : ClosureOperator α)

/-- **Closure–merge commutation.**
`cl (cl X ⊔ₖ Y) = cl (X ⊔ₖ Y)` — applying `cl` before merging is
absorbed by the final closure. This is the algebraic heart of the
CRDT convergence theorem.

Proof structurally mirrors the lemma in `theorems/crdt-convergence.md`. -/
theorem closure_merge_commute (X Y : α) :
    c.cl (PreBilattice.supK (c.cl X) Y) = c.cl (PreBilattice.supK X Y) := by
  apply PreBilattice.leK_antisymm
  · -- ≤ direction:
    -- cl X ≤ cl (X ⊔ Y)  by monotone of cl on  X ≤ X ⊔ Y
    -- Y ≤ cl (X ⊔ Y)     by le_supK_right then cl_inflationary (transitivity)
    -- supK (cl X) Y ≤ cl (X ⊔ Y)  by supK_le
    -- cl (supK (cl X) Y) ≤ cl (cl (X ⊔ Y)) = cl (X ⊔ Y)  by mono + idempotent
    have h1 : c.cl X ≤ₖ c.cl (PreBilattice.supK X Y) :=
      c.monotone (PreBilattice.le_supK_left X Y)
    have h2 : Y ≤ₖ c.cl (PreBilattice.supK X Y) :=
      PreBilattice.leK_trans (PreBilattice.le_supK_right X Y) (c.inflationary _)
    have h3 : PreBilattice.supK (c.cl X) Y ≤ₖ c.cl (PreBilattice.supK X Y) :=
      PreBilattice.supK_le h1 h2
    have h4 : c.cl (PreBilattice.supK (c.cl X) Y) ≤ₖ c.cl (c.cl (PreBilattice.supK X Y)) :=
      c.monotone h3
    rw [c.idempotent] at h4
    exact h4
  · -- ≥ direction:
    -- X ≤ cl X ≤ supK (cl X) Y                    (cl_inflationary, le_supK_left)
    -- Y ≤ supK (cl X) Y                            (le_supK_right)
    -- supK X Y ≤ supK (cl X) Y                     (supK_le)
    -- cl (supK X Y) ≤ cl (supK (cl X) Y)           (cl_monotone)
    have h1 : X ≤ₖ PreBilattice.supK (c.cl X) Y :=
      PreBilattice.leK_trans (c.inflationary X) (PreBilattice.le_supK_left _ _)
    have h2 : Y ≤ₖ PreBilattice.supK (c.cl X) Y :=
      PreBilattice.le_supK_right _ _
    exact c.monotone (PreBilattice.supK_le h1 h2)

/-- The trivial (identity) closure operator: `cl = id`. -/
def id : ClosureOperator α where
  cl := _root_.id
  monotone := fun h => h
  inflationary := PreBilattice.leK_refl
  idempotent := fun _ => rfl

end ClosureOperator

/-! ## Closure-driven settlings

A **closure-driven** SKP is built from a per-predicate closure operator `cl`,
an initial valuation, and an increment sequence:
$v_0(p) = \mathrm{init}(p)$, $v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p) \sqcup_k u_{\tau+1}(p))$.
This realizes `concepts/closure-drivenness.md`. -/

universe v w

namespace SpatiotemporalKnowledgePresheaf
variable {L : Type u} {P : Type w} {E : Type v} [Lattice L]

/-- The settling values of a closure-driven SKP, given by the recurrence
`v_{τ+1}(p) = cl p (v_τ p ⊔ₖ u_{τ+1}(p))` with base `v_0 = init`. -/
def closureDrivenStep
    (cl : P → ClosureOperator (PredicationFiberAlgebra L E))
    (init : P → PredicationFiberAlgebra L E)
    (increments : Nat → P → PredicationFiberAlgebra L E) :
    Nat → P → PredicationFiberAlgebra L E
  | 0 => init
  | τ+1 => fun p =>
      (cl p).cl (closureDrivenStep cl init increments τ p ⊔ₖ increments (τ+1) p)

/-- Build a closure-driven SKP from a per-predicate closure operator, an
initial valuation, and an increment sequence. Settling monotonicity is
witnessed by repeated application of `cl`-inflationarity composed with
`le_supK_left`. -/
def closureDriven
    (cl : P → ClosureOperator (PredicationFiberAlgebra L E))
    (init : P → PredicationFiberAlgebra L E)
    (increments : Nat → P → PredicationFiberAlgebra L E) :
    SpatiotemporalKnowledgePresheaf L P E where
  val := closureDrivenStep cl init increments
  monotone {σ τ} hστ p := by
    induction hστ with
    | refl => exact PreBilattice.leK_refl _
    | step _ ih =>
      refine PreBilattice.leK_trans ih ?_
      exact PreBilattice.leK_trans
        (PreBilattice.le_supK_left _ _)
        ((cl p).inflationary _)

end SpatiotemporalKnowledgePresheaf
