---
name: "Rocket Nozzle Design"
date-created: 2026-03-06
type: concept
aliases:
  - "Rocket Nozzle Design"
  - "rocket nozzle design"
  - "de Laval nozzle"
  - "convergent-divergent nozzle"
keywords:
  - Propulsion
  - Thermodynamics
  - FluidDynamics
description: "How nozzle geometry converts thermal energy from combustion into directed kinetic energy — the convergent-divergent nozzle and its design trade-offs."
authors:
  - emsenn
  - claude-opus-4-6
---

A rocket nozzle converts the thermal energy of hot, high-pressure combustion gases into directed kinetic energy — exhaust velocity. The nozzle is where chemical energy becomes [thrust](../../../../../../content/text/glossary/terms/thrust.md). Its geometry determines how much of the combustion energy is recovered as useful exhaust momentum, making nozzle design one of the most consequential decisions in rocket engine engineering.

## The convergent-divergent (de Laval) nozzle

All chemical rocket engines use a convergent-divergent (CD) nozzle, invented by Gustaf de Laval in the 1880s for steam turbines. The nozzle has three sections:

**Convergent section** — the chamber narrows toward the throat. Subsonic gas accelerates as the cross-section decreases (like squeezing a garden hose). The flow accelerates toward the speed of sound.

**Throat** — the minimum cross-sectional area. The flow reaches exactly [Mach](../../../../../../content/text/glossary/terms/mach-number.md) 1 at the throat (choked flow). The throat area determines the mass flow rate and therefore the thrust. Throat area is the single most important dimensional parameter of a rocket engine.

**Divergent section** — downstream of the throat, the nozzle expands. Counter-intuitively, the supersonic gas continues to accelerate as the area increases (the opposite of subsonic behavior). The gas converts thermal energy (pressure and temperature) to kinetic energy (velocity) through this expansion.

The exit velocity depends on the pressure ratio between the [combustion chamber](./combustion-chamber.md) and the nozzle exit:

v_e = √(2γ/(γ-1) × R × T_c/M_w × (1 - (p_e/p_c)^((γ-1)/γ)))

where γ is the ratio of specific heats, R is the universal gas constant, T_c is chamber temperature, M_w is mean molecular weight of the exhaust, p_e is exit pressure, and p_c is chamber pressure. This is why high chamber pressure and low molecular weight exhaust (hydrogen combustion products) give the highest [specific impulse](./specific-impulse.md).

## Nozzle expansion ratio

The expansion ratio (ε) is the ratio of exit area to throat area: ε = A_e / A_t. Higher expansion ratios extract more energy from the exhaust but produce larger, heavier nozzles.

| Engine | Expansion ratio | Environment | Notes |
|---|---|---|---|
| Merlin 1D (sea level) | 16:1 | Sea level | Compact; avoids flow separation |
| Merlin Vacuum | 165:1 | Vacuum | Very large bell; 3.4 m exit diameter |
| RS-25 (SSME) | 77:1 | Sea level to vacuum | Compromise for full-flight-profile operation |
| RL-10B-2 | 285:1 | Vacuum only | Carbon-carbon extendable nozzle |

### Over-expansion and under-expansion

**Optimally expanded** — exit pressure equals ambient pressure. All exhaust energy is converted to axial momentum. Maximum thrust for the given altitude.

**Under-expanded** (p_e > p_ambient) — the exhaust is still above ambient pressure at the exit. Additional expansion occurs outside the nozzle as a plume, but this expansion is not directed and does not contribute efficiently to thrust. Vacuum nozzles operating at sea level are severely under-expanded — but this is acceptable because the low ambient pressure means loss is small.

**Over-expanded** (p_e < p_ambient) — the exhaust drops below ambient pressure inside the nozzle. Ambient air intrudes into the nozzle, creating [shock waves](../../../../../../content/text/glossary/terms/shock-wave.md) and flow separation. Severe over-expansion causes flow instability, side loads on the nozzle (which can damage or destroy it), and reduced thrust. This is why sea-level engines have lower expansion ratios — they must avoid over-expansion at launch when ambient pressure is highest.

### The altitude compensation problem

No fixed-geometry nozzle is optimal at all altitudes. A sea-level nozzle is under-expanded in vacuum; a vacuum nozzle would be destroyed by over-expansion at sea level. Solutions:

- **Dual-bell nozzle** — two contours in one nozzle; flow separates at the inflection point at low altitude, fills the full nozzle at high altitude.
- **Aerospike nozzle** — an inside-out nozzle where exhaust expands against a central spike. The ambient pressure automatically compensates the expansion. Tested but never flown operationally.
- **Extendable nozzle** — a nozzle extension deployed after reaching vacuum. Used on RL-10B-2.
- **Compromise** — most engines simply accept the penalty. The RS-25 uses a 77:1 ratio that is slightly over-expanded at sea level and under-expanded in vacuum, performing acceptably but not optimally across the flight profile.

## Nozzle cooling

The throat region experiences the highest heat flux of any part of the engine — combustion gases at 3,000–3,600 K flow through the minimum area at Mach 1, with extremely high convective heat transfer coefficients. Throat cooling is almost always regenerative: propellant flows through channels machined or brazed into the nozzle wall. The Space Shuttle SSME throat region handled heat fluxes of ~160 MW/m² — comparable to the surface of the Sun.

## Nozzle materials

The nozzle throat must withstand extreme temperatures and erosion. Common materials:

- **Nickel superalloys** (Inconel, Haynes) — regeneratively cooled liquid engine throats
- **Niobium alloys** (C-103) — radiation-cooled nozzle extensions (Apollo SPS, many spacecraft engines)
- **Carbon-carbon composite** — solid motor throats and vacuum nozzle extensions (erosion-resistant at extreme temperatures)
- **Ablative composites** — solid motor nozzles where the throat erodes progressively during the burn (acceptable for single-use motors)

## Related concepts

- [Rocket Propellant Chemistry](./rocket-propellant-chemistry.md) — propellant properties determine the gas conditions the nozzle must expand
- [Launch Vehicle Structures](./launch-vehicle-structures.md) — the nozzle is a major structural and thermal component

## Related terms

- [Specific Impulse](./specific-impulse.md) — nozzle efficiency directly affects I_sp
- [Combustion Chamber](./combustion-chamber.md) — the upstream conditions the nozzle receives
- [Shock Wave](../../../../../../content/text/glossary/terms/shock-wave.md) — forms inside over-expanded nozzles
- [Gimbal](./gimbal.md) — the nozzle is the component being gimbaled
