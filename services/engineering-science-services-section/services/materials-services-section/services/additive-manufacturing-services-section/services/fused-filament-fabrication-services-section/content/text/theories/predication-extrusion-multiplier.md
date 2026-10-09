---
type: concept
class: calibration-parameter
symbol: f
depends-on: [bead]
title: Extrusion multiplier (flow rate)
description: A scalar multiplier $f$, typically $0.90$–$1.10$, applied to the slicer's calculated extruder distance for every extrusion command.
---

# Extrusion multiplier (flow rate)

A scalar multiplier $f$, typically $0.90$–$1.10$, applied to the slicer's calculated extruder distance for every extrusion command. Used to compensate for systematic errors in the (extruder, hotend, filament) system that are not captured by the slicer's idealized flow model.

Causes of $f \neq 1.00$:

- **Filament diameter variance.** Nominal $1.75$ mm filament from quality manufacturers measures $1.74$–$1.78$ mm; lesser brands $1.65$–$1.85$ mm. The slicer assumes the configured nominal; a $0.05$ mm error is a $\sim 6\%$ volume error.
- **Extruder gear slip.** Bondtech-style dual-gear extruders calibrate near $f = 1.00$; single-drive-gear extruders with worn or under-tensioned grips can require $f = 1.05$–$1.10$.
- **Material density and shrinkage.** Cooling shrinkage and partial-crystallinity effects mean the deposited bead volume differs from the molten extrusion volume.
- **Polymer-specific flow behavior.** Pressure-driven flow through the nozzle is non-Newtonian; the slicer assumes pseudo-Newtonian behavior.

Calibration procedure (one of two standard methods):

1. **Single-bead-width test.** Print a thin-walled cube (1 perimeter, no top/bottom) at $f = 1.00$. Measure wall thickness with calipers. Compute $f' = (\text{nominal wall} / \text{measured wall}) \cdot f$. Re-test at $f'$. Iterate until measured = nominal $\pm 0.02$ mm.
2. **Filament-feed test.** Mark the filament $120$ mm above the extruder entrance. Issue G-code to extrude $100$ mm (e.g. `G1 E100 F100`). Measure remaining distance from mark to extruder. Compute $f = 100 / (\text{actual extruded})$.

Both methods should produce values within $\pm 0.02$ of each other. If they don't, there is a confounding error (extruder slip, hotend backpressure, etc.).

Each filament spool should be calibrated independently; even within a brand, $f$ varies by $\pm 0.03$ between spools. Production work logs $f$ per spool in the print profile.

Setting $f$ correctly is the single highest-leverage FFF calibration. Wrong $f$ causes:
- Under-extrusion ($f$ too low): visible gaps between adjacent beads, weak parts, stringing-like cosmetic defects.
- Over-extrusion ($f$ too high): blobs at perimeter starts, "elephant's foot" at first layer, dimensional growth, nozzle drag artifacts on subsequent layers, eventual extruder clicking and grinding.
