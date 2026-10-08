---
title: "Propulsion Principles"
type: "concept"
date-created: 2026-03-06
description: The physics of aerospace propulsion — how momentum exchange produces thrust, from propellers through ion engines.
---

The physics of aerospace propulsion — how momentum exchange produces thrust, from propellers through ion engines.

Table of contents

- [The fundamental trade-off](#the-fundamental-trade-off)

- [Propulsion types by working fluid](#propulsion-types-by-working-fluid)

[Air-breathing: using atmospheric air as working fluid](#air-breathing-using-atmospheric-air-as-working-fluid)

- [Self-contained: carrying both fuel and oxidizer](#self-contained-carrying-both-fuel-and-oxidizer)

- [Matching propulsion to mission](#matching-propulsion-to-mission)

All aerospace propulsion works by the same principle: accelerate mass in one direction to produce [thrust](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/thrust.md) in the opposite direction. The differences lie in what mass is accelerated, how much of it there is, and how fast it is thrown. These choices define the propulsion system&rsquo;s performance envelope and determine which flight regimes and missions it can serve.

## The fundamental trade-off

Propulsive efficiency depends on the relationship between exhaust velocity and flight velocity. The thrust power delivered to the vehicle is:

P_thrust = F × v_flight

The total power in the exhaust is:

P_exhaust = ½ × ṁ × v_exhaust²

Propulsive efficiency (η_p) is maximized when the exhaust velocity closely matches the flight velocity:

η_p = 2 / (1 + v_exhaust/v_flight)

This creates the central trade-off in propulsion design:

- **Low exhaust velocity, high mass flow** → high propulsive efficiency at low speeds (propellers)

- **High exhaust velocity, low mass flow** → high propulsive efficiency at high speeds (jets, rockets)

- **Very high exhaust velocity, tiny mass flow** → efficient only in space (ion engines)

## Propulsion types by working fluid

### Air-breathing: using atmospheric air as working fluid

**Propeller** — a rotating airfoil that accelerates a large mass of air by a small velocity increment. Most efficient below M ≈ 0.6. Electric motors ([ESC](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/esc.md)-controlled BLDC) or piston engines drive the propeller. Dominant propulsion for UAVs, general aviation, and turboprops.

**Turbojet** — compresses incoming air, mixes it with fuel, burns the mixture, and expels the hot exhaust at high velocity. Efficient at M 0.8–2.5. The thermodynamic cycle (Brayton cycle) converts heat to kinetic energy. Thrust comes entirely from the high-velocity exhaust.

**Turbofan** — a turbojet with a large fan driven by the core turbine. The fan accelerates a bypass airstream at lower velocity. The bypass ratio (bypass air / core air) determines the character: low bypass (2–3:1) for fighters, high bypass (8–12:1) for commercial airliners. High bypass turbofans are the most fuel-efficient engines at M 0.78–0.85.

**Ramjet** — uses vehicle speed to compress incoming air; no rotating machinery. Works only above M ≈ 2, where ram compression is sufficient. Simple and lightweight but cannot produce static thrust — needs an external boost to operating speed.

**Scramjet** (supersonic combustion ramjet) — combustion occurs at supersonic velocities within the engine. Operates above M ≈ 5. No operational vehicle has used scramjet propulsion for sustained flight; the X-43A achieved M 9.6 for ~10 seconds in 2004.

### Self-contained: carrying both fuel and oxidizer

**Chemical rocket** — burns fuel and oxidizer to produce high-temperature, high-pressure exhaust expanded through a nozzle. Works in vacuum. Exhaust velocities of 2,500–4,500 m/s depending on propellant combination. The only propulsion type that can reach orbit.

**Electric propulsion** — uses electrical energy to accelerate propellant (ions, plasma, or neutral gas) to very high exhaust velocities (15,000–100,000 m/s). Very low thrust but extremely high efficiency (high [specific impulse](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/specific-impulse.md)). Used for spacecraft station-keeping and some interplanetary missions (Dawn, Starlink).

**Cold gas** — stores pressurized gas and releases it through a nozzle. Simple, low performance (exhaust velocity ~500–1,500 m/s). Used for attitude control in spacecraft and some small rockets.

## Matching propulsion to mission

Mission
Speed regime
Best propulsion
Why

Small UAV survey
M < 0.1
Electric propeller
Quiet, simple, efficient at low speed

Commercial airline
M 0.78–0.85
High-bypass turbofan
Best fuel efficiency at cruise

Air superiority fighter
M 0–2+
Low-bypass turbofan with afterburner
Wide speed range, high T/W

Cruise missile
M 0.7–3
Turbojet or ramjet
Range and speed balance

Hypersonic vehicle
M 5+
Scramjet + rocket
Only options at high Mach

Launch to orbit
M 0–25
Chemical rocket
Must work in vacuum, high thrust

In-space maneuvering
Orbital
Electric or chemical
Depends on thrust vs. efficiency priority
