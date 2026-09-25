---
type: morphism
class: software-transformation
depends-on: [model-stl, slicer, gcode, layer]
realizes: []
title: Slicing
description: "The transformation $\\mathrm{slice} : \\mathrm{Mesh} \\times \\mathrm{Profile} \\to \\mathrm{GCode}$ from a tessellated mesh and a print profile to a machine-executable G-code program."
---

# Slicing

The transformation $\mathrm{slice} : \mathrm{Mesh} \times \mathrm{Profile} \to \mathrm{GCode}$ from a tessellated mesh and a [print profile](./predication-print-profile.md) to a machine-executable [G-code](./predication-gcode.md) program. Realized by the [slicer](./predication-slicer.md).

Slicing decomposes into a chain of sub-morphisms — each lossy, in the sense that information present in the input does not survive to the output:

$$\mathrm{Mesh} \xrightarrow{\mathrm{repair}} \mathrm{ManifoldMesh} \xrightarrow{\mathrm{intersect}} \{\mathrm{Polygon}_i\}_{i=1}^{N} \xrightarrow{\mathrm{offset}} \{\mathrm{ToolPath}_i\} \xrightarrow{\mathrm{order}} \mathrm{ToolPath}^{\mathrm{ordered}} \xrightarrow{\mathrm{emit}} \mathrm{GCode}$$

Each arrow is non-injective: many meshes intersect the same plane to produce the same polygon set; many polygon sets offset to the same toolpath; many toolpath orderings emit equivalent G-code. The chain is *deterministic given seed, profile, and slicer version* — the same inputs reliably produce the same output, but small input perturbations can cause large output differences (a vertex moved by $10^{-4}$ mm can flip a triangle's manifold classification, change the layer-intersection polygon set, change the seam placement, change the print).

This sensitivity is the root cause of the "I sliced the same model and got a different print" complaint: slicer version, profile parameter changes, or even ordering differences in mesh-repair output can shift the entire toolpath.

Slicing is *not* a categorical morphism in the strict mathematical sense (slicing two STLs and concatenating doesn't equal concatenating two STLs and slicing — though it nearly does, and the failure modes of the equality define the multi-part-print failure modes). It is a morphism in the engineering sense: a structure-preserving transformation between artifact types in the AM pipeline.

The categorical statement that *does* hold: slicing factors through the layer decomposition. Two meshes with identical layer-plane intersections produce identical G-code (modulo seam-placement non-determinism). This is what licenses "vase mode" tricks, layer-by-layer modifier extensions, and adaptive-layer-height optimization.

## Earlier material

The transformation $\mathrm{slice} : \mathrm{Mesh} \times \mathrm{Profile} \to \mathrm{GCode}$ from a tessellated mesh and a [print profile](../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/objects/print-profile.md) to a machine-executable [G-code](../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/objects/gcode.md) program. Realized by the [slicer](../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/objects/slicer.md).
