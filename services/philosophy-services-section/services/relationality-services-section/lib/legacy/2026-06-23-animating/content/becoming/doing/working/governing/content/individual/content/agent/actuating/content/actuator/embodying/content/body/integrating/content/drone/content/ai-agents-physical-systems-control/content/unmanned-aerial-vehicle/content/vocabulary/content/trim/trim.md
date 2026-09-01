---
title: "Trim"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Trim"
  - "trim"
  - "trimmed flight"
  - "trim condition"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - ControlSystems
description: "The steady-state control surface deflection required for balanced, hands-off flight at a given speed, weight, and CG position."
---

Trim is the condition of balanced flight in which all forces and moments are in equilibrium — the aircraft maintains steady speed, altitude, and attitude without continuous control input.
Achieving trim requires specific [control surface](./control-surface.md) deflections that vary with airspeed, weight, [center of gravity](./center-of-gravity.md) position, and power setting.

**Trim drag** is the [drag](./drag.md) penalty of maintaining these deflections.
A deflected [elevator](./elevator.md) or [elevon](./elevon.md) produces [lift](./lift.md) to balance the pitching moment, but that lift comes with its own [induced drag](./induced-drag.md).
On tailless aircraft (delta wings, flying wings), trim drag can be significant: a reflexed [airfoil](./airfoil.md) reduces trim drag by building the pitch-up moment into the wing shape itself, but at the cost of reduced maximum lift coefficient.

For UAV autopilots, trim is handled automatically.
The [flight controller](./flight-controller.md) continuously adjusts control surface deflections to maintain the commanded attitude, using the integral term of the PID controller to eliminate steady-state error.
In effect, the autopilot finds and holds the trim condition at every flight condition — something a human pilot does by feel and adjustment.

**Trim sensitivity to CG:** Moving the [center of gravity](./center-of-gravity.md) aft reduces the required elevator/elevon deflection for trim at a given speed (less nose-up correction needed), reducing trim drag.
But it also reduces the stability margin.
UAV designers balance these competing effects to find the CG position that minimizes trim drag while maintaining adequate stability for the [flight controller's](./flight-controller.md) capability.

**Manufacturing asymmetry and trim:** [3D-printed](../concepts/additive-manufacturing-in-uav-airframes.md) or hand-built airframes inevitably have slight geometric asymmetries.
A wing with unequal [span](./span.md) or differing [airfoil](./airfoil.md) accuracy between left and right halves will require steady [aileron](./aileron.md)/[elevon](./elevon.md) deflection to maintain wings-level flight.
The autopilot compensates automatically, but the resulting trim drag reduces range.
This is one reason manufacturing tolerance matters even for expendable platforms — not for aesthetics, but for fuel efficiency.

## Related terms

- [Center of Gravity](./center-of-gravity.md) — the balance parameter that most strongly affects trim
- [Control Surface](./control-surface.md) — the devices deflected to achieve trim
- [Parasitic Drag](./parasitic-drag.md) — the drag category that trim deflections contribute to
