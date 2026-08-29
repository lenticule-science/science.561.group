-- Establishes: commutation

/-!
# Independence: the commutation relation on the step set

Corresponds to `math/commutation.md`.

**Quality facet** of the History (§history): what can be SAID of the history
category. Of any two steps s, s' in the step set, whether their order does not
affect the relational outcome.

Formally: commutation is a symmetric irreflexive relation
  I ⊆ Σ × Σ,    s ⊥ s' :↔ (s,s') ∈ I.

## The Diamond

The operationally decisive consequence of commutation is the diamond in T:
when s ⊥ s', the extensions s ★ t and s' ★ t satisfy
  s ★ (s' ★ t) = s' ★ (s ★ t).
This diamond is what drives nucleus commutativity σ ∘ Δ = Δ ∘ σ (§fiber-algebra).

## OPEN: connection to the abstract history system

The abstract `HistorySystem T` (§history) does not expose the step set or I — it
works at the level of the quotient M(Σ,I). The concrete construction of M(Σ,I)
from `CommutationRelation` and the proof that it satisfies `HistorySystem` belong
in `HistoryUniversality.lean`.

Note: We write `Alph` for the step set type variable. `Σ` is reserved in Lean 4
for dependent sum types.
-/

universe u

/-- A symmetric irreflexive relation on a step set.
    The **Quality facet** of the history — which step-pairs commute.
    Corresponds to `math/commutation.md §commutation`. -/
structure CommutationRelation (Alph : Type u) where
  commute    : Alph → Alph → Prop
  symm_comm  : ∀ s s', commute s s' → commute s' s
  irref_comm : ∀ s, ¬ commute s s
