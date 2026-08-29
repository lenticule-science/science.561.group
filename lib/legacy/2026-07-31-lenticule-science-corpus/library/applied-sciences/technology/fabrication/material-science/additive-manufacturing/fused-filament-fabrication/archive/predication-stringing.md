---
type: concept
class: defect
depends-on: [retraction]
---

# Stringing

Thin filaments of polymer trailing behind the nozzle during travel moves, leaving hair-like strands between disconnected print regions. Stringing is the most common cosmetic FFF defect and is caused by inadequate pressure relief during travel — the nozzle continues to ooze under residual pressure and gravity, drawing a thin trail across the air gap.

Mechanism:

1. Print head approaches end of an extrusion segment.
2. Slicer commands a [retraction](retraction.md), if configured.
3. Travel move begins; nozzle accelerates to travel speed.
4. Residual melt pressure plus gravity push polymer through nozzle orifice.
5. Polymer cools in flight, forming a fine string from origin to current nozzle position.
6. Travel completes; deposition resumes; the string is left dangling, often attached to one end of the travel.

Stringing is most severe with:
- **Polymers with low melt viscosity at print temperature** (PETG is the canonical offender; it remains fluid in a range that spans typical travel-move duration).
- **High nozzle temperature** (lower viscosity → faster ooze).
- **Insufficient retraction** (residual pressure not relieved).
- **Slow travel moves** (more time in air for the same pressure drop).
- **Wet filament** (absorbed moisture flashes to steam at the nozzle, increasing pressure during travel; see [filament-drying](../morphisms/drying.md)).

Mitigations, in order of effect:
1. **Dry the filament.** Wet PETG in particular strings dramatically more than dry PETG. Filament dryers (Polymaker, Sunlu, Eibos) at $50$–$60$°C for $4$–$8$ h.
2. **Lower nozzle temperature** by $5$–$10$°C from the manufacturer recommendation; balance against under-extrusion and layer-adhesion loss.
3. **Increase retraction distance** by $0.5$–$1$ mm increments; over-retraction causes filament grinding and gaps at print resume.
4. **Increase travel speed** to minimize air time.
5. **Enable combing / avoid-crossing-perimeters** in slicer.
6. **Print stringy polymers in single-region geometries** that minimize travel between disconnected islands.

Strings are removable post-print with a heat gun (low setting), a deburring tool, or a quick pass with a flame for materials that don't melt-pool problematically. Severe stringing on a complex geometry is often easier to fix in slicer/material settings before reprinting than to clean post-print.
