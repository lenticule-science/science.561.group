/-!
# Aperiodic history systems

This module promotes the dependency-free core of the archived
`relational-hyperverse` history layer: histories as a concatenating carrier whose
order is exactly prefix extension, together with the commutation relation on
generating steps.

The archive's concrete quotient monoid `M(Σ,I)` and universality proof remain
frontier material: the archived proof explicitly left cancellation open. The
active module records the abstract carrier and the prefix laws it proves.

## Main definitions

* `AperiodicOrder.Tiling.HistorySystem`
* `AperiodicOrder.Tiling.CommutationRelation`

## Main results

* `HistorySystem.empty_le`
* `HistorySystem.le_concat`
* `HistorySystem.le_trans`
* `HistorySystem.concat_left_monotone`
* `prefix_antisymm_of_cancel_unit_free`
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace Aperiodic

/-- A history system is a concatenating carrier whose order is prefix extension. -/
structure HistorySystem where
  /-- The carrier of histories. -/
  carrier : Type
  /-- The empty history. -/
  unit : carrier
  /-- History concatenation. -/
  concat : carrier → carrier → carrier
  /-- The prefix-extension order. -/
  le : carrier → carrier → Prop
  /-- Empty history is a left unit. -/
  unit_concat : ∀ t, concat unit t = t
  /-- Empty history is a right unit. -/
  concat_unit : ∀ t, concat t unit = t
  /-- Concatenation is associative. -/
  concat_assoc : ∀ t u v, concat (concat t u) v = concat t (concat u v)
  /-- The order is exactly prefix extension. -/
  le_iff_prefix : ∀ t t', le t t' ↔ ∃ u, t' = concat t u
  /-- Prefix extension is antisymmetric on this carrier. -/
  le_antisymm : ∀ {t t'}, le t t' → le t' t → t = t'

namespace HistorySystem

variable (T : HistorySystem)

/-- Prefix order is reflexive because the empty history is a right unit. -/
theorem le_refl (t : T.carrier) : T.le t t :=
  (T.le_iff_prefix t t).mpr ⟨T.unit, (T.concat_unit t).symm⟩

/-- Any concatenation `t ⋅ u` lies above `t` in the prefix order. -/
theorem le_concat (t u : T.carrier) : T.le t (T.concat t u) :=
  (T.le_iff_prefix t (T.concat t u)).mpr ⟨u, rfl⟩

/-- The empty history lies below every history. -/
theorem empty_le (t : T.carrier) : T.le T.unit t :=
  (T.le_iff_prefix T.unit t).mpr ⟨t, (T.unit_concat t).symm⟩

/-- Prefix order is transitive by concatenating the two extension witnesses. -/
theorem le_trans {t t' t'' : T.carrier} (h : T.le t t') (h' : T.le t' t'') :
    T.le t t'' := by
  rw [T.le_iff_prefix] at h h' ⊢
  obtain ⟨u, hu⟩ := h
  obtain ⟨v, hv⟩ := h'
  exact ⟨T.concat u v, by rw [hv, hu, T.concat_assoc]⟩

/-- Left-concatenation is monotone for the prefix order. -/
theorem concat_left_monotone {t t' : T.carrier} (u : T.carrier) (h : T.le t t') :
    T.le (T.concat u t) (T.concat u t') := by
  rw [T.le_iff_prefix] at h ⊢
  obtain ⟨v, hv⟩ := h
  exact ⟨v, by rw [hv, T.concat_assoc]⟩

end HistorySystem

/-- A left-cancellative, unit-free concatenation makes prefix extension antisymmetric. -/
theorem prefix_antisymm_of_cancel_unit_free
    {M : Type} (unit : M) (concat : M → M → M)
    (concat_unit : ∀ t, concat t unit = t)
    (assoc : ∀ a b c, concat (concat a b) c = concat a (concat b c))
    (left_cancel : ∀ a b c, concat a b = concat a c → b = c)
    (unit_free : ∀ a b, concat a b = unit → a = unit ∧ b = unit)
    {t t' : M}
    (h : ∃ u, t' = concat t u)
    (h' : ∃ u, t = concat t' u) : t = t' := by
  obtain ⟨u, hu⟩ := h
  obtain ⟨v, hv⟩ := h'
  have heq : concat t unit = concat t (concat u v) := by
    rw [concat_unit, ← assoc, ← hu, hv]
  have huv : concat u v = unit := (left_cancel t unit (concat u v) heq).symm
  have hu1 : u = unit := (unit_free u v huv).1
  rw [hu, hu1, concat_unit]

/-- A symmetric irreflexive commutation relation on a generating step type. -/
structure CommutationRelation (Alph : Type) where
  /-- The relation saying two steps commute. -/
  commute : Alph → Alph → Prop
  /-- Commutation is symmetric. -/
  symm_comm : ∀ s t, commute s t → commute t s
  /-- No step commutes with itself. -/
  irref_comm : ∀ s, ¬ commute s s

namespace CommutationRelation

/-- Symmetry of the commutation relation. -/
theorem symm {Alph : Type} (I : CommutationRelation Alph) {s t : Alph}
    (h : I.commute s t) : I.commute t s :=
  I.symm_comm s t h

/-- Irreflexivity of the commutation relation. -/
theorem not_self {Alph : Type} (I : CommutationRelation Alph) (s : Alph) :
    ¬ I.commute s s :=
  I.irref_comm s

end CommutationRelation

end Aperiodic
end AperiodicOrder.Tiling
end Obsmetrologia
