import SpatiotemporalKnowledgeSystem.Homebrew.Settling.Closure

/-!
# CRDT convergence

The headline result of `theorems/crdt-convergence.md`: a distributed
SKP system with a common closure operator and a delta-merge protocol
**converges without consensus**. Each replica's state, after receiving
some sequence of writes (with the closure operator applied between
merges), equals the closure of the join of the initial state and all
received writes — independent of the *order* in which closures and
merges were interleaved.

Once two replicas have received the same set of writes (in any order),
this theorem combined with commutativity and associativity of `⊔ₖ`
gives convergence to the same final state. The load-bearing lemma is
`applyWrites_eq_cl_foldl`; full any-order convergence follows in
`applyWrites_perm_invariant`.
-/

universe u

open scoped PreBilattice

namespace ClosureOperator
variable {α : Type u} [PreBilattice α]

/-- Apply a sequence of writes (deltas) to an accumulator, applying the
closure operator after each merge. The accumulator is assumed to already
be closed (`c.cl` was applied to the initial state at start-up). -/
def applyWrites (c : ClosureOperator α) : α → List α → α
  | acc, []      => acc
  | acc, w :: ws => applyWrites c (c.cl (acc ⊔ₖ w)) ws

variable (c : ClosureOperator α)

/-- **CRDT convergence (load-bearing lemma).**

Starting from a closed initial state, applying writes one-at-a-time with
closure between each merge gives the same result as merging all writes
(via `foldl ⊔ₖ`) and applying closure exactly once at the end:
$$\mathrm{applyWrites}\,(\mathrm{cl}\,\mathrm{init})\,\mathit{ws}
= \mathrm{cl}(\mathrm{init} \,\sqcup_k\, \bigvee_k \mathit{ws}).$$

Proof: induction on `ws`, with the inductive step closing under the
**closure–merge commutation lemma** at each step.

Combined with `foldl_supK_perm`, this upgrades to full any-order
convergence (`applyWrites_perm_invariant` below). -/
theorem applyWrites_eq_cl_foldl (init : α) (ws : List α) :
    c.applyWrites (c.cl init) ws = c.cl (List.foldl (· ⊔ₖ ·) init ws) := by
  induction ws generalizing init with
  | nil => rfl
  | cons w rest ih =>
    show c.applyWrites (c.cl (c.cl init ⊔ₖ w)) rest
       = c.cl (List.foldl (· ⊔ₖ ·) (init ⊔ₖ w) rest)
    rw [c.closure_merge_commute init w]
    exact ih (init ⊔ₖ w)

/-- **CRDT convergence (full any-order statement).**

Two `applyWrites` runs on the *same* closed initial state, with the same
multiset of writes received in *any* order, produce the *same* final state.

Combines the load-bearing lemma `applyWrites_eq_cl_foldl` with the
permutation-invariance of `foldl ⊔ₖ` (`PreBilattice.foldl_supK_perm`).

This is the corpus's `theorems/crdt-convergence.md` headline result,
specialized to a single fiber: replicas of a distributed SKP system
that have received the same multiset of deltas converge to the same
state, no consensus needed. -/
theorem applyWrites_perm_invariant {ws₁ ws₂ : List α} (h : ws₁.Perm ws₂) (init : α) :
    c.applyWrites (c.cl init) ws₁ = c.applyWrites (c.cl init) ws₂ := by
  rw [c.applyWrites_eq_cl_foldl, c.applyWrites_eq_cl_foldl]
  congr 1
  exact PreBilattice.foldl_supK_perm h init

end ClosureOperator

/-! ## Distributed SKP system

A **distributed SKP system** is a finite family of SKPs over a common
parameter set, with merge given by pointwise knowledge-order join.
Per `objects/distributed-settling-system.md`. -/

universe v w

/-- A finite family of SKPs over `(L, P, E)`. -/
structure DistributedSKPSystem (L : Type u) (P : Type w) (E : Type v) [Lattice L] where
  /-- The replica index type. -/
  Replica    : Type
  /-- The settling for each replica. -/
  presheaves : Replica → SpatiotemporalKnowledgePresheaf L P E

namespace DistributedSKPSystem
variable {L : Type u} {P : Type w} {E : Type v} [Lattice L]

/-- Merge two replicas at settling step `τ` and predicate `p`: pointwise
knowledge-order join of the two fiber-algebra values. -/
def merge (sys : DistributedSKPSystem L P E) (i j : sys.Replica) (τ : Nat)
    (p : P) : PredicationFiberAlgebra L E :=
  PreBilattice.supK ((sys.presheaves i).val τ p) ((sys.presheaves j).val τ p)

/-- **Distributed convergence corollary.**

If two replicas were both built as closure-driven settlings from the same
closed initial state with the same multiset of received writes (in any
order), they converge cellwise to the same state at every step that has
absorbed all writes. The proof reduces immediately to
`ClosureOperator.applyWrites_perm_invariant`. -/
theorem closureDriven_perm_converge
    (c : ClosureOperator (PredicationFiberAlgebra L E))
    (init : PredicationFiberAlgebra L E)
    {ws₁ ws₂ : List (PredicationFiberAlgebra L E)} (h : ws₁.Perm ws₂) :
    c.applyWrites (c.cl init) ws₁ = c.applyWrites (c.cl init) ws₂ :=
  c.applyWrites_perm_invariant h init

end DistributedSKPSystem
