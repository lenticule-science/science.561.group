import Obsmetrologia.Calculus.Order.GraphColoring

/-!
# Concrete chromatic numbers: the complete-graph ladder, `χ(K₄) = FOUR`

`GraphColoring` pinned the memo's thesis — a proper colouring **is** a factor map onto the
complete-graph colour shift (`properColoring_iff_hom`). This module cashes that into **exact
chromatic numbers** for the complete graphs `Kₙ = completeGraph (Fin n)` (and `K₄ = completeGraph
Charge`), the worked §2 examples of the coloring-aperiodic-tiles memo.

A complete graph is the extremal case in both directions:
* **upper bound** — the identity colours `K_C` with `C` (`completeGraph_colorable`): distinct
  vertices are distinct colours.
* **lower bound** — *every* proper colouring of `K_C` is **injective** (`proper_completeGraph_injective`):
  all vertices are pairwise adjacent, so no two share a colour. Hence `K_C` cannot be coloured by any
  palette that `C` does not inject into (`not_colorable_completeGraph`).

Together these give `χ(K_C) = |C|` exactly. The instances:
* `χ(K₂) = 2` — a single edge (the minimal 2-chromatic graph; a bipartite tile like the chair is
  2-chromatic for the same two reasons: it has an edge, and it is bipartite).
* `χ(K₃) = 3` — the triangle, the first odd cycle: 3-colourable but not bipartite.
* `χ(K₄) = 4 = FOUR` — and the lower bound says it tightly: every 4-colouring of `K₄` uses **all four
  charges** `{⊥, t, f, ⊤}` distinctly. The Four-Colour palette is exactly the Belnap bilattice, and
  `K₄` is what forces all four — the memo's "four colours = FOUR" made an extremal theorem.

## Main results
* `completeGraph_colorable` / `proper_completeGraph_injective` — the two-sided bound `χ(K_C) = |C|`.
* `K2_not_one_colorable`, `K3_not_bipartite`, `K3_three_colorable` — `χ(K₂)=2`, `χ(K₃)=3`.
* `K4_requires_FOUR` — every proper colouring of `K₄` is injective on the four charges.

## References
Corpus `combinatorics.md`; the coloring-aperiodic-tiles memo §2 (concrete chromatic numbers).
-/

namespace Obsmetrologia
namespace Combinatorics

open Obsmetrologia.Discrete (Graph)

/-- **The identity properly colours `K_C`**: distinct vertices receive distinct colours, which is
exactly the complete-graph adjacency. -/
theorem completeGraph_self_coloring {C : Type} [DecidableEq C] :
    ProperColoring (completeGraph C) (fun c => c) :=
  fun _ _ huv => of_decide_eq_true huv

/-- **`K_C` is `C`-colourable** (the chromatic upper bound `χ(K_C) ≤ |C|`). -/
theorem completeGraph_colorable {C : Type} [DecidableEq C] : Colorable (completeGraph C) C :=
  ⟨fun c => c, completeGraph_self_coloring⟩

/-- **Every proper colouring of a complete graph is injective** (the lower bound `χ(K_C) ≥ |C|`): all
vertices are pairwise adjacent, so they get pairwise-distinct colours. -/
theorem proper_completeGraph_injective {C D : Type} [DecidableEq C] {c : C → D}
    (hc : ProperColoring (completeGraph C) c) : Function.Injective c := by
  intro a b hab
  by_cases h : a = b
  · exact h
  · exact absurd hab (hc a b (decide_eq_true h))

/-- **No injection of palettes ⟹ not colourable.** If `C` does not inject into `D`, the complete graph
`K_C` cannot be properly `D`-coloured — there are not enough colours. -/
theorem not_colorable_completeGraph {C D : Type} [DecidableEq C]
    (hCD : ¬ ∃ f : C → D, Function.Injective f) : ¬ Colorable (completeGraph C) D := by
  rintro ⟨c, hc⟩
  exact hCD ⟨c, proper_completeGraph_injective hc⟩

/-! ### `χ(K₂) = 2` — a single edge -/

/-- No injection `Bool ↪ PUnit`: two values cannot fit one colour. -/
theorem no_injection_bool_punit : ¬ ∃ f : Bool → PUnit, Function.Injective f := by
  rintro ⟨f, hf⟩
  exact absurd (hf (Subsingleton.elim (f true) (f false))) (by decide)

/-- **`K₂` is 2-colourable** — `completeGraph Bool` is the single edge. -/
theorem K2_two_colorable : Colorable (completeGraph Bool) Bool := completeGraph_colorable

/-- **`K₂` is not 1-colourable**: a single edge needs two colours, so `χ(K₂) = 2`. -/
theorem K2_not_one_colorable : ¬ Colorable (completeGraph Bool) PUnit :=
  not_colorable_completeGraph no_injection_bool_punit

/-! ### `χ(K₃) = 3` — the triangle -/

/-- No injection `Fin 3 ↪ Bool`: three vertices cannot share two colours (pigeonhole). -/
theorem no_injection_fin3_bool : ¬ ∃ f : Fin 3 → Bool, Function.Injective f := by
  rintro ⟨f, hf⟩
  have h01 : f 0 ≠ f 1 := fun h => absurd (hf h) (by decide)
  have h02 : f 0 ≠ f 2 := fun h => absurd (hf h) (by decide)
  have h12 : f 1 ≠ f 2 := fun h => absurd (hf h) (by decide)
  cases hf0 : f 0 <;> cases hf1 : f 1 <;> cases hf2 : f 2 <;> simp_all

/-- **`K₃` is 3-colourable.** -/
theorem K3_three_colorable : Colorable (completeGraph (Fin 3)) (Fin 3) := completeGraph_colorable

/-- **`K₃` (the triangle) is not 2-colourable**: not bipartite, so `χ(K₃) = 3` — the first odd cycle. -/
theorem K3_not_bipartite : ¬ Colorable (completeGraph (Fin 3)) Bool :=
  not_colorable_completeGraph no_injection_fin3_bool

/-! ### `χ(K₄) = 4 = FOUR` -/

/-- **`K₄` is colourable by the Belnap FOUR** `{⊥, t, f, ⊤}`. -/
theorem K4_four_colorable : Colorable (completeGraph Charge) Charge := completeGraph_colorable

/-- **`K₄` requires all four charges.** Every proper colouring of `K₄ = completeGraph Charge` is
*injective* on the four charges — there is no slack, all of `{⊥, t, f, ⊤}` must appear. The
Four-Colour palette is exactly the FOUR bilattice, and `K₄` is the extremal graph that forces it. -/
theorem K4_requires_FOUR {D : Type} {c : Charge → D}
    (hc : ProperColoring (completeGraph Charge) c) : Function.Injective c :=
  proper_completeGraph_injective hc

end Combinatorics
end Obsmetrologia
