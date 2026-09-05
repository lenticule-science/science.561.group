import SpatiotemporalKnowledgeSystem.Homebrew.Predication.FiberAlgebra

/-!
# Spatiotemporal knowledge presheaf

A **spatiotemporal knowledge presheaf** (SKP) over `(L, P, E)` is a
settling-indexed family of predication valuations,
$$v = (v_\tau)_{\tau < \omega}, \quad v_\tau : \Pi \to A,$$
satisfying **settling monotonicity**: knowledge accumulates along the
settling — for every predicate `p` and every `σ ≤ τ`,
$v_\sigma(p) \leq_k v_\tau(p)$ pointwise in the fiber algebra.

This file uses `Nat` (= ω) as the settling index. Transfinite settlings
(the transfinite-bounded and aperiodic regimes in the corpus) require
ordinals and belong in a separate Mathlib-dependent module.

The predicate index `P` is a bare type here; the categorical structure
on predicates (specialization, converse, projections) is also deferred
to a separate module.
-/

universe u v w

open scoped PreBilattice

/-- A **spatiotemporal knowledge presheaf** over `(L, P, E)`: a
settling family `val τ p : E × E → L⋈` of predication valuations,
monotone in the knowledge order. -/
structure SpatiotemporalKnowledgePresheaf
    (L : Type u) (P : Type w) (E : Type v) [Lattice L] where
  /-- The settling family of predication valuations. -/
  val      : Nat → P → PredicationFiberAlgebra L E
  /-- Settling monotonicity: at every predicate, the fiber-algebra value
  grows monotonically in the knowledge order along the settling. -/
  monotone : ∀ {σ τ : Nat}, σ ≤ τ → ∀ (p : P), val σ p ≤ₖ val τ p

namespace SpatiotemporalKnowledgePresheaf
variable {L : Type u} {P : Type w} {E : Type v} [Lattice L]

/-- Successor-step monotonicity: a special case of `monotone` for `σ = τ`. -/
theorem le_succ (v : SpatiotemporalKnowledgePresheaf L P E) (τ : Nat) (p : P) : v.val τ p ≤ₖ v.val (τ + 1) p :=
  v.monotone (Nat.le_succ τ) p

/-- The presheaf is **quiescent at τ\*** if no further changes occur after
step τ\*: for every `τ ≥ τ*` and every predicate `p`, `val τ p = val τ* p`.

(From `concepts/settling-quiescence.md`.) -/
def Quiescent (v : SpatiotemporalKnowledgePresheaf L P E) (τstar : Nat) : Prop :=
  ∀ {τ : Nat}, τstar ≤ τ → ∀ p, v.val τ p = v.val τstar p

/-- Quiescence at `τ*` implies quiescence at every later step. -/
theorem Quiescent.mono {v : SpatiotemporalKnowledgePresheaf L P E} {τstar τstar' : Nat}
    (hq : v.Quiescent τstar) (h : τstar ≤ τstar') :
    v.Quiescent τstar' := by
  intro τ hτ p
  have h₁ : v.val τ p = v.val τstar p := hq (Nat.le_trans h hτ) p
  have h₂ : v.val τstar' p = v.val τstar p := hq h p
  rw [h₁, ← h₂]

/-! ## Constant settlings -/

/-- The **trivial settling** at a fixed predication valuation: `val τ p = w p`
for all τ. Settling monotonicity holds vacuously since every step has the
same value. -/
def const (w : P → PredicationFiberAlgebra L E) : SpatiotemporalKnowledgePresheaf L P E where
  val      := fun _ p => w p
  monotone := fun _ p => PreBilattice.leK_refl (w p)

/-- The trivial settling is quiescent at step 0. -/
theorem const_quiescent (w : P → PredicationFiberAlgebra L E) :
    (const w).Quiescent 0 := fun _ _ => rfl

end SpatiotemporalKnowledgePresheaf
