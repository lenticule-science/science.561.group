import Obsmetrologia.Calculus.Order.ChromaticNumber
import Obsmetrologia.Calculus.Real.Logarithm

/-!
# Colouring entropy: `log₂(#proper colourings)`

The coloring-aperiodic-tiles memo's synthesis is *coloring = factor map = **information***. `GraphColoring`
and `ChromaticNumber` built the factor-map side; `Logarithm` built `log₂`. Here they meet on the
**information** side: the number of bits to specify a proper colouring is `log₂` of how many there are.

Core Lean has no `Fintype.card`, but a finite colouring set is just a concrete `List`, so its count is a
computation (`decide`) — no cardinality framework needed. For the single edge `K₂` the proper
2-colourings number exactly two, so its colouring entropy is `log₂ 2 = 1` **bit**, equal to
`fullShiftEntropy 2` (the full binary shift). A properly-2-coloured edge carries exactly one bit. The
complete graph `K₃` (triangle) has `3! = 6` proper 3-colourings, the falling-factorial pattern
`#colourings(Kₘ, c) = c·(c−1)⋯(c−m+1)`.

## Main results
* `properEdgeColourings_count` — a single edge has two proper 2-colourings.
* `edge_colouring_entropy` — so its colouring entropy is `log₂ 2 = 1` bit.
* `properTriangleColourings_count` — the triangle has `3! = 6` proper 3-colourings.
* `properK4Colourings_count` — `K₄` on FOUR has `4! = 24` proper 4-colourings.

## References
Corpus `combinatorics.md`; the coloring-aperiodic-tiles memo (the "coloring = information" synthesis).
-/

namespace Obsmetrologia
namespace Combinatorics

open Real.Internal

/-- The four colourings of a single edge's two endpoints, as `(colour v₀, colour v₁)`. -/
def edgeColourings : List (Bool × Bool) :=
  [(false, false), (false, true), (true, false), (true, true)]

/-- The **proper** ones: the endpoints get different colours (the edge's single constraint, exactly
`ProperColoring (completeGraph Bool)` read on the pair). -/
def properEdgeColourings : List (Bool × Bool) :=
  edgeColourings.filter (fun p => decide (p.1 ≠ p.2))

/-- **A single edge has exactly two proper 2-colourings** (`{(a,b) : a ≠ b}`). -/
theorem properEdgeColourings_count : properEdgeColourings.length = 2 := by decide

/-- **The edge's colouring entropy is one bit.** Specifying a proper 2-colouring of an edge — choosing
one of the two available — costs `log₂ 2 = 1` bit, exactly `fullShiftEntropy 2`, the entropy of the
full binary shift. The memo's "coloring = information" as a concrete equality. -/
theorem edge_colouring_entropy :
    logNat 2 properEdgeColourings.length (by decide) (by decide) = RReal.ofRat 1 :=
  logNat_self 2 (by decide)

/-- The 27 colourings of the triangle's three vertices with three colours, as `(c v₀, c v₁, c v₂)`. -/
def triangleColourings : List (Fin 3 × Fin 3 × Fin 3) :=
  (List.finRange 3).flatMap fun a =>
    (List.finRange 3).flatMap fun b =>
      (List.finRange 3).map fun c => (a, b, c)

/-- The **proper** triangle 3-colourings: all three vertices pairwise distinct (every pair is an edge). -/
def properTriangleColourings : List (Fin 3 × Fin 3 × Fin 3) :=
  triangleColourings.filter (fun p => decide (p.1 ≠ p.2.1 ∧ p.1 ≠ p.2.2 ∧ p.2.1 ≠ p.2.2))

/-- **The triangle has `3! = 6` proper 3-colourings** — the falling factorial `3·2·1`, the chromatic
polynomial of `K₃` at `c = 3`. (Its entropy `log₂ 6` has no nicer closed form, so we record the count.) -/
theorem properTriangleColourings_count : properTriangleColourings.length = 6 := by decide

/-! ### `K₄` on FOUR -/

/-- The 256 colourings of `K₄`'s four charge vertices by the FOUR palette. -/
def chargeColourings : List (Charge × Charge × Charge × Charge) :=
  [Charge.kBot, Charge.tTop, Charge.tBot, Charge.kTop].flatMap fun a =>
    [Charge.kBot, Charge.tTop, Charge.tBot, Charge.kTop].flatMap fun b =>
      [Charge.kBot, Charge.tTop, Charge.tBot, Charge.kTop].flatMap fun c =>
        [Charge.kBot, Charge.tTop, Charge.tBot, Charge.kTop].map fun d => (a, b, c, d)

/-- The proper `K₄` colourings by FOUR: every pair of vertices receives distinct
charges. -/
def properK4Colourings : List (Charge × Charge × Charge × Charge) :=
  chargeColourings.filter (fun p =>
    decide (p.1 ≠ p.2.1 ∧ p.1 ≠ p.2.2.1 ∧ p.1 ≠ p.2.2.2 ∧
      p.2.1 ≠ p.2.2.1 ∧ p.2.1 ≠ p.2.2.2 ∧ p.2.2.1 ≠ p.2.2.2))

/-- **`K₄` on FOUR has `4! = 24` proper 4-colourings.** The extremal obstruction
forces injectivity, and the finite count is the permutation count of the four
charges. -/
theorem properK4Colourings_count : properK4Colourings.length = 24 := by decide

end Combinatorics
end Obsmetrologia
