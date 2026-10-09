---
type: object
class: machine-component
depends-on: [hotend]
title: Nozzle
description: The terminal orifice of the hotend through which molten polymer is extruded.
---

# Nozzle

The terminal orifice of the [hotend](./predication-hotend.md) through which molten polymer is extruded. Removable, threaded into the heater block with M6 (E3D-pattern) or proprietary (MK8, CHT) thread, allowing the user to swap nozzle diameter and material.

Two specifications matter:

**Orifice diameter** $d$. Sets the bead width range and the resolvable feature size.

| $d$ | Bead width range | Min feature | Max flow | Typical use |
|---|---|---|---|---|
| 0.2 mm | 0.20–0.32 mm | 0.30 mm | $\sim 5$ mm³/s | Miniatures, dental, fine detail |
| 0.4 mm | 0.40–0.60 mm | 0.50 mm | $\sim 15$ mm³/s | Default; nearly all general work |
| 0.6 mm | 0.60–0.90 mm | 0.80 mm | $\sim 25$ mm³/s | Large functional parts, high speed |
| 0.8 mm | 0.80–1.20 mm | 1.20 mm | $\sim 40$ mm³/s | Very large parts, "vase mode" thin-walled |
| 1.0 mm | 1.0–1.5 mm | 1.5 mm | $\sim 60$ mm³/s | Architectural models, sub-millimeter resolution unnecessary |

The default $0.4$ mm balances detail and speed; it's the right answer roughly $80\%$ of the time. Switch to $0.6$ mm for any functional part where features are above $1$ mm and time matters; switch to $0.2$ mm only when $0.5$ mm features are critical.

**Material.** Determines wear life and chemical compatibility.

- **Brass.** Standard. Excellent thermal conductivity. Wears in 50–200 hours with abrasive filaments (carbon fiber, glass fiber, glow-in-dark, metallic). $1$ each.
- **Hardened steel.** Tool-steel or A2/H13. Tolerates abrasive filaments indefinitely. Slightly lower thermal conductivity (negligible at typical print speeds). $5$–$15$ each. Default for any user printing CF or GF filaments.
- **Stainless steel.** Food-safe (relevant for direct-food-contact parts). Lower thermal conductivity than brass. $5$–$10$ each.
- **Ruby-tipped (Olsson Ruby, Bondtech CHT Ruby).** Synthetic ruby insert at orifice; effectively un-wearing. $80$–$150$ each. Use case: production environments with high-abrasive filaments.
- **Nickel-plated copper.** High thermal conductivity for high-flow applications; soft, wears with abrasives. $20$–$40$ each.

Nozzle wear is detectable. Symptoms: bead width drift over time (a once-tuned $f$ now produces wider beads), loss of fine detail, eventual oval orifice visible under magnification. Replacement is a 5-minute job with a wrench (cold) or two wrenches (hot — preferred to avoid breaking the heat-break thread).

The orifice's exit profile matters: standard nozzles have a flat outer face, which compacts the bead into the previous layer (the source of the rounded-rectangle bead cross-section). "CHT" (Core Heating Technology) nozzles have a triplex internal core that increases melt-zone surface area without changing the orifice; functionally a high-flow nozzle.
