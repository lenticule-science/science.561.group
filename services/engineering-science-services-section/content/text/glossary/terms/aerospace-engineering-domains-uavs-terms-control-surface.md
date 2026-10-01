---
name: "Control Surface"
date-created: 2026-03-06
---

A movable panel on an aircraft's wing or tail that deflects airflow to generate moments for attitude control.

A control surface is a hinged or movable panel on a wing, tail, or body that the pilot or [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) deflects to change the aircraft&rsquo;s attitude. Deflecting a control surface alters the local [camber](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/camber.md) and [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md), changing the [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) distribution on that part of the airframe. The resulting asymmetric force creates a moment (torque) that rotates the aircraft around one of its three axes.

The conventional fixed-wing control surfaces are:

- **[Aileron](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aileron.md)** — on the outer trailing edge of each wing, deflecting differentially (one up, one down) to roll the aircraft.

- **[Elevator](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevator.md)** — on the horizontal tail, deflecting symmetrically to pitch the aircraft nose-up or nose-down.

- **[Rudder](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/rudder.md)** — on the vertical tail, deflecting to yaw the aircraft left or right.

UAVs frequently use combined control surfaces to reduce part count:

- **[Elevon](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevon.md)** — combines aileron and elevator function on a tailless or delta wing. Symmetric deflection controls pitch; differential deflection controls roll. Standard on delta-winged expendable drones.

- **Ruddervator (V-tail mixer)** — two surfaces on a V-tail that combine elevator and rudder function.

- **Flaperon** — combines flap (high-lift device) and aileron function. Used on some UAVs to reduce the number of [servos](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/servo.md).

Control surface sizing depends on the moment arm (distance from the aircraft&rsquo;s [center of gravity](../../documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/aerospace-engineering/archive/center-of-gravity.md)) and the required control authority. Larger surfaces provide stronger moments but add weight and [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md). Undersized surfaces cause sluggish response; oversized surfaces cause twitchy handling and increased [parasitic drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/parasitic-drag.md).

For multirotors, there are no aerodynamic control surfaces — all attitude control is achieved through differential motor speed via the [ESCs](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/esc.md), with the [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) managing the mixing in software.
