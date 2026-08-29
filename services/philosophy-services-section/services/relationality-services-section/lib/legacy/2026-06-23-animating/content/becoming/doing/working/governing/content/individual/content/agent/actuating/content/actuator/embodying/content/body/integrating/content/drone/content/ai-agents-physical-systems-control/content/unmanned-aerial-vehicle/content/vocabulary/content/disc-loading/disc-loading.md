---
title: "Disc Loading"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Disc Loading"
  - "disc loading"
  - "disk loading"
defines:
  - "disc loading"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - Propulsion
description: "The ratio of aircraft weight to total rotor disc area, the rotary-wing equivalent of wing loading that governs hover efficiency and noise."
---

Disc loading is the ratio of a rotary-wing aircraft's weight to the total area swept by its rotors.
For a quadcopter with four propellers of diameter d:

disc loading = W / (4 × π × (d/2)²)

Disc loading is the rotary-wing analog of [wing loading](./wing-loading.md) — it governs the fundamental performance trade-offs for hovering and vertical flight:

**Low disc loading** (large rotors relative to weight): - More efficient hover (less power required per unit weight) - Lower downwash velocity (less ground disturbance, safer for nearby people) - Quieter (lower tip speeds for a given thrust) - Larger physical footprint

**High disc loading** (small rotors relative to weight): - Less efficient hover (more power, shorter flight time) - Compact airframe (fits through doorways, deploys from small containers) - Faster forward flight (less rotor drag) - Noisier

Representative disc loading values:

| Platform | Disc loading (kg/m²) | Notes |
|---|---|---|
| Large helicopter (UH-60) | 30–45 | Low for efficiency, payload |
| Small UAV helicopter (S-100) | 20–35 | Moderate, endurance-optimized |
| Photography multirotor (DJI Mavic) | 40–70 | Compact form factor |
| Racing quadcopter | 80–150 | Minimum size, maximum agility |
| Ducted-fan micro UAV | 100–200 | Very compact, reduced efficiency from duct |

Disc loading interacts directly with battery sizing for electric multirotors: higher disc loading requires more power to hover, draining the battery faster, reducing endurance.
This is why large-diameter, slow-turning propellers are preferred for endurance missions (mapping, inspection) and small, fast-spinning propellers are preferred where compactness matters more than flight time (racing, indoor inspection).

## Related terms

- [Wing Loading](./wing-loading.md) — the fixed-wing equivalent
- [Thrust-to-Weight Ratio](./thrust-to-weight-ratio.md) — the performance parameter that disc loading feeds into
- [Propeller Pitch](./propeller-pitch.md) — the blade geometry interacting with disc loading
