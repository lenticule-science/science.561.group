---
name: "Thrust-to-Weight Ratio"
type: "term"
date-created: 2026-03-06
---

The ratio of available thrust to aircraft weight, determining whether an aircraft can climb, hover, or merely sustain level flight.

Thrust-to-weight ratio (T/W) is the ratio of the maximum thrust a propulsion system can produce to the total weight of the aircraft. It determines the fundamental performance envelope:

- **T/W  1.0**: The aircraft can climb vertically and has excess thrust for acceleration and maneuvering. Racing quadcopters achieve T/W of 8–12; practical multirotors for photography and survey fly at T/W 1.5–3.0.

For fixed-wing UAVs, T/W determines:

- **Climb rate** — excess thrust (thrust minus drag) divided by weight. A fixed-wing drone with T/W 0.3 and L/D 10 at climb speed can sustain a climb angle of roughly 15°.

- **Maximum speed** — the speed at which thrust equals [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md). Higher T/W means more available thrust to overcome drag at higher speeds.

- **Catapult requirements** — a platform with very low T/W needs more launch velocity from the catapult to reach flying speed. High T/W allows shorter catapult rails or even hand launch.

- **Maneuvering capability** — T/W limits the sustained g-load in turns (combined with [wing loading](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-loading.md)).

For multirotors, T/W is the most important sizing parameter:

- **Minimum practical T/W**: ~1.5 for benign conditions. Below this, the aircraft cannot maintain altitude in wind or execute attitude corrections.

- **Photography/survey**: T/W 2.0–3.0. Enough authority for active hover in moderate wind with payload.

- **Racing/acrobatic**: T/W 6.0–12.0. Enables vertical climbs, snap rolls, and high-speed maneuvers.

- **Heavy lift**: T/W 1.3–1.8. Maximizes payload fraction at the cost of maneuverability and wind tolerance.
