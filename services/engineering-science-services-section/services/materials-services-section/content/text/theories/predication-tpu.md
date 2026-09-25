---
type: object
class: thermoplastic-elastomer
depends-on: [hygroscopicity]
title: TPU (thermoplastic polyurethane)
description: A flexible thermoplastic elastomer — rubbery and elastic at room temperature, processable as a melt above its softening range.
---

# TPU (thermoplastic polyurethane)

A flexible thermoplastic elastomer — rubbery and elastic at room temperature, processable as a melt above its softening range. TPU spans a wide hardness range, characterized by Shore A or Shore D durometer.

**Hardness range** (most-common FFF grades):

| Grade | Hardness | Behavior |
|---|---|---|
| Shore 60A | Very soft, gummy | Hardly printable on any FFF; specialty resin for cushioning |
| Shore 85A | Soft, like a soft eraser | Direct-drive only; very slow printing |
| Shore 95A | Like a tire tread | Standard "flexible" FFF filament; printable on most direct-drive machines |
| Shore 98A / 75D | Firm; harder than a hockey puck | Easier to print; less flexible |
| Shore 65D | Semi-rigid; flexes only with effort | Almost printable like PLA |

**Properties (95A, generic):**

| Property | Value |
|---|---|
| Hardness | Shore 95A |
| Tensile strength | $20$–$40$ MPa |
| Elongation at break | $300$–$700\%$ |
| Tear strength | High |
| Service temperature | $\leq 60$–$80$°C |
| Hygroscopicity | High |

**Process window.**
- Nozzle: $220$–$240$°C.
- Bed: $30$–$50$°C; sticks to PEI well, sometimes too well (use brim or glue stick).
- Fan: $50$–$100\%$. High cooling reduces stringing.
- **Direct-drive extruder: required for soft TPU.** Bowden tubes allow soft filament to buckle inside the tube; printing is impossible. Some firmer TPU (98A, 65D) can manage Bowden with very slow speeds.
- **Slow:** $20$–$30$ mm/s for soft TPU; $40$–$60$ mm/s for firm.
- **Drying: required.**

**Strengths.**
- Flexible parts (gaskets, bumpers, watch bands, vibration dampers, phone cases).
- High tear strength and elasticity.
- Chemical resistance to oils, fuels.
- Abrasion resistance.

**Weaknesses.**
- **Slow.** Print speeds well below other materials.
- **Cannot retract aggressively** — soft filament buckles in extruder under reverse motion. Stringing is frequent and hard to mitigate.
- **Hygroscopic.** Wet TPU strings catastrophically; pops at the nozzle.
- Soft grades (85A) are barely printable on consumer hardware; printable on professional direct-drive machines (Prusa MK4, Bambu) with carefully-tuned profiles.
- Layer adhesion good in tension but weak in peel.

**Use case.** Anything that needs to flex. Gaskets, watch straps, drone bumpers, cable strain reliefs, phone cases, soft jaws for vises. For printed-in-place hinges, TPU 95A is a magic material.

**Sub-variants.**
- **TPU 95A** is the de facto FFF default flexible filament.
- **TPE** (thermoplastic elastomer, broader chemical class) — printability and properties similar to comparable-hardness TPU.
- **TPC** — copolymer variant; less common.
