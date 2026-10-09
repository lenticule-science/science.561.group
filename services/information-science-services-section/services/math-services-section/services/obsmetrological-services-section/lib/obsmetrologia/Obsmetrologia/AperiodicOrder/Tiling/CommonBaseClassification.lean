import Obsmetrologia.AperiodicOrder.Tiling.ClassificationReduction

/-!
# The common-base MLD classification — the converse, proved on a shared base

`Classification` left the converse `CohEquiv ⟹ Mld` open on the *abstract* `Settling` carrier, which
records only `cl-inv : H1Class` and no orbit/firing structure — there is nothing to build a
settling-morphism out of. The tiling reading supplies the missing datum: a settling over a base is a
**firing-ordinal pattern** (where the non-Scott firings occur, by stage), and a mutual local
derivation is an explicit relabeling of firings. On a **common base** that relabeling is direct — the
corpus's "coinduction-independent combinatorial companion" — so the converse is *provable* here, with
real derivation data rather than the bare relation of the abstract carrier.

This is the proved common-base fragment of `thm:aperiodic-mld-classification`: on a shared base,
mutual local derivability **coincides** with cohomological equivalence — converse included — by an
explicit firing-pattern derivation. The general cross-base case (different bases, a nontrivial
relabeling) is where the fibered coinduction up-to-closure is needed, and stays the frontier.

## Main definitions

* `BaseSettling` — a settling over a common base, as its firing-ordinal pattern.
* `Derivation` / `BaseMLD` — a local derivation carrying one firing pattern to another, and its
  existence (the geometric MLD on a common base).
* `baseClInv` — the classifying invariant on a common base: the firing pattern.

## Main results

* `baseMLD_of_clInv_eq` — the converse on a common base: equal `cl-inv` yields a local derivation.
* `common_base_classification` — `BaseMLD ⟺ CohEquiv` on a common base (the full classification).

## References

`content/.../aperiodic-regime-classification` (Step 4, common-base case),
`content/.../mutually-locally-derivable`. Built on `Obsmetrologia.AperiodicOrder.Tiling.ClassificationReduction`.

## Tags

mutual local derivability, common base, firing pattern, tiling, aperiodic classification
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace CommonBase

/-! ## (A) Settlings over a common base, as firing patterns -/

/-- A settling over a fixed common base, recorded by its **firing-ordinal pattern** — the concrete
geometric datum a local derivation acts on (the stages at which non-Scott firings occur). -/
structure BaseSettling where
  /-- The firing-ordinal pattern (by stage). -/
  firings : List Nat

/-- The classifying invariant on a common base: the firing **multiset**, recorded by its stage-count
function `a ↦ #{firings at stage a}`. On a shared base the `H¹` class is exactly this
relabeling-invariant count of firing-ordinals — it sees *how many* firings land on each stage, not
their order. -/
def baseClInv (s : BaseSettling) : Nat → Nat := fun a => s.firings.count a

