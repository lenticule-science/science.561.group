---
type: object
class: thermoplastic
depends-on: [glass-transition]
title: ABS (acrylonitrile butadiene styrene)
description: An amorphous terpolymer — three monomers (acrylonitrile, butadiene, styrene) copolymerized to balance heat resistance (acrylonitrile), impact resistance (butadiene rubber phase), and surface finish (styrene).
---

# ABS (acrylonitrile butadiene styrene)

An amorphous terpolymer — three monomers (acrylonitrile, butadiene, styrene) copolymerized to balance heat resistance (acrylonitrile), impact resistance (butadiene rubber phase), and surface finish (styrene). The dominant injection-molded plastic for consumer goods (LEGO, electronics housings, automotive interior trim) and one of the most-printed FFF materials despite being the most-difficult-to-print of the common ones.

**Properties (unfilled, generic spool):**

| Property | Value |
|---|---|
| Glass transition $T_g$ | $\sim 105$°C |
| Density | $\sim 1.05$ g/cm³ |
| Tensile strength (XY) | $35$–$45$ MPa |
| Tensile modulus | $\sim 2.2$ GPa |
| Elongation at break | $\sim 5$–$15\%$ |
| Impact (Izod) | $\sim 200$ J/m (very high) |
| Service temperature | $\leq 90$°C |
| Hygroscopicity | Moderate |

**Process window.**
- Nozzle temperature: $230$–$260$°C.
- Bed temperature: $100$–$110$°C.
- Part-cooling fan: $0$–$20\%$. Higher fan causes layer separation.
- **Enclosure: required.** Chamber held at $\geq 40$°C, ideally $50$–$60$°C.
- Drying: needed if spool has been open more than a few weeks.

**Strengths.**
- High service temperature (relative to PLA, PETG).
- High impact resistance; tough, not brittle.
- Acetone-vapor-smoothable — surface can be made glossy and watertight by exposure to acetone vapor for $30$–$60$ minutes.
- Acetone weldable — multi-part assemblies bonded with brushed acetone produce strong joints.
- Inexpensive; widely available.

**Weaknesses.**
- **Warps severely without an enclosure.** Open-printer ABS prints fail above $80 \times 80$ mm footprint. See [why-this-print-warped](../../../services/additive-manufacturing-services-section/content/text/theories/predication-why-this-print-warped.md).
- **Releases styrene fumes** during printing; ventilation required (carbon-filter enclosure or window vent).
- **UV-degrades** in outdoor exposure; cracks within a year. Use ASA instead for outdoor parts.
- Slightly brittle in thin walls; better in bulk.

**The ABS open-printer problem.** ABS's high $T_g$ ($\sim 105$°C) means deposited material cools through a wide temperature range to ambient $\sim 22$°C, and the differential cooling of upper hot layers above lower cold layers generates large internal stresses. In a $50$°C enclosure, the differential is $\sim 55$°C; on an open machine, $\sim 80$°C. The squared-difference relationship between temperature gradient and cooling stress means a $50$°C enclosure reduces warping stress by roughly half — usually the difference between successful and failed prints.

**Variants.**
- **ASA.** Almost identical mechanically; UV-stable for outdoor use. Replace ABS with ASA for any outdoor application.
- **ABS+/Tough ABS.** Modified for slightly easier printing; trades some impact strength.
- **ABS-CF.** Carbon-fiber filled. Stiffer; warping reduced (CF lowers shrinkage); abrasive.

**When to use.** Functional parts needing $> 65$°C service temperature, high impact resistance, or acetone-smoothing finish. Requires an enclosed printer; not viable on an open desktop machine for non-trivial geometry.
