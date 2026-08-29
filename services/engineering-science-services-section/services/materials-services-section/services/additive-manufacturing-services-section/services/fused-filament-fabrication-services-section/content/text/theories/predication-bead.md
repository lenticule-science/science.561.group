---
type: concept
class: process-primitive
symbol: w
depends-on: []
---

# Bead (extruded line, road)

The fundamental geometric primitive of FFF: a single continuous extrusion of molten polymer deposited along a toolpath, characterized by its **width** $w$ (cross-section perpendicular to motion) and **height** $h$ (the layer height). Cross-section is approximately a rounded-corner rectangle: rectangular at the bead-to-bead joints, semicircular at the start and end where the nozzle hasn't yet committed direction.

Bead width is set by the slicer's flow calculation:

$$w = \frac{Q}{v \cdot h}$$

where $Q$ is volumetric flow rate (mm³/s), $v$ is print speed (mm/s), $h$ is layer height. For a $0.4$ mm nozzle, typical $w = 0.40$–$0.50$ mm; the slicer can vary $w$ in the $[0.4, 1.2]$ mm range by adjusting flow, with quality degrading at the extremes (under-extruded thin beads gap; over-extruded fat beads pile and clip on the next perimeter).

The bead is the unit in which essentially all FFF features are composed:
- A perimeter is one or more beads laid end-to-end around the layer outline.
- An infill cell is a sparse pattern of beads at $\sim 30°$–$60°$ orientations.
- A solid raster is parallel beads at $\sim 0.95 w$ spacing (the $5\%$ overlap closes inter-bead seams).
- A bridge is a single bead spanning unsupported air.

Bead-to-bead bonding within a layer is strong (both beads are above $T_g$ when adjacent, full diffusion across the seam). Bead-to-bead bonding across layers is the [layer adhesion](./predication-layer-adhesion.md) problem.

Knowing the bead width is the first prerequisite for understanding what FFF can resolve. **Minimum feature size $\approx 1$–$2 w$.** A $0.4$ mm nozzle cannot reliably print details below $\sim 0.6$ mm; a $0.2$ mm nozzle can resolve $\sim 0.3$ mm features but at $4\times$ the print time and $4\times$ the clog susceptibility.
