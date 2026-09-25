---
name: "Launch Vehicle Structures"
date-created: 2026-03-06
type: concept
aliases:
  - "Launch Vehicle Structures"
  - "launch vehicle structures"
keywords:
  - StructuralEngineering
  - RocketEngineering
  - Materials
description: "The engineering of minimum-weight pressure vessels that fly — how launch vehicles achieve propellant mass fractions above 90% while surviving extreme loads."
authors:
  - emsenn
  - claude-opus-4-6
---

A launch vehicle is, structurally, a pressurized container designed to be as light as possible while surviving the most violent loads it will encounter for a few minutes before being discarded. The structural challenge is extreme: an orbital first stage must carry 10–20 times its own dry mass in propellant, survive [structural loads](../../../../../../content/text/glossary/terms/structural-load.md) of 3–5 g during ascent and max Q [dynamic pressure](../../../../../../content/text/glossary/terms/dynamic-pressure.md), withstand engine thrust of meganewtons transmitted through the base structure, and do all of this with a [propellant mass fraction](./propellant-mass-fraction.md) above 90%.

For comparison: a commercial airliner fuselage is about 40% structural mass. A launch vehicle must achieve 5–10% structural mass. This tenfold difference explains why rockets are fragile, expensive, and occasionally fail spectacularly.

## Tank design

The propellant tanks are the dominant structural element — they constitute 60–80% of the vehicle's length and nearly all of its volume. Tank design drives the vehicle's structural architecture.

### Balloon tanks

The simplest approach: thin-walled stainless steel tanks that maintain their shape through internal pressurization, like a balloon. Unpressurized, they collapse under their own weight. The Atlas missile (1957) used balloon tanks with walls as thin as 0.25 mm — thinner than a dime. This minimized structural mass but made the vehicle structurally dependent on maintaining tank pressure at all times, from manufacturing through flight.

Advantage: extremely light structural mass. Disadvantage: must be kept pressurized continuously; a pressurization failure on the pad causes the vehicle to collapse.

### Semi-monocoque tanks

Most modern vehicles (Falcon 9, Ariane 5, Delta IV) use semi-[monocoque](../../../../../uavs-services-section/content/text/glossary/terms/monocoque.md) construction: tank walls formed from aluminum or aluminum-lithium alloy sheet, stiffened with internal stringers and ring frames. The skin carries pressure loads; the stringers and frames carry compressive loads (engine thrust pushing up on a column of propellant).

Common construction methods:
- **Isogrid machining** — a CNC mill removes material from thick plate in a triangular grid pattern, leaving a network of intersecting ribs with thin skin between them. Produces an extremely efficient structure that is strong in compression and bending while minimizing mass. Used on Falcon 9, Saturn V, and many other vehicles.
- **Orthogrid machining** — rectangular grid instead of triangular. Slightly less efficient than isogrid but easier to manufacture.
- **Friction stir welding** — a solid-state joining process that produces stronger, lighter welds than conventional fusion welding. Critical for joining tank barrel sections and dome-to-barrel joints. Used on Falcon 9, SLS, and Delta IV.

### Common bulkhead

When a vehicle uses two different propellants (e.g., RP-1 and LOX), the two tanks can share a common dome wall between them, eliminating the mass of two separate dome closures and the intertank structure. The Space Shuttle External Tank used a common bulkhead between the LOX (forward) and LH₂ (aft) tanks. Centaur (the most efficient upper stage ever built) uses a common bulkhead.

The engineering challenge: one side of the bulkhead is in contact with cryogenic propellant (-183°C for LOX, -253°C for LH₂) and the other side with a different propellant at a different temperature. Thermal insulation within or on the bulkhead must prevent propellant freezing or boiling on the wrong side.

## Load paths

During powered flight, the load path runs from the engines at the base (pushing up) through the thrust structure, up through the tank walls (which are simultaneously pressure vessels and compression columns), through the interstage or common bulkhead, and to the payload at the top.

The critical structural load cases:

| Load case | When | What |
|---|---|---|
| Max Q | 60–90 s after launch | Maximum aerodynamic loads on the forward structure |
| Max acceleration | Stage burnout (near-empty tanks, full thrust) | Maximum compressive loads on the aft structure |
| Gust loads | Any time in atmosphere | Lateral loads from wind shear |
| Engine shutdown transient | MECO, SECO | Dynamic pressure waves in propellant (water hammer) |
| Stage separation | Between stage burns | Mechanical and pyrotechnic loads |
| Ground handling | Pre-launch | Wind loads on the vehicle while vertical on the pad |

## Materials

| Material | Application | Why |
|---|---|---|
| Al 2219 | Tank barrels, domes | Good weldability, moderate strength, heritage |
| Al-Li 2195 | Tank barrels (SLS, Shuttle ET) | 5% lighter and 5% stiffer than 2219 |
| Al 7075 | Non-welded fittings, adapters | High strength, poor weldability |
| 301 stainless steel | Starship tanks, fairings | High strength at cryogenic temps; heavy but cheap |
| Carbon fiber composite | Fairings, interstages, some tanks | Very high specific strength; expensive |
| Inconel 718 | Thrust structures, hot sections | Retains strength at high temperatures |

SpaceX's choice of 301 stainless steel for Starship reversed decades of aerospace trend toward lighter materials. The rationale: stainless is 3× heavier than aluminum per unit volume but actually *stronger* at cryogenic temperatures (unlike aluminum, which becomes brittle). It requires no thermal protection on the windward side during reentry up to ~1,000°C. And it costs \$3/kg versus \$30+/kg for carbon fiber or \$15/kg for aerospace aluminum. At Starship's scale, the lower material cost and simpler manufacturing outweigh the mass penalty.

## Structural efficiency metrics

The structural coefficient (λ) measures how efficiently a stage converts total mass into useful propellant:

λ = m_structure / (m_structure + m_propellant)

| Stage | λ | Interpretation |
|---|---|---|
| Atlas V Centaur | 0.07 | Among the most efficient stages ever built |
| Falcon 9 first stage | 0.06 | Remarkable for a reusable stage |
| Space Shuttle SRBs | 0.12 | Solid motor casings are heavy |
| Saturn V S-IC | 0.07 | 1960s technology, still competitive |
| Theoretical SSTO | <0.05 needed | At the edge of feasibility |

## Related concepts

- [Rocket Propellant Chemistry](./rocket-propellant-chemistry.md) — propellant density and storage requirements drive tank design
- [Rocket Nozzle Design](./rocket-nozzle-design.md) — the nozzle and thrust structure are major structural components

## Related terms

- [Propellant Mass Fraction](./propellant-mass-fraction.md) — the metric structural design tries to maximize
- [Mass Ratio](./mass-ratio.md) — directly determined by structural efficiency
- [Safety Factor](../../../../../uavs-services-section/content/text/glossary/terms/safety-factor.md) — kept low (1.25–1.4) in launch vehicles to minimize structural mass
- [Structural Load](../../../../../../content/text/glossary/terms/structural-load.md) — the loads the structure must survive
