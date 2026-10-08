---
name: "Induced Drag"
date-created: 2026-03-06
aliases:
  - "Induced Drag"
  - "induced drag"
  - "vortex drag"
  - "lift-dependent drag"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
description: "The drag component caused by wingtip vortices, inherent to generating lift with a finite-span wing, reduced by increasing aspect ratio."
---

Induced drag is the [drag](./drag.md) produced as a byproduct of generating [lift](./lift.md) with a finite-[span](./span.md) wing. Air flowing from the high-pressure lower surface around the wingtip to the low-pressure upper surface creates trailing vortices. These vortices tilt the local lift vector rearward, producing a component in the drag direction.

The induced drag coefficient is:

C_Di = C_L² / (π × AR × e)

where C_L is the lift coefficient, AR is [aspect ratio](./aspect-ratio.md), and e is the Oswald efficiency factor (0.7–0.95, depending on planform shape). This equation reveals the two levers for reducing induced drag:

1. **Increase aspect ratio.** Doubling AR halves induced drag at the same C_L. This is why long-endurance UAVs (MQ-9 Reaper, ScanEagle) use high-AR wings despite the structural cost.

2. **Reduce lift coefficient.** Fly faster or use a larger wing area. Since C_L appears squared, a small reduction in C_L substantially reduces induced drag — but requires more [wing loading](./wing-loading.md) analysis to avoid other penalties.

At low speeds and high lift coefficients, induced drag dominates total drag. At high speeds and low lift coefficients, [parasitic drag](./parasitic-drag.md) dominates. The crossover speed is the speed for maximum [lift-to-drag ratio](./lift-to-drag-ratio.md).

For delta-winged drones with AR 1.5–2.5, induced drag is the dominant drag component throughout the flight envelope, making the delta inherently less efficient than a conventional wing — a trade-off accepted in [expendable designs](./expendable-airframe-design.md) for structural and manufacturing reasons.

## Related terms

- [Parasitic Drag](./parasitic-drag.md) — the other major drag component, independent of lift
- [Aspect Ratio](./aspect-ratio.md) — the geometric parameter that controls induced drag magnitude
- [Lift-to-Drag Ratio](./lift-to-drag-ratio.md) — the efficiency metric that induced drag directly affects
