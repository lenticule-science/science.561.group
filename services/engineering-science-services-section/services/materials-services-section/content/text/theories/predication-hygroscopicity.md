---
type: concept
class: chemical-property
depends-on: []
title: Hygroscopicity
description: The tendency of a material to absorb moisture from ambient air.
---

# Hygroscopicity

The tendency of a material to absorb moisture from ambient air. Polymers vary widely in hygroscopicity: PLA absorbs slowly and to low equilibrium ($\sim 1\%$); PA6 absorbs rapidly and to high equilibrium ($\sim 9\%$ saturation). For FFF, hygroscopicity sets storage requirements, drying requirements, and the polymer's tolerable open-air dwell time before printing degrades.

**Why hygroscopicity matters in fabrication.**

1. **Process disruption.** Absorbed water flashes to steam in the FFF melt zone or in injection-molding screws, causing surface defects, weak bonds, and processing instability.
2. **Hydrolysis.** Some polymers (PETG, PC, PA, PLA above $T_g$) cleave their chain backbones in the presence of water at elevated temperature. Chain cleavage permanently reduces molecular weight, hence strength and toughness — even if the polymer is dried after exposure, the damage to chain length is done.
3. **Plasticization.** In service, absorbed moisture acts as a plasticizer in PA and PC, lowering effective $T_g$ by $20$–$50$°C. A "dry" PA part that is rigid at $50$°C may be a soft rubber at the same temperature after a week in $80\%$ humidity.

**Measurement.** Equilibrium moisture content (EMC) at $50\%$ RH, $23$°C — manufacturer datasheets often list it; if not, can be measured by mass loss after Karl Fischer titration or by oven-dry mass change.

**Polymer hygroscopicity ranking** (rough, EMC at $50\%$ RH):

| Polymer | EMC | Behavior |
|---|---|---|
| PLA | $\sim 0.5\%$ | Mildly hygroscopic; tolerates open-air storage for weeks. |
| ABS | $\sim 0.3\%$ | Mildly hygroscopic. |
| ASA | $\sim 0.2\%$ | Comparable to ABS. |
| PETG | $\sim 0.2\%$ wt at equilibrium, but hydrolyzes during processing | Misleadingly low EMC; aggressive drying still required because of hydrolysis. |
| PC | $\sim 0.3\%$ wt; hydrolysis-sensitive | Drying mandatory before printing. |
| PA6 | $\sim 3\%$ at $50\%$ RH; up to $9\%$ saturation | Extreme; absorbs hours, not days. |
| PA12 | $\sim 1.5\%$ | Less extreme than PA6 but still significant. |
| TPU | $\sim 0.5$–$1\%$ | High enough to require drying. |
| PEEK | $\sim 0.15\%$ | Low; still dried before processing. |

**Storage hierarchy.**
- **Open shelf, ambient air.** Acceptable for PLA, ABS, ASA for weeks; never for PA, PC, TPU.
- **Sealed bag with desiccant.** Resets the moisture-absorption clock when bag is sealed; desiccant must be active (rechargeable silica or molecular sieves).
- **Sealed dry box at $\leq 15\%$ RH.** Standard for in-progress PETG, ABS, ASA; required for in-progress PC.
- **Heated dry box at $40$–$50$°C, in-line with printer.** Required for PA, PC, TPU during printing. Filament absorbs moisture from ambient air faster than the printer consumes it; passive storage is insufficient.

**Drying restores moisture content** but does not undo hydrolysis. A spool of PETG that has been wet for months may dry visually fine but still produce mechanically inferior parts. Hygroscopic, hydrolysis-sensitive polymers (PETG, PA, PC) have a finite "shelf life from open" of weeks-to-months even with proper drying cycles.
