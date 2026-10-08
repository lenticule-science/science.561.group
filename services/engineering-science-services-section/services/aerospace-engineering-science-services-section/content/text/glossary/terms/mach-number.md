---
name: "Mach Number"
date-created: 2026-03-06
aliases:
  - "Mach Number"
  - "Mach number"
  - "M"
keywords:
  - FluidDynamics
  - Aerodynamics
  - Compressibility
description: "The ratio of flow velocity to the local speed of sound, governing whether compressibility effects matter."
authors:
  - emsenn
  - claude-opus-4-6
---

The Mach number (M) is the ratio of an object's velocity to the local speed of sound in the surrounding medium:

M = V / a

where V is the flow or object velocity and a is the local speed of sound (~340 m/s in sea-level air at 15°C, but varying with temperature as a = √(γRT), where γ is the ratio of specific heats, R the specific gas constant, and T the absolute temperature).

The Mach number defines the compressibility regime:

| Regime | Mach range | Key physics |
|---|---|---|
| Subsonic | M < 0.8 | Flow behaves as nearly incompressible below M ≈ 0.3; density changes become significant above M ≈ 0.3 |
| Transonic | 0.8 < M < 1.2 | Mixed subsonic and supersonic flow; [shock waves](./shock-wave.md) form on surfaces even below M = 1 |
| Supersonic | 1.2 < M < 5 | Entire flow field supersonic; oblique shocks dominate; wave [drag](../../../../services/uavs-services-section/content/text/glossary/terms/drag.md) is the primary drag component |
| Hypersonic | M > 5 | Kinetic heating dominates design; air molecules dissociate; conventional aerodynamic assumptions break down |

Most UAVs operate at M < 0.3, where compressibility is negligible and flow can be treated as incompressible. Rockets transit all four regimes during ascent — subsonic at launch, through the transonic regime where aerodynamic loads peak (max Q), into supersonic and hypersonic flight as they leave the atmosphere.

The Mach number is named for Ernst Mach, who studied the physics of supersonic projectiles in the 1880s.

## Related terms

- [Dynamic Pressure](./dynamic-pressure.md) — the pressure quantity that peaks at max Q during rocket ascent
- [Shock Wave](./shock-wave.md) — the discontinuity that forms when flow exceeds M = 1
- [Reynolds Number](../../../../services/uavs-services-section/content/text/glossary/terms/reynolds-number.md) — the other key dimensionless parameter in fluid mechanics
