import Obsmetrologia.Language.Positing.Morphism

/-!
# Positing.MorphismNaturality — naturality of `posit` under the other three generators

`Morphism.lean` proved that `posit` is natural under reindexing along `converse`
(`posit_converse_natural`), and said in its closing remarks that naturality for
`subjProj`/`objProj`/`specialize` was open because the proof leaned on
`PredicationCell.converse_eq_iff`, an involution fact. This module works out and proves the
**honest** statement for each of the other three generators. The four generators
do not all deserve the same strength of claim, and the point of this module is to
say precisely which strength each one gets and why:

* **`converse`** — an involution (hence a bijection). Full pointwise naturality,
  already proved in `Morphism.lean` (`posit_converse_natural`).
* **`specialize f` for `f` injective** — an injective (but not surjective, and not
  in general involutive) reindexing. Full pointwise naturality holds
  (`posit_reindex_natural_of_specialize_injective`), because injectivity alone —
  not bijectivity — is what the proof needs: it only ever uses the *cancellation*
  direction of `f`, never an inverse.
* **`subjProj` / `objProj`** — idempotent, non-injective projections onto the
  diagonal (`{χ : χ.subject = χ.object}`). The single-posit naturality form
  **fails in general** — we exhibit a concrete counterexample
  (`posit_reindex_subjProj_not_natural`) built from two cells that collapse to
  the same image. What *is* true, and proved here, is the **diagonal fixed-point
  case**: restricted to query points `ψ` already on the diagonal, `subjProj`
  (resp. `objProj`) acts as the identity, so naturality holds there for *every*
  `φ`, not just diagonal `φ` (`posit_reindex_subjProj_diagonal`,
  `posit_reindex_objProj_diagonal`).

The four results are obtained from one shared, fully general fact that needs no
hypothesis on `r` at all: the **exchange lemma** (`reindex_posit_exchange`) and its
immediate corollary, the **pull-back form** of `delta` (`delta_reindex_point`).
Everything else in this file is these two facts specialized to what is true of
each generator's fiber structure.

Everything is stated **pointwise**; no `funext` is used anywhere in this file.
-/

namespace Obsmetrologia
namespace Valuation

/-! ## 1. The general exchange lemma — true for every `r`, no hypothesis needed

Reindexing a posited valuation along **any** cellwise map `r` unfolds to a join of
the reindexed valuation with `delta` hit at the *pushed-forward* query point `r ψ`.
This is immediate from the definitions of `reindex` and `posit` — a single `rfl`. -/

/-- **Exchange lemma.** For any `r : PredicationCell → PredicationCell` (no injectivity, no
involution — nothing assumed), reindexing a posited valuation along `r` is the
join of the reindexed valuation with `delta` evaluated at the pushed-forward
point `r ψ`. Every naturality statement below is this fact plus a description
of when `delta φ q (r ψ)` collapses to a single-posit shape. -/
theorem reindex_posit_exchange (r : PredicationCell → PredicationCell) (φ : PredicationCell) (q : Charge)
    (v : Valuation) (ψ : PredicationCell) :
    Valuation.reindex r (posit φ q v) ψ
      = Charge.joinK (Valuation.reindex r v ψ) (delta φ q (r ψ)) := rfl

/-! ## 2. The pull-back form of `delta`, and naturality for injective `r`

`delta φ q` at a pushed-forward point `r ψ` is, by definition, an if-then-else on
`r ψ = φ`. When `r` is **injective** and `φ` itself is in the image of `r`, say
`φ = r φ'`, cancellation turns that condition into `ψ = φ'` — the condition
`delta φ' q` tests at `ψ` directly. This is exactly what makes the single-posit
naturality form hold: injectivity, not bijectivity, is the load-bearing
hypothesis. Nothing here uses an inverse of `r`. -/

/-- **Pull-back form of `delta`.** Unconditional in `r` — a restatement of the
definition of `delta` at the pushed-forward point `r ψ`. -/
theorem delta_reindex_point (φ : PredicationCell) (q : Charge) (r : PredicationCell → PredicationCell) (ψ : PredicationCell) :
    delta φ q (r ψ) = if r ψ = φ then q else Charge.kBot := rfl

