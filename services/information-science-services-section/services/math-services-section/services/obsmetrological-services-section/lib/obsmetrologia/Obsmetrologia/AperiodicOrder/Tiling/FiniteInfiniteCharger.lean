import Obsmetrologia.AperiodicOrder.Tiling.SoficShift
import Obsmetrologia.AperiodicOrder.Tiling.AndersonPutnam
import Obsmetrologia.Language.Positing.Gauge
import Obsmetrologia.Language.Positing.OrderSwapDuality

/-!
# The finite/transfinite x algebra/coalgebra charger

This module packages a second face of the Klein-four symmetry. The two commuting
axes are:

* algebra versus coalgebra, read as the arrow-reversal axis;
* finite versus transfinite, read as the closure-ordinal/metallization axis.

Their product is a four-cell charger. The bridge cells are the two off-diagonal
corners already used by the aperiodic corpus: a sofic cover is a finite
coalgebraic observation, and a directed colimit is a transfinite algebraic
construction.

## Main definitions

* `Charger.Cell` -- the four charger cells.
* `Charger.toK4`, `Charger.ofK4` -- the equivalence with `Positing.Gauge.K4`.
* `Charger.arrowDual`, `Charger.finitenessDual` -- the two commuting `Z/2`
  axes.
* `Charger.soficCell`, `Charger.colimitCell` -- the charge assignments for the
  two bridge mechanisms.

## Main results

* `Charger.ofK4_toK4`, `Charger.toK4_ofK4` -- the charger is a K4 face.
* `Charger.axes_commute` -- the two axes commute.
* `Charger.sofic_lands_finite_coalgebra` -- sofic witnesses land in the
  finite-coalgebra cell.
* `Charger.colimit_cocone_lands_transfinite_algebra` -- directed colimits land
  in the transfinite-algebra cell while retaining their cocone law.

## References

* `SoficShift`: decorated finite-type covers and `fib_deep_sofic`.
* `AndersonPutnam`: directed systems and `DirectedSystem.Colimit`.
* `OrderSwapDuality`: the existing order-swap involution is a distinct
  arrow-reversal-shaped witness, not an element of the original charge `K4`.
-/

namespace Obsmetrologia
namespace AperiodicOrder.Tiling
namespace Charger

open Obsmetrologia.Discrete (Graph)

/-! ## The two axes -/

/-- The construction/observation axis: algebra builds; coalgebra observes. -/
inductive Orientation where
  /-- Algebraic construction. -/
  | algebra
  /-- Coalgebraic observation. -/
  | coalgebra
  deriving DecidableEq, Repr

/-- The closure-size axis: finite versus transfinite. -/
inductive Finiteness where
  /-- The finite side, `κ < ω`. -/
  | finite
  /-- The transfinite side, `κ ≥ ω`. -/
  | transfinite
  deriving DecidableEq, Repr

/-- A charger cell is the product of orientation and finiteness. -/
structure Cell where
  /-- Algebraic or coalgebraic orientation. -/
  orientation : Orientation
  /-- Finite or transfinite size. -/
  finiteness : Finiteness
  deriving DecidableEq, Repr

/-! ## The four named cells -/

/-- The finite-algebra cell: finite inductive build data. -/
def finiteAlgebra : Cell := ⟨Orientation.algebra, Finiteness.finite⟩

/-- The finite-coalgebra cell: finite-state observation, as in a sofic cover. -/
def finiteCoalgebra : Cell := ⟨Orientation.coalgebra, Finiteness.finite⟩

/-- The transfinite-algebra cell: transfinite construction, as in a directed colimit. -/
def transfiniteAlgebra : Cell := ⟨Orientation.algebra, Finiteness.transfinite⟩

/-- The transfinite-coalgebra cell: coinductive behavior in the analytic regime. -/
def transfiniteCoalgebra : Cell := ⟨Orientation.coalgebra, Finiteness.transfinite⟩

/-! ## The charger as a K4 face -/

/-- Read a charger cell as the corresponding element of the existing `K4` carrier.

The arrow-reversal generator is `K4.neg`; the finite/transfinite generator is
`K4.conf`. Their composite is the transfinite-coalgebra corner. -/
def toK4 : Cell → Positing.Gauge.K4
  | ⟨Orientation.algebra, Finiteness.finite⟩ => Positing.Gauge.K4.id
  | ⟨Orientation.coalgebra, Finiteness.finite⟩ => Positing.Gauge.K4.neg
  | ⟨Orientation.algebra, Finiteness.transfinite⟩ => Positing.Gauge.K4.conf
  | ⟨Orientation.coalgebra, Finiteness.transfinite⟩ => Positing.Gauge.K4.negConf

/-- Read a `K4` element as a charger cell. -/
def ofK4 : Positing.Gauge.K4 → Cell
  | Positing.Gauge.K4.id => finiteAlgebra
  | Positing.Gauge.K4.neg => finiteCoalgebra
  | Positing.Gauge.K4.conf => transfiniteAlgebra
  | Positing.Gauge.K4.negConf => transfiniteCoalgebra

/-- The charger-to-`K4` map followed by the inverse returns the charger cell. -/
theorem ofK4_toK4 (c : Cell) : ofK4 (toK4 c) = c := by
  cases c with
  | mk o f => cases o <;> cases f <;> rfl

/-- The `K4`-to-charger map followed by the inverse returns the `K4` element. -/
theorem toK4_ofK4 (g : Positing.Gauge.K4) : toK4 (ofK4 g) = g := by
  cases g <;> rfl

/-! ## The two commuting generators -/

