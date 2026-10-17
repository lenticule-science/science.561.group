---
type: reference
class: practitioner-resource
authors: [Andrew Ellis]
year: 2021
url: "https://ellis3dp.com/Print-Tuning-Guide/"
title: "3D Print Tuning Guide"
description: "The de-facto standard practitioner reference for FFF calibration: a maintained, open-source web guide walking through every calibration test in the recommended order (extruder e-steps → first-layer squish → flow → pressure-advance →…"
---

# Ellis (2021–) — *3D Print Tuning Guide*

The de-facto standard practitioner reference for FFF calibration: a maintained, open-source web guide walking through every calibration test in the recommended order (extruder e-steps → first-layer squish → flow → pressure-advance → temperature tower → retraction → max-flow → speed). Originated in the Voron community; now a generic reference cited by Klipper, OrcaSlicer, and Bambu official documentation.

**Why it matters here.** Standalone practitioner tuning runbook. Pairs with the academic references (Bellini, Yang–Pitchumani, Spoerk) — the academic literature explains *why* each calibration matters; Ellis explains *how* to perform it correctly.

**Strengths.**

- Tests are ordered by dependency: each calibration assumes the previous ones are already done. Skipping the order produces invalid results.
- Concrete numerical pass/fail criteria for each test.
- Active maintenance: updates reflect new firmware features (input-shaper, beacon probes).

**Cited from.** [`max-volumetric-flow-rate-bounds-print-speed`](./predication-max-volumetric-flow-rate-bounds-print-speed.md), [`pressure-advance`](./predication-pressure-advance.md), the FFF tuning narrative.
