---
name: "Orbital Mechanics"
date-created: 2026-03-06
aliases:
  - "Orbital Mechanics"
  - "orbital mechanics"
  - "celestial mechanics"
  - "astrodynamics"
keywords:
  - Astronautics
  - FlightMechanics
  - Physics
description: "The physics of motion under gravitational attraction — how spacecraft orbit, transfer between orbits, and reach other bodies."
authors:
  - emsenn
  - claude-opus-4-6
---

Orbital mechanics (also called astrodynamics or celestial mechanics) is the study of the motion of objects under gravitational attraction. It governs every aspect of spaceflight: launch trajectories, orbit insertion, station-keeping, orbital transfers, rendezvous, and interplanetary navigation.

## Kepler's laws

Three empirical laws describe orbital motion:

1. **Orbits are ellipses** with the central body at one focus. Circular orbits are a special case (eccentricity = 0).
2. **Equal areas in equal times** — a line from the body to the orbiting object sweeps out equal areas in equal time intervals. Objects move faster at periapsis (closest approach) and slower at apoapsis (farthest point).
3. **Period² ∝ semi-major axis³** — the orbital period squared is proportional to the cube of the semi-major axis. For Earth orbits: T² = (4π²/GM) × a³.

## Key orbit types

| Orbit | Altitude | Period | Uses |
|---|---|---|---|
| Low Earth Orbit (LEO) | 200–2,000 km | 90–127 min | ISS, Earth observation, Starlink |
| Medium Earth Orbit (MEO) | 2,000–35,786 km | 2–24 h | GPS (20,200 km), Galileo |
| Geostationary (GEO) | 35,786 km | 24 h (sidereal) | Communications, weather |
| Sun-synchronous (SSO) | 600–800 km | ~97 min | Remote sensing (constant sun angle) |
| Molniya | 500–39,900 km | 12 h | High-latitude communications |
| Transfer orbit | Variable | Variable | Moving between orbits |

## The vis-viva equation

The fundamental energy equation of orbital mechanics:

v² = GM × (2/r - 1/a)

where v is orbital velocity, G is the gravitational constant, M is the central body mass, r is the current distance from the center, and a is the semi-major axis. This equation gives the velocity at any point in any orbit and is the basis for computing orbital transfers.

At LEO (r ≈ a ≈ 6,571 km for 200 km altitude): v ≈ 7.8 km/s.
At GEO (r ≈ a ≈ 42,164 km): v ≈ 3.1 km/s.

The difference in velocity between orbits — the [delta-v](../../../../services/rocketry-services-section/content/text/glossary/terms/delta-v.md) — determines how much propellant a transfer requires.

## Hohmann transfer

The most fuel-efficient way to move between two circular orbits is the Hohmann transfer: two engine burns that place the spacecraft on an elliptical transfer orbit tangent to both the initial and final orbits. The total delta-v for a LEO-to-GEO Hohmann transfer is about 3.9 km/s.

## Related terms

- [Delta-v](../../../../services/rocketry-services-section/content/text/glossary/terms/delta-v.md) — the velocity change budget governing mission design
- [Thrust](./thrust.md) — the force that produces velocity changes in orbit
