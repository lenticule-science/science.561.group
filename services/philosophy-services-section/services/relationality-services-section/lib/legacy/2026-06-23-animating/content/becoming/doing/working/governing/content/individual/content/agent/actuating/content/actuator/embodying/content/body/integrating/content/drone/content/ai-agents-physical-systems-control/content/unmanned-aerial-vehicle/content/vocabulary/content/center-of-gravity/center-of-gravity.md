---
title: "Center of Gravity"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Center of Gravity"
  - "center of gravity"
  - "CG"
  - "centre of gravity"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - StructuralEngineering
description: "The point at which an aircraft's weight effectively acts, whose position relative to the wing's aerodynamic center determines stability and controllability."
---

The center of gravity (CG) is the point through which the total weight of the aircraft acts.
Its longitudinal position — how far forward or aft it sits relative to the wing — is the single most critical balance parameter in fixed-wing aircraft design.
CG position determines static stability, [control surface](./control-surface.md) effectiveness, [stall](./stall.md) behavior, and [trim](./trim.md) drag.

**Static stability** requires the CG to be forward of the wing's aerodynamic center (the neutral point — typically 25–30% of the mean [chord](./chord.md) for a conventional wing, 40–45% for a delta).
When the CG is forward: - A pitch disturbance increases [angle of attack](./angle-of-attack.md), generating more lift behind the CG, which creates a nose-down restoring moment. - The aircraft naturally returns to its trimmed attitude — it is statically stable.

When the CG is aft of the neutral point, the aircraft is statically unstable — any disturbance grows.
Some high-performance military UAVs are deliberately designed with aft CG (relaxed static stability) to improve maneuverability, relying on the [flight controller](./flight-controller.md) to stabilize the aircraft faster than the instability develops.
This requires high-rate control loops (typically >100 Hz) and is not suitable for simple autopilots.

**CG range** — the distance between the most-forward and most-aft acceptable CG positions — is narrow for tailless aircraft (delta wings, flying wings) and wider for conventional tailed designs.
A delta wing with [elevon](./elevon.md) control may have a CG range of only 3–5% of mean chord; a conventional layout might tolerate 10–20%.
This is why [expendable airframes](../concepts/expendable-airframe-design.md) designed for interchangeable payloads of varying mass face a CG management challenge: the warhead/sensor swap changes the CG position, and the airframe must either accommodate the range or use ballast to compensate.

**Lateral CG offset** (left-right asymmetry) causes a roll tendency that must be trimmed out by steady [aileron](./aileron.md) or [elevon](./elevon.md) deflection.
For [3D-printed](../concepts/additive-manufacturing-in-uav-airframes.md) airframes, asymmetric [infill](./infill-density.md) or an off-center battery placement can introduce lateral CG offset.
A 5 mm lateral offset on a 2 kg drone is typically manageable by the autopilot; 20 mm may exceed trim authority.

## Related terms

- [Trim](./trim.md) — the control surface deflection required to balance moments at a given CG
- [Control Surface](./control-surface.md) — the devices that generate moments around the CG
- [Wing Loading](./wing-loading.md) — the weight parameter that CG position modulates
