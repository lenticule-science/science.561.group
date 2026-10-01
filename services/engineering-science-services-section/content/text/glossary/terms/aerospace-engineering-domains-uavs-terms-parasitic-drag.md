---
name: "Parasitic Drag"
type: "term"
date-created: 2026-03-06
---

The drag component unrelated to lift generation, caused by skin friction, flow separation, and interference between aircraft components.

Parasitic drag is all [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) that is not caused by the generation of [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md). It has three sub-components:

**Skin friction drag** — shear stress between the moving air and the aircraft&rsquo;s surface. Determined by wetted area (total surface exposed to airflow), [boundary layer](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/boundary-layer.md) state (laminar or turbulent), and surface roughness. Skin friction is typically 40–70% of total parasitic drag on a clean airframe.

**Form drag (pressure drag)** — the pressure difference between the front and rear of a body caused by boundary layer separation. Blunt shapes, abrupt transitions, and separated flow regions all increase form drag. Streamlined shapes minimize it by preventing or delaying separation.

**Interference drag** — additional drag produced where two components meet (wing-fuselage junction, strut-wing junction, motor mount-fuselage junction). Intersecting boundary layers thicken and separate more readily than on isolated components. Fairings and fillets reduce interference drag but add weight and complexity.

Parasitic drag increases with the square of airspeed, making it the dominant drag component at high speed. The parasitic drag coefficient (C_D0) is roughly constant with speed for a given configuration — typically 0.02–0.04 for a clean small UAV, 0.04–0.08 for a UAV with external payloads, landing gear, or rough surfaces.

For [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) airframes, surface roughness from layer lines can increase skin friction by 5–15% compared to a smooth composite or painted surface. Whether this matters depends on the mission: for a high-endurance surveillance drone, it is significant; for a short-range [expendable](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/expendable-airframe-design.md) platform, it is negligible.
