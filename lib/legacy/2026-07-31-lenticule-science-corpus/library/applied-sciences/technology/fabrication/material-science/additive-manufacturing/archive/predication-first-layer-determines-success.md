---
type: theorem
status: empirical
class: empirical-law
depends-on: [adhesion, layer]
---

# First layer determines success

**Claim.** Conditional on a manufacturing-grade slicer and tuned print profile, the probability that an FFF print completes successfully is dominated by the quality of the first layer. Specifically: prints whose first layer exhibits visible gaps between adjacent beads, lifted corners, or non-uniform line width fail at rates substantially higher than baseline; prints whose first layer is continuous, uniform, and well-adhered complete at near-baseline rates regardless of part complexity above the first layer.

**Mechanism.** The first layer is the adhesive interface between part and build plate. Three failure modes are seeded here:

1. **Detachment during print.** A poorly-adhered first layer lifts under cooling stresses from subsequent layers; once the part dislodges, the nozzle drags it across the build, ending the print.
2. **Z-axis registration error.** A first layer that is too thin (over-squished) accumulates flow restriction; too thick (under-squished) does not bond to plate; either way subsequent layer heights are biased, drift compounds, and Z-dimensions are wrong throughout the part.
3. **Geometric initiation error.** Gaps in first-layer infill propagate as voids in the bottom solid surface and may extend several layers up before being closed by overhanging perimeters; a part with a missing first-layer corner has a missing corner, full stop.

**Scope conditions.**
- FFF only. SLA's analog ("first cured layer adhesion to build plate") is a different physics (suction force, elephant's foot, exposure tuning) and the heuristic does not transfer directly though a related principle holds.
- Conditional on tuned profile. Prints with profile-level errors (wrong filament temperature, wrong nozzle size declared) fail for unrelated reasons.
- "Substantially higher rates" is documented across community telemetry (PrusaSlicer Connect, Bambu Cloud, OctoPrint analytics) and is the basis of the universal recommendation to "watch the first layer" before walking away.

**Counterexamples and edge cases.**
- A print can fail far above the first layer for unrelated reasons — power loss, filament tangle, mechanical fault, severe warping in tall ABS prints. The heuristic is "first layer is necessary, not sufficient."
- Some prints with poor first-layer survive due to compensating slicer features (brim, raft, mouse ears). These are mitigations, not refutations: they widen the effective adhesion footprint and are recommended exactly when first-layer-as-printed would otherwise fail.

**Corollary — operational rule.** The first $\sim 10$ minutes of any new print should be supervised. If the first layer is good, subsequent layers usually are. If the first layer is bad, abort and re-tune; do not "let it run and see."

**Related rules.**
- [Build-plate type sets adhesion characteristic](build-plate-type-sets-adhesion.md) — *not yet written; in scope.*
- [First-layer line width should exceed nominal extrusion width](theories/fused-filament-fabrication/theorems/first-layer-width.md) — *not yet written.*
