---
name: "Delta-v"
date-created: 2026-03-06T00:00:00
aliases:
  - "Delta-v"
  - "delta-v"
  - "Δv"
  - "delta-V"
keywords:
  - OrbitalMechanics
  - Propulsion
  - MissionDesign
description: "The total velocity change a spacecraft must produce to complete a mission — the universal currency of space mission design."
authors:
  - emsenn
  - claude-opus-4-6
---

Delta-v (Δv) is the total change in velocity a rocket must produce to accomplish a mission. It is the single most important parameter in space mission design — once you know the Δv, the [rocket equation](./rocket-equation.md) tells you how much propellant is needed, and the propellant requirement determines the vehicle size and cost.

Δv is additive: a mission that requires several maneuvers has a total Δv equal to the sum of each maneuver's Δv. This makes it a budget — you start with the Δv your propulsion system can deliver (determined by [specific impulse](./specific-impulse.md) and [mass ratio](./mass-ratio.md)), and you spend it on each mission phase.

## The delta-v map

Key delta-v values for Earth-based missions:

| Maneuver | Δv (km/s) | Notes |
|---|---|---|
| Surface to LEO (200 km) | 9.3–9.5 | Includes ~1.5 km/s gravity/drag losses |
| LEO to GTO | 2.5 | Transfer orbit to geostationary altitude |
| GTO to GEO | 1.5 | Circularization at GEO |
| LEO to Moon transfer | 3.1 | Trans-lunar injection |
| Moon orbit to surface | 1.7 | Lunar descent |
| LEO to Mars transfer | 3.6 | Hohmann transfer, favorable opposition |
| Mars orbit to surface | 1.0 | With aerobraking: ~0.05 km/s |
| LEO to Earth escape | 3.2 | C3 = 0 |

The dominant cost is always the first maneuver — getting off Earth's surface. The 9.4 km/s to LEO is more than the Δv from LEO to Mars. This is why "once you're in orbit, you're halfway to anywhere" (Robert Heinlein) — though not in terms of travel time.

### Gravity losses and drag losses

The ideal Δv for a circular orbit at 200 km is just the orbital velocity: 7.8 km/s. Real rockets need 9.3–9.5 km/s because:

- **Gravity loss** (~1,000–1,500 m/s): while climbing vertically, gravity accelerates the rocket downward. Every second spent fighting gravity rather than building horizontal velocity is wasted Δv.
- **Drag loss** (~100–400 m/s): atmospheric [drag](../../../topics/uavs/terms/drag.md) slows the rocket during the dense-atmosphere phase of ascent.
- **Steering loss** (~50–100 m/s): the [gravity turn](./gravity-turn.md) trajectory is not perfectly efficient.

### Delta-v as design driver

The Δv budget drives every aspect of launch vehicle design:
- **Propellant choice** — higher [I_sp](./specific-impulse.md) means less propellant for a given Δv
- **Staging** — more stages allow higher total Δv from practical mass ratios
- **Trajectory** — gravity turns and aerobraking reduce propulsive Δv requirements
- **Payload mass** — every kilogram of payload reduces the achievable Δv

## Related terms

- [Rocket Equation](./rocket-equation.md) — the equation linking Δv to mass ratio and exhaust velocity
- [Specific Impulse](./specific-impulse.md) — determines how much propellant a given Δv requires
- [Orbital Mechanics](../../terms/orbital-mechanics.md) — the physics that determines how much Δv each maneuver requires
- [Gravity Turn](./gravity-turn.md) — the ascent trajectory that minimizes gravity losses
