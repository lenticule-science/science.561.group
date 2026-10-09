---
type: concept
class: structural-property
depends-on: [glass-transition]
title: Crystallinity (in polymers)
description: The volume fraction of a semi-crystalline polymer that has formed ordered crystalline regions, as opposed to disordered amorphous regions.
---

# Crystallinity (in polymers)

The volume fraction of a semi-crystalline polymer that has formed ordered crystalline regions, as opposed to disordered amorphous regions. Polymers are never fully crystalline (chain entanglement prevents perfect packing) and rarely fully amorphous if their chemistry permits crystallization at all. Typical degrees of crystallinity: PLA $5$–$50\%$ (highly process-dependent), PA $20$–$50\%$, PEEK $25$–$40\%$, HDPE $60$–$80\%$.

**Why crystallinity matters in fabrication.**

1. **Mechanical properties.** Higher crystallinity increases stiffness, tensile strength, and chemical resistance; decreases toughness and impact resistance. Annealed (more crystalline) PLA is stronger but more brittle than as-printed PLA.
2. **Service temperature.** Crystalline regions are stable up to $T_m$; amorphous regions soften at $T_g$. A part with high crystallinity retains structural integrity above $T_g$ as long as the crystalline backbone holds.
3. **Warping and shrinkage.** Crystallization is exothermic and accompanied by densification. Semi-crystalline polymers (ABS amorphous; PA, PEEK, PLA semi-crystalline) shrink more than amorphous on cooling, increasing warping risk.
4. **Optical properties.** Crystalline regions scatter light; semi-crystalline parts are opaque, fully amorphous parts (PETG, PC, ABS) are transparent or translucent.
5. **Chemical resistance.** Crystalline regions resist solvent penetration; amorphous regions are vulnerable. Acetone smooths ABS (amorphous) effectively; doesn't touch fully-crystalline PEEK.

**Process control of crystallinity.**

Crystallization requires time at temperature between $T_g$ and $T_m$. Process variables:

- **Cooling rate.** Fast cooling (FFF parts on cold ambient) suppresses crystallization; slow cooling (chamber-controlled processes) promotes it. PLA printed on cold ambient is $\sim 5$–$10\%$ crystalline; the same PLA annealed at $80$°C for an hour reaches $\sim 40\%$.
- **Anneal temperature and time.** Heating between $T_g$ and $T_m$ drives crystallization to higher levels. PEEK in particular is wildly process-sensitive: amorphous PEEK (fast-cooled, transparent) and semi-crystalline PEEK (slow-cooled, opaque, beige) are distinct material states with different mechanical and chemical properties.
- **Filler effects.** Some additives (carbon fiber, glass fiber, talc) act as nucleation sites and promote faster crystallization; others (some plasticizers) suppress it.

**Practical implications for design.**

- **PLA functional parts** that need heat resistance above $50$°C: anneal at $80$°C for $\sim 1$ h. Expect $1$–$3\%$ shrinkage; design oversized.
- **PEEK functional parts.** Print in a chamber-temperature-controlled machine ($\geq 90$°C); without it, parts come out amorphous, weak, and chemically vulnerable.
- **Semi-crystalline parts that warp.** The contraction during crystallization is a major contributor; mitigate via chamber temperature (slow the temperature gradient across the part), brim, or part design (avoid large flat bottom surfaces).

Crystallinity is the property that distinguishes "printed PLA from a desktop machine" (mostly amorphous, weak, $50$°C ceiling) from "annealed PLA" (semi-crystalline, strong, $110$°C ceiling) — same polymer, two different functional materials.
