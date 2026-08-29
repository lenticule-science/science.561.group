---
title: "Servo"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Servo"
  - "servo"
  - "servo motor"
  - "servomechanism"
defines:
  - "servo"
  - "servomechanism"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - ControlSystems
description: "A small actuator that converts electrical signals into precise angular position, used to deflect control surfaces on fixed-wing UAVs."
---

A servo (servomechanism) is a small electric motor with integrated position feedback, gearing, and control electronics.
It receives a commanded position (typically as a PWM signal from the [flight controller](./flight-controller.md)) and rotates its output shaft to match.
In fixed-wing UAVs, servos deflect control surfaces — ailerons, elevators, rudders, elevons — to control the aircraft's attitude and trajectory.

Servo selection for UAV design involves:

- **Torque** — the force the servo can exert, typically 1–20 kg·cm for small UAVs.
  Must exceed the hinge moment of the control surface at maximum airspeed with a margin.
  Under-torqued servos cause control flutter or loss of authority at high speed.
- **Speed** — angular velocity, typically 0.05–0.20 seconds per 60° of rotation.
  Faster servos provide better control response but draw more current.
- **Weight** — from 4 g for micro servos to 80+ g for standard metal-gear servos.
  For a small expendable drone, the total servo weight can be a significant fraction of the airframe mass.
- **Gear material** — plastic gears are lighter and cheaper but strip under shock loads (catapult launch, hard maneuvers).
  Metal gears survive abuse but add weight.
- **Digital vs. analog** — digital servos update their position at higher rates (typically 300 Hz vs. 50 Hz), providing stiffer, more precise hold and faster response.
  Cost premium is modest.

For [expendable airframes](../concepts/expendable-airframe-design.md), servo selection is driven by minimum-acceptable quality.
A single servo per control surface (no redundancy) with the cheapest metal-gear unit that meets the torque and speed requirements.
For reusable tactical and MALE UAVs, redundant servos, waterproofing, and EMI shielding become relevant.

Multirotor UAVs generally do not use servos — they achieve all attitude control through differential motor speed, with the [flight controller](./flight-controller.md) commanding each motor's [ESC](./esc.md) directly.

## Related terms

- [Flight Controller](./flight-controller.md) — the device that sends position commands to servos
- [ESC](./esc.md) — the motor controller equivalent for brushless motors on multirotors
