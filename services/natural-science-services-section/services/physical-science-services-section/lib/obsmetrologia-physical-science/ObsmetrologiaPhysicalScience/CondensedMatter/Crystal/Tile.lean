import Obsmetrologia.AperiodicOrder.Tiling.FiniteLocalRule

/-!
# Tiles: the finite-local-rule face of substance

The base rung of the substance ladder: a local transition graph together with
one admissible word of that graph.

## Main definitions
* `Tiles`

## References
Corpus glass line; the coloring-aperiodic-tiles memo.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Crystal

open Obsmetrologia.Discrete (Graph)

/-- `Tiles` are the finite-local-rule face: a local transition graph together
with one admissible word of that graph. -/
structure Tiles where
  /-- The local alphabet or tile carrier. -/
  Carrier : Type
  /-- The finite local compatibility rule. -/
  localRule : Graph Carrier
  /-- A listed local pattern. -/
  word : List Carrier
  /-- The listed pattern obeys the finite local rule. -/
  admissible : AperiodicOrder.Tiling.Path localRule word

end AperiodicOrder.Crystal
end Obsmetrologia
