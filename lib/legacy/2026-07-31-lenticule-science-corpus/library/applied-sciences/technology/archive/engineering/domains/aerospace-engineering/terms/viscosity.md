---
title: "Viscosity"
date-created: 2026-03-07T00:00:00
type: term
aliases:
  - "Viscosity"
  - "viscosity"
  - "dynamic viscosity"
  - "kinematic viscosity"
defines:
  - "viscosity"
  - "kinematic viscosity"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - FluidDynamics
description: "A fluid's resistance to shearing motion — the property that creates boundary layers, governs Reynolds number, and makes flight possible."
---

Viscosity is a fluid's resistance to shearing deformation. A high-viscosity fluid (honey) resists flowing; a low-viscosity fluid (air) flows easily. Viscosity is the reason [boundary layers](../../topics/uavs/terms/boundary-layer.md) exist, the reason [drag](../../topics/uavs/terms/drag.md) is not zero even on perfectly streamlined bodies, and — through its role in the [Reynolds number](../../topics/uavs/terms/reynolds-number.md) — the property that determines whether flow is [laminar or turbulent](./laminar-and-turbulent-flow.md).

## Two forms

**Dynamic viscosity (μ)** — the shear [stress](./stress.md) required to maintain a unit velocity gradient in the fluid. Measured in Pa·s (pascal-seconds). Air at sea level has μ ≈ 1.81 × 10⁻⁵ Pa·s. Dynamic viscosity appears in the [Navier-Stokes equations](./navier-stokes-equations.md).

**Kinematic viscosity (ν)** — dynamic viscosity divided by fluid density:

ν = μ / ρ

Measured in m²/s. Air at sea level has ν ≈ 1.48 × 10⁻⁵ m²/s. Kinematic viscosity is what appears in the [Reynolds number](../../topics/uavs/terms/reynolds-number.md):

Re = V × L / ν

Kinematic viscosity is the more operationally useful quantity because aerodynamic similarity depends on it, not on dynamic viscosity alone.

## Viscosity and altitude

As altitude increases, air temperature drops and density decreases. Dynamic viscosity changes modestly with temperature (decreasing about 10% from sea level to the tropopause), but kinematic viscosity increases substantially because density drops faster than dynamic viscosity. At 10 km altitude, ν ≈ 3.5 × 10⁻⁵ m²/s — more than double the sea-level value. This means the same aircraft at the same speed has a lower Reynolds number at altitude, potentially changing boundary layer behavior and airfoil performance.

| Altitude (km) | Temperature (°C) | Density (kg/m³) | ν (m²/s) | Re at V=15 m/s, c=200 mm |
|---|---|---|---|---|
| 0 | 15 | 1.225 | 1.48 × 10⁻⁵ | 203,000 |
| 2 | 2 | 1.007 | 1.71 × 10⁻⁵ | 175,000 |
| 5 | -18 | 0.736 | 2.21 × 10⁻⁵ | 136,000 |
| 10 | -50 | 0.414 | 3.53 × 10⁻⁵ | 85,000 |

For small UAVs already operating in the [low-Reynolds-number regime](../../topics/uavs/concepts/low-reynolds-number-aerodynamics.md), altitude effects can push the Reynolds number below critical thresholds where [airfoil](../../topics/uavs/terms/airfoil.md) performance deteriorates sharply.

## Viscosity as the source of drag

An inviscid (zero-viscosity) fluid produces zero drag on a body moving through it — this is d'Alembert's paradox, proven mathematically in 1752 and obviously contradicted by experience. All [drag](../../topics/uavs/terms/drag.md) on subsonic aircraft ultimately originates from viscosity: skin friction drag from the viscous boundary layer, pressure drag from viscosity-induced [flow separation](./flow-separation.md), and [induced drag](../../topics/uavs/terms/induced-drag.md) from the trailing vortex system that exists because viscosity prevents the flow from slipping freely around the wing tip.

## Related terms

- [Reynolds Number](../../topics/uavs/terms/reynolds-number.md) — the ratio of inertial to viscous forces, with viscosity in the denominator
- [Boundary Layer](../../topics/uavs/terms/boundary-layer.md) — the thin layer where viscous effects are concentrated
- [Atmosphere](./atmosphere.md) — the medium whose viscosity varies with altitude and temperature
- [Navier-Stokes Equations](./navier-stokes-equations.md) — the equations of viscous fluid motion
