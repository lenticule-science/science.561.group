---
type: concept
class: process-parameter
depends-on: [layer, anisotropy, overhang]
---

# Build orientation

The rotation $R \in SO(3)$ applied to a part before slicing — the choice of which face sits on the build plate and which direction is "up". Build orientation is the single most consequential pre-slice parameter and is unique to AM (subtractive and formative processes do not have an analogous degree of freedom).

Build orientation simultaneously determines:

1. **Anisotropy alignment.** The Z direction in the part frame is the weak direction (see [anisotropy](anisotropy.md)). The dominant tensile load on the part should run in-plane, not along build-Z. See [build-orientation-aligns-load-with-xy](../theorems/build-orientation-aligns-load-with-xy.md).
2. **Overhang distribution.** Different orientations expose different surfaces as [overhangs](overhang.md). A poorly-oriented part may need 30% support material; a well-oriented version of the same part may need none.
3. **Surface finish.** Stair-stepping appears on surfaces whose normal is close to the build axis. Surfaces requiring a smooth finish should be oriented vertical (parallel to Z) or fully horizontal-up (the topmost layer is smoothed by ironing or continuous extrusion).
4. **Dimensional accuracy.** XY accuracy is set by motion-system precision and bead geometry; Z accuracy is set by layer height. Critical-tolerance features should be placed in the more accurate direction for the process.
5. **Print time.** Tall narrow orientations have many small layers (lots of layer-change time, many retractions); short squat orientations have fewer larger layers (faster).
6. **First-layer adhesion footprint.** Larger contact area with the build plate → better adhesion. A part standing on its edge has smaller footprint and is more likely to dislodge.

These six considerations conflict: the orientation that minimizes supports may align loads with Z, the orientation that aligns loads with XY may put a critical surface on the build plate. Build orientation is the central design-for-AM optimization and is rarely fully automated; the practitioner balances the six considerations against part requirements.
