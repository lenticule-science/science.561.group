---
title: "Flight Regimes"
date-created: 2026-03-06T00:00:00
type: concept
aliases:
  - "Flight Regimes"
  - "flight regimes"
defines:
  - "flight regimes"
keywords:
  - Aerodynamics
  - FlightMechanics
  - Astronautics
description: "The distinct physical regimes of flight — from low-speed aerodynamics through hypersonic reentry — each governed by different dominant physics."
authors:
  - emsenn
  - claude-opus-4-6
---

Aerospace vehicles operate across flight regimes so physically different that the engineering methods, dominant failure modes, and design drivers change fundamentally as speed and altitude increase. Understanding which regime a vehicle operates in is the first question of aerospace design — it determines what physics matters.

## The regimes

### Low-speed / incompressible (M < 0.3)

Dominant physics: viscous effects, [boundary layer](../../topics/uavs/terms/boundary-layer.md) behavior, [low-Reynolds-number effects](../../topics/uavs/concepts/low-reynolds-number-aerodynamics.md) for small vehicles.

The [Mach number](../terms/mach-number.md) is low enough that air behaves as incompressible — density changes are negligible. The [Bernoulli equation](../terms/bernoulli-equation.md) applies directly. [Drag](../../topics/uavs/terms/drag.md) is dominated by [skin friction and pressure drag](../../topics/uavs/terms/parasitic-drag.md) at low angles of attack, [induced drag](../../topics/uavs/terms/induced-drag.md) at high lift coefficients.

This is the regime of most UAVs, general aviation, helicopters, and human-powered aircraft. Design is driven by aerodynamic efficiency ([lift-to-drag ratio](../../topics/uavs/terms/lift-to-drag-ratio.md)), structural weight, and propulsive efficiency.

### Subsonic compressible (0.3 < M < 0.8)

Dominant physics: compressibility corrections become significant; pressure recovery at stagnation points departs from Bernoulli.

Commercial turboprops and some business jets operate here. The Prandtl-Glauert correction factor (1/√(1-M²)) modifies pressure coefficients. Airfoil design must account for the different pressure distributions that compressibility produces.

### Transonic (0.8 < M < 1.2)

Dominant physics: mixed subsonic and supersonic flow; [shock waves](../terms/shock-wave.md) form on surfaces even though freestream M < 1.

The most treacherous regime. Local flow over curved surfaces accelerates to supersonic speeds while the freestream remains subsonic. Shocks form on the wing upper surface, interact with the boundary layer, and can cause flow separation, buffet, and loss of control. The "sound barrier" — the dramatic increase in drag through the transonic regime — is caused by shock wave formation.

Design strategies: swept wings (delay shock formation), supercritical airfoils (weaken shocks), area ruling (smooth cross-sectional area distribution to minimize wave drag). Commercial jets (M 0.78–0.85) operate at the edge of this regime.

### Supersonic (1.2 < M < 5)

Dominant physics: the entire flow field is supersonic; oblique shock waves dominate the aerodynamic picture; wave drag is the largest drag component.

Design is driven by shock geometry. Sharp noses and thin airfoils minimize wave drag. Wings become thin, highly swept or delta-planform. The Concorde (M 2.04) and SR-71 (M 3.2+) operated in this regime. Rockets transit through it during ascent.

### Hypersonic (M > 5)

Dominant physics: [aerodynamic heating](../terms/heat-transfer.md) dominates all other design considerations; air molecules dissociate and ionize; conventional aerodynamic theory breaks down.

The thin-shock-layer assumption replaces traditional shock analysis. Heating scales roughly as v³ — at M 25 (orbital reentry), surface temperatures reach 1,500–3,000°C. Design is entirely driven by thermal protection: the shape of a reentry vehicle is determined by heat management, not aerodynamic efficiency. Blunt bodies are preferred because they push the shock wave away from the surface, reducing surface heating despite increasing drag.

### Exoatmospheric

Dominant physics: [orbital mechanics](../terms/orbital-mechanics.md) replaces aerodynamics entirely. There is no lift, no drag, no aerodynamic heating. Propulsion is by rocket thrust or gravitational assists. Attitude control uses reaction wheels, control moment gyroscopes, or small thrusters.

## Transitions between regimes

Most aerospace vehicles operate in one or two regimes. A few must traverse all of them:

| Vehicle | Regimes traversed | Duration in each |
|---|---|---|
| Small UAV | Low-speed only | Entire flight |
| Commercial airliner | Subsonic → low transonic | Cruise at M 0.78–0.85 |
| Fighter jet | Subsonic → transonic → supersonic | Minutes in each |
| Launch vehicle | All regimes, bottom to top | Seconds to minutes per regime |
| Reentry vehicle | Exoatmospheric → hypersonic → supersonic → subsonic | Minutes per regime |
| SpaceShipTwo | Subsonic → transonic → low supersonic → subsonic | Brief excursion |

The engineering challenge escalates nonlinearly with the number of regimes a vehicle must handle. A vehicle that operates only at low speed can be optimized for that regime. A launch vehicle that must survive all regimes must compromise everywhere and cannot be optimal anywhere — which is one reason rockets are so structurally inefficient compared to aircraft.

## Related concepts

- [Low-Reynolds-Number Aerodynamics](../../topics/uavs/concepts/low-reynolds-number-aerodynamics.md) — the subdomain of low-speed flight where viscous effects dominate
- [Wing Planform Selection for UAVs](../../topics/uavs/concepts/wing-planform-selection-for-uavs.md) — how flight regime influences wing geometry

## Related terms

- [Mach Number](../terms/mach-number.md) — the parameter defining the regime
- [Shock Wave](../terms/shock-wave.md) — the phenomenon that distinguishes transonic and supersonic regimes
- [Heat Transfer](../terms/heat-transfer.md) — the dominant concern in the hypersonic regime
- [Dynamic Pressure](../terms/dynamic-pressure.md) — the aerodynamic loading parameter that peaks in the transonic-supersonic transition
