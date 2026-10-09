---
name: "Parasitic Drag"
date-created: 2026-03-06
aliases:
  - "Parasitic Drag"
  - "parasitic drag"
  - "zero-lift drag"
  - "profile drag"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
description: "The drag component unrelated to lift generation, caused by skin friction, flow separation, and interference between aircraft components."
---

Parasitic drag is all [drag](./drag.md) that is not caused by the generation of [lift](./lift.md). It has three sub-components:

**Skin friction drag** — shear stress between the moving air and the aircraft's surface. Determined by wetted area (total surface exposed to airflow), [boundary layer](./boundary-layer.md) state (laminar or turbulent), and surface roughness. Skin friction is typically 40–70% of total parasitic drag on a clean airframe.

**Form drag (pressure drag)** — the pressure difference between the front and rear of a body caused by boundary layer separation. Blunt shapes, abrupt transitions, and separated flow regions all increase form drag. Streamlined shapes minimize it by preventing or delaying separation.

**Interference drag** — additional drag produced where two components meet (wing-fuselage junction, strut-wing junction, motor mount-fuselage junction). Intersecting boundary layers thicken and separate more readily than on isolated components. Fairings and fillets reduce interference drag but add weight and complexity.

Parasitic drag increases with the square of airspeed, making it the dominant drag component at high speed. The parasitic drag coefficient (C_D0) is roughly constant with speed for a given configuration — typically 0.02–0.04 for a clean small UAV, 0.04–0.08 for a UAV with external payloads, landing gear, or rough surfaces.

For [3D-printed](./additive-manufacturing-in-uav-airframes.md) airframes, surface roughness from layer lines can increase skin friction by 5–15% compared to a smooth composite or painted surface. Whether this matters depends on the mission: for a high-endurance surveillance drone, it is significant; for a short-range [expendable](./expendable-airframe-design.md) platform, it is negligible.

## Related terms

- [Induced Drag](./induced-drag.md) — the lift-dependent drag component
- [Boundary Layer](./boundary-layer.md) — the flow region where skin friction and separation originate
- [Drag](./drag.md) — the total aerodynamic resistance, of which parasitic drag is one part
