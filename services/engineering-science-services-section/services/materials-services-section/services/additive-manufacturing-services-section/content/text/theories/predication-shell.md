---
type: concept
class: internal-structure
depends-on: [layer, infill]
title: Shell (perimeter, wall)
description: The outer wall of a printed part — the ordered set of perimeter beads laid down along the boundary of each layer's cross-section before infill is filled in.
---

# Shell (perimeter, wall)

The outer wall of a printed part — the ordered set of perimeter beads laid down along the boundary of each layer's cross-section before [infill](./predication-infill.md) is filled in. Shell count (number of perimeters) and shell thickness (number $\times$ bead width) are the dominant determinants of part stiffness, surface quality, and watertightness for thin-walled FFF parts.

For a part of fixed wall thickness, three perimeters are typically far stronger than infill at the same total mass because:

1. Perimeters are continuous extrusions following the part outline — load paths are aligned with the boundary, not with an arbitrary infill grid.
2. Bead-to-bead bonding inside the shell is along the print direction; no air gaps; no unfused crossings.
3. The shell carries bending load via the outermost fibers; section modulus scales with wall offset, not mass.

Standard FFF defaults: 2–3 perimeters, 3–5 solid top layers (so the topmost infill cells get bridged over by solid raster), 3–5 solid bottom layers. The "top/bottom" solid layers are independent of "perimeters" — together they enclose the infill in a closed shell and produce a watertight (within FFF tolerances) part.

Increasing shell count past $\sim 4$–$5$ rarely repays the time cost. For higher strength, increase wall thickness (more perimeters, thicker walls) rather than infill density.

For watertightness: the shell-only path may still leak through Z-seams and crossovers. True watertightness in FFF requires post-processing (epoxy coat, vapor smoothing for ABS/ASA, annealing for crystalline polymers). For SLA the green part is watertight by construction; for SLS the part is microporous and requires sealing for fluid use.
