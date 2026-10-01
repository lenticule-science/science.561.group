---
name: "Stability"
type: "term"
date-created: 2026-03-06
---

The tendency of an aerospace vehicle to return to its equilibrium state after a disturbance — the foundation of controllable flight.

Stability is the tendency of a vehicle to return to its equilibrium condition after being disturbed. An aircraft hit by a gust that pitches it nose-up is stable if it naturally pitches back down; unstable if it continues pitching up; neutrally stable if it remains at the new attitude.

## Static vs. dynamic stability

**Static stability** — the initial tendency. Does the vehicle generate restoring forces when displaced? A pendulum has positive static stability: displace it and gravity pulls it back. An aircraft has positive static pitch stability when the [center of gravity](../../documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/topics/uavs/terms/center-of-gravity.md) is forward of the neutral point (the aerodynamic center of the whole aircraft).

**Dynamic stability** — the long-term behavior. A statically stable vehicle may still be dynamically unstable if the restoring oscillations grow rather than damp out. A vehicle is dynamically stable when oscillations damp to zero over time. All piloted aircraft must be dynamically stable (or at least neutrally stable) in their primary modes; many modern fighters are statically unstable and rely on fly-by-wire computers to provide artificial stability.

## Axes of stability

Axis
Rotation
Stability mode
Primary stabilizer

Longitudinal (roll)
Roll
Lateral stability
Wing dihedral, sweep

Lateral (pitch)
Pitch
Longitudinal stability
Horizontal tail / [elevator](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevator.md)

Vertical (yaw)
Yaw
Directional stability
Vertical tail / [rudder](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/rudder.md)

Pitch stability is the most critical for flight safety. The static margin — the distance between the CG and the neutral point, expressed as a percentage of the [chord](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/chord.md) — quantifies pitch stability. Conventional aircraft have static margins of 5–15% chord. Fighter aircraft may have negative static margins (unstable) for enhanced maneuverability.

## Stability in rockets

Rockets achieve stability differently from aircraft. A rocket is aerodynamically stable when the center of pressure (where aerodynamic forces act) is aft of the center of gravity. Fins at the base of a rocket move the center of pressure aft, providing stability — this is why model rockets have fins. Large launch vehicles often have small or no fins and rely on active thrust vectoring ([gimbaled engines](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/gimbal.md)) or reaction control systems for stability during atmospheric flight.

## Stability in UAVs

Many UAVs are designed with relaxed stability (small positive or slightly negative static margins) controlled by a [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md). This trades natural stability for agility and reduced [trim](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/trim.md) drag. The autopilot closes the stability loop at 100–400 Hz — fast enough that the aircraft appears stable to external observers even though the bare airframe is not.
