---
type: morphism
class: feedstock-preparation
depends-on: [filament]
---

# Drying (filament conditioning)

The transformation $\mathrm{dry} : \mathrm{WetFilament} \to \mathrm{DryFilament}$ — heat-driven removal of absorbed atmospheric moisture from a filament spool, performed before printing or in real time during printing.

All FFF feedstocks are at least slightly hygroscopic. Moisture content above the printability threshold (a polymer-specific value, typically $0.1$–$0.3$ wt% water) causes:

- **Steam at the nozzle.** Audible popping/hissing during extrusion as absorbed water flashes to vapor in the melt zone.
- **Bubbles and surface defects.** Steam pockets blow out of beads, leaving pits and rough surfaces.
- **Stringing.** Vapor pressure provides additional "ooze pressure" during travel moves.
- **Reduced layer adhesion.** Steam weakens the polymer-polymer interface during fusion.
- **Polymer hydrolysis.** Some polymers (PETG, PA, PC) degrade chemically when extruded wet, producing chain scission and permanent loss of mechanical properties — even if dried later, the damage to chain length is done.

Polymer-specific moisture susceptibility:

| Material | Sensitivity | Typical dry temp | Typical dry time |
|---|---|---|---|
| PLA | Low | $40$–$50$°C | $4$ h |
| PETG | High | $55$–$65$°C | $6$–$8$ h |
| ABS | Moderate | $55$–$65$°C | $4$–$6$ h |
| ASA | Moderate | $60$–$70$°C | $4$–$6$ h |
| PA (nylon) | Extreme | $70$–$80$°C | $8$–$16$ h |
| PC | High | $70$–$80$°C | $10$–$12$ h |
| TPU | High (and dries quickly back to wet) | $50$–$60$°C | $6$–$8$ h |
| PEEK | Moderate | $120$–$150$°C | $6$ h |

Drying equipment:

- **Dedicated filament dryers** (Polymaker PolyDryer, Sunlu S2/S4, Eibos Cyclopes). $30$–$200$. Maintain set temperature $\pm 2$°C, run timer-bounded cycles, and many double as in-line heated dry boxes during printing. Highly recommended.
- **Food dehydrators.** $40$–$80$. Repurposable; some lack precise temperature control or run hotter than setpoint at the lowest setting.
- **Convection ovens.** Risky. Most home ovens cannot reliably maintain $50$–$70$°C; the actual temperature with an oven set to "warm" is often $90$–$120$°C, which deforms PLA spools and crystallizes/embrittles others.
- **Vacuum chambers.** Used by some industrial users; effective and gentle but slow.

In-line drying. Most commercial dryers can run continuously while feeding filament to the printer (a heated dry box). For PA, TPU, PC, this is essentially mandatory: the polymer absorbs moisture from ambient air faster than it is being printed. A $1$ kg spool of dry PA exposed to $50\%$ RH air becomes too wet to print in $\sim 4$ hours.

A dryer pays for itself within a few prints for any user printing PETG or anything more exotic.
