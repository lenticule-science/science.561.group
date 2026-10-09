import ObsmetrologiaManual.DocSetup
import ObsmetrologiaManual.PartIV.ChurchRosser
import ObsmetrologiaManual.PartIV.InternalReals
import ObsmetrologiaManual.PartIV.YonedaArrowsFirst
import ObsmetrologiaManual.PartIV.FCALambekCircle

open Verso.Genre Manual InlineLean

#doc (Manual) "Recovered foundations" =>

# Part IV: Recovering Familiar Mathematics

Received mathematics is not discarded in Obsmetrologia. It is recovered in-chain.

This part teaches the old words under new obligations. A reader should be able
to recognize category, order, equality, sheaf, cohomology, linear logic, modal
logic, dynamics, and geometry here, but only after seeing the generating stage
that makes each word lawful.

The finished book needs one chapter for each major recovered foundation:

* category and functoriality from predication;
* order, lattice, and fixed points from settling;
* residuation and linear logic from the twist-product value structure;
* classical and paraconsistent equality from the two adjoint systems;
* hyperdoctrine structure from quantifying over predication;
* sheaves and cohomology from settled sections and gluing;
* modal logic from closure/interior pairs;
* dynamics and geometry from closure flow and regime.

The important phrase is "from." The manual should not say "Obsmetrologia uses order
theory" when the point is "Obsmetrologia derives order at settling." It should not say
"Obsmetrologia is category theory" when the point is "category-theoretic structure is
recovered once predication has generated oriented morphisms."

## The reader's bargain

A reader familiar with Grothendieck-style mathematics should be able to find the
old tools here. But they should find them with their generating conditions exposed.
The manual's job is to show both the recovery and the cost of forgetting the
recovery.

When a recovered structure is only modeled in a strict or finite setting, the prose
must say so. When the full theorem is frontier, the prose should point to the
blueprint rather than pretending the chapter has already closed the gap.

## How to read the worked recoveries

The chapters currently included here are worked recoveries. They do not yet
exhaust the recovered foundations program. They are models for the form the book
needs:

* name the familiar mathematical pressure;
* locate the generated Obsmetrologia site where it becomes lawful;
* state what the Lean development actually settles;
* say what the recovery changes, suppresses, or leaves frontier.

This is how the book avoids two failures at once: it does not erase familiar
mathematics, and it does not let familiar mathematics retake the role of
foundation.

{include 1 ObsmetrologiaManual.PartIV.ChurchRosser}

{include 1 ObsmetrologiaManual.PartIV.InternalReals}

{include 1 ObsmetrologiaManual.PartIV.YonedaArrowsFirst}

{include 1 ObsmetrologiaManual.PartIV.FCALambekCircle}
