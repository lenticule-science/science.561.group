---
name: "Viscosity"
date-created: 2026-03-07
---

A fluid's resistance to shearing motion — the property that creates boundary layers, governs Reynolds number, and makes flight possible.

Viscosity is a fluid&rsquo;s resistance to shearing deformation. A high-viscosity fluid (honey) resists flowing; a low-viscosity fluid (air) flows easily. Viscosity is the reason [boundary layers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/boundary-layer.md) exist, the reason [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) is not zero even on perfectly streamlined bodies, and — through its role in the [Reynolds number](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md) — the property that determines whether flow is [laminar or turbulent](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/laminar-and-turbulent-flow.md).

## Two forms

**Dynamic viscosity (μ)** — the shear [stress](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/stress.md) required to maintain a unit velocity gradient in the fluid. Measured in Pa·s (pascal-seconds). Air at sea level has μ ≈ 1.81 × 10⁻⁵ Pa·s. Dynamic viscosity appears in the [Navier-Stokes equations](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/navier-stokes-equations.md).

**Kinematic viscosity (ν)** — dynamic viscosity divided by fluid density:

ν = μ / ρ

Measured in m²/s. Air at sea level has ν ≈ 1.48 × 10⁻⁵ m²/s. Kinematic viscosity is what appears in the [Reynolds number](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md):

Re = V × L / ν

Kinematic viscosity is the more operationally useful quantity because aerodynamic similarity depends on it, not on dynamic viscosity alone.

## Viscosity and altitude

As altitude increases, air temperature drops and density decreases. Dynamic viscosity changes modestly with temperature (decreasing about 10% from sea level to the tropopause), but kinematic viscosity increases substantially because density drops faster than dynamic viscosity. At 10 km altitude, ν ≈ 3.5 × 10⁻⁵ m²/s — more than double the sea-level value. This means the same aircraft at the same speed has a lower Reynolds number at altitude, potentially changing boundary layer behavior and airfoil performance.

Altitude (km)
Temperature (°C)
Density (kg/m³)
ν (m²/s)
Re at V=15 m/s, c=200 mm

0
15
1.225
1.48 × 10⁻⁵
203,000

2
2
1.007
1.71 × 10⁻⁵
175,000

5
-18
0.736
2.21 × 10⁻⁵
136,000

10
-50
0.414
3.53 × 10⁻⁵
85,000

For small UAVs already operating in the [low-Reynolds-number regime](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/low-reynolds-number-aerodynamics.md), altitude effects can push the Reynolds number below critical thresholds where [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md) performance deteriorates sharply.

## Viscosity as the source of drag

An inviscid (zero-viscosity) fluid produces zero drag on a body moving through it — this is d&rsquo;Alembert&rsquo;s paradox, proven mathematically in 1752 and obviously contradicted by experience. All [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) on subsonic aircraft ultimately originates from viscosity: skin friction drag from the viscous boundary layer, pressure drag from viscosity-induced [flow separation](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/flow-separation.md), and [induced drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/induced-drag.md) from the trailing vortex system that exists because viscosity prevents the flow from slipping freely around the wing tip.
