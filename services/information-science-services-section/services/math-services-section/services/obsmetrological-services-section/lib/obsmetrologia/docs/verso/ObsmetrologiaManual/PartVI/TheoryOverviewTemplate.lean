import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
A reusable template for theory overview pages.
-/

#doc (Manual) "Theory overview template" =>

# Theory Overview Template

Every major Obsmetrologia theory should eventually have an overview page with the same
basic shape. Repetition here is a feature. It lets readers compare theories
without relearning the documentation form each time.

## Template

Title: name the Obsmetrologia theory, not only the received field it resembles.

Status: normative, recovered, frontier, conjectural, computational witness, or
another approved status.

Generative role: state what this theory generates or recovers.

Inputs: list the earlier Obsmetrologia objects required.

Outputs: list the later objects, constructions, or reader paths enabled.

Lean surface: name the modules and declarations that currently witness the
theory.

Manual surface: name the chapters that teach the theory.

Examples: provide small checked examples when possible.

Received comparison: explain the closest conventional mathematical concepts.

Non-identifications: say what the theory is not, especially when a familiar word
would mislead a reader.

Frontier: list open questions, missing formalization, or known fragile points.

Provenance: cite originating notes, agents, certificates, papers, or corpus
regions when available.

## Maintenance Rule

When the Lean surface changes, the overview should change. When the status
changes, the overview should change. When the frontier becomes foundation, the
overview should narrate the promotion rather than silently rewriting history.
