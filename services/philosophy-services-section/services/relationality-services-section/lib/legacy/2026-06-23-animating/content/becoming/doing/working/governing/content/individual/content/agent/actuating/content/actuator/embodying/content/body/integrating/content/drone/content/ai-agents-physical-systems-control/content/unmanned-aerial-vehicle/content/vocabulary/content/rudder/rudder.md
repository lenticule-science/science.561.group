---
title: "Rudder"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Rudder"
  - "rudder"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - ControlSystems
description: "A control surface on the vertical tail, deflected to yaw the aircraft left or right."
---

A rudder is a hinged [control surface](./control-surface.md) on the vertical stabilizer (fin).
Deflecting the rudder generates a side force on the tail, yawing the aircraft's nose left or right.
The rudder is primarily used for coordinating turns (preventing sideslip), correcting for crosswinds, and maintaining directional control during asymmetric thrust conditions (one engine failed on a twin-engine platform).

### Why yaw matters

In a coordinated turn, the aircraft's nose points along its flight path — the airflow hits both wings symmetrically, and [drag](./drag.md) is minimized.
Without yaw control, banking to turn creates adverse yaw: the outer wing produces more [induced drag](./induced-drag.md) than the inner wing, pulling the nose away from the turn.
The result is sideslip — airflow hitting the aircraft at an angle, increasing total drag and making the turn inefficient.
The rudder corrects this by deflecting to yaw the nose into the turn.

For crosswind landings (relevant for conventional-takeoff UAVs), the rudder maintains the fuselage aligned with the runway while the wings are banked into the wind.
Without rudder authority, crosswind capability is limited to the aircraft's natural weathervane tendency from the vertical fin alone.

### UAV configurations without rudders

Many small UAVs omit the rudder entirely.
Delta-winged designs rely on differential [elevon](./elevon.md) deflection (split elevons) or drag rudders for yaw control.
Flying wings use split trailing-edge surfaces or spoilerons.
Some conventional fixed-wing UAVs use only [ailerons](./aileron.md) and [elevator](./elevator.md), accepting that uncoordinated turns produce slightly more drag but eliminating one [servo](./servo.md) and the vertical tail's structural weight.
On autopilot-controlled platforms, the [flight controller](./flight-controller.md) can compensate for the absence of a rudder by using bank angle and differential thrust (on multi-engine platforms) for yaw management.

Where a rudder is present on small UAVs, it is typically small — sufficient for yaw damping and crosswind correction but not intended for aggressive yaw maneuvers.
The vertical fin itself provides passive directional [stability](../../terms/stability.md) (weathervane effect); the rudder adds active control authority on top of this.

## Related terms

- [Aileron](./aileron.md) — the roll control surface, which interacts with rudder through adverse yaw
- [Elevator](./elevator.md) — the pitch control surface
- [Elevon](./elevon.md) — the combined pitch/roll surface that replaces both elevator and aileron on tailless designs
- [Control Surface](./control-surface.md) — the general category
- [Stability](../../terms/stability.md) — the tendency to return to equilibrium that the vertical fin provides passively
