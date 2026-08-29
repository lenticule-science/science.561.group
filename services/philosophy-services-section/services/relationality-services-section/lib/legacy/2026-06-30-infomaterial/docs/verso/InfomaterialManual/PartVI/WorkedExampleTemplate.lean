import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
A reusable template for literate checked examples.
-/

#doc (Manual) "Worked example template" =>

# Worked Example Template

Worked examples are where the manual proves that it is not merely talking about
Lean. A good example lets a reader watch the generative order happen at a small
scale.

## Template

Question: state the mathematical question in prose.

Context: name the earlier Infomaterial objects already available.

Construction: build the new object step by step.

Lean witness: include the smallest checked Lean fragment that verifies the
construction.

Reading: explain what the Lean witness says in ordinary prose.

Failure mode: explain one tempting but invalid shortcut.

Status: mark whether the example is normative, recovered, frontier, or purely
illustrative.

Next path: tell the reader which concept or chapter this example prepares.

## Example Discipline

The example should not depend on hidden imports, Mathlib conveniences, or
unstated received assumptions. If a convenience is used, say where it enters.

If an example is too large, split it. A small checked example is a better teacher
than a huge demonstration that readers cannot mentally run.

If an example is frontier, let it be frontier. The point is not to pretend every
construction is settled. The point is to make the unsettled parts legible.
