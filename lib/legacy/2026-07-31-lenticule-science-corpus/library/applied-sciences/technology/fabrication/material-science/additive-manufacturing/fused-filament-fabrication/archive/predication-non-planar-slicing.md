---
type: concept
class: process-frontier
depends-on: [layer]
realizes: []
---

# Non-planar slicing

A class of toolpath-generation techniques that abandons the assumption that each layer is a plane perpendicular to the build axis. Instead, layers are curved surfaces that follow the part's geometry — typically the top or bottom surface, the principal stress direction, or an arbitrary curvature field.

## Why bother

Planar layering (the standard) imposes:

- **Stair-stepping** on sloped surfaces, with $R_a$ proportional to layer height (see [surface-roughness-orientation-rule](../../theorems/surface-roughness-orientation-rule.md)).
- **Anisotropy aligned with the build axis**, regardless of the load direction.
- **Support requirements** wherever overhangs exceed ~45°.

Non-planar layering can address all three:

- *Surface finish.* Curved top surface follows the part contour; stair-stepping disappears.
- *Anisotropy.* Layers can be oriented to put inter-layer interfaces in compression rather than tension.
- *Supports.* Self-supporting curved layers can reach into geometries that planar layers cannot.

## Approaches

1. **Top-surface non-planar finish (Daniel Ahnert / SuperSlicer 2019).** Standard planar slicing for the bulk; the topmost layer is replaced by a curved surface following the model. Limited to small surface deviations (a few mm of curvature) because the toolhead must clear the lower part of the build.

2. **Field-driven curved layer slicing (Mitropoulou et al. 2020, Fang et al. 2020).** Layers are level sets of a scalar field designed by the user or computed from boundary conditions. Requires 5- or 6-axis motion to keep the nozzle perpendicular to the layer surface.

3. **Stress-aligned slicing (Tam & Mueller 2017).** Compute principal stress directions in the part; align layers so that inter-layer interfaces are in compression. Can recover XY-grade strength along load paths regardless of load direction.

4. **Conical or tilted-layer slicing (RotBot, Open5x).** A simpler subclass: each layer is a cone or tilted plane. Achievable with 4-axis or 5-axis FFF hardware modifications.

## Hardware requirements

- *Nozzle clearance.* Standard FFF hot-ends have a wide cooling shroud; non-planar deposition demands a slim nozzle or active tool tilt to avoid colliding with the in-progress part.
- *Multi-axis motion.* For most non-planar paths, 5-axis (3 linear + 2 rotational) motion is required to keep the nozzle normal to the layer. Several open-source projects (Open5x, RotBot, FullControl GCode 5-axis) and commercial systems (Ai Build, 3D Systems Demcon) implement this.
- *Slicer support.* PrusaSlicer / SuperSlicer handle the simple top-surface case. Field-driven curved slicing is research-grade (Compas FAB, FullControl GCode).

## Status (2026)

Production: small-deviation top-surface smoothing (commercial slicers, since 2020). Research: 5-axis curved-layer slicing for stress alignment, surface finish, and overhang elimination, with several university and startup demonstrations but no mass-market production.

The bottleneck is *not* the algorithm but the hardware: 5-axis FFF systems are expensive and slow, and 3-axis users can usually solve their problem with planar slicing plus better orientation.

## Open question

When does the cost of 5-axis FFF hardware drop below the value of the surface-finish + stress-alignment + support-reduction benefits, in some non-trivial market segment? Aerospace and dental are candidates. See [non-planar-toolpath-planning](questions/non-planar-toolpath-planning.md).

## References

- **Etienne, J., et al. (2019).** "CurviSlicer: slightly curved slicing for 3-axis printers." *ACM TOG* (SIGGRAPH).
- **Mitropoulou, I., et al. (2020).** "Print Paths Key-framing." *Symposium on Computational Fabrication*.
- **Fang, G., et al. (2020).** "Reinforced FDM: Multi-axis filament alignment with controlled anisotropic strength." *ACM TOG*.
- **Tam, K. M., Mueller, C. T. (2017).** "Additive manufacturing along principal stress lines." *3D Printing and Additive Manufacturing* 4(2).
