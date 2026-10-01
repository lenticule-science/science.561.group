---
name: "Gravity Turn"
type: "term"
date-created: 2026-03-06
---

An ascent trajectory where the rocket gradually pitches from vertical to horizontal, using gravity to turn the flight path while minimizing steering losses.

A gravity turn is a launch trajectory in which the rocket lifts off vertically, pitches slightly from vertical early in flight (the &ldquo;pitch kick&rdquo;), and then allows gravity to gradually bend the flight path toward horizontal. The vehicle&rsquo;s thrust vector remains approximately aligned with its velocity vector throughout — the turn is performed by gravity, not by engine [gimbaling](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/gimbal.md).

## Why it works

Orbital flight requires mostly horizontal velocity (~7.8 km/s at LEO altitude) and relatively little vertical velocity (just enough to reach orbital altitude). The gravity turn efficiently transitions from the vertical launch (needed to clear the pad and traverse the dense lower [atmosphere](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/atmosphere.md)) to the horizontal acceleration needed for orbit.

The key insight: if the thrust vector is always aligned with the velocity vector, no thrust is wasted turning the vehicle. Gravity does the turning for free. Any thrust used to steer (pointing the engine away from the velocity direction) is lost as &ldquo;steering losses&rdquo; — an addition to the [delta-v](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/delta-v.md) budget that buys no useful velocity.

## Trajectory phases

- **Vertical rise** — the first 10–20 seconds. The rocket clears the launch tower and gains altitude to begin the turn.

- **Pitch kick** — a small deliberate pitch maneuver (1–3°) initiated by the guidance system. This starts the gravity turn by giving gravity a horizontal component to work with.

- **Gravity turn proper** — the rocket flies prograde (thrust along velocity vector) while gravity curves the trajectory toward horizontal. This phase lasts most of the ascent.

- **Insertion burn** — near orbital altitude, the trajectory is nearly horizontal. The final burn circularizes the orbit.

## Max Q during the gravity turn

The vehicle passes through maximum [dynamic pressure](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/dynamic-pressure.md) (max Q) during the gravity turn, typically 60–90 seconds after launch. Some vehicles throttle down approaching max Q to limit [structural loads](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/structural-load.md), then throttle up after passing through.
