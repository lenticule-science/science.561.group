---
name: "Ullage"
date-created: 2026-03-06
aliases:
  - "Ullage"
  - "ullage"
  - "ullage motor"
  - "ullage pressure"
keywords:
  - RocketEngineering
  - FluidManagement
  - VehicleDesign
description: "The gas-filled space above liquid propellant in a tank — and the problem of ensuring liquid (not gas) reaches the engine inlets in microgravity."
authors:
  - emsenn
  - claude-opus-4-6
---

Ullage is the volume of gas above the liquid propellant in a rocket tank. The term originates from winemaking, where it describes the air gap in a barrel. In rocketry, ullage has two critical functions: maintaining structural pressure in the tank (preventing tank collapse under aerodynamic and acceleration loads) and — more subtly — ensuring that liquid propellant, not gas, flows to the engine inlets.

## The ullage problem

On the ground and during powered ascent, gravity and acceleration settle propellant at the bottom of the tank, covering the feed lines. But during coast phases (between stage firings, or during orbital maneuvers), the vehicle is in free-fall. Without gravity, surface tension dominates and propellant floats as a blob — it may settle against any wall, exposing the outlet to gas. If gas enters the turbopump, the engine can suffer cavitation, combustion instability, or explosive failure.

## Solutions

**Ullage motors** — small solid or liquid rockets that fire briefly before a main engine restart, applying a small forward acceleration that settles propellant over the outlets. The Saturn V's S-IVB third stage used two small solid ullage motors before each J-2 engine ignition.

**Propellant management devices (PMDs)** — passive structures inside the tank (screens, vanes, traps, sponges) that use surface tension to keep liquid positioned over the outlets regardless of orientation. Used in spacecraft propulsion where ullage motors would be impractical for hundreds of small burns.

**Pressurization systems** — helium (or autogenous pressurant — heated propellant vapor) maintains tank pressure above the vapor pressure of the propellant, preventing boiling and cavitation. Falcon 9 uses helium stored in composite overwrapped pressure vessels (COPVs) immersed in the LOX tank.

**Bladder tanks** — a flexible bladder separates liquid from pressurant gas, ensuring liquid is always available at the outlet regardless of orientation. Common in spacecraft and upper stages using storable propellants.

## Related terms

- [Combustion Chamber](./combustion-chamber.md) — where the propellant must arrive as liquid
- [Propellant Mass Fraction](./propellant-mass-fraction.md) — ullage volume reduces usable propellant capacity
