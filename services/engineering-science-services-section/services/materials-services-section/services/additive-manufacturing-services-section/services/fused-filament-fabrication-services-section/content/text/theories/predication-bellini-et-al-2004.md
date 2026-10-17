---
type: reference
class: research-article
authors: [Anna Bellini, Selçuk Güçeri, Mauro Bertoldi]
year: 2004
journal: "Journal of Manufacturing Science and Engineering"
volume: 126
issue: 2
pages: "237-246"
doi: "10.1115/1.1688377"
title: Bellini, Güçeri & Bertoldi (2004) — Liquefier dynamics in fused deposition
description: The first end-to-end physical model of an FFF (then "FDM") hot-end.
---

# Bellini, Güçeri & Bertoldi (2004) — *Liquefier dynamics in fused deposition*

The first end-to-end physical model of an FFF (then "FDM") hot-end. Couples three sub-models: (1) heat conduction from the heater block into the filament, (2) melt-zone geometry with a moving solid–liquid interface, (3) pressure-driven non-Newtonian flow through the nozzle. Validated against direct pressure measurements on an instrumented Stratasys liquefier.

**Why it matters here.** The canonical citation for any quantitative FFF rheology claim. The model and its successors (Phan et al. 2020, Serdeczny et al. 2020) are still the basis of the [max volumetric flow rate](./predication-max-volumetric-flow-rate-bounds-print-speed.md) ceiling and of pressure-advance algorithms in modern firmware (Klipper PA, Marlin Linear Advance).

**Limitations.** Treats only steady-state flow; does not address the transient dynamics during acceleration/deceleration that pressure-advance corrects. Newtonian-equivalent rheology used in some closed-form steps; modern revisits use full Cross/Carreau models.

**Cited from.** [`melt-flow-rheology`](./predication-melt-flow-rheology.md), [`max-volumetric-flow-rate-bounds-print-speed`](./predication-max-volumetric-flow-rate-bounds-print-speed.md).
