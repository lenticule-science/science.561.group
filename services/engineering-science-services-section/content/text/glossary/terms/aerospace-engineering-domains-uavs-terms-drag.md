---
title: "Drag"
type: "term"
date-created: 2026-03-06
---

The aerodynamic force opposing an aircraft's motion through the air, comprising parasitic and induced components.

Drag is the component of aerodynamic force acting parallel to and opposite the direction of flight. It is the force that propulsion must overcome to maintain airspeed. Total drag on a wing-borne aircraft divides into two fundamentally different mechanisms:

**[Parasitic drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/parasitic-drag.md)** — friction and pressure drag caused by the aircraft&rsquo;s physical presence in the airflow. It increases with the square of airspeed. Smooth surfaces, streamlined shapes, and minimal frontal area reduce it.

**[Induced drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/induced-drag.md)** — the drag penalty for generating [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) with a finite-span wing. Tip vortices redirect part of the lift force rearward. It decreases with increasing airspeed (because the required lift coefficient decreases). It decreases with increasing [aspect ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aspect-ratio.md).

Total drag is the sum of both components. At low speed, induced drag dominates; at high speed, parasitic drag dominates. The speed at which they are equal — the minimum-drag speed — is the speed for maximum [lift-to-drag ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift-to-drag-ratio.md) and maximum range.

The drag equation mirrors the lift equation:

D = ½ × ρ × V² × S × C_D

where C_D is the total drag coefficient. Because drag scales with V², doubling speed quadruples drag — which is why high-speed flight is expensive and why most UAV platforms designed for long [endurance](../../documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/aerospace-engineering/archive/endurance.md) cruise slowly.

### Drag and UAV design decisions

For UAV design, drag determines fuel consumption (or battery drain), which determines range and endurance — the most constrained performance parameters for most uncrewed missions. The dominant source of drag differs by platform class:

- **Small fixed-wing UAVs** (sub-25 kg, low speed): [induced drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/induced-drag.md) is large because the [wing loading](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-loading.md) is relatively high for the wing area, and parasitic drag from landing gear, struts, camera pods, and [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) surface roughness is significant relative to the small planform.

- **MALE/HALE platforms** (high [aspect ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aspect-ratio.md), slow cruise): parasitic drag dominates because the high-AR wing minimizes induced drag. The clean, streamlined airframe keeps parasitic drag low enough for 20–30 hour endurance.

- **Expendable strike drones** (low AR delta wings): induced drag from the low-[aspect-ratio](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aspect-ratio.md) [planform](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-planform-selection-for-uavs.md) is accepted as the cost of structural simplicity and low manufacturing cost. The extra fuel burned is cheaper than the wing it replaces.

Every external feature — a camera gimbal, an antenna, a pitot tube, an exposed bolt head — adds parasitic drag. For small UAVs where the airframe itself is not much larger than its accessories, these items can account for 20–40% of total parasitic drag. This is why integration discipline matters even on platforms that seem too small to worry about aerodynamics.
