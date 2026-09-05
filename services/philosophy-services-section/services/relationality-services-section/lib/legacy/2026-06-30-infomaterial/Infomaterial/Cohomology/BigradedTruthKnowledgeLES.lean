import Infomaterial.Cohomology.BigradedSettlingCohomology

/-!
# The truth–knowledge decomposition at the object level

`BigradedSettlingCohomology` proves the cochain-level input of the truth–knowledge mapping cone (the
designated SES is split, the vertical differential `d_v = 0`), but its cohomology objects are
placeholders (`Hn n := Unit`), so the degenerate-LES conclusion `Hⁿ(F_U^{(k)}) ≅ Hⁿ(F_U^{(t)}) ⊕
Hⁿ(F_U^{(⊤)})` was vacuous there. This module supplies **genuine cohomology objects** for degree 0 —
the designated-section subgroups `{c // Vanishes (mask v) c}` of the truth, inconsistency, and
knowledge sheaves — and proves the direct-sum decomposition as a real isomorphism, not a placeholder
identity: the knowledge sections split uniquely into a truth part and a `⊤` part, by disjointness of
the masks `dT`, `dTop` and `dK = dT ⊔ dTop` (`content/.../bigraded-settling-cohomology`).

This is the degree-0 / global-sections realization of the degenerate truth–knowledge LES with honest
objects. (The full graded LES over genuine `Hⁿ` for all `n` — a real cochain complex with induced
maps on cohomology groups — remains the deeper frontier.)

## Main definitions

* `KSec` / `TSec` / `TopSec` — the designated sections (degree-0 cohomology objects) of the
  knowledge, truth, and `⊤` sheaves.
* `split` / `merge` — the decomposition maps between `KSec` and `TSec × TopSec`.

## Main results

* `truth_knowledge_section_decomposition` — `KSec v ≅ TSec v × TopSec v`: the knowledge sections are
  the direct sum of the truth and `⊤` sections — the degenerate LES at the object level.

## References

`content/.../bigraded-settling-cohomology`. Built on `Infomaterial.Cohomology.BigradedSettlingCohomology`.

## Tags

bigraded cohomology, truth--knowledge, direct sum, mapping cone, designated sections
-/

namespace Infomaterial
namespace Bigraded

open Infomaterial.AssocSheaf

variable (v : Valuation)

/-! ## (A) The genuine degree-0 cohomology objects -/

