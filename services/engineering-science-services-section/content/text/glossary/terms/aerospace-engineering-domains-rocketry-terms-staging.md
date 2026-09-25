---
title: "Staging"
type: "term"
date-created: 2026-03-06
---

The practice of dividing a rocket into sections that are discarded after their propellant is spent, improving the mass ratio of subsequent stages.

Staging is the division of a rocket into two or more sections (stages), each with its own propellant tanks and engines, where each stage is jettisoned after its propellant is consumed. By discarding the dead mass of empty tanks and engines, the remaining vehicle starts each subsequent burn with a better [mass ratio](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/mass-ratio.md) than a single stage could achieve.

## Why staging is necessary

The [rocket equation](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/rocket-equation.md) shows that the mass ratio required to reach orbit is ~15–20 for kerosene/LOX propulsion. This means the rocket must be 93–95% propellant by mass. But real tanks, engines, plumbing, and avionics have mass. The structural fraction (structure mass / total stage mass) is typically 5–10% for liquid stages and 8–12% for solid stages. A single stage with 7% structural fraction and kerosene/LOX propulsion can deliver about 8.5 km/s of [delta-v](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/delta-v.md) — not quite enough for orbit (9.4 km/s with losses).

With two stages, each stage only needs to deliver about half the total delta-v. A mass ratio of 4–5 per stage (75–80% propellant each) is readily achievable, and the total delta-v is the sum of the stages.

## Staging types

**Serial (tandem) staging** — stages stacked vertically, firing one at a time from bottom to top. The first stage fires at launch; when spent, it separates, and the second stage ignites. Saturn V, Falcon 9, Soyuz upper stages use serial staging.

**Parallel staging** — boosters mounted alongside a core stage, all firing at liftoff. The boosters separate first (they burn faster or carry less propellant), leaving the core to continue. Space Shuttle (SRBs + orbiter), Delta IV Heavy, and Ariane 5 use parallel staging. Parallel staging allows higher initial [thrust-to-weight ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/thrust-to-weight-ratio.md) without penalizing the upper stages.

**Stage-and-a-half** — engines from a sustainer stage fire at liftoff alongside booster engines; the booster engines (but not their propellant tanks) are jettisoned. Atlas (original) used this approach. It saves the weight of separate tankage for the booster phase.

## Diminishing returns

Adding stages has diminishing returns and increasing complexity:

Stages
Payload to LEO (relative)
Separation events
Reliability impact

1 (SSTO)
Baseline (near zero for chemical)
0
Highest per-stage

2
~3–4% of liftoff mass
1
Stage separation is a failure mode

3
~4–5% of liftoff mass
2
More failure modes

4+
Marginal gain
3+
Rapidly diminishing returns

Most modern orbital rockets use 2 stages (Falcon 9, Electron) or 2 stages + solid boosters (Atlas V, Ariane 5). Three-stage vehicles (Saturn V, Proton) are rarer because the payload gains from a third stage rarely justify the added complexity.

## Reusable staging

SpaceX&rsquo;s Falcon 9 first stage returns to Earth and lands propulsively, enabling reuse. This changes the staging economics: instead of discarding a stage worth $20–30M, it is recovered and reflown. The propellant cost for a Falcon 9 flight is roughly $200,000; the hardware cost is ~$60M new. Reuse amortizes the hardware cost over many flights, fundamentally changing launch economics even though the propulsive cost of landing (reserving ~15% of first-stage propellant for boostback and landing burns) reduces payload capacity by 30–40%.
