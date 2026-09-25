---
type: object
class: thermoplastic
depends-on: [glass-transition, hygroscopicity, crystallinity]
title: PA (polyamide, "nylon")
description: A family of semi-crystalline polyamides — PA6, PA66, PA12, PA6/12, etc.
---

# PA (polyamide, "nylon")

A family of semi-crystalline polyamides — PA6, PA66, PA12, PA6/12, etc. — distinguished by carbon-chain length between amide groups. PA is the high-performance engineering plastic family: high tensile strength, excellent fatigue resistance, low friction (used for gears, bearings, sliding surfaces), good chemical resistance to fuels and oils, and one of the most-difficult FFF materials to print due to extreme hygroscopicity and warping.

**Properties (PA6, dry, unfilled, generic spool):**

| Property | Value |
|---|---|
| Glass transition $T_g$ (dry) | $\sim 50$°C |
| Glass transition $T_g$ (wet) | $\sim 0$°C |
| Melting $T_m$ | $\sim 220$°C (PA6); $\sim 260$°C (PA66); $\sim 178$°C (PA12) |
| Density | $\sim 1.13$ g/cm³ |
| Tensile strength (dry, XY) | $60$–$80$ MPa |
| Tensile modulus (dry) | $\sim 3.0$ GPa |
| Elongation at break | $\sim 50$–$300\%$ |
| Impact (Izod, dry) | $\sim 50$ J/m; wet $\sim 200$ J/m (water plasticizes) |
| Service temperature | $\leq 80$°C continuous (varies with humidity) |
| Hygroscopicity | Extreme; absorbs $\sim 3\%$ at $50\%$ RH, $\sim 9\%$ saturation |

**Process window.**
- Nozzle: $250$–$280$°C (PA6); $260$–$290$°C (PA12); requires all-metal hotend.
- Bed: $80$–$110$°C; garolite or PEI-with-glue or PEEK-coated bed (PA does not stick reliably to plain PEI).
- Fan: $0\%$.
- **Enclosure with chamber temperature $\geq 50$°C: strongly recommended; for PA6 closer to required.**
- **In-line drying: required.** PA6 reabsorbs to printing-failure moisture in $\sim 4$h of open exposure to $50\%$ RH air. Drying overnight before each print is the bare minimum; an inline heated dry box at $60$–$80$°C is the production solution.

**Strengths.**
- High tensile and fatigue strength; mechanical properties survive cyclic load orders of magnitude longer than PLA/PETG/ABS.
- Low coefficient of friction — moving parts (gears, sliders, hinges) wear slowly.
- Chemical resistance to fuels, oils, mild acids.
- High operating temperature when dry.

**Weaknesses.**
- **Hygroscopicity is operational hell.** Absorbs faster than printer consumes; print sessions begin with a fully-dried spool and end with a partially-wet one if no inline dryer.
- **Warping** comparable to ABS but harder to control. Garolite bed and brim are essentially mandatory.
- **Mechanical properties drop drastically with moisture.** Wet PA is $30$–$50\%$ weaker than dry PA in tension; impact actually increases (water plasticizes, makes it tougher) but stiffness drops a lot.
- $T_g$ is moisture-dependent — a "rigid PA part" that worked dry becomes soft after months in humid air.

**Variants.**
- **PA6, PA66, PA12.** Different chain lengths; PA12 is the lowest-hygroscopicity (and easiest-to-print); PA66 is the strongest; PA6 is the most-common.
- **PA-CF / PA-GF.** Carbon- or glass-fiber filled. Stiffer, less elongation, lower hygroscopicity (filler displaces polymer), reduced warping. The CF variants are the practical default for most users.
- **PA-Aramid (Onyx by Markforged).** Chopped aramid filler in PA; further reduced warping, distinctive matte black appearance.

**When to use.** Functional parts that need the strength, fatigue resistance, or low friction PA provides. Not the right choice for occasional hobbyist printing — the operational overhead (drying, enclosure, abrasive nozzle, careful bed setup) is large and justified only when PA-class properties are actually required.

**Alternative for high-strength applications without PA's drama:** PETG-CF or PA-CF blend filaments offer most of the stiffness with much less moisture sensitivity.
