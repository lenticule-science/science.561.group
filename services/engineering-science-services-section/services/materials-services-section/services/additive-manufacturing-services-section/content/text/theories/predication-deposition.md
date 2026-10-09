---
type: morphism
class: physical-transformation
depends-on: [gcode, layer]
realizes: []
title: Deposition
description: "The physical transformation $\\mathrm{deposit} : \\mathrm{GCode} \\times \\mathrm{Machine} \\times \\mathrm{Material} \\to \\mathrm{GreenPart}$ executed by an AM machine: G-code commands cause coordinated motion of the deposition head and metered…"
---

# Deposition

The physical transformation $\mathrm{deposit} : \mathrm{GCode} \times \mathrm{Machine} \times \mathrm{Material} \to \mathrm{GreenPart}$ executed by an AM machine: G-code commands cause coordinated motion of the deposition head and metered release of material onto the build region, producing the **green part** — the as-built but pre-post-processed object.

"Green part" is the term for the part *as it leaves the machine*, before any post-processing. The terminology is borrowed from ceramics and powder metallurgy and applies analogously across AM:

- FFF green part: dimensionally complete, surface as-printed (visible layer lines, possible witness marks at supports), mechanical properties at $80$–$100\%$ of post-annealed values, may carry residual stress.
- SLA green part: dimensionally complete, surface smooth, mechanical properties at $30$–$70\%$ of post-cured values (the resin is "snappy" but not at full strength until UV post-cure).
- SLS / MJF green part: dimensionally complete, surface gritty (loose powder adhered), mechanical properties at full or near-full bulk values (powder bed processes are essentially fully fused at deposition).
- DMLS green part: dimensionally near-complete with support structures still attached, on-build-plate, requires removal, heat treatment, possibly HIP, and machining of mating surfaces.

The deposition morphism is *not* deterministic in the way slicing is: identical G-code on identical hardware can produce different green parts due to ambient temperature, filament moisture, build-plate cleanliness, mechanical wear, and quantum mechanics. The non-determinism is bounded — an $X \pm 0.1$ mm dimensional repeatability is typical for a tuned FFF machine — but it is real, and serious AM work treats deposition as a stochastic morphism whose statistics must be characterized per machine.

Composition with [solidification](./predication-solidification.md) and [post-processing](./predication-post-processing.md) yields the full part-production morphism $\mathrm{Mesh} \to \mathrm{FinishedPart}$. The factorization through the green part is essential for reasoning about AM failure modes: most failures (warping, layer separation, dimensional drift) occur at deposition; most secondary failures (insufficient strength, poor surface, fatigue) are post-processing problems.