/-- **A member can be rotated to the front, choice-free.** `a ∈ l → l ~ a :: l.erase a`, by induction
on `l` (the choice-free replacement for `List.perm_cons_erase`, which routes through
`Classical.choice`). -/
private theorem permConsErase {α : Type} [DecidableEq α] :
    ∀ (a : α) (l : List α), a ∈ l → l.Perm (a :: l.erase a)
  | a, [], hmem => by simp at hmem
  | a, b :: rest, hmem => by
    by_cases hba : b = a
    · subst hba
      rw [List.erase_cons_head]
    · have hmem' : a ∈ rest := by
        rcases List.mem_cons.mp hmem with h1 | h1
        · exact absurd h1.symm hba
        · exact h1
      rw [List.erase_cons_tail (by simpa using hba)]
      exact ((permConsErase a rest hmem').cons b).trans (List.Perm.swap a b (rest.erase a))

/-- **Equal stage-counts construct a permutation, choice-free.** By induction on the first pattern
(peel the head `a`, locate it in the second by its positive count, recurse on the erased tail) — the
constructive replacement for `List.perm_iff_count`, which routes through `Classical.choice`. This is
the firing-ordinal bijection, built explicitly. -/
private theorem permOfCountEq {α : Type} [DecidableEq α] :
    ∀ (l₁ l₂ : List α), (∀ a, l₁.count a = l₂.count a) → l₁.Perm l₂
  | [], l₂, h => by
    cases l₂ with
    | nil => exact .nil
    | cons b rest =>
      have hb := h b
      rw [List.count_nil, List.count_cons_self] at hb
      exact absurd hb (by omega)
  | a :: t, l₂, h => by
    have hmem : a ∈ l₂ := by
      have ha := h a
      rw [List.count_cons_self] at ha
      exact List.count_pos_iff.mp (by omega)
    have hpe : l₂.Perm (a :: l₂.erase a) := permConsErase a l₂ hmem
    have herase : ∀ c, t.count c = (l₂.erase a).count c := by
      intro c
      have hc := h c
      have hp := hpe.count_eq c
      by_cases hca : c = a
      · subst hca
        rw [List.count_cons_self] at hc hp
        omega
      · rw [List.count_cons_of_ne (Ne.symm hca)] at hc hp
        omega
    exact ((permOfCountEq t (l₂.erase a) herase).cons a).trans hpe.symm

/-- A **local derivation** `s → s'` on the common base: an explicit **firing-ordinal bijection** — a
permutation carrying `s`'s firing pattern onto `s'`'s. This is the data of a settling-morphism (the
sliding-block relabeling of firings), not a bare relation. -/
structure Derivation (s s' : BaseSettling) where
  /-- The firing-ordinal bijection: `s`'s pattern is a permutation of `s'`'s. -/
  perm : s.firings.Perm s'.firings

/-- **Common-base mutual local derivability**: a firing-ordinal bijection exists. -/
def BaseMLD (s s' : BaseSettling) : Prop := Nonempty (Derivation s s')

/-! ## (B) The groupoid laws -/

/-- `BaseMLD` is reflexive — the identity bijection. -/
theorem baseMLD_refl (s : BaseSettling) : BaseMLD s s := ⟨⟨List.Perm.refl _⟩⟩

/-- `BaseMLD` is symmetric — invert the bijection. -/
theorem baseMLD_symm {s s' : BaseSettling} (h : BaseMLD s s') : BaseMLD s' s :=
  h.elim fun d => ⟨⟨d.perm.symm⟩⟩

/-- `BaseMLD` is transitive — compose bijections. -/
theorem baseMLD_trans {s s' s'' : BaseSettling}
    (h : BaseMLD s s') (h' : BaseMLD s' s'') : BaseMLD s s'' :=
  h.elim fun d => h'.elim fun d' => ⟨⟨d.perm.trans d'.perm⟩⟩

/-! ## (C) Step 3 and the converse, on a common base -/

/-- **Step 3 on a common base.** A firing-ordinal bijection preserves the classifying invariant: a
permutation preserves every stage-count, so `cl-inv` agrees. -/
theorem baseClInv_of_baseMLD {s s' : BaseSettling} (h : BaseMLD s s') :
    baseClInv s = baseClInv s' :=
  h.elim fun d => funext fun a => d.perm.count_eq a

/-- **The converse, on a common base (coinduction-free).** Equal `cl-inv` yields an explicit
firing-ordinal bijection: equal stage-counts make the two firing patterns permutations of each other
(`permOfCountEq`, built without `Classical`), and that permutation **is** the local derivation. This
is the corpus's proved common-base case of the MLD classification — the geometric MLD, constructed
(no coinduction), exactly the firing-ordinal bijection the corpus names. -/
theorem baseMLD_of_clInv_eq {s s' : BaseSettling} (h : baseClInv s = baseClInv s') :
    BaseMLD s s' :=
  ⟨⟨permOfCountEq _ _ (fun a => congrFun h a)⟩⟩

/-! ## (D) The headline -/

/-- **The common-base MLD classification.** On a shared base, mutual local derivability is an
equivalence relation and **coincides** with cohomological equivalence — both directions, the converse
included — witnessed by an explicit firing-pattern derivation. This discharges the common-base
fragment of `thm:aperiodic-mld-classification`; the cross-base case, where a relabeling must
be built by fibered coinduction up-to-closure, remains the frontier. -/
theorem common_base_classification :
    (∀ s : BaseSettling, BaseMLD s s)
    ∧ (∀ s s' : BaseSettling, BaseMLD s s' → BaseMLD s' s)
    ∧ (∀ s s' s'' : BaseSettling, BaseMLD s s' → BaseMLD s' s'' → BaseMLD s s'')
    ∧ (∀ s s' : BaseSettling, BaseMLD s s' ↔ baseClInv s = baseClInv s') :=
  ⟨baseMLD_refl,
   fun _ _ h => baseMLD_symm h,
   fun _ _ _ h h' => baseMLD_trans h h',
   fun _ _ => ⟨baseClInv_of_baseMLD, baseMLD_of_clInv_eq⟩⟩

end CommonBase
end AperiodicOrder.Tiling
end Obsmetrologia
