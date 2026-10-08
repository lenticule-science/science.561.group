---
name: "Control Surface"
date-created: 2026-03-06
aliases:
  - "Control Surface"
  - "control surface"
  - "control surfaces"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - ControlSystems
description: "A movable panel on an aircraft's wing or tail that deflects airflow to generate moments for attitude control."
---

A control surface is a hinged or movable panel on a wing, tail, or body that the pilot or [flight controller](./flight-controller.md) deflects to change the aircraft's attitude. Deflecting a control surface alters the local [camber](./camber.md) and [angle of attack](./angle-of-attack.md), changing the [lift](./lift.md) distribution on that part of the airframe. The resulting asymmetric force creates a moment (torque) that rotates the aircraft around one of its three axes.

The conventional fixed-wing control surfaces are:

- **[Aileron](./aileron.md)** — on the outer trailing edge of each wing, deflecting differentially (one up, one down) to roll the aircraft.
- **[Elevator](./elevator.md)** — on the horizontal tail, deflecting symmetrically to pitch the aircraft nose-up or nose-down.
- **[Rudder](./rudder.md)** — on the vertical tail, deflecting to yaw the aircraft left or right.

UAVs frequently use combined control surfaces to reduce part count:

- **[Elevon](./elevon.md)** — combines aileron and elevator function on a tailless or delta wing. Symmetric deflection controls pitch; differential deflection controls roll. Standard on delta-winged expendable drones.
- **Ruddervator (V-tail mixer)** — two surfaces on a V-tail that combine elevator and rudder function.
- **Flaperon** — combines flap (high-lift device) and aileron function. Used on some UAVs to reduce the number of [servos](./servo.md).

Control surface sizing depends on the moment arm (distance from the aircraft's [center of gravity](./center-of-gravity.md)) and the required control authority. Larger surfaces provide stronger moments but add weight and [drag](./drag.md). Undersized surfaces cause sluggish response; oversized surfaces cause twitchy handling and increased [parasitic drag](./parasitic-drag.md).

For multirotors, there are no aerodynamic control surfaces — all attitude control is achieved through differential motor speed via the [ESCs](./esc.md), with the [flight controller](./flight-controller.md) managing the mixing in software.

## Related terms

- [Servo](./servo.md) — the actuator that deflects control surfaces
- [Elevon](./elevon.md) — the combined surface used on tailless UAVs
- [Trim](./trim.md) — the steady-state deflection required for balanced flight
