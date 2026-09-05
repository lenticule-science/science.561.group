---
type: object
class: design-feature
depends-on: []
see-also: [infill]
---

# Rib (in additive design)

A thin reinforcing wall projecting from a part surface to add stiffness without adding bulk material. Ribs are the fundamental design-for-strength feature in AM, injection molding, and sheet metal — and far more efficient than solid infill at adding stiffness per gram.

A rib increases the section modulus of the cross-section it joins by an amount that scales with the rib's height *cubed*. A part with internal ribs at $20\%$ infill is typically stiffer than the same part at $50\%$ infill with no ribs, at half the print time.

Design rules (largely inherited from injection molding, applicable to AM with appropriate adjustment):

- **Rib thickness $\leq$ 0.6× wall thickness.** In injection molding this prevents sink marks on the opposite face. In AM this prevents the rib from acting as a heat sink that distorts adjacent geometry on cooling. In FFF, rib thickness should be an integer multiple of bead width to print as solid extrusion (1, 2, or 3 beads = 0.4, 0.8, 1.2 mm for 0.4 mm nozzle).
- **Rib height $\leq$ 3× wall thickness.** Beyond this the rib is unstable in compression and may buckle.
- **Draft $\geq 0.5°$ per side.** Less applicable in AM but inherited from formative practice; the AM equivalent is to chamfer the rib base for stress relief.
- **Fillet at rib base.** The corner where rib meets parent wall is a stress concentrator; a small fillet (radius $\approx 0.25 \times$ rib thickness) cuts the concentration factor from $\sim 3$ to $\sim 1.5$.
- **Triangulate ribs in 2D arrays.** Cross-ribbed grids beat parallel ribs at the same mass for general bending loads.

Ribs interact strongly with [build orientation](./predication-build-orientation.md): a rib aligned with the build axis prints as continuous extrusion at the rib face — strong; a rib horizontal in the build plane prints as a wall sticking up from the plate — easy and accurate; a rib at 45° prints as a mostly-horizontal feature with overhang considerations on its undersides.
