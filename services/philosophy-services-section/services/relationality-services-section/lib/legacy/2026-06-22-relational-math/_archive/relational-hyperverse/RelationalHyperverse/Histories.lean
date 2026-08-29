import RelationalHyperverse.Ordering
import RelationalHyperverse.Concatenating

-- Establishes: history

/-!
# HistorySystem: the thin category T of histories

Corresponds to `math/history.md`.

The **History System** is the composite mathematical Thing: it assembles the
four facets of the history into a single coherent structure:

- **Substrate** (§history): T as the objects of the thin category M(Σ,I).
- **Quality** (§commutation): which step-pairs in Σ commute.
- **Relation** (§order): the prefix order t ≤ t' ↔ ∃ u, t' = t ★ u.
- **Act** (§concatenating): history concatenation ★, the monoid operation.

The four facets are encoded in Lean as:
- [Monoid T] — concatenation (Act, `math/concatenating.md`)
- [PartialOrder T] — the order structure
- [PrefixOrdering T] — the linking axiom (Relation, `math/order.md`)

`HistorySystem` adds no new axioms; it packages the components and provides the
name corresponding to the composite math unit `math/history.md`.

## Atomic structure

The basic lemmas (empty_le, le_concat, prefix_trans, mul_left_monotone)
live in `Ordering.lean` under `PrefixOrdering`, where they belong.
This file re-exports them via the `HistorySystem` typeclass instance.

## OPEN: concrete construction

The step set Σ and independence relation I (`math/commutation.md`)
are not exposed in the abstract `HistorySystem` — T is taken as a given
satisfying these axioms. The concrete construction of T = M(Σ,I) and the
proof that it is the **initial** history system lives in `HistoryUniversality.lean`.

See `math/history-universality.md §universality`.
-/

/-- A history system: a monoid-ordered type where the order is the prefix extension.

    Packages the Relation and Act facets of the history:
    - `[Monoid T]` — the Act (concatenation ★, unit e = 1)
    - `[PrefixOrdering T]` — the Relation (prefix order t ≤ t' ↔ ∃ u, t' = t ★ u)

    Corresponds to `math/history.md` — the composite history structure. -/
class HistorySystem (T : Type*) [PartialOrder T] [Monoid T]
    extends PrefixOrdering T : Prop

namespace HistorySystem

variable {T : Type*} [PartialOrder T] [Monoid T] [HistorySystem T]

-- The basic prefix-order lemmas come from PrefixOrdering.
-- They are accessible here since [HistorySystem T] implies [PrefixOrdering T].

/-- Alias: the empty history 1 is below everything. From `PrefixOrdering.empty_le`. -/
theorem empty_le (t : T) : (1 : T) ≤ t := PrefixOrdering.empty_le t

/-- Alias: t ≤ t ★ u. From `PrefixOrdering.le_concat`. -/
theorem le_concat (t u : T) : t ≤ t * u := PrefixOrdering.le_concat t u

/-- The prefix order is antisymmetric (from PartialOrder). -/
theorem prefix_antisymm {t t' : T} (h : t ≤ t') (h' : t' ≤ t) : t = t' :=
  le_antisymm h h'

/-- Transitivity of ≤. From `PrefixOrdering.prefix_trans`. -/
theorem prefix_trans {t t' t'' : T} (h : t ≤ t') (h' : t' ≤ t'') : t ≤ t'' :=
  PrefixOrdering.prefix_trans h h'

/-- Left-concatenation is monotone. From `PrefixOrdering.mul_left_monotone`. -/
theorem mul_left_monotone {t t' : T} (u : T) (h : t ≤ t') : u * t ≤ u * t' :=
  PrefixOrdering.mul_left_monotone u h

end HistorySystem
