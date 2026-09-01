---
type: object
class: software-tool
depends-on: []
realizes: [slicing]
---

# Slicer

The software pipeline that consumes a tessellated 3D model (typically [STL](./predication-model-stl.md), 3MF, or OBJ) plus a [print profile](./predication-print-profile.md) and emits a machine-executable [G-code](./predication-gcode.md) program (or equivalent — CLI for SLA, BSL for SLS). The slicer realizes the [slicing](./predication-slicing.md) morphism.

A slicer's pipeline:

1. **Mesh repair.** Detect non-manifold edges, holes, self-intersections; auto-repair or report. Garbage in $\to$ failed print out.
2. **Orient and place.** Apply build orientation (see [build-orientation](./predication-build-orientation.md)); place on build plate.
3. **Layer planes.** Intersect the mesh with $N$ horizontal planes at $z_i = i \cdot h$ for layer height $h$. Each intersection is a set of closed planar polygons (the layer's cross-section).
4. **Perimeter generation.** Offset each polygon inward by half-bead-width; generate $k$ perimeter loops at successive offsets ([shell](./predication-shell.md) count).
5. **Infill generation.** Within the inner-most perimeter, generate the [infill](./predication-infill.md) pattern at specified density.
6. **Top/bottom solid generation.** Identify layers that need full-density solid raster (because no part is above/below at that location) and overwrite their infill with solid lines.
7. **Support generation.** Identify [overhangs](./predication-overhang.md) past angle threshold; generate [support](./predication-support.md) structures.
8. **Toolpath ordering.** Sequence perimeters, infill, supports per layer; choose Z-seam locations; insert travel moves and [retractions](../../../services/fused-filament-fabrication-services-section/content/text/theories/predication-retraction.md).
9. **G-code emission.** Translate toolpath into machine-specific motion commands plus thermal, fan, and extruder commands.

Active open-source slicers (FFF): PrusaSlicer, OrcaSlicer, SuperSlicer, Cura. Active SLA slicers: Lychee, Chitubox, PrusaSlicer (PrusaSL1 fork). Industrial: Materialise Magics, Autodesk Netfabb, Siemens NX AM.

Slicer choice matters: identical input mesh + identical nominal parameters (layer height, infill, perimeters, temperature) sliced by two different slicers produces visibly different prints due to differences in toolpath ordering, seam placement, retraction logic, and overhang detection. For functional-parts work, fixing the slicer is part of fixing the print profile.
