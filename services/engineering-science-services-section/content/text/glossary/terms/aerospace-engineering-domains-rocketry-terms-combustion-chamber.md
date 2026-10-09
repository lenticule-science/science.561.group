---
name: "Combustion Chamber"
date-created: 2026-03-06
---

The enclosed volume where rocket propellants mix and burn — the starting point of the expansion process that produces thrust.

The combustion chamber is the enclosed volume in a rocket engine where fuel and oxidizer mix and react, producing high-temperature, high-pressure combustion gases. These gases then expand through a [nozzle](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/rocket-nozzle-design.md) to produce [thrust](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/thrust.md).

## Chamber conditions

Combustion chamber pressure (p_c) and temperature (T_c) define the starting conditions for nozzle expansion:

Engine
Propellant
p_c (MPa)
T_c (K)
Cycle

Merlin 1D (Falcon 9)
RP-1/LOX
9.7
~3,400
Gas generator

RS-25 (Shuttle/SLS)
LH₂/LOX
20.6
~3,500
Staged combustion

Raptor 2 (Starship)
CH₄/LOX
30+
~3,600
Full-flow staged combustion

RD-180 (Atlas V)
RP-1/LOX
26.7
~3,500
Staged combustion

Solid motor (typical)
APCP
3–10
~3,200
Pressure-fed (grain)

Higher chamber pressure generally improves engine performance ([specific impulse](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/specific-impulse.md)) because it allows greater expansion through the nozzle. But higher pressure demands heavier chamber walls, more powerful turbopumps, and better cooling — engineering trade-offs that have driven decades of engine development.

## Cooling the chamber

Combustion temperatures (3,200–3,600 K) exceed the melting point of all structural metals (nickel superalloys melt at ~1,350°C). The chamber and nozzle throat must be actively cooled:

- **Regenerative cooling** — one propellant (usually fuel) flows through channels in the chamber wall before entering the combustion zone. The propellant absorbs heat, keeping the wall temperature below structural limits. The heated propellant enters combustion slightly preheated, marginally improving efficiency.

- **Film cooling** — a layer of cooler fuel is injected along the chamber wall, creating a protective boundary layer. Less efficient than regenerative cooling (the unburned fuel reduces I_sp) but simpler.

- **Ablative cooling** — the chamber wall is made of material that chars and erodes, absorbing heat as it ablates. Used in solid motors and some low-cost liquid engines. The chamber degrades with each firing.

- **Radiation cooling** — the chamber or nozzle extension glows at high temperature, radiating heat to the surroundings. Only practical for low-heat-flux regions like large nozzle extensions.
