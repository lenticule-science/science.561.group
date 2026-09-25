---
title: "Induced Drag"
type: "term"
date-created: 2026-03-06
---

The drag component caused by wingtip vortices, inherent to generating lift with a finite-span wing, reduced by increasing aspect ratio.

Induced drag is the [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) produced as a byproduct of generating [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) with a finite-[span](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/span.md) wing. Air flowing from the high-pressure lower surface around the wingtip to the low-pressure upper surface creates trailing vortices. These vortices tilt the local lift vector rearward, producing a component in the drag direction.

The induced drag coefficient is:

C_Di = C_L² / (π × AR × e)

where C_L is the lift coefficient, AR is [aspect ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aspect-ratio.md), and e is the Oswald efficiency factor (0.7–0.95, depending on planform shape). This equation reveals the two levers for reducing induced drag:

- **Increase aspect ratio.** Doubling AR halves induced drag at the same C_L. This is why long-endurance UAVs (MQ-9 Reaper, ScanEagle) use high-AR wings despite the structural cost.

- **Reduce lift coefficient.** Fly faster or use a larger wing area. Since C_L appears squared, a small reduction in C_L substantially reduces induced drag — but requires more [wing loading](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-loading.md) analysis to avoid other penalties.

At low speeds and high lift coefficients, induced drag dominates total drag. At high speeds and low lift coefficients, [parasitic drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/parasitic-drag.md) dominates. The crossover speed is the speed for maximum [lift-to-drag ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift-to-drag-ratio.md).

For delta-winged drones with AR 1.5–2.5, induced drag is the dominant drag component throughout the flight envelope, making the delta inherently less efficient than a conventional wing — a trade-off accepted in [expendable designs](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/expendable-airframe-design.md) for structural and manufacturing reasons.
