---
name: "Gravity Turn"
date-created: 2026-03-06T00:00:00
aliases:
  - "Gravity Turn"
  - "gravity turn"
  - "gravity turn trajectory"
keywords:
  - FlightMechanics
  - OrbitalMechanics
  - Trajectories
description: "An ascent trajectory where the rocket gradually pitches from vertical to horizontal, using gravity to turn the flight path while minimizing steering losses."
authors:
  - emsenn
  - claude-opus-4-6
---

A gravity turn is a launch trajectory in which the rocket lifts off vertically, pitches slightly from vertical early in flight (the "pitch kick"), and then allows gravity to gradually bend the flight path toward horizontal. The vehicle's thrust vector remains approximately aligned with its velocity vector throughout — the turn is performed by gravity, not by engine [gimbaling](./gimbal.md).

## Why it works

Orbital flight requires mostly horizontal velocity (~7.8 km/s at LEO altitude) and relatively little vertical velocity (just enough to reach orbital altitude). The gravity turn efficiently transitions from the vertical launch (needed to clear the pad and traverse the dense lower [atmosphere](../../terms/atmosphere.md)) to the horizontal acceleration needed for orbit.

The key insight: if the thrust vector is always aligned with the velocity vector, no thrust is wasted turning the vehicle. Gravity does the turning for free. Any thrust used to steer (pointing the engine away from the velocity direction) is lost as "steering losses" — an addition to the [delta-v](./delta-v.md) budget that buys no useful velocity.

## Trajectory phases

1. **Vertical rise** — the first 10–20 seconds. The rocket clears the launch tower and gains altitude to begin the turn.
2. **Pitch kick** — a small deliberate pitch maneuver (1–3°) initiated by the guidance system. This starts the gravity turn by giving gravity a horizontal component to work with.
3. **Gravity turn proper** — the rocket flies prograde (thrust along velocity vector) while gravity curves the trajectory toward horizontal. This phase lasts most of the ascent.
4. **Insertion burn** — near orbital altitude, the trajectory is nearly horizontal. The final burn circularizes the orbit.

## Max Q during the gravity turn

The vehicle passes through maximum [dynamic pressure](../../terms/dynamic-pressure.md) (max Q) during the gravity turn, typically 60–90 seconds after launch. Some vehicles throttle down approaching max Q to limit [structural loads](../../terms/structural-load.md), then throttle up after passing through.

## Related terms

- [Delta-v](./delta-v.md) — gravity losses during the turn add 1,000–1,500 m/s to the required delta-v
- [Gimbal](./gimbal.md) — provides the initial pitch kick and corrects deviations from the planned trajectory
- [Dynamic Pressure](../../terms/dynamic-pressure.md) — peaks during the gravity turn
