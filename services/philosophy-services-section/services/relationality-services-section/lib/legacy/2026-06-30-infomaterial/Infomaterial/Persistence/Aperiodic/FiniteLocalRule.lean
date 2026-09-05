import Infomaterial.Persistence.Aperiodic.SoficShift

/-!
# Finite local rules: the category of graph factors, and how it carries SFT words

A **finite local rule** in this corpus appears under two faces that `GraphColoring` and `SoficShift`
treat separately:

* a `Graph V` read as a **colour/adjacency constraint** — a proper colouring is a graph hom into the
  complete-graph colour shift (`properColoring_iff_hom`);
* a `Graph A` read as a **one-step shift of finite type** — its admissible words are the directed walks
  `Path` of the transition graph.

This module welds the two by giving `GraphHom` its category structure and proving the one fact that
makes "colouring = factor map = SFT morphism" structural rather than a slogan: **a graph homomorphism
carries SFT-admissible words to admissible words** (`GraphHom.map_path`). With that bridge a proper
colouring relabels every admissible word of `G` into an admissible word of the colour shift
(`ProperColoring.map_path`), colourings pull back along factors (`Colorable.pullback`,
`fourColouring_pullback`), and the one-block factor of any SFT word is sofic (`factor_of_sft_is_sofic`,
the general form of `sft_is_sofic`).

## Main results
* `GraphHom.id`, `GraphHom.comp` — graph factors form a category.
* `GraphHom.map_path` — a graph hom sends `Path`s to `Path`s (the colour-world ↔ SFT-world bridge).
* `Colorable.pullback` / `fourColouring_pullback` — colourings pull back along graph factors.
* `ProperColoring.map_path` — a proper colouring relabels admissible words into colour-shift walks.
* `factor_of_sft_is_sofic` — any one-block factor of an admissible word is sofic.

## References
Corpus aperiodic-settling line; the coloring-aperiodic-tiles memo §4 (coloring = factor map = sofic
cover). Consolidates `Order.GraphColoring` and `Persistence.Aperiodic.SoficShift`.
-/

namespace Infomaterial
namespace Combinatorics

open Infomaterial.Discrete (Graph)

/-- **Identity is a graph factor.** -/
theorem GraphHom.id {V : Type} (G : Graph V) : GraphHom G G (fun v => v) :=
  fun _ _ huv => huv

/-- **Graph factors compose** (functoriality of the local-rule category): a factor of a factor is a
factor. -/
theorem GraphHom.comp {U V W : Type} {G : Graph U} {H : Graph V} {K : Graph W}
    {f : U → V} {g : V → W} (hf : GraphHom G H f) (hg : GraphHom H K g) :
    GraphHom G K (fun u => g (f u)) :=
  fun u v huv => hg (f u) (f v) (hf u v huv)

/-- **A graph hom carries admissible words to admissible words.** Every directed walk of `G` maps,
letter-by-letter through `f`, to a directed walk of `H` — the structural content uniting the colour and
SFT readings of a finite local rule: a factor map preserves admissibility. -/
theorem GraphHom.map_path {V W : Type} {G : Graph V} {H : Graph W} {f : V → W}
    (hf : GraphHom G H f) : ∀ p : List V, Persistence.Aperiodic.Path G p → Persistence.Aperiodic.Path H (p.map f)
  | [], _ => trivial
  | [_], _ => trivial
  | a :: b :: r, h => by
      obtain ⟨hab, hrest⟩ := h
      show Persistence.Aperiodic.Path H (f a :: f b :: r.map f)
      exact ⟨hf a b hab, GraphHom.map_path hf (b :: r) hrest⟩

/-- **Colourings pull back along graph factors.** If `f : G → H` is a factor and `H` is `C`-colourable,
so is `G` (colour `G` by `c ∘ f`). The factor-direction companion to `Colorable.mono` (palette
direction). -/
theorem Colorable.pullback {V W C : Type} {G : Graph V} {H : Graph W} {f : V → W}
    (hf : GraphHom G H f) (h : Colorable H C) : Colorable G C := by
  obtain ⟨c, hc⟩ := h
  exact ⟨fun v => c (f v), ProperColoring.comp hf hc⟩

/-- **Four-colourability pulls back along graph factors** — the FOUR-palette case of
`Colorable.pullback`. -/
theorem fourColouring_pullback {V W : Type} {G : Graph V} {H : Graph W} {f : V → W}
    (hf : GraphHom G H f) (h : fourColouring H) : fourColouring G :=
  Colorable.pullback hf h

/-- **A proper colouring relabels admissible words into colour-shift walks.** Reading the colouring as
the factor map `G → completeGraph C` (`properColoring_iff_hom`) and applying `GraphHom.map_path`: every
admissible word of `G`, recoloured by `c`, is an admissible word of the complete-graph colour shift. The
synthesis of the two faces. -/
theorem ProperColoring.map_path {V C : Type} [DecidableEq C] {G : Graph V} {c : V → C}
    (hc : ProperColoring G c) (p : List V) (hp : Persistence.Aperiodic.Path G p) :
    Persistence.Aperiodic.Path (completeGraph C) (p.map c) :=
  GraphHom.map_path ((properColoring_iff_hom G c).mp hc) p hp

end Combinatorics

namespace Persistence.Aperiodic

open Infomaterial.Discrete (Graph)

/-- **Any one-block factor of an admissible word is sofic** — the defining witness `⟨p, hp, rfl⟩`: a
sofic word is exactly a `π`-relabelled admissible word. Generalises `sft_is_sofic` (the `π = id` case)
to an arbitrary letter map `π : A → B`. -/
theorem factor_of_sft_is_sofic {A B : Type} (step : Graph A) (π : A → B) (p : List A)
    (hp : Path step p) : SoficImage step π (p.map π) :=
  ⟨p, hp, rfl⟩

end Persistence.Aperiodic
end Infomaterial
