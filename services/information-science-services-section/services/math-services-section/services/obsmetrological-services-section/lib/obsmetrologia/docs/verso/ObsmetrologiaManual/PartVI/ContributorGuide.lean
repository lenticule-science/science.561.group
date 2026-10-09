import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
Contributor guidance for mathematics, prose, and frontier work.
-/

#doc (Manual) "Contributor guide" =>

# Contributor Guide

Contributing to Obsmetrologia means contributing to a foundation. That is a stronger
discipline than adding a theorem to a broad library.

Every contribution should preserve the generative story: earlier objects generate
later objects, frontier work is marked as frontier, and received mathematics is
recovered rather than imported as an unstated premise.

## Contribution Types

Foundational contributions clarify or extend the primitive chain. They require
the highest prose burden.

Recovery contributions connect Obsmetrologia to familiar mathematics. They should say
which familiar structure is being recovered, which Obsmetrologia construction recovers
it, and where the recovery is partial.

Frontier contributions explore. They should be easy to find, easy to promote,
and easy to quarantine if wrong.

Infrastructure contributions improve the documentation, build, navigation, API
surfaces, examples, or metadata that let the mathematics be read.

## Expected Shape

A healthy contribution usually has:

1. a short scope statement,
2. a status label,
3. the relevant Lean module or intended module,
4. a prose explanation of the generative role,
5. at least one checked example when the concept is formalized,
6. links to prior manual chapters and future dependent work.

## Promotion Path

Frontier notes may become blueprint nodes. Blueprint nodes may become Lean
declarations. Lean declarations may become manual examples. Manual examples may
become part of the teaching path.

Promotion should preserve provenance. A promoted idea should still know where it
came from.

## What Not To Do

Do not add prose that only sounds foundational. Name the construction.

Do not add Lean declarations that merely imitate a familiar theory. Show the
Obsmetrologia generators.

Do not erase uncertainty. Mark it, contain it, and let it become a research
object.
