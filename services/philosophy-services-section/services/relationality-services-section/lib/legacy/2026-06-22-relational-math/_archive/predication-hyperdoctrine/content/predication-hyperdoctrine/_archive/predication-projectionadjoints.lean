import PredicationCategories.Categorical.FiberFunctor
import PredicationCategories.Categorical.TwistProductCompleteLattice

/-!
# Subject-projection and object-projection quantifier adjoints

Mechanizes the corpus theorems

- `theorems/predicate-subject-projection-quantifier-adjoints.md`
- `theorems/predicate-object-projection-quantifier-adjoints.md`

For each of the projection generators (subject and object) the induced
fiber map `f^* : A_p → A_q` carries both knowledge-order and truth-order
adjoints. Eight Galois biconditionals total — four per projection,
covering existential/universal × K-order/T-order.

The existential adjoints are *folds onto the diagonal* (rows for `subj`,
columns for `obj`) with the corresponding bilattice bottom off-diagonal:
`⊥` for K, `f` for T. The universal adjoints are dual *meets* with the
corresponding tops off-diagonal: `⊤` for K, `t` for T.

All eight proofs follow a uniform template:

  1. Reduce both sides of the biconditional to pointwise inequalities
     via `le{K,T}_pointwise`.
  2. Inspect the cell `(s, o)`:
     - one direction: instantiate the universal hypothesis at the
       relevant diagonal cell and unfold the indexed-join
       universal property.
     - other direction: case-split `s = o` vs `s ≠ o`. On the diagonal,
       use the indexed-join universal property; off-diagonal, use that
       the projection's default value (⊥ / ⊤ / f / t) sits at the
       extreme of the relevant order.

All eight definitions are `noncomputable` (the indexed joins use
`iSup`/`iInf`); the proofs require `[CompleteLattice L]` and
`[DecidableEq E]`.
-/

universe u v

open Categorical
open scoped Categorical.PreBilattice Categorical.Bilattice

namespace PredicateMap

variable {L : Type u} {E : Type v} [CompleteLattice L] [DecidableEq E]

/-! ## Pointwise order characterizations on the fiber algebra -/

/-- `v ≤ₖ w` on `PredicationFiberAlgebra` iff the inequality holds at
every cell. -/
theorem leK_pointwise (v w : PredicationFiberAlgebra L E) :
    v ≤ₖ w ↔ ∀ p, v p ≤ₖ w p := by
  refine ⟨fun h p => ?_, fun h => ?_⟩
  · show TwistProduct.infK (v p) (w p) = v p
    exact congrFun h p
  · show (fun p => TwistProduct.infK (v p) (w p)) = v
    funext p
    exact h p

/-- `v ≤ₜ w` on `PredicationFiberAlgebra` iff the inequality holds at
every cell. -/
theorem leT_pointwise (v w : PredicationFiberAlgebra L E) :
    v ≤ₜ w ↔ ∀ p, v p ≤ₜ w p := by
  refine ⟨fun h p => ?_, fun h => ?_⟩
  · show TwistProduct.infT (v p) (w p) = v p
    exact congrFun h p
  · show (fun p => TwistProduct.infT (v p) (w p)) = v
    funext p
    exact h p

/-! ## Subject-projection — K-existential adjoint `∃_f^k ⊣ f^*` -/

/-- `∃_f^k(w)`: K-row-fold at the subject diagonal, `⊥` off-diagonal. -/
noncomputable def existsK_subj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.kSup (fun o' => w (p.1, o')) else ⊥

@[simp] theorem existsK_subj_diag (w : PredicationFiberAlgebra L E) (s : E) :
    existsK_subj w (s, s) = TwistProduct.kSup (fun o' => w (s, o')) := if_pos rfl

theorem existsK_subj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : existsK_subj w (s, o) = (⊥ : TwistProduct L) := if_neg h

/-- **K-existential adjunction for subject-projection**: `∃_f^k ⊣ f^*`. -/
theorem existsK_subj_galois_K (w v : PredicationFiberAlgebra L E) :
    existsK_subj w ≤ₖ v ↔ w ≤ₖ fiberSubj L E v := by
  rw [leK_pointwise, leK_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · rw [fiberSubj_apply]
    have := h (s, s)
    rw [existsK_subj_diag, TwistProduct.kSup_leK_iff] at this
    exact this o
  · by_cases heq : s = o
    · subst heq
      rw [existsK_subj_diag, TwistProduct.kSup_leK_iff]
      intro o'
      have := h (s, o')
      rwa [fiberSubj_apply] at this
    · rw [existsK_subj_off_diag _ heq]
      exact TwistProduct.bot_leK _

/-! ## Subject-projection — K-universal adjoint `f^* ⊣ ∀_f^k` -/

/-- `∀_f^k(w)`: K-row-meet at the subject diagonal, `⊤` off-diagonal. -/
noncomputable def forallK_subj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.kInf (fun o' => w (p.1, o')) else ⊤

@[simp] theorem forallK_subj_diag (w : PredicationFiberAlgebra L E) (s : E) :
    forallK_subj w (s, s) = TwistProduct.kInf (fun o' => w (s, o')) := if_pos rfl

