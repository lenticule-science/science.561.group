---
name: "Specific Impulse"
date-created: 2026-03-06
aliases:
  - "Specific Impulse"
  - "specific impulse"
  - "Isp"
  - "I_sp"
keywords:
  - Propulsion
  - Thermodynamics
  - RocketEngineering
description: "The thrust produced per unit weight flow rate of propellant — the universal efficiency metric for rocket engines, measured in seconds."
authors:
  - emsenn
  - claude-opus-4-6
---

Specific impulse (I_sp) is the [thrust](../../../../../../content/text/glossary/terms/thrust.md) produced per unit weight flow rate of propellant:

I_sp = F / (ṁ × g₀)

where F is thrust, ṁ is propellant mass flow rate, and g₀ is standard gravitational acceleration (9.81 m/s²). The units are seconds — a dimensionally peculiar but practically convenient choice that makes I_sp independent of the unit system.

Physically, I_sp is the time a unit weight of propellant can produce a unit of thrust. Higher I_sp means more thrust per kilogram of propellant, which means less propellant for a given [delta-v](./delta-v.md) — directly translating to smaller vehicles or larger payloads.

Equivalently, I_sp = v_e / g₀, where v_e is the effective exhaust velocity. An engine with I_sp = 300 s has an effective exhaust velocity of 2,943 m/s.

## Typical values

| Propulsion type | Propellant | I_sp (s) | Notes |
|---|---|---|---|
| Cold gas (N₂) | Nitrogen | 65–75 | Attitude control thrusters |
| Solid motor | APCP | 240–270 | Simple, storable; boosters and tactical missiles |
| Kerosene/LOX | RP-1/O₂ | 270–310 (SL) / 320–350 (vac) | Falcon 9 first stage (Merlin 1D: 282/311 s) |
| Hydrazine/NTO | N₂H₄/N₂O₄ | 280–320 | Storable; widely used in spacecraft and upper stages |
| Hydrogen/LOX | H₂/O₂ | 380–410 (SL) / 440–460 (vac) | Space Shuttle SSME (366/452 s); highest chemical I_sp |
| Ion (xenon) | Xe | 1,500–5,000 | Millinewton thrust; Deep Space 1, Dawn, Starlink |
| Hall thruster | Xe or Kr | 1,200–3,000 | Higher thrust than ion, lower I_sp |

### The I_sp–thrust trade-off

Chemical rockets have low I_sp (250–460 s) but can produce enormous thrust (meganewtons). Electric propulsion has high I_sp (1,500–5,000 s) but tiny thrust (millinewtons to newtons). This is not a coincidence — it reflects the energy density of chemical bonds versus the power limitations of solar panels and nuclear reactors in space.

For launch from a planetary surface, thrust must exceed weight, so only chemical rockets (and potentially nuclear thermal rockets) are viable. For in-space maneuvers where acceleration can be slow, electric propulsion's high I_sp makes it far more mass-efficient.

### Sea level vs. vacuum I_sp

A rocket engine's I_sp is lower at sea level than in vacuum because atmospheric pressure acts against the exhaust, reducing the effective thrust. The difference is typically 10–20%. Engine [nozzles](./rocket-nozzle-design.md) are designed to expand exhaust to a specific pressure — sea-level nozzles are shorter (less expansion), vacuum nozzles are larger (more expansion, lower exit pressure).

## Related terms

- [Rocket Equation](./rocket-equation.md) — I_sp (as exhaust velocity) is a key input to the equation
- [Delta-v](./delta-v.md) — higher I_sp means less propellant for a given delta-v
- [Thrust](../../../../../../content/text/glossary/terms/thrust.md) — the force that I_sp normalizes by propellant consumption
