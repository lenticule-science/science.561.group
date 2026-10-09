---
name: "Infill Density"
date-created: 2026-03-06
aliases:
  - "Infill Density"
  - "infill density"
  - "infill percentage"
  - "infill"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - AdditiveManufacturing
  - StructuralEngineering
description: "The percentage of solid material filling the interior of a 3D-printed part, the primary lever controlling the weight-to-strength trade-off in FDM-manufactured airframe components."
---

Infill density is the percentage of the interior volume of a 3D-printed part that is filled with material, as opposed to air. A part at 100% infill is solid plastic; a part at 0% infill is a hollow shell. Practical FDM parts for UAV airframes use 10–60% infill depending on structural requirements, with the lattice pattern (rectilinear, gyroid, triangular, honeycomb) determining how that material is distributed.

Infill density is the single most consequential slicer parameter for [printed UAV airframes](./additive-manufacturing-in-uav-airframes.md). Doubling infill density roughly doubles print time and material consumption while increasing compressive strength by only 50–80% (the relationship is sublinear). This means that a wing [spar](./spar.md) printed at 50% gyroid infill is not twice as strong as one at 25% — it is perhaps 1.6× as strong at 1.9× the weight. The engineering problem is identifying the minimum infill density that provides adequate strength for the expected load case, because every gram of excess infill is a gram that could have been payload, fuel, or battery.

The optimal infill depends on the platform's intended lifecycle. A reusable survey drone's wing [rib](./rib.md) might need 40% infill to survive [fatigue](./fatigue.md) cycling over hundreds of flights. An [expendable](./expendable-airframe-design.md) strike drone's wing rib may need only 20% to survive a single catapult launch and a few hours of cruise. A racing quadcopter frame optimizes differently again — high infill at motor mounts (vibration and crash loads) with low infill elsewhere (weight savings for agility).

## Related terms

- [Spar](./spar.md) — the primary structural element whose infill density most critically affects bending strength
- [Rib](./rib.md) — chordwise members whose infill supports airfoil shape under aerodynamic loads
- [Fatigue](./fatigue.md) — the failure mode that determines minimum infill for reusable platforms
- [Safety Factor](./safety-factor.md) — the margin between design load and failure that infill density must provide
- [Composite](./composite.md) — the alternative structural approach that printed infill competes with
- [Wing Loading](./wing-loading.md) — the overall load parameter that drives structural requirements
