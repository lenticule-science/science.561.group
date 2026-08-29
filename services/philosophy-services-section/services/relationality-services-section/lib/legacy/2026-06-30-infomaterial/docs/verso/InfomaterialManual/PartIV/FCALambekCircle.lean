import InfomaterialManual.DocSetup
import Infomaterial

open Verso.Genre Manual InlineLean
open Infomaterial Infomaterial.FCALambek

/-!
A recovered-foundations chapter: the closed circle FCA ⇄ Lambek ⇄ residuated-lattice ⇄
settling-closure, each algebraic edge a theorem. Welds against `Infomaterial.FCALambek`.
-/

#doc (Manual) "The FCA–Lambek circle" =>

# The FCA–Lambek Circle

_A recovered foundation: four classical threads — formal concept analysis, the Lambek
calculus, residuated lattices, and settling closure — turn out to be one closed circle._

Formal concept analysis computes concepts as closures of a Galois connection; the
Lambek calculus has residuated lattices as its algebraic semantics; and Belohlavek's
many-valued FCA over a residuated lattice gives, by Wurm's theorem, complete semantics
for that calculus. Infomaterial already has the settling closure and the residuated value
structure, so these are not four imports but four edges of one circle — and the three
algebraic edges are theorems here.

## Edge 1 — FCA closure is settling closure

The FCA derivation closure `A ↦ A″` is extensive, monotone, and idempotent: the exact
shape of operator the settling morphism iterates. Computing formal concepts *is*
computing settling closures.

{docstring Infomaterial.FCALambek.fcaClosureOp}

The three laws are bundled as {name Infomaterial.FCALambek.fca_closure_laws}`fca_closure_laws`.

## Edge 2 — concepts form a complete lattice

The concepts of any context form a complete lattice — the fundamental theorem of FCA,
re-exported as {name Infomaterial.FCALambek.concept_lattice_is_complete}`concept_lattice_is_complete`.
This is the lattice that, on the many-valued side, carries the calculus's semantics.

## Edge 3 — a residuated lattice is a commutative Lambek algebra

Every integral commutative residuated lattice is a commutative Lambek algebra: the
product and its two residuals collapse to a single implication satisfying the
residuation adjunction.

```lean
example (R : Order.ResiduatedLattice) :
    Lambek.LambekAlgebra :=
  lambekOfResiduated R
```

That this is non-vacuous is witnessed concretely by the Boolean two-element residuated
lattice {name Infomaterial.Order.Two}`Two` — the FOUR base — sitting inside the Lambek
calculus's algebraic semantics, with commutative product:

```lean
example : ∀ a b,
    TwoLambek.dot a b = TwoLambek.dot b a :=
  TwoLambek_comm
```

The general edge is {name Infomaterial.FCALambek.residuated_lattice_is_commutative_lambek}`residuated_lattice_is_commutative_lambek`.

## Edge 4 — the closing edge (documented)

The fourth edge — Wurm (2012): the concept lattice of a many-valued context gives
*complete* semantics for the Lambek calculus — is a model-theoretic theorem, recorded
in the module header rather than formalized. It is the one edge of the circle that is
cited, not proved in-core; the prose says so plainly.

## The circle

The three proved edges assemble into one object.

{docstring Infomaterial.FCALambek.CircleData}

{docstring Infomaterial.FCALambek.the_circle}

So formal concept analysis, the Lambek calculus, residuated lattices, and the settling
closure are not four separate pieces of received mathematics. Three of the four edges
that link them are theorems in Infomaterial, turning on a single fact the library already
owns: the closure operator is the settling shape, and the value structure is residuated.
