---
name: "Heat Transfer"
date-created: 2026-03-06
aliases:
  - "Heat Transfer"
  - "heat transfer"
  - "aerodynamic heating"
  - "thermal protection"
keywords:
  - Thermodynamics
  - StructuralEngineering
  - Reentry
description: "The movement of thermal energy between a vehicle and its environment — conduction, convection, and radiation — governing thermal protection design."
authors:
  - emsenn
  - claude-opus-4-6
---

Heat transfer in aerospace engineering is the movement of thermal energy between a vehicle and its surroundings, governing the design of thermal protection systems, engine cooling, avionics thermal management, and structural material selection.

## Mechanisms

**Conduction** — heat transfer through solid material from hot to cold regions. Rate depends on thermal conductivity (k), temperature gradient, and cross-sectional area. Metals conduct heat well (aluminum: k ≈ 205 W/m·K); insulating materials resist it (silica tiles: k ≈ 0.05 W/m·K). Conduction governs how quickly heat from an external surface reaches internal structure.

**Convection** — heat transfer between a surface and a moving fluid. In aerospace, the fluid is usually air or combustion gases. The rate depends on flow velocity, fluid properties, and surface geometry. The convective heat flux to a vehicle surface scales roughly as v³ — doubling velocity increases heating roughly eightfold. This is why hypersonic flight generates extreme surface temperatures.

**Radiation** — heat transfer via electromagnetic emission. All bodies radiate energy proportional to T⁴ (Stefan-Boltzmann law). At reentry temperatures (1,500–3,000 K), radiation is a primary cooling mechanism — the hot [shock wave](./shock-wave.md) layer radiates energy both toward the vehicle and away into space. The vehicle's thermal protection surface also radiates heat, which is why reentry vehicles glow — they are rejecting heat as fast as they absorb it.

## Aerodynamic heating

When air is decelerated in the [boundary layer](../../../../services/uavs-services-section/content/text/glossary/terms/boundary-layer.md), its kinetic energy converts to thermal energy. The stagnation temperature — the temperature air reaches when brought to rest — is:

T₀ = T∞ × (1 + (γ-1)/2 × M²)

At [Mach](./mach-number.md) 2, stagnation temperature is ~250°C. At Mach 5 (hypersonic threshold), it reaches ~1,800°C. At Mach 25 (orbital reentry velocity), it exceeds 7,000°C — well beyond the melting point of any structural material.

## Thermal protection strategies

| Strategy | Mechanism | Example |
|---|---|---|
| Heat sink | Absorb heat in mass | Early ballistic reentry vehicles (copper nose cones) |
| Ablation | Surface material chars and sublimates, carrying heat away | Apollo heat shield (AVCOAT), Stardust (PICA) |
| Radiative cooling | Hot surface radiates heat to space | Space Shuttle tiles (LI-900 silica) |
| Active cooling | Pump coolant through structure | Rocket engine chambers, scramjet leading edges |
| Insulation | Slow conduction to internal structure | Space Shuttle blankets (FRSI, AFRSI) |

### Low-speed heat transfer

Heat transfer also matters for UAVs and low-speed aircraft — not from aerodynamic heating, but from:
- Motor and battery thermal management (electric UAVs)
- Engine cooling (piston-powered UAVs)
- Avionics heat dissipation
- Solar heating of dark-colored airframes in desert environments

## Related terms

- [Shock Wave](./shock-wave.md) — the source of extreme heating during reentry
- [Mach Number](./mach-number.md) — the parameter determining stagnation temperature