theorem forallK_subj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : forallK_subj w (s, o) = (⊤ : TwistProduct L) := if_neg h

/-- **K-universal adjunction for subject-projection**: `f^* ⊣ ∀_f^k`. -/
theorem forallK_subj_galois_K (v w : PredicationFiberAlgebra L E) :
    fiberSubj L E v ≤ₖ w ↔ v ≤ₖ forallK_subj w := by
  rw [leK_pointwise, leK_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · by_cases heq : s = o
    · subst heq
      rw [forallK_subj_diag, TwistProduct.leK_kInf_iff]
      intro o'
      have := h (s, o')
      rwa [fiberSubj_apply] at this
    · rw [forallK_subj_off_diag _ heq]
      exact TwistProduct.leK_top _
  · rw [fiberSubj_apply]
    have := h (s, s)
    rw [forallK_subj_diag, TwistProduct.leK_kInf_iff] at this
    exact this o

/-! ## Subject-projection — T-existential adjoint `∃_f^t ⊣ f^*` -/

/-- `∃_f^t(w)`: T-row-fold at the subject diagonal, `f` off-diagonal. -/
noncomputable def existsT_subj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.tSup (fun o' => w (p.1, o')) else TwistProduct.f

@[simp] theorem existsT_subj_diag (w : PredicationFiberAlgebra L E) (s : E) :
    existsT_subj w (s, s) = TwistProduct.tSup (fun o' => w (s, o')) := if_pos rfl

theorem existsT_subj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : existsT_subj w (s, o) = (TwistProduct.f : TwistProduct L) := if_neg h

/-- **T-existential adjunction for subject-projection**: `∃_f^t ⊣ f^*`. -/
theorem existsT_subj_galois_T (w v : PredicationFiberAlgebra L E) :
    existsT_subj w ≤ₜ v ↔ w ≤ₜ fiberSubj L E v := by
  rw [leT_pointwise, leT_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · rw [fiberSubj_apply]
    have := h (s, s)
    rw [existsT_subj_diag, TwistProduct.tSup_leT_iff] at this
    exact this o
  · by_cases heq : s = o
    · subst heq
      rw [existsT_subj_diag, TwistProduct.tSup_leT_iff]
      intro o'
      have := h (s, o')
      rwa [fiberSubj_apply] at this
    · rw [existsT_subj_off_diag _ heq]
      exact TwistProduct.f_leT _

/-! ## Subject-projection — T-universal adjoint `f^* ⊣ ∀_f^t` -/

/-- `∀_f^t(w)`: T-row-meet at the subject diagonal, `t` off-diagonal. -/
noncomputable def forallT_subj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.tInf (fun o' => w (p.1, o')) else TwistProduct.t

@[simp] theorem forallT_subj_diag (w : PredicationFiberAlgebra L E) (s : E) :
    forallT_subj w (s, s) = TwistProduct.tInf (fun o' => w (s, o')) := if_pos rfl

theorem forallT_subj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : forallT_subj w (s, o) = (TwistProduct.t : TwistProduct L) := if_neg h

/-- **T-universal adjunction for subject-projection**: `f^* ⊣ ∀_f^t`. -/
theorem forallT_subj_galois_T (v w : PredicationFiberAlgebra L E) :
    fiberSubj L E v ≤ₜ w ↔ v ≤ₜ forallT_subj w := by
  rw [leT_pointwise, leT_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · by_cases heq : s = o
    · subst heq
      rw [forallT_subj_diag, TwistProduct.leT_tInf_iff]
      intro o'
      have := h (s, o')
      rwa [fiberSubj_apply] at this
    · rw [forallT_subj_off_diag _ heq]
      exact TwistProduct.leT_t _
  · rw [fiberSubj_apply]
    have := h (s, s)
    rw [forallT_subj_diag, TwistProduct.leT_tInf_iff] at this
    exact this o

/-! ## Object-projection — K-existential adjoint `∃_f^k ⊣ f^*` -/

/-- `∃_f^k(w)` for object-projection: K-column-fold at the object
diagonal, `⊥` off-diagonal. -/
noncomputable def existsK_obj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.kSup (fun s' => w (s', p.2)) else ⊥

@[simp] theorem existsK_obj_diag (w : PredicationFiberAlgebra L E) (o : E) :
    existsK_obj w (o, o) = TwistProduct.kSup (fun s' => w (s', o)) := if_pos rfl

theorem existsK_obj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : existsK_obj w (s, o) = (⊥ : TwistProduct L) := if_neg h

