import Obsmetrologia.Calculus.Order.CombinatoricsExtremal

/-!
# Proper colourings as factor maps, and the four-colour palette is FOUR

`CombinatoricsExtremal` builds the graph layer: `Graph V := V → V → Bool`, `Bipartite` (a
no-monochromatic-edge `V → Bool`), walks, walk-colour parity, and the necessary half of König —
a bipartite graph has no odd closed walk. This module lifts that 2-colour story to a general
**proper colouring** and pins the memo's thesis as a Lean identity:

> a proper colouring **is** a factor map (graph homomorphism) onto a finite colour shift.

The colour shift is the **complete graph** `completeGraph C` (distinct colours adjacent); a proper
`C`-colouring of `G` is exactly a graph map `G → completeGraph C` (`properColoring_iff_hom`). Colourings
then **pull back along factor maps** (`ProperColoring.comp`) — functoriality is what makes "coloring =
factor map" structural rather than a slogan, and it is the same vocabulary a sofic/matching-rule cover
uses (a substitution subshift is a factor of a shift of finite type).

The four-colour case is special: the natural palette is **FOUR** — the Belnap bilattice
`Reading = {⊥, t, f, ⊤}` that recurs through the corpus. The Four-Colour-Theorem palette and the four
readings are one alphabet (`fourColouring`).

## Main results
* `properColoring_iff_hom` — proper colouring ⟺ graph hom into the complete-graph colour shift.
* `ProperColoring.comp` — colourings pull back along factor maps.
* `Colorable.mono` — a palette injection lifts colourability (more colours never hurt).
* `bipartite_iff_colorableBool` — the existing `Bipartite` is exactly `Bool`-colourability.
* `not_bipartite_of_odd_closed_walk` — an odd closed walk forces `χ ≥ 3`.
* `fourColouring` / `fourColouring_iff_hom` — 4-colouring valued in the Belnap FOUR.

## References
Corpus `combinatorics.md`; the coloring-aperiodic-tiles memo (Evans–Gawlak–Ramsey–Strungaru–Trang
chromatic numbers; the "coloring = factor map to a finite shift = information" synthesis).
-/

namespace Obsmetrologia
namespace Combinatorics

open Obsmetrologia.Discrete (Graph)

/-- A **proper colouring** of `G` valued in a palette `C`: adjacent vertices receive distinct colours.
The palette-general form of `Bipartite` (which is the `C = Bool` case). -/
def ProperColoring {V C : Type} (G : Graph V) (c : V → C) : Prop :=
  ∀ u v, G u v = true → c u ≠ c v

/-- `G` is **`C`-colourable** when some proper colouring valued in `C` exists. -/
def Colorable {V : Type} (G : Graph V) (C : Type) : Prop := ∃ c : V → C, ProperColoring G c

/-- The **complete graph / colour shift** on palette `C`: distinct colours are adjacent. A proper
colouring is exactly a graph map into this object. -/
def completeGraph (C : Type) [DecidableEq C] : Graph C := fun a b => decide (a ≠ b)

/-- A **graph homomorphism / factor map** `f : V → W`: every edge of `G` maps to an edge of `H`. -/
def GraphHom {V W : Type} (G : Graph V) (H : Graph W) (f : V → W) : Prop :=
  ∀ u v, G u v = true → H (f u) (f v) = true

/-- **Colouring = factor map.** A proper `C`-colouring of `G` is precisely a graph homomorphism from
`G` into the complete-graph colour shift on `C` — the memo's thesis as an identity. -/
theorem properColoring_iff_hom {V C : Type} [DecidableEq C] (G : Graph V) (c : V → C) :
    ProperColoring G c ↔ GraphHom G (completeGraph C) c := by
  constructor
  · intro h u v huv
    exact decide_eq_true (h u v huv)
  · intro h u v huv
    exact of_decide_eq_true (h u v huv)

/-- **Colourings pull back along factor maps** (functoriality). If `f : G → H` is a graph hom and `d`
properly colours `H`, then `d ∘ f` properly colours `G`. This is what makes a sofic cover work: colour
the simpler (finite-type) cover, pull the colouring back along the factor. -/
theorem ProperColoring.comp {V W C : Type} {G : Graph V} {H : Graph W} {f : V → W}
    (hf : GraphHom G H f) {d : W → C} (hd : ProperColoring H d) :
    ProperColoring G (fun v => d (f v)) :=
  fun u v huv => hd (f u) (f v) (hf u v huv)

/-- **More colours never hurt.** An injection of palettes lifts colourability. -/
theorem Colorable.mono {V : Type} {G : Graph V} {C D : Type} (i : C → D)
    (hi : ∀ {a b}, i a = i b → a = b) (h : Colorable G C) : Colorable G D := by
  obtain ⟨c, hc⟩ := h
  exact ⟨fun v => i (c v), fun u v huv hcontra => hc u v huv (hi hcontra)⟩

/-- **`Bipartite` is exactly `Bool`-colourability** — the 2-colour case of the general definition. -/
theorem bipartite_iff_colorableBool {V : Type} (G : Graph V) : Bipartite G ↔ Colorable G Bool :=
  Iff.rfl

/-- **An odd closed walk obstructs 2-colouring** (so the chromatic number is `≥ 3`): the
contrapositive of `bipartite_no_odd_closed_walk`. -/
theorem not_bipartite_of_odd_closed_walk {V : Type} (G : Graph V) (start : V) (vs : List V)
    (hw : IsWalk G start vs) (hcl : walkEnd start vs = start) (hodd : vs.length % 2 = 1) :
    ¬ Bipartite G := by
  intro hbip
  have := bipartite_no_odd_closed_walk hbip start vs hw hcl
  omega

/-- **The four-colour palette is FOUR.** A `Reading`-valued proper colouring is a 4-colouring whose
palette is the Belnap bilattice `{⊥, t, f, ⊤}` — the same FOUR that recurs through the corpus. The
Four-Colour-Theorem palette and the four readings are one alphabet. -/
def fourColouring {V : Type} (G : Graph V) : Prop := Colorable G Reading

/-- A `Reading`-colouring is a factor map onto the complete graph on FOUR (`K₄` on the readings). -/
theorem fourColouring_iff_hom {V : Type} (G : Graph V) (c : V → Reading) :
    ProperColoring G c ↔ GraphHom G (completeGraph Reading) c :=
  properColoring_iff_hom G c

end Combinatorics
end Obsmetrologia
