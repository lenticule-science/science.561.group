---
type: object
class: thermoplastic
depends-on: [glass-transition]
realizes: []
---

# PLA (polylactic acid, polylactide)

A bio-derived semi-crystalline polyester, the dominant FFF feedstock by volume. Manufactured from fermented plant sugars (corn, sugarcane, cassava); biodegradable under industrial composting conditions ($60$°C, controlled humidity); not biodegradable under ambient outdoor conditions on practical timescales.

**Properties (as-printed FFF, unfilled, generic spool):**

| Property | Value |
|---|---|
| Glass transition $T_g$ | $\sim 60$°C |
| Melting $T_m$ | $\sim 175$°C |
| Density | $\sim 1.24$ g/cm³ |
| Tensile strength (XY) | $50$–$60$ MPa |
| Tensile modulus | $\sim 3.5$ GPa |
| Elongation at break | $\sim 5$–$10\%$ |
| Impact (Izod) | $\sim 16$ J/m (low) |
| Service temperature | $\leq 50$°C |
| Hygroscopicity | Low; weeks-to-months tolerance |

**Process window.**
- Nozzle temperature: $190$–$220$°C (PLA), $200$–$230$°C (PLA+).
- Bed temperature: $50$–$60$°C on PEI; $0$°C on glass with adhesion aid.
- Part-cooling fan: $100\%$ from layer 3.
- Enclosure: not required; chamber heat is actually counterproductive (raises ambient toward $T_g$, soften parts during print).

**Strengths.**
- Easiest-to-print FFF material. First-layer adhesion forgiving; warping minimal; bed plate options many.
- Sharp detail capability — wide process window for dimensional accuracy.
- Low odor; printable in living spaces.
- Wide color and finish variety; quality manufacturer differentiation visible (Polymaker, Prusament, eSun, Bambu basics).

**Weaknesses.**
- Low service temperature. Parts in a $50$°C+ environment (car interior in summer, inside an electronic enclosure with heat-generating components) deform.
- Brittleness. Low impact resistance; cracks propagate easily through layer interfaces.
- Creep under sustained load — even at room temperature, PLA structural parts under continuous load deform over months.

**Variants.**
- **PLA+** / Tough PLA / PLA-LW. Modified PLA (impact modifier or copolymer) with $2$–$3\times$ impact resistance and modestly higher service temperature. Slightly worse surface finish.
- **High-speed PLA** (Bambu, Polymaker SpeedX). Lower-melt-viscosity PLA optimized for $250$–$500$ mm/s printing on machines that can sustain it.
- **PLA-CF / PLA-GF.** Carbon-fiber or glass-fiber reinforced PLA. $2\times$ stiffness, 1/2 elongation, abrasive (requires hardened steel nozzle).
- **PLA-Wood / PLA-Cork / PLA-Metal.** Cosmetic fillers with the listed appearance/feel; mechanical properties marginal.
- **Annealed PLA.** Post-process heated to $80$–$110$°C for an hour; crystallinity increases from $\sim 5\%$ to $\sim 40\%$; service temperature rises to $\sim 110$°C; tensile strength increases $\sim 30\%$; impact decreases; dimensions shrink $1$–$3\%$.

**When to use.** Default choice for prototyping, decorative parts, indoor functional parts not exposed to sustained load or heat. Not the right choice for parts that will see sun, sustained humidity, sustained load, or temperatures above $\sim 50$°C — pick PETG, ABS, ASA, or PA instead.
