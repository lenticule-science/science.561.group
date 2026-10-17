---
type: object
class: geometry-representation
depends-on: []
title: STL mesh
description: A triangulated surface mesh — a finite set of planar triangles in $\mathbb{R}^3$ representing the boundary of a part — historically the universal exchange format between CAD and AM slicers.
---

# STL mesh

A triangulated surface mesh — a finite set of planar triangles in $\mathbb{R}^3$ representing the boundary of a part — historically the universal exchange format between CAD and AM slicers. STL stands for *stereolithography* (the format originated with 3D Systems' early SLA machines in 1987); the format predates and outlasted the process it was named for.

An STL file declares: a list of triangles, each with three vertices in $\mathbb{R}^3$ and an outward-facing normal. ASCII and binary variants exist; binary is universal in practice ($\sim 50$ bytes per triangle vs. several hundred ASCII).

STL's structural deficiencies — and why AM is slowly migrating to 3MF:

1. **No units.** "1.0" in an STL file is not declared as mm, cm, or inch. Convention is mm; misimport from inch-default CAD is a routine source of "why is my part 25.4× too big".
2. **No topology.** Triangles share vertices by coincidence, not by reference; the same vertex may appear at slightly different floating-point coordinates in different triangles. Mesh repair becomes necessary for any non-trivial export.
3. **No materials, no colors, no metadata.** A part's intended material, scale, build orientation, support style — none of it travels with the geometry.
4. **No assemblies.** Multi-part STL is a single triangle soup; the "parts" are non-manifold connected components if you're lucky.
5. **No precision control.** Tessellation density (chord-height tolerance) is set at export; once exported, curved surfaces are forever piecewise-linear at the chosen density. Re-exporting at higher density requires the original CAD.

3MF (3D Manufacturing Format, 3MF Consortium) addresses all five: it is a ZIP container of XML files declaring units, materials, assemblies, colors, and slicer-specific metadata. PrusaSlicer, OrcaSlicer, Bambu Studio, and Fusion 360 produce and consume 3MF natively; the format is gradually displacing STL for serious work.

STL persists because of network effect and inertia: every CAD package, every slicer, every model-sharing site supports it. For a one-off print of a downloaded model, STL is fine; for a versioned design with multiple parts and material assignments, 3MF (or the source CAD) is the correct interchange.
