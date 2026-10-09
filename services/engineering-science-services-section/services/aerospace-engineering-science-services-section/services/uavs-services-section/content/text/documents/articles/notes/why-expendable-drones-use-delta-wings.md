---
title: "Why Expendable Drones Use Delta Wings"
date-created: 2026-03-06T00:00:00
type: curriculum-lesson
aliases:
  - "Why Expendable Drones Use Delta Wings"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - aerodynamics
  - structural-engineering
  - additive-manufacturing
description: "A lesson tracing the engineering logic that connects cost constraints to delta wing selection in expendable UAVs like the Shahed-136 and LUCAS."
teaches:
  - "wing planform selection under cost constraints"
  - "delta wing structural advantages"
  - "manufacturing tolerance and aerodynamic robustness"
requires:
  - "aspect ratio"
  - "wing loading"
  - "induced drag"
  - "spar"
  - "infill density"
---

This lesson traces the engineering reasoning that leads expendable strike drone designers — from the Iranian Shahed-136 program to the American [LUCAS](../../../glossary/terms/lucas.md) — to converge on the delta [wing planform](../../../glossary/terms/wing-planform-selection-for-uavs.md). It assumes familiarity with basic aerodynamic terms ([aspect ratio](../../../glossary/terms/aspect-ratio.md), [wing loading](../../../glossary/terms/wing-loading.md), [induced drag](../../../glossary/terms/induced-drag.md), [lift-to-drag ratio](../../../glossary/terms/lift-to-drag-ratio.md)) and structural concepts ([spar](../../../glossary/terms/spar.md), bending loads, [fatigue](../../../glossary/terms/fatigue.md)).

## The constraint that matters most

Begin with a question: if you are designing a fixed-wing aircraft that must cruise 500–2,000 km, deliver a 30–50 kg payload, and cost under \$50,000, which wing do you choose?

A high-[aspect-ratio](../../../glossary/terms/aspect-ratio.md) conventional wing (AR 10–15, like an MQ-9 Reaper) is aerodynamically superior. It minimizes [induced drag](../../../glossary/terms/induced-drag.md), maximizes [lift-to-drag ratio](../../../glossary/terms/lift-to-drag-ratio.md), and extends range. But it is structurally demanding: the long [spar](../../../glossary/terms/spar.md) must resist bending loads across a span of several meters, requiring careful material selection, precise manufacturing, and structural analysis at multiple load cases. The wing alone can cost more than the entire expendable drone should.

A delta planform (AR 1.5–2.5) gives up roughly 40% of that aerodynamic efficiency. But it gains:

1. **A short, simple spar.** Bending loads are distributed over a deep root chord rather than concentrated at a narrow wing root. In many expendable designs, the wing skin itself — if sufficiently stiff — carries the loads without a discrete spar at all.

2. **No tail.** A conventional aircraft uses a horizontal stabilizer for pitch control. The delta integrates lifting and stabilizing functions in one surface, eliminating the tail boom, tail surfaces, and their actuators. For a 3-meter-class drone, this cuts part count by 30–40%.

3. **Wide manufacturing tolerance.** A slight asymmetry in sweep or chord produces a mild roll tendency that the autopilot trims out. The same asymmetry on a high-AR wing can produce [flutter](../../../glossary/terms/flutter.md) or structural failure.

4. **Flat-panel construction.** Delta wings can be built from flat or single-curvature sheets — hot-wire-cut foam, flat [composite](../../../glossary/terms/composite.md) layups, [3D-printed slabs](../../../glossary/terms/additive-manufacturing-in-uav-airframes.md) — without compound-curve molds.

## The aerodynamic cost, quantified

A delta with AR 2.0 and span of 2.4 m produces roughly the same lift as a conventional wing with AR 8.0 and span of 4.8 m at the same total area. But the delta's induced drag coefficient is approximately four times higher at the same lift coefficient, because induced drag scales inversely with aspect ratio:

C_Di = C_L² / (π × AR × e)

where e is the Oswald efficiency factor (typically 0.7–0.85 for a delta, 0.8–0.95 for a well-designed conventional wing). At a cruise lift coefficient of 0.4:

- Delta (AR 2.0, e = 0.75): C_Di ≈ 0.034
- Conventional (AR 8.0, e = 0.85): C_Di ≈ 0.0075

The delta produces 4.5× more induced drag. In practical terms, this means the delta-winged drone burns roughly 30–50% more fuel for the same distance (induced drag is only part of total drag; parasitic drag is similar for both).

## Why the cost is acceptable

For an expendable strike drone:

- **Range is bounded.** Mission radii of 500–2,500 km are achievable with a modestly efficient airframe carrying a high fuel fraction (30–50% of gross weight).
- **Fuel is cheap.** A few extra liters of gasoline costs dollars. The high-AR wing costs thousands more.
- **The structural savings compound.** The lighter, simpler delta spar leaves more weight budget for fuel — partially compensating for the drag penalty — and for warhead mass, which is the point of the platform.
- **Stall behavior is forgiving.** Deltas stall progressively from tip to root, maintaining elevon authority deep into the stall. For a [GPS/INS](../../../glossary/terms/uav-guidance-navigation-and-control.md)-guided drone with limited sensor feedback, this reduces the risk of unrecoverable departures.

## Manufacturing in practice

The delta's tolerance for imprecision is what makes production at scale and low cost possible:

**Foam-core composite.** Cut from expanded polystyrene blocks with a hot wire. Skin with fiberglass, hand-laid or vacuum-bagged. This is the Shahed-136's primary construction method. A worker can learn the process in a day.

**[FDM printing](../../../glossary/terms/additive-manufacturing-in-uav-airframes.md).** A low-AR wing fits within standard printer build volumes more easily than a long, slender wing. [Infill](../../../glossary/terms/infill-density.md) patterns can be varied across the span — denser at the root where bending loads concentrate, sparser at the tips — allowing structural optimization as a slicer configuration change rather than a manufacturing process change.

**Injection molding.** For volumes above tens of thousands, delta skins and structural elements can be injection-molded from glass-filled nylon. The simple geometry requires less complex mold tooling than a conventional planform.

## Common refinements

Not all expendable deltas are simple triangles:

- **Wing fences or vortex generators** on the upper surface to delay flow separation at high [angle of attack](../../../glossary/terms/angle-of-attack.md).
- **Cranked or double-delta planforms** — highly swept inboard (structural depth, volume) with moderately swept outboard (better low-speed lift).
- **Reflexed [airfoil](../../../glossary/terms/airfoil.md) sections** at the trailing edge to provide positive pitching moment without a tail, reducing trim drag.
- **Winglets or endplates** to reduce tip vortex losses — though many expendable designs omit these as unnecessary complexity.

## The key insight

The delta wing is not the best wing for any single performance metric. It is the best wing for the constraint that actually binds in expendable drone design: cost. Every other planform requires either more manufacturing precision, more parts, more tooling, or more structural material. The delta minimizes all of these simultaneously, at the price of aerodynamic efficiency that an expendable platform can afford to spend.

This is the logic that the Shahed-136 program discovered, that [LUCAS](../../../glossary/terms/lucas.md) inherited and refined, and that dozens of derivative programs worldwide are now replicating. It is not the only way to build a drone. It is the cheapest way to build a drone that flies well enough.
