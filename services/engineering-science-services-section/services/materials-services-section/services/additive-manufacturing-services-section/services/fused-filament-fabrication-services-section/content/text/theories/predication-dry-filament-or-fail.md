---
type: theorem
status: established
class: empirical-law
depends-on: [filament]
title: Dry the filament or fail (for hygroscopic polymers)
description: Claim.
---

# Dry the filament or fail (for hygroscopic polymers)

**Claim.** Printing a hygroscopic FFF filament (PETG, PA, PC, TPU, ABS to a lesser extent) that has been exposed to ambient humidity above ~$30\%$ RH for more than a polymer-specific dwell time *will* produce visible defects regardless of how well the slicer profile and printer are tuned. The required mitigation is upstream of the printer: dry the filament before use.

**Mechanism.** Absorbed moisture flashes to steam in the hotend melt zone. Vapor pressure inside the molten polymer disrupts laminar extrusion: bubbles form, pop at the nozzle, and produce visible defects (pitting, hissing, popping, foamy beads). For chain-cleavable polymers (PETG, PA, PC) the steam also drives hydrolysis, permanently shortening polymer chains and reducing mechanical properties.

**Symptom-to-cause table.**

| Symptom | Likely cause |
|---|---|
| Audible popping/hissing during extrusion | Wet filament (steam at melt zone) |
| Bubbles and pits in bead surface | Wet filament |
| Excessive stringing in PETG that was previously fine | Wet filament |
| Layer-adhesion test bar yields half its previous value | Wet filament + chain hydrolysis |
| Brittle parts (PA in particular) snap with no warning under load | Wet filament + hydrolysis |

**Polymer-specific dwell-to-failure times** (typical, $50\%$ RH ambient):

| Material | Time to noticeable defects | Time to severe defects |
|---|---|---|
| PLA | weeks-to-months | months |
| ABS | days-to-weeks | weeks |
| ASA | days | week |
| PETG | hours-to-day | days |
| PC | hours | day |
| PA (nylon) | $\sim 4$ hours | $\sim 1$ day |
| TPU | $\sim 6$ hours | days |

**Costs of drying.** A dehydrator or filament dryer is $\$30$–$\$200$ one-time. A drying cycle is $4$–$16$ hours but is unattended (run overnight). A heated dry box for in-print storage is $\$50$–$\$200$ and removes the ongoing moisture-absorption rate problem.

**Costs of not drying.** Failed prints (1–10 hours each) until the user diagnoses the problem; permanent mechanical-property loss for in-spec but already-printed parts.

**Diagnostic test.** Cut a $20$ cm length of filament, hold it in a flame for 1–2 seconds, and listen. Dry filament burns quietly; wet filament audibly pops and steams. (Caution: flame, drips, fumes — outdoors only, away from the printer.)

**Corollary — purchasing.** When ordering filament, buy the smallest spool size you can use within the polymer's dwell-time window. A $1$ kg spool of PA opened in March and not finished until September is essentially scrap by August.

**References.** Manufacturer technical sheets (Polymaker, Prusament, FormFutura, Push Plastic). Halidi, S. N., & Abdullah, J. (2012). "Moisture effects on the ABS used for fused deposition modeling rapid prototyping machine."
