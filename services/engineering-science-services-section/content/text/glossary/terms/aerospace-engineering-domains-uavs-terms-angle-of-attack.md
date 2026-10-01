---
name: "Angle of Attack"
type: "term"
date-created: 2026-03-06
---

The angle between the wing's chord line and the oncoming airflow, the primary variable controlling lift generation.

Angle of attack (AoA, often denoted α) is the angle between a wing&rsquo;s [chord](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/chord.md) line and the direction of the oncoming airflow (the relative wind). It is the single most important variable controlling [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) production: increasing angle of attack increases the lift coefficient — up to a critical angle beyond which the airflow separates from the upper surface and the wing [stalls](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/stall.md).

For most [airfoils](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md), the lift coefficient increases approximately linearly with angle of attack at a rate of about 0.1 per degree (the &ldquo;lift curve slope&rdquo;), from a small negative angle (the zero-lift angle) up to the stall angle, which is typically 12–18° for conventional airfoils and may exceed 25° for some delta wings.

### Angle of attack is not pitch angle

A common confusion: angle of attack is the angle between the wing and the *airflow*, not the angle between the wing and the horizon. An aircraft climbing steeply at 30° nose-up with a flight path angle of 25° has an AoA of only 5°. An aircraft in a level turn at high bank may have an AoA of 8° with zero pitch attitude. The distinction matters because AoA determines whether the wing stalls, and stall can occur at any aircraft attitude — including nose-down, if the relative wind comes from sufficiently below the wing (as in a steep descending turn).

### AoA in UAV control

In UAV flight, angle of attack is not set directly — the [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) commands pitch attitude, and AoA results from the combination of pitch angle and flight path angle. Most small UAVs do not measure angle of attack directly; the flight controller infers it from accelerometer and airspeed data, or simply limits pitch attitude to remain within safe bounds.

Dedicated AoA sensors (vanes or differential pressure probes) exist but are uncommon on sub-25 kg platforms due to cost, weight, and calibration complexity. Larger military UAVs ([MALE](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/male.md) and [HALE](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/hale.md) platforms) typically include AoA measurement for stall protection and performance optimization.

### Low-Reynolds-number effects on AoA behavior

At the [Reynolds numbers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md) typical of small UAVs (Re 50,000–300,000), the lift-versus-AoA relationship is less predictable than at higher Re. [Laminar separation bubbles](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/low-reynolds-number-aerodynamics.md) can cause abrupt changes in lift and [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) at specific angles, and hysteresis effects mean that the lift at a given AoA may differ depending on whether the angle is increasing or decreasing. These nonlinearities make simple pitch-attitude limiting a less reliable stall-prevention strategy than it is on full-scale aircraft.