/-- **Naturality under injective reindexing.** When `r` is injective and the
posited cell `φ` is itself `r`'s image of some `φ'`, reindexing the posit along
`r` is the same as positing at `φ'` into the already-reindexed valuation. The
only use of `hr` is the cancellation direction `r ψ = r φ' → ψ = φ'`; no inverse
of `r` is constructed or needed. -/
theorem posit_reindex_natural_of_injective (r : PredicationCell → PredicationCell) (hr : Function.Injective r)
    (φ' : PredicationCell) (q : Charge) (v : Valuation) (ψ : PredicationCell) :
    Valuation.reindex r (posit (r φ') q v) ψ
      = posit φ' q (Valuation.reindex r v) ψ := by
  rw [reindex_posit_exchange, delta_reindex_point]
  show Charge.joinK (Valuation.reindex r v ψ) (if r ψ = r φ' then q else Charge.kBot) = _
  unfold posit delta
  by_cases h : ψ = φ'
  · rw [if_pos (congrArg r h), if_pos h]
  · rw [if_neg (fun hh => h (hr hh)), if_neg h]

end Valuation

/-! ## 3. Instantiating for `specialize` — injective on cells iff injective on predicates -/

namespace PredicationCell

/-- `specialize f` is injective on cells **iff** `f` is injective on predicates.
The entity coordinates (`subject`, `object`) pass through `specialize` unchanged,
so all the discriminating power is carried by the predicate coordinate — the
cell-level and predicate-level injectivity questions are the same question. -/
theorem specialize_injective_iff (f : Predicate → Predicate) :
    Function.Injective (specialize f) ↔ Function.Injective f := by
  constructor
  · intro hcell p₁ p₂ hp
    have hc : specialize f (⟨default, p₁, default⟩ : PredicationCell)
        = specialize f (⟨default, p₂, default⟩ : PredicationCell) := by
      show (⟨(default : Entity), f p₁, default⟩ : PredicationCell)
          = ⟨default, f p₂, default⟩
      rw [hp]
    have := hcell hc
    exact congrArg PredicationCell.predicate this
  · intro hf φ₁ φ₂ hφ
    obtain ⟨s₁, p₁, o₁⟩ := φ₁
    obtain ⟨s₂, p₂, o₂⟩ := φ₂
    simp only [specialize, PredicationCell.mk.injEq] at hφ
    obtain ⟨hs, hp, ho⟩ := hφ
    exact PredicationCell.mk.injEq .. |>.mpr ⟨hs, hf hp, ho⟩

end PredicationCell

namespace Valuation

/-- **Naturality under an injective specialization.** Corollary of
`posit_reindex_natural_of_injective` via `specialize_injective_iff`: for `f`
injective on predicates, reindexing a `specialize f`-posit is a single posit at
the pulled-back cell `φ'`. -/
theorem posit_reindex_natural_of_specialize_injective (f : Predicate → Predicate)
    (hf : Function.Injective f) (φ' : PredicationCell) (q : Charge) (v : Valuation) (ψ : PredicationCell) :
    Valuation.reindex (PredicationCell.specialize f)
        (posit (PredicationCell.specialize f φ') q v) ψ
      = posit φ' q (Valuation.reindex (PredicationCell.specialize f) v) ψ :=
  posit_reindex_natural_of_injective (PredicationCell.specialize f)
    ((PredicationCell.specialize_injective_iff f).mpr hf) φ' q v ψ

/-! ## 4. `subjProj` / `objProj` — the single-posit form fails; the diagonal form holds

`subjProj` and `objProj` are idempotent projections onto the diagonal
`{χ : χ.subject = χ.object}`, and neither is injective: every cell sharing a
subject (resp. object) and predicate collapses to the same `subjProj`
(resp. `objProj`) image, regardless of the other coordinate. So for a target `φ`
in the image, the fiber `{ψ : subjProj ψ = φ}` is not a singleton, and no single
`φ'` can make `delta φ q (subjProj ψ) = delta φ' q ψ` hold for every `ψ` in that
fiber — the hypothesis `posit_reindex_natural_of_injective` needs is simply
false for `subjProj`/`objProj`. We record this as a genuine counterexample rather
than merely asserting it. -/

/-- Two cells sharing subject and predicate but differing in object,
demonstrating a non-trivial `subjProj` fiber: both collapse to `φ₀`. -/
private def φ₀ : PredicationCell := ⟨⟨⟨"s"⟩⟩, ⟨⟨"p"⟩⟩, ⟨⟨"s"⟩⟩⟩
private def ψ₁ : PredicationCell := ⟨⟨⟨"s"⟩⟩, ⟨⟨"p"⟩⟩, ⟨⟨"o1"⟩⟩⟩
private def ψ₂ : PredicationCell := ⟨⟨⟨"s"⟩⟩, ⟨⟨"p"⟩⟩, ⟨⟨"o2"⟩⟩⟩

private theorem subjProj_ψ₁ : PredicationCell.subjProj ψ₁ = φ₀ := rfl
private theorem subjProj_ψ₂ : PredicationCell.subjProj ψ₂ = φ₀ := rfl
private theorem ψ₁_ne_ψ₂ : ψ₁ ≠ ψ₂ := by decide
private theorem tTop_ne_kBot : Charge.tTop ≠ Charge.kBot := by decide

/-- **The single-posit naturality form fails for `subjProj`, in general.** No
`φ'` makes `reindex subjProj (posit φ₀ q v) ψ = posit φ' q (reindex subjProj v) ψ`
hold at *every* `ψ`: `ψ₁` and `ψ₂` both lie in `subjProj`'s fiber over `φ₀`, so
matching the equation at `ψ₁` forces `φ' = ψ₁` and matching it at `ψ₂` forces
`φ' = ψ₂` — impossible since `ψ₁ ≠ ψ₂`. This is the honest negative counterpart
to `posit_reindex_natural_of_injective`: it is exactly the failure of
injectivity that breaks the single-posit form. -/
theorem posit_reindex_subjProj_not_natural :
    ¬ ∃ φ' : PredicationCell, ∀ ψ : PredicationCell,
        Valuation.reindex PredicationCell.subjProj
            (posit φ₀ Charge.tTop Valuation.knowledgeLeast) ψ
          = posit φ' Charge.tTop
              (Valuation.reindex PredicationCell.subjProj Valuation.knowledgeLeast) ψ := by
  rintro ⟨φ', hφ'⟩
  have h1 := hφ' ψ₁
  have h2 := hφ' ψ₂
  rw [reindex_posit_exchange, subjProj_ψ₁] at h1
  rw [reindex_posit_exchange, subjProj_ψ₂] at h2
  have hkl : ∀ χ : PredicationCell, Valuation.reindex PredicationCell.subjProj Valuation.knowledgeLeast χ
      = Charge.kBot := fun _ => rfl
  have hd0 : delta φ₀ Charge.tTop φ₀ = Charge.tTop := by unfold delta; rw [if_pos rfl]
  rw [hkl ψ₁, hd0, Charge.joinK_kBot] at h1
  rw [hkl ψ₂, hd0, Charge.joinK_kBot] at h2
  unfold posit at h1 h2
  rw [hkl ψ₁, Charge.joinK_kBot] at h1
  rw [hkl ψ₂, Charge.joinK_kBot] at h2
  unfold delta at h1 h2
  have e1 : ψ₁ = φ' := by
    by_cases hne : ψ₁ = φ'
    · exact hne
    · rw [if_neg hne] at h1; exact absurd h1 tTop_ne_kBot
  have e2 : ψ₂ = φ' := by
    by_cases hne : ψ₂ = φ'
    · exact hne
    · rw [if_neg hne] at h2; exact absurd h2 tTop_ne_kBot
  exact ψ₁_ne_ψ₂ (e1.trans e2.symm)

/-- `subjProj` fixes every diagonal cell — a cell whose subject already equals
its object is untouched. -/
theorem subjProj_fixed_of_diagonal {χ : PredicationCell} (h : χ.subject = χ.object) :
    PredicationCell.subjProj χ = χ := by
  obtain ⟨s, p, o⟩ := χ
  simp only [PredicationCell.subjProj] at h ⊢
  simp only [h]

/-- `objProj` fixes every diagonal cell, symmetrically. -/
theorem objProj_fixed_of_diagonal {χ : PredicationCell} (h : χ.subject = χ.object) :
    PredicationCell.objProj χ = χ := by
  obtain ⟨s, p, o⟩ := χ
  simp only [PredicationCell.objProj] at h ⊢
  simp only [← h]

/-- **The honest positive form for `subjProj`.** Restricted to query points `ψ`
already on the diagonal, `subjProj` acts as the identity there
(`subjProj_fixed_of_diagonal`), so the single-posit naturality form holds — for
**every** `φ`, not only diagonal `φ`: if `φ` is off the diagonal, `subjProj ψ`
(= `ψ`, diagonal) can never equal it, so both sides independently collapse to
`reindex subjProj v ψ` with no contribution from the posit, and the equation
still holds trivially. This is the true, narrower fact that replaces the failed
general claim. -/
theorem posit_reindex_subjProj_diagonal (φ : PredicationCell) (q : Charge) (v : Valuation)
    (ψ : PredicationCell) (hψ : ψ.subject = ψ.object) :
    Valuation.reindex PredicationCell.subjProj (posit φ q v) ψ
      = posit φ q (Valuation.reindex PredicationCell.subjProj v) ψ := by
  rw [reindex_posit_exchange, subjProj_fixed_of_diagonal hψ]
  rfl

/-- **The honest positive form for `objProj`**, symmetrically. -/
theorem posit_reindex_objProj_diagonal (φ : PredicationCell) (q : Charge) (v : Valuation)
    (ψ : PredicationCell) (hψ : ψ.subject = ψ.object) :
    Valuation.reindex PredicationCell.objProj (posit φ q v) ψ
      = posit φ q (Valuation.reindex PredicationCell.objProj v) ψ := by
  rw [reindex_posit_exchange, objProj_fixed_of_diagonal hψ]
  rfl

end Valuation
end Obsmetrologia