/-- **K-existential adjunction for object-projection**: `∃_f^k ⊣ f^*`. -/
theorem existsK_obj_galois_K (w v : PredicationFiberAlgebra L E) :
    existsK_obj w ≤ₖ v ↔ w ≤ₖ fiberObj L E v := by
  rw [leK_pointwise, leK_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · rw [fiberObj_apply]
    have := h (o, o)
    rw [existsK_obj_diag, TwistProduct.kSup_leK_iff] at this
    exact this s
  · by_cases heq : s = o
    · subst heq
      rw [existsK_obj_diag, TwistProduct.kSup_leK_iff]
      intro s'
      have := h (s', s)
      rwa [fiberObj_apply] at this
    · rw [existsK_obj_off_diag _ heq]
      exact TwistProduct.bot_leK _

/-! ## Object-projection — K-universal adjoint `f^* ⊣ ∀_f^k` -/

/-- `∀_f^k(w)` for object-projection: K-column-meet at the object
diagonal, `⊤` off-diagonal. -/
noncomputable def forallK_obj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.kInf (fun s' => w (s', p.2)) else ⊤

@[simp] theorem forallK_obj_diag (w : PredicationFiberAlgebra L E) (o : E) :
    forallK_obj w (o, o) = TwistProduct.kInf (fun s' => w (s', o)) := if_pos rfl

theorem forallK_obj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : forallK_obj w (s, o) = (⊤ : TwistProduct L) := if_neg h

/-- **K-universal adjunction for object-projection**: `f^* ⊣ ∀_f^k`. -/
theorem forallK_obj_galois_K (v w : PredicationFiberAlgebra L E) :
    fiberObj L E v ≤ₖ w ↔ v ≤ₖ forallK_obj w := by
  rw [leK_pointwise, leK_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · by_cases heq : s = o
    · subst heq
      rw [forallK_obj_diag, TwistProduct.leK_kInf_iff]
      intro s'
      have := h (s', s)
      rwa [fiberObj_apply] at this
    · rw [forallK_obj_off_diag _ heq]
      exact TwistProduct.leK_top _
  · rw [fiberObj_apply]
    have := h (o, o)
    rw [forallK_obj_diag, TwistProduct.leK_kInf_iff] at this
    exact this s

/-! ## Object-projection — T-existential adjoint `∃_f^t ⊣ f^*` -/

/-- `∃_f^t(w)` for object-projection: T-column-fold at the object
diagonal, `f` off-diagonal. -/
noncomputable def existsT_obj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.tSup (fun s' => w (s', p.2)) else TwistProduct.f

@[simp] theorem existsT_obj_diag (w : PredicationFiberAlgebra L E) (o : E) :
    existsT_obj w (o, o) = TwistProduct.tSup (fun s' => w (s', o)) := if_pos rfl

theorem existsT_obj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : existsT_obj w (s, o) = (TwistProduct.f : TwistProduct L) := if_neg h

/-- **T-existential adjunction for object-projection**: `∃_f^t ⊣ f^*`. -/
theorem existsT_obj_galois_T (w v : PredicationFiberAlgebra L E) :
    existsT_obj w ≤ₜ v ↔ w ≤ₜ fiberObj L E v := by
  rw [leT_pointwise, leT_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · rw [fiberObj_apply]
    have := h (o, o)
    rw [existsT_obj_diag, TwistProduct.tSup_leT_iff] at this
    exact this s
  · by_cases heq : s = o
    · subst heq
      rw [existsT_obj_diag, TwistProduct.tSup_leT_iff]
      intro s'
      have := h (s', s)
      rwa [fiberObj_apply] at this
    · rw [existsT_obj_off_diag _ heq]
      exact TwistProduct.f_leT _

/-! ## Object-projection — T-universal adjoint `f^* ⊣ ∀_f^t` -/

/-- `∀_f^t(w)` for object-projection: T-column-meet at the object
diagonal, `t` off-diagonal. -/
noncomputable def forallT_obj (w : PredicationFiberAlgebra L E) :
    PredicationFiberAlgebra L E :=
  fun p => if p.1 = p.2 then TwistProduct.tInf (fun s' => w (s', p.2)) else TwistProduct.t

@[simp] theorem forallT_obj_diag (w : PredicationFiberAlgebra L E) (o : E) :
    forallT_obj w (o, o) = TwistProduct.tInf (fun s' => w (s', o)) := if_pos rfl

theorem forallT_obj_off_diag (w : PredicationFiberAlgebra L E) {s o : E}
    (h : s ≠ o) : forallT_obj w (s, o) = (TwistProduct.t : TwistProduct L) := if_neg h

/-- **T-universal adjunction for object-projection**: `f^* ⊣ ∀_f^t`. -/
theorem forallT_obj_galois_T (v w : PredicationFiberAlgebra L E) :
    fiberObj L E v ≤ₜ w ↔ v ≤ₜ forallT_obj w := by
  rw [leT_pointwise, leT_pointwise]
  refine ⟨fun h ⟨s, o⟩ => ?_, fun h ⟨s, o⟩ => ?_⟩
  · by_cases heq : s = o
    · subst heq
      rw [forallT_obj_diag, TwistProduct.leT_tInf_iff]
      intro s'
      have := h (s', s)
      rwa [fiberObj_apply] at this
    · rw [forallT_obj_off_diag _ heq]
      exact TwistProduct.leT_t _
  · rw [fiberObj_apply]
    have := h (o, o)
    rw [forallT_obj_diag, TwistProduct.leT_tInf_iff] at this
    exact this s

end PredicateMap
