---
title: "Elevator"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Elevator"
  - "elevator"
  - "elevators"
defines:
  - "elevator"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - ControlSystems
description: "A control surface on the horizontal tail, deflected to pitch the aircraft nose-up or nose-down."
---

An elevator is a hinged [control surface](./control-surface.md) on the horizontal stabilizer (tail).
Deflecting the elevator trailing-edge-up produces a downward force on the tail, pitching the aircraft nose-up and increasing [angle of attack](./angle-of-attack.md).
Deflecting trailing-edge-down does the opposite.

The elevator's effectiveness depends on the **tail volume coefficient** — the product of tail area and moment arm (distance from wing to tail) divided by wing area and mean [chord](./chord.md).
A longer fuselage with a smaller tail produces the same pitching authority as a shorter fuselage with a larger tail, but with different dynamic characteristics: the longer-arm configuration responds more sluggishly but damps pitch oscillations better, while the shorter-arm version is more agile but less stable.

### Trim and elevator deflection

In steady flight, the elevator maintains [trim](./trim.md) — the condition where pitching moments sum to zero.
The [center of gravity](./center-of-gravity.md) position determines how much elevator deflection is needed for trim: a forward CG requires more up-elevator (trailing-edge-up) to balance the nose-heavy moment, which generates a downward force on the tail.
This "trim drag" — the [drag](./drag.md) from the tail producing a net downforce instead of zero or positive lift — is one reason that CG position matters for cruise efficiency.

On conventional fixed-wing UAVs, the elevator is driven by a single [servo](./servo.md).
On delta wings and flying wings that lack a horizontal tail, the elevator function is handled by [elevons](./elevon.md) on the trailing edge of the wing.

Some UAVs use a **full-flying tail** (stabilator) — the entire horizontal surface rotates rather than having a separate hinged elevator.
This provides more powerful pitch control per unit area but requires more precise [center of gravity](./center-of-gravity.md) management because the surface is more sensitive to deflection.

## Related terms

- [Aileron](./aileron.md) — the roll control surface
- [Rudder](./rudder.md) — the yaw control surface
- [Elevon](./elevon.md) — the combined pitch/roll surface on tailless aircraft
- [Trim](./trim.md) — the equilibrium condition the elevator maintains
- [Center of Gravity](./center-of-gravity.md) — the balance point that determines elevator trim requirement
