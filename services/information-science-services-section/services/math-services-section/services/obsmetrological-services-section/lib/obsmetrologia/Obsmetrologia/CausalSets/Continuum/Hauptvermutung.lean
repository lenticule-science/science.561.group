import Obsmetrologia.CausalSets.Action.EinsteinHilbertAction

/-!
# The spacetime fingerprint — the Hauptvermutung's testable content

The Hauptvermutung conjectures that a causal set's faithful continuum embedding is essentially
unique. Its *force* is that the continuum is over-determined by order-intrinsic data; its open part
(continuum uniqueness, approximate isometry) cannot even be stated here — no Lorentzian manifolds are
formalized (see the corpus node). What *is* green is the **spacetime fingerprint**: the invariants any
embedding must reproduce, all computed from `(E, ≺)` alone.

## Main definitions

* `SpacetimeFingerprint` — the order-intrinsic tuple `(relations, action)` (dimension input + the
  discrete Einstein–Hilbert action / curvature).
* `fingerprint` — read it off a causal order, with no manifold.

## Main results

* `diamond_fingerprint` — the diamond's fingerprint `(5, 1)`: five relations, action `1`.

## References

`content/.../lorentzian-causal-settling/content/hauptvermutung`. Reads `apexCount`
(`CausalSets.Dimension.OrderingFraction`) and `bdAction` (`CausalSets.Action.EinsteinHilbertAction`).

## Tags

Hauptvermutung, faithful embedding, spacetime fingerprint, causal set, intrinsic invariant
-/

namespace Obsmetrologia
namespace CausalSets.Continuum.Hauptvermutung

open Obsmetrologia.CausalSets.Dimension.OrderingFraction
open Obsmetrologia.CausalSets.Action.EinsteinHilbertAction

/-- The **spacetime fingerprint** of a causal order: the order-intrinsic data a faithful continuum
embedding must reproduce — the relation count (the Myrheim–Meyer dimension input) and the discrete
Einstein–Hilbert action (curvature). Computed from `(es, prec)` alone, with no manifold; the
Hauptvermutung conjectures this (suitably completed) determines the continuum uniquely. -/
structure SpacetimeFingerprint where
  /-- The relation count `|Apex|` — the Myrheim–Meyer dimension input. -/
  relations : Nat
  /-- The discrete Einstein–Hilbert (Benincasa–Dowker) action `∑_x □1(x)`. -/
  action : Int
deriving DecidableEq

/-- Read the spacetime fingerprint off a causal order. -/
def fingerprint {E : Type} [DecidableEq E] (es : List E) (prec : E → E → Bool) :
    SpacetimeFingerprint :=
  { relations := apexCount es prec, action := bdAction es prec }

/-- **The diamond's spacetime fingerprint** `(5, 1)`: five causal relations (the dimension input)
and Einstein–Hilbert action `1` (its single minimal boundary event). The order-intrinsic data the
Hauptvermutung says fixes the continuum. -/
theorem diamond_fingerprint :
    fingerprint fourEvents diamondPrec = { relations := 5, action := 1 } := by
  decide

end CausalSets.Continuum.Hauptvermutung
end Obsmetrologia
