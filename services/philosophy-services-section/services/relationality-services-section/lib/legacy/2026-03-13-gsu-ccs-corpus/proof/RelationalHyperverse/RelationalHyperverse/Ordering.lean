import Mathlib.Order.Defs.PartialOrder
import Mathlib.Algebra.Group.Defs

-- Establishes: order

/-!
# Ordering: prefix extension partial order on histories

Corresponds to `math/order.md`.

**Relation facet** of the History (§history): how histories CONNECT to one another.

The prefix ordering on a history monoid T is:
  t ≤ t' iff ∃ u, t' = t ★ u

This makes T a **thin category** — a poset viewed as a category where the
unique morphism t → t' exists precisely when t ≤ t'.

## Main definition
- `PrefixOrdering T` : the prefix order axiom (Relation facet of histories)

## Basic results (from the ordering axiom alone)
- `PrefixOrdering.le_concat` : t ≤ t ★ u
- `PrefixOrdering.empty_le` : 1 ≤ t (empty history is initial)
- `PrefixOrdering.prefix_trans` : transitivity of ≤
- `PrefixOrdering.mul_left_monotone` : u ★ t ≤ u ★ t' when t ≤ t'
-/

/-- The prefix ordering axiom: the partial order on T coincides with the prefix
    extension order. t ≤ t' iff t' = t ★ u for some u.

    This is the **Relation facet** of the history — it is how histories connect,
    not what they are (substrate) or what they do (act). Corresponds to
    `math/order.md §order`. -/
class PrefixOrdering (T : Type*) [PartialOrder T] [Mul T] : Prop where
  /-- The partial order is the prefix extension: t ≤ t' iff ∃ u, t' = t ★ u. -/
  le_iff_prefix : ∀ (t t' : T), t ≤ t' ↔ ∃ u, t' = t * u

namespace PrefixOrdering

variable {T : Type*} [PartialOrder T] [Monoid T] [PrefixOrdering T]

/-- Any extension t ★ u lies above t in the prefix order. -/
theorem le_concat (t u : T) : t ≤ t * u :=
  (le_iff_prefix t (t * u)).mpr ⟨u, rfl⟩

/-- The empty history (monoidal unit 1) is the least element: 1 ≤ t for all t.
    This is the initial-object property of the empty history. -/
theorem empty_le (t : T) : (1 : T) ≤ t :=
  (le_iff_prefix 1 t).mpr ⟨t, (one_mul t).symm⟩

/-- Transitivity of ≤ from the prefix witnesses:
    if t' = t ★ u and t'' = t' ★ v then t'' = t ★ (u ★ v). -/
theorem prefix_trans {t t' t'' : T} (h : t ≤ t') (h' : t' ≤ t'') : t ≤ t'' := by
  rw [le_iff_prefix] at h h' ⊢
  obtain ⟨u, hu⟩ := h
  obtain ⟨v, hv⟩ := h'
  exact ⟨u * v, by rw [hv, hu, mul_assoc]⟩

/-- Left-concatenation is monotone: t ≤ t' implies u ★ t ≤ u ★ t'. -/
theorem mul_left_monotone {t t' : T} (u : T) (h : t ≤ t') : u * t ≤ u * t' := by
  rw [le_iff_prefix] at h ⊢
  obtain ⟨v, hv⟩ := h
  exact ⟨v, by rw [hv, mul_assoc]⟩

end PrefixOrdering

-- ── Corollary: prefix antisymmetry from algebraic properties ─────────────────

/-- In any left-cancellative unit-free monoid, the prefix relation ∃ u, t' = t * u
    is antisymmetric.

    This is Corollary `cor-prefix-order` from `math/history-universality.md`:
    the prefix relation is a partial order on any such monoid, so the `PrefixOrdering`
    axiom can always be satisfied by defining ≤ as the prefix relation.

    Proof: if t' = t * u and t = t' * v then t = t * (u * v), so 1 = u * v by
    left-cancellation, so u = v = 1 by unit-free, so t' = t * 1 = t. -/
theorem prefixLE_antisymm {M : Type*} [Monoid M]
    (hlc  : ∀ a b c : M, a * b = a * c → b = c)
    (huf  : ∀ a b : M, a * b = 1 → a = 1 ∧ b = 1)
    {t t' : M}
    (h  : ∃ u, t' = t * u)
    (h' : ∃ u, t  = t' * u) : t = t' := by
  obtain ⟨u, hu⟩ := h
  obtain ⟨v, hv⟩ := h'
  have heq : t * 1 = t * (u * v) := by
    rw [mul_one, ← mul_assoc, ← hu, hv]
  have huv : u * v = 1 := (hlc t 1 (u * v) heq).symm
  have hu1 : u = 1 := (huf u v huv).1
  rw [hu, hu1, mul_one]
