import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Aperiodicity frontier overview" =>

# Aperiodicity Frontier

Status: frontier witness and recovered cohomology.

Modules: `AperiodicOrder.Tiling.Classification`, `AperiodicOrder.Tiling.Witness.JeandelRao`,
`AperiodicOrder.Tiling.CoClassifying`.

The aperiodicity modules are not the whole program, but they are a useful model
for how frontier work should enter the library. They combine finite certificates,
cohomological invariants, classification language, and explicit open edges.

`AperiodicOrder.Tiling.Witness.JeandelRao` records finite Lean-checked witness structures.
`AperiodicOrder.Tiling.Classification` places those witnesses in a classification frame.
`AperiodicOrder.Tiling.CoClassifying` relates the cohomological and dual
co-classifying views.

The documentation standard here should become the standard for other frontier
zones: identify the finite witness, state what is checked, state what is still a
bridge, and keep the provenance attached to the claim.
