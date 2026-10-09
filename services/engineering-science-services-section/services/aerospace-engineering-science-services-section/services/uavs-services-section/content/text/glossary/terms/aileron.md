---
name: "Aileron"
date-created: 2026-03-06
aliases:
  - "Aileron"
  - "aileron"
  - "ailerons"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - ControlSystems
description: "A control surface on the outer trailing edge of each wing, deflected differentially to roll the aircraft."
---

An aileron is a hinged [control surface](./control-surface.md) on the trailing edge of each wing, near the tips. The two ailerons deflect in opposite directions: when the left aileron goes up (reducing [lift](./lift.md) on the left wing) and the right aileron goes down (increasing lift on the right wing), the aircraft rolls to the left.

Ailerons are placed outboard (near the tips) to maximize the rolling moment arm — the force acts at maximum distance from the aircraft's roll axis. This also means ailerons occupy the portion of the wing most affected by tip [stall](./stall.md), which is why wing [washout](./washout.md) is important: it ensures the root stalls before the tips, preserving aileron authority at high [angles of attack](./angle-of-attack.md).

On delta and flying-wing UAVs that lack a separate tail, the aileron function is combined with the [elevator](./elevator.md) function in an [elevon](./elevon.md) — reducing part count and [servo](./servo.md) count at the cost of more complex mixing in the [flight controller](./flight-controller.md).

## Related terms

- [Elevator](./elevator.md) — the pitch control surface
- [Rudder](./rudder.md) — the yaw control surface
- [Elevon](./elevon.md) — the combined pitch/roll surface on tailless aircraft
