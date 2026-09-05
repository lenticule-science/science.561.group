---
type: concept
class: sacrificial-structure
depends-on: [overhang, build-orientation]
---

# Support (in additive manufacturing)

Sacrificial material deposited beneath an [overhang](overhang.md) to hold it up during printing, removed after the part is finished. Supports are an unavoidable cost of geometric freedom: without them, $\theta > \theta_{\max}$ overhangs cannot be printed; with them, every overhang is buildable but every support consumes time, material, and post-processing labor and leaves a worse surface finish on the supported face.

Slicer-generated support categories:

- **Tree / branching:** topology-aware structures growing from build plate or from part faces toward overhang tips; minimal volume, easy to remove, may be unstable for large overhang regions.
- **Linear / grid:** planar walls in the unsupported volume; reliable for any geometry, more material, harder to remove cleanly, can leave witness marks.
- **Soluble:** dual-material print with PVA (in water), HIPS (in limonene), or BVOH (in water) as the support material; perfect surface finish, requires dual-extruder hardware and dissolution time, expensive consumable.
- **Snap-off interface layer:** a single sparse layer between part and support tuned to break cleanly under hand load; reduces witness-mark severity for the most common cases.

Supports are not free:

- **Material:** $5$–$50\%$ of total print mass for poorly-oriented parts, $0$–$5\%$ for well-oriented parts. The orientation choice (see [build-orientation](build-orientation.md)) usually matters more than support strategy.
- **Time:** supports are themselves layers; print time scales with total layer count, including support layers.
- **Surface:** the supported face is rough — witness marks, dimensional bulge from squished interface layers, possible Z-seam scarring. Critical-tolerance or aesthetic surfaces should never be supported.
- **Labor:** removal is manual; brittle materials (PLA, PETG) snap cleanly, tough materials (PA, PC, TPU) do not.

The first design-for-AM heuristic: minimize supports by orientation and geometry choice, not by tuning support settings. A well-oriented part needs no supports and produces a better result than a badly-oriented part with the world's best support strategy.