/-- Toggle algebra and coalgebra while preserving the finite/transfinite side. -/
def arrowDual : Cell → Cell
  | ⟨Orientation.algebra, k⟩ => ⟨Orientation.coalgebra, k⟩
  | ⟨Orientation.coalgebra, k⟩ => ⟨Orientation.algebra, k⟩

/-- Toggle finite and transfinite while preserving the algebra/coalgebra side. -/
def finitenessDual : Cell → Cell
  | ⟨o, Finiteness.finite⟩ => ⟨o, Finiteness.transfinite⟩
  | ⟨o, Finiteness.transfinite⟩ => ⟨o, Finiteness.finite⟩

/-- The arrow-dual generator is an involution. -/
theorem arrowDual_involutive (c : Cell) : arrowDual (arrowDual c) = c := by
  cases c with
  | mk o f => cases o <;> cases f <;> rfl

/-- The finite/transfinite generator is an involution. -/
theorem finitenessDual_involutive (c : Cell) : finitenessDual (finitenessDual c) = c := by
  cases c with
  | mk o f => cases o <;> cases f <;> rfl

/-- The two charger axes commute. -/
theorem axes_commute (c : Cell) :
    arrowDual (finitenessDual c) = finitenessDual (arrowDual c) := by
  cases c with
  | mk o f => cases o <;> cases f <;> rfl

/-- Under the `K4` reading, `arrowDual` is left multiplication by `K4.neg`. -/
theorem arrowDual_toK4 (c : Cell) :
    toK4 (arrowDual c) = Positing.Gauge.K4.mul Positing.Gauge.K4.neg (toK4 c) := by
  cases c with
  | mk o f => cases o <;> cases f <;> rfl

/-- Under the `K4` reading, `finitenessDual` is left multiplication by `K4.conf`. -/
theorem finitenessDual_toK4 (c : Cell) :
    toK4 (finitenessDual c) = Positing.Gauge.K4.mul Positing.Gauge.K4.conf (toK4 c) := by
  cases c with
  | mk o f => cases o <;> cases f <;> rfl

/-- Under the `K4` reading, applying both axes is left multiplication by `K4.negConf`. -/
theorem composite_toK4 (c : Cell) :
    toK4 (arrowDual (finitenessDual c)) =
      Positing.Gauge.K4.mul Positing.Gauge.K4.negConf (toK4 c) := by
  cases c with
  | mk o f => cases o <;> cases f <;> rfl

/-! ## The two bridge mechanisms -/

/-- The bridge mechanisms that move through the off-diagonal charger cells. -/
inductive Bridge where
  /-- A sofic cover: finite-state observation presenting an infinite system. -/
  | soficCover
  /-- A directed colimit: transfinite algebraic construction. -/
  | directedColimit
  deriving DecidableEq, Repr

/-- The charger cell occupied by each bridge mechanism. -/
def bridgeCell : Bridge → Cell
  | Bridge.soficCover => finiteCoalgebra
  | Bridge.directedColimit => transfiniteAlgebra

/-- The two named bridges occupy the two off-diagonal cells. -/
theorem bridge_cells :
    bridgeCell Bridge.soficCover = finiteCoalgebra ∧
      bridgeCell Bridge.directedColimit = transfiniteAlgebra :=
  ⟨rfl, rfl⟩

/-- The charger assignment for a sofic witness. -/
def soficCell {A B : Type} (step : Graph A) (π : A → B) (w : List B)
    (_ : SoficImage step π w) : Cell :=
  finiteCoalgebra

/-- A sofic witness lands in the finite-coalgebra cell. -/
theorem sofic_lands_finite_coalgebra {A B : Type} (step : Graph A) (π : A → B)
    (w : List B) (h : SoficImage step π w) :
    soficCell step π w h = finiteCoalgebra :=
  rfl

/-- The concrete decorated Fibonacci sofic cover lands in the finite-coalgebra cell. -/
theorem fib_deep_sofic_lands_finite_coalgebra (w : List Bool) (hw : Path goldenStep w) :
    soficCell decoStep forgetDecoration (substitute fibSub w) (fib_deep_sofic w hw)
      = finiteCoalgebra :=
  rfl

/-- The charger assignment for a directed colimit. -/
def colimitCell (_S : DirectedSystem) : Cell :=
  transfiniteAlgebra

/-- A directed colimit lands in the transfinite-algebra cell. -/
theorem colimit_lands_transfinite_algebra (S : DirectedSystem) :
    colimitCell S = transfiniteAlgebra :=
  rfl

/-- A directed colimit retains the cocone law and lands in the transfinite-algebra cell. -/
theorem colimit_cocone_lands_transfinite_algebra (S : DirectedSystem) :
    (∀ (m n : Nat) (h : m ≤ n) (x : S.stage m),
        DirectedSystem.Colimit.mk S ⟨m, x⟩ =
          DirectedSystem.Colimit.mk S ⟨n, S.map h x⟩) ∧
      colimitCell S = transfiniteAlgebra :=
  ⟨fun _ _ h x => DirectedSystem.Colimit.map_eq S h x, rfl⟩

/-! ## Relation to the existing order-swap duality -/

/-- `OrderSwapDuality` supplies the existing involutive order-swap witness. It is
separate from the original charge `K4`, but it has the arrow-reversal shape needed
by the charger's algebra/coalgebra axis. -/
theorem orderSwapDuality_witnesses_arrow_reversal_shape (a : Charge) :
    a.swap.swap = a :=
  Charge.swap_swap a

end Charger
end AperiodicOrder.Tiling
end Obsmetrologia