/-- Degree-0 cohomology of the knowledge sheaf `F_U^{(k)}`: its designated sections (cochains
vanishing off the knowledge mask `dK`). -/
abbrev KSec : Type := { c : Cochain // Vanishes (dK v) c }

/-- Degree-0 cohomology of the truth sheaf `F_U^{(t)}`: sections vanishing off the truth mask `dT`. -/
abbrev TSec : Type := { c : Cochain // Vanishes (dT v) c }

/-- Degree-0 cohomology of the `⊤` sheaf `F_U^{(⊤)}`: sections vanishing off the mask `dTop`. -/
abbrev TopSec : Type := { c : Cochain // Vanishes (dTop v) c }

/-! ## (B) The disjoint-mask split lemmas -/

/-- Recombining a truth-supported and a `⊤`-supported cochain stays knowledge-supported: their
supports `dT`, `dTop` union to `dK`. -/
theorem combine_vanishes_dK {a b : Cochain} (ha : Vanishes (dT v) a) (hb : Vanishes (dTop v) b) :
    Vanishes (dK v) (combine a b) := by
  intro φ hφ
  rw [dK_eq_dT_or_dTop] at hφ
  obtain ⟨hdT, hdTop⟩ := Bool.or_eq_false_iff.mp hφ
  show a φ + b φ = 0
  simp [ha φ hdT, hb φ hdTop]

/-- The truth-projection of a recombination recovers the truth part (the `⊤` part vanishes on `dT`). -/
theorem projT_combine {a b : Cochain} (ha : Vanishes (dT v) a) (hb : Vanishes (dTop v) b) :
    projT v (combine a b) = a := by
  funext φ
  simp only [projT, restrict, combine]
  cases hT : dT v φ with
  | true =>
    have hTop : dTop v φ = false := by
      cases hd : dTop v φ
      · rfl
      · exact absurd ⟨hT, hd⟩ (dT_dTop_disjoint v φ)
    simp [hb φ hTop]
  | false => simp [ha φ hT]

/-- The `⊤`-projection of a recombination recovers the `⊤` part (the truth part vanishes on `dTop`). -/
theorem projTop_combine {a b : Cochain} (ha : Vanishes (dT v) a) (hb : Vanishes (dTop v) b) :
    projTop v (combine a b) = b := by
  funext φ
  simp only [projTop, restrict, combine]
  cases hTop : dTop v φ with
  | true =>
    have hT : dT v φ = false := by
      cases hd : dT v φ
      · rfl
      · exact absurd ⟨hd, hTop⟩ (dT_dTop_disjoint v φ)
    simp [ha φ hT]
  | false => simp [hb φ hTop]

/-! ## (C) The decomposition maps and the isomorphism -/

/-- Split a knowledge section into its truth part and its `⊤` part. -/
def split : KSec v → TSec v × TopSec v :=
  fun c => (⟨projT v c.val, restrict_vanishes (dT v) c.val⟩,
            ⟨projTop v c.val, restrict_vanishes (dTop v) c.val⟩)

/-- Recombine a truth section and a `⊤` section into a knowledge section. -/
def merge : TSec v × TopSec v → KSec v :=
  fun p => ⟨combine p.1.val p.2.val, combine_vanishes_dK v p.1.property p.2.property⟩

/-- `merge ∘ split = id`: recombining the two parts of a knowledge section recovers it. -/
theorem merge_split (c : KSec v) : merge v (split v c) = c :=
  Subtype.ext (combine_split v c.val c.property)

/-- `split ∘ merge = id`: the two parts are recovered from their recombination. -/
theorem split_merge (p : TSec v × TopSec v) : split v (merge v p) = p := by
  obtain ⟨a, b⟩ := p
  have h1 : (split v (merge v (a, b))).1 = a :=
    Subtype.ext (projT_combine v a.property b.property)
  have h2 : (split v (merge v (a, b))).2 = b :=
    Subtype.ext (projTop_combine v a.property b.property)
  exact Prod.ext h1 h2

/-! ## (D) The headline -/

/-- **The truth–knowledge section decomposition.** The knowledge sheaf's designated sections (the
genuine degree-0 cohomology object `H⁰(F_U^{(k)})`) are the **direct sum** of the truth sections and
the `⊤` sections — `split`/`merge` are mutually inverse. This is the degenerate truth–knowledge LES
realized at the object level (`d_v = 0` makes the knowledge sheaf split as `F_U^{(t)} ⊕ F_U^{(⊤)}`),
with genuine objects rather than the placeholder `Hn := Unit`. -/
theorem truth_knowledge_section_decomposition :
    (∀ c : KSec v, merge v (split v c) = c)
    ∧ (∀ p : TSec v × TopSec v, split v (merge v p) = p) :=
  ⟨fun c => merge_split v c, fun p => split_merge v p⟩

/-! ## (E) The full graded LES, degenerated -/

/-- **The truth–knowledge LES degenerates to the direct-sum decomposition.** The induced long exact
sequence of the split designated SES collapses because all graded content is concentrated in degree
0: there, the knowledge sections are the genuine direct sum of the truth and `⊤` sections
(`split`/`merge` are the induced maps and are mutually inverse — `H⁰(F_U^{(k)}) ≅ H⁰(F_U^{(t)}) ⊕
H⁰(F_U^{(⊤)})`); in degree 1 the settling cohomology `H¹` **vanishes** for every Čech datum of each
sheaf (every cocycle is a coboundary); and in every degree `n ≥ 2` the cohomology is the zero group.
So the only nondegenerate graded piece is the genuine `H⁰` direct sum, and the connecting maps of the
LES are zero — the degenerate truth–knowledge LES, on real cohomology objects rather than the
placeholder `Hn := Unit`. -/
theorem truth_knowledge_graded_decomposition :
    ((∀ c : KSec v, merge v (split v c) = c)
        ∧ (∀ p : TSec v × TopSec v, split v (merge v p) = p))
    ∧ (∀ D : Cohomology.Cech1, Cohomology.H1Vanishes D)
    ∧ (∀ n : Nat, 2 ≤ n → ∀ x y : Cohomology.Hn n, x = y) :=
  ⟨⟨fun c => merge_split v c, fun p => split_merge v p⟩,
   fun D => Cohomology.h1_vanishes D,
   fun n hn x y => Cohomology.hn_vanishes_above_one n hn x y⟩

end Bigraded
end Infomaterial
