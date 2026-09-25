---
type: object
class: machine-component
depends-on: [filament, hotend]
title: Extruder (filament feeder)
description: The mechanism that drives filament into the hotend — a stepper-motor-driven gear (or pair of gears) that grips the filament and advances or retracts it under control of the firmware.
---

# Extruder (filament feeder)

The mechanism that drives [filament](./predication-filament.md) into the [hotend](./predication-hotend.md) — a stepper-motor-driven gear (or pair of gears) that grips the filament and advances or retracts it under control of the firmware. The extruder is mechanically and thermodynamically the printer's "right hand": its job is to deliver the volumetric flow rate the slicer commanded, no more and no less.

Two configurations:

- **Direct-drive.** Extruder mounted on the print head, immediately above the hotend. Short filament path ($\sim 30$–$50$ mm) gives crisp pressure response, allows aggressive retraction tuning ($0.5$–$1.5$ mm typical), and reliably drives flexible filaments (TPU 95A and softer can only be printed direct-drive). Cost: print-head mass increases by $\sim 100$–$300$ g, limiting maximum acceleration without ringing.
- **Bowden.** Extruder mounted on the printer frame, pushing filament through a 200–800 mm PTFE tube to the hotend. Light print head, high acceleration, but the long compressible filament-in-tube column creates pressure-response lag — retraction must be longer ($3$–$6$ mm) and TPU is essentially unprintable (the soft filament buckles inside the tube under feed pressure).

Drive geometry:

- **Single drive gear.** One gripping gear pressed against an idler bearing. Cheap, prone to slip, common on budget printers. Adequate for PLA at moderate speeds; struggles at high flow.
- **Dual drive gear.** Two opposed gripping gears (Bondtech BMG, Triangle Labs Matrix, Bambu BMG-style). Doubles grip area, eliminates slip up to extruder torque limits. The standard for serious work.
- **Direct planetary gearbox.** Stepper drives a planetary reduction (e.g. LDO Orbiter, Bondtech LGX), trading speed for torque. Required for $0.6$ and $0.8$ mm nozzles at high flow.

Extruder calibration (E-step, "esteps per mm"):

1. Heat the hotend to print temperature for the loaded filament.
2. Mark the filament $120$ mm above the extruder entrance with a marker.
3. Send `M83` (relative E mode) and `G1 E100 F100` (extrude $100$ mm slowly).
4. Measure the remaining distance from mark to extruder. If the extruder advanced exactly $100$ mm, the remaining distance is $20$ mm.
5. Compute new e-steps: $\text{new} = \text{old} \cdot (100 / \text{actual advanced})$. Set with `M92 E<new>` and save with `M500`.

This calibration is per-extruder, not per-filament; it is one-time after assembly or after gear/motor changes.

A common confusion: e-step calibration sets the *commanded-to-actual* mapping; the [extrusion multiplier](./predication-extrusion-multiplier.md) sets the *actual-to-deposited-volume* mapping (filament-diameter-dependent). Both are needed; both are routinely conflated.

## Earlier material

The mechanism that drives [filament](../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-simulation-system-services-section/services/astronomy-position-computation-service/research-source/_archive/world/scripts/geometrizing/content/spacetime/scripts/eventualizing/content/spacetime-entity-set/scripts/predicating/content/light-cone-predicate-category/scripts/settling/content/cosmological-settling/_archive/cosmogenesis-development/content/informational-spacetime/library/condensing/library/quantum-spacetime/library/collapsing/library/classical-spacetime/library/cosmic-structure/library/filament/filament.md) into the [hotend](../../../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/fused-filament-fabrication/archive/hotend.md) — a stepper-motor-driven gear (or pair of gears) that grips the filament and advances or retracts it under control of the firmware. The extruder is mechanically and thermodynamically the printer's "right hand": its job is to deliver the volumetric flow rate the slicer commanded, no more and no less.
