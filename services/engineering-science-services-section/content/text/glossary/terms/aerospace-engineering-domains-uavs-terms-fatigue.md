---
title: "Fatigue"
type: "term"
date-created: 2026-03-06
---

The progressive weakening and eventual failure of a material under repeated loading cycles, even when each cycle is below the material's static strength.

Fatigue is the process by which a structure fails under repeated loading at stress levels well below its static ultimate strength. A wing [spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) that can support 5,000 N in a single static test may fail at 2,000 N after 100,000 loading cycles — not because the material is weak, but because microscopic cracks nucleate at stress concentrations, grow incrementally with each cycle, and eventually reach a critical length at which the remaining cross-section can no longer carry the load.

Fatigue life is typically characterized by S-N curves (stress vs. number of cycles to failure). Aluminum alloys have no fatigue limit — they will eventually fail at any cyclic stress above zero, given enough cycles. Some steels have a fatigue limit (endurance limit) below which they can theoretically survive infinite cycles.

For reusable UAVs, fatigue is a primary design driver:

- A MALE UAV designed for 20,000 flight hours experiences millions of wing-bending cycles from gusts and maneuvers.

- Propeller hubs experience a bending cycle every revolution — at 5,000 RPM, that is 300,000 cycles per hour.

- Landing gear components experience high-stress cycles on every landing.

For [expendable airframes](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/expendable-airframe-design.md), fatigue is **not** a design driver. A structure that will experience fewer than 10,000 loading cycles in its entire lifecycle (one flight of a few hours) will not fail from fatigue unless it is already near its static strength limit. This is the key insight that allows expendable drones to use materials and [safety factors](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/safety-factor.md) that would be unacceptable for reusable platforms — [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) thermoplastics, foam-core composites, and hot-glue joints can all survive a single flight even though they would fail within weeks of regular use.

[3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) parts are particularly susceptible to fatigue because cracks preferentially initiate and propagate along the inter-layer boundaries — the weakest link in FDM construction. For reusable printed UAV components (motor mounts, landing gear), fatigue analysis of the inter-layer bond is essential.
