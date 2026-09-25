---
title: "Center of Gravity"
type: "term"
date-created: 2026-03-06
---

The point at which an aircraft's weight effectively acts, whose position relative to the wing's aerodynamic center determines stability and controllability.

The center of gravity (CG) is the point through which the total weight of the aircraft acts. Its longitudinal position — how far forward or aft it sits relative to the wing — is the single most critical balance parameter in fixed-wing aircraft design. CG position determines static stability, [control surface](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/control-surface.md) effectiveness, [stall](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/stall.md) behavior, and [trim](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/trim.md) drag.

**Static stability** requires the CG to be forward of the wing&rsquo;s aerodynamic center (the neutral point — typically 25–30% of the mean [chord](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/chord.md) for a conventional wing, 40–45% for a delta). When the CG is forward:

- A pitch disturbance increases [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md), generating more lift behind the CG, which creates a nose-down restoring moment.

- The aircraft naturally returns to its trimmed attitude — it is statically stable.

When the CG is aft of the neutral point, the aircraft is statically unstable — any disturbance grows. Some high-performance military UAVs are deliberately designed with aft CG (relaxed static stability) to improve maneuverability, relying on the [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) to stabilize the aircraft faster than the instability develops. This requires high-rate control loops (typically >100 Hz) and is not suitable for simple autopilots.

**CG range** — the distance between the most-forward and most-aft acceptable CG positions — is narrow for tailless aircraft (delta wings, flying wings) and wider for conventional tailed designs. A delta wing with [elevon](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevon.md) control may have a CG range of only 3–5% of mean chord; a conventional layout might tolerate 10–20%. This is why [expendable airframes](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/expendable-airframe-design.md) designed for interchangeable payloads of varying mass face a CG management challenge: the warhead/sensor swap changes the CG position, and the airframe must either accommodate the range or use ballast to compensate.

**Lateral CG offset** (left-right asymmetry) causes a roll tendency that must be trimmed out by steady [aileron](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aileron.md) or [elevon](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevon.md) deflection. For [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) airframes, asymmetric [infill](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/infill-density.md) or an off-center battery placement can introduce lateral CG offset. A 5 mm lateral offset on a 2 kg drone is typically manageable by the autopilot; 20 mm may exceed trim authority.
