---
title: "Propeller Pitch"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Propeller Pitch"
  - "propeller pitch"
  - "prop pitch"
  - "blade pitch"
defines:
  - "propeller pitch"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Propulsion
  - Aerodynamics
description: "The theoretical distance a propeller would advance through the air in one revolution if there were no slip, expressed in inches or millimeters."
---

Propeller pitch is the helical angle of the propeller blade, expressed as the theoretical forward distance per revolution.
A "10×6" propeller (common designation) has a 10-inch diameter and a 6-inch pitch — meaning in one revolution it would theoretically advance 6 inches through the air.
In practice, slip (the difference between geometric pitch and actual advance) reduces this by 10–30%.

Pitch is the primary propeller parameter that trades static thrust against cruise efficiency:

- **Low pitch** (large pitch/diameter ratio < 0.5): High static thrust, good for hovering multirotors and short-takeoff fixed wings.
  The blade acts like a low-gear transmission — lots of force, less speed.
- **High pitch** (pitch/diameter ratio > 0.8): Less static thrust but higher speed for a given RPM.
  Suited for cruise-optimized fixed-wing UAVs that need efficient thrust at 20–50 m/s.

Pitch interacts with motor characteristics (KV rating, or RPM per volt) and battery voltage to determine the operating point: - A high-KV motor (~2200 KV, as in a racing quadcopter) spins fast and pairs with low-pitch, small-diameter props. - A low-KV motor (~400 KV, as in a heavy-lift or endurance platform) spins slowly and pairs with large-diameter, moderate-pitch props.

**Variable-pitch propellers** can adjust blade angle in flight, optimizing for different flight phases (takeoff, climb, cruise).
They are common on large UAVs (Predator, Reaper) and manned aircraft but rare on small UAVs due to the mechanical complexity, weight, and cost of the pitch-change mechanism.

**Folding propellers** collapse flat when not powered, reducing [parasitic drag](./parasitic-drag.md) for glide or storage.
Common on motor-glider UAVs and some tube-launched designs.

For [expendable fixed-wing UAVs](../concepts/expendable-airframe-design.md) with pusher propellers, a fixed-pitch prop sized for cruise speed is typical — simplest, cheapest, and adequate for a one-way mission with no need to optimize for multiple flight phases.

## Related terms

- [Thrust-to-Weight Ratio](./thrust-to-weight-ratio.md) — the performance metric that propeller pitch helps determine
- [ESC](./esc.md) — the motor controller that sets the RPM at which the propeller operates
