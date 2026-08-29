---
title: "Airfoil"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Airfoil"
  - "airfoil"
  - "aerofoil"
  - "wing section"
  - "airfoil profile"
defines:
  - "airfoil"
  - "aerofoil"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
description: "The cross-sectional shape of a wing, whose geometry determines lift, drag, and stall characteristics at a given Reynolds number."
---

An airfoil is the cross-sectional profile of a wing — the shape you see if you slice a wing perpendicular to the [span](./span.md).
Its geometry determines how the wing converts forward motion into [lift](./lift.md), how much [drag](./drag.md) it produces, and how it behaves as [angle of attack](./angle-of-attack.md) increases toward [stall](./stall.md).

An airfoil is described by:

- **[Chord](./chord.md)** — the straight-line distance from leading edge to trailing edge.
- **[Camber](./camber.md)** — the curvature of the mean line between upper and lower surfaces.
  Positive camber produces lift at zero angle of attack.
  Symmetric airfoils (zero camber) produce no lift at zero AoA.
- **Thickness** — maximum distance between upper and lower surfaces, expressed as a percentage of chord.
  Typical values: 6–8% for high-speed sections, 12–18% for low-speed, high-lift sections.
- **Thickness distribution** — where the maximum thickness falls along the chord.
  Forward (20–30% chord) promotes laminar flow; rearward (40–50%) provides more volume.

Airfoil selection for UAVs is complicated by [Reynolds number](./reynolds-number.md).
Small UAVs (chord < 200 mm, speed < 20 m/s) operate at Reynolds numbers of 50,000–200,000, where the boundary layer is predominantly laminar and prone to separation bubbles that dramatically increase drag.
Airfoils designed for full-scale aircraft (NACA 2412, Clark Y) perform poorly at these scales.
Specialized low-Reynolds-number airfoils (Selig S1223, Eppler 387, AG-series) use specific camber and thickness distributions to manage the laminar-turbulent transition.

For [3D-printed](../concepts/additive-manufacturing-in-uav-airframes.md) wings, airfoil selection also interacts with manufacturing constraints: thin trailing edges are difficult to print accurately, and surface roughness from layer lines affects boundary layer behavior.
Many printed-wing designers use slightly thicker trailing edges (1–2 mm rather than knife-edge) and accept the small drag penalty.

## Related terms

- [Chord](./chord.md) — the characteristic length of the airfoil
- [Camber](./camber.md) — the curvature that generates lift at zero angle of attack
- [Reynolds Number](./reynolds-number.md) — the flow parameter that determines which airfoils work at a given scale
- [Boundary Layer](./boundary-layer.md) — the thin air layer whose behavior the airfoil shape is designed to control
