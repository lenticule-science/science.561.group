---
name: "HALE"
date-created: 2026-03-06
aliases:
  - "HALE"
  - "high-altitude long-endurance"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - PlatformClassification
description: "A class of UAV operating above 15,000 m altitude for 24+ hours, used for strategic reconnaissance and wide-area persistent surveillance."
---

HALE (high-altitude long-endurance) is a classification for UAVs designed to operate above 15,000 m (50,000 ft) for 24+ hours — and in some solar-powered variants, for weeks or months continuously. HALE platforms provide strategic-level surveillance, communications relay, and atmospheric research from altitudes above weather and most air defenses.

Representative HALE platforms:

| Platform | Country | Weight (kg) | Endurance | Altitude (m) | Wingspan (m) |
|---|---|---|---|---|---|
| RQ-4 Global Hawk | USA | 14,628 | 32 hr | 18,000 | 39.9 |
| MQ-4C Triton | USA | 14,628 | 24 hr | 17,000 | 39.9 |
| Zephyr S | UK/Airbus | 75 | Months | 21,000+ | 25 |
| Wing Loong 3 | China | ~7,500 | 24+ hr | 15,000+ | 24 |

HALE engineering is dominated by the challenge of efficient flight in thin air. At 18,000 m, air density is roughly 7% of sea level. Since [lift](./lift.md) is proportional to air density, a HALE platform needs either enormously more wing area, much higher speed, or much higher lift coefficient than a sea-level aircraft of the same weight.

This drives HALE design toward:
- Very high [aspect ratios](./aspect-ratio.md) (25–35) — Global Hawk's 40 m wingspan approaches sailplane territory
- Light [wing loading](./wing-loading.md) (200–350 kg/m²) — large wing relative to weight
- Turbofan or turboprop [propulsion](./uav-propulsion-systems.md) optimized for altitude — or solar cells with electric motors for indefinite-endurance variants
- Specialized high-altitude [airfoils](./airfoil.md) that perform at [Reynolds numbers](./reynolds-number.md) comparable to much smaller aircraft at sea level (Re ~1–3 million at altitude, vs. ~20–30 million at sea level for the same wing)
- Extreme structural efficiency — carbon [composite](./composite.md) throughout, with weight management rivaling sailplane construction

The solar-powered HALE category (Zephyr, Odysseus) operates at a different engineering frontier: wing area is sized for solar panel capacity as much as for aerodynamics, structural weight must be minimized to near-zero margins for night flight on battery power alone, and [fatigue](./fatigue.md) from daily thermal cycling at extreme altitude becomes a defining structural concern.

## Related terms

- [MALE](./male.md) — the medium-altitude classification one step below
- [Aspect Ratio](./aspect-ratio.md) — driven to extreme values by HALE efficiency requirements
- [Reynolds Number](./reynolds-number.md) — high altitude reduces effective Re, complicating airfoil design
