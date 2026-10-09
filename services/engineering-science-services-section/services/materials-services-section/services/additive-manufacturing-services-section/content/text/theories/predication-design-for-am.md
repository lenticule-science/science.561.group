---
type: concept
class: design-methodology
depends-on: [build-orientation, overhang, support, anisotropy]
realizes: []
title: Design for Additive Manufacturing (DfAM)
description: A design methodology that exploits AM's freedoms (geometric complexity, internal structure, part consolidation) and respects its constraints (anisotropy, overhang limits, surface roughness, residual stress) — analogous to DfM (Design for…
---

# Design for Additive Manufacturing (DfAM)

A design methodology that exploits AM's freedoms (geometric complexity, internal structure, part consolidation) and respects its constraints (anisotropy, overhang limits, surface roughness, residual stress) — analogous to DfM (Design for Manufacturing) for machining and casting, but with substantially different rules.

## DfAM exploitation rules

These are things AM can do that conventional manufacturing cannot:

1. **Part consolidation.** Replace an assembly of N machined/welded parts with a single AM part. Canonical example: GE LEAP fuel nozzle (20 parts → 1, 25% lighter, 5× durability). Reduces fastener count, eliminates assembly labor, removes joint failure modes.
2. **Internal channels.** Conformal cooling channels in injection-mold tooling reduce cycle time 20–40%. Heat-exchanger channels with 1:50 aspect ratio are routinely produced by LPBF.
3. **Lattices.** See [lattice-structure](./predication-lattice-structure.md). Mass reduction with controlled stiffness.
4. **Topology-optimized geometry.** See [topology-optimization](./predication-topology-optimization.md). Material only where structurally needed.
5. **Functionally graded materials.** Spatial variation of composition or porosity. Implemented by multi-material AM systems.

## DfAM constraint rules

These are AM-specific limits the designer must respect:

1. **Overhang angle.** See [overhang-angle-rule](./predication-overhang-angle-rule.md). Below ~45° from horizontal in FFF (≈30° in some materials), supports are needed; supports cost material, time, and surface finish.
2. **Build orientation drives anisotropy.** See [build-orientation-aligns-load-with-xy](./predication-build-orientation-aligns-load-with-xy.md). The dominant tensile load should run in-plane.
3. **Minimum feature size.** Set by the process resolution: ~0.4 mm for FFF (single bead), ~0.1 mm for LPBF, ~50 μm for SLA. Features below this are unresolved.
4. **Surface roughness.** $R_a \sim 5$–$20$ μm for unfinished FFF, $\sim 5$–$15$ μm for LPBF. If the application requires smoother (e.g., fluid sealing surface, mating surface), include machining stock and finish post-process.
5. **Residual stress and distortion.** See [residual-stress](./predication-residual-stress.md). Tall, thin, or asymmetric parts in metal LPBF distort; orient to minimize moment arms.
6. **Trapped powder / resin.** Internal channels need drain holes for SLA (resin) and LPBF (unmelted powder).

## DfAM rule of thumb table

| Process | Min feature | Overhang limit | $R_a$ unfinished | Anisotropy ratio |
|---|---|---|---|---|
| FFF | 0.4 mm | 45° | 10–20 μm | 0.4–0.8 |
| SLA / DLP | 0.05–0.1 mm | (supports always) | 1–5 μm | ~1.0 (post-cured) |
| SLS / MJF | 0.5 mm | (none, powder-bed) | 5–15 μm | 0.85–0.95 |
| LPBF metal | 0.1–0.2 mm | 45° | 10–20 μm | 0.9–1.0 (HIP) |

## Tooling

DfAM is now embedded in commercial CAD: SolidWorks Print3D, Fusion 360 Print Studio, Materialise Magics, nTopology, Autodesk Netfabb. Each provides overhang highlighting, support generation, build-orientation optimization, and (increasingly) topology optimization.

## Pedagogical resources

- Diegel, O., Nordin, A., Motte, D. (2019). *A Practical Guide to Design for Additive Manufacturing.* Springer.
- Redwood, B., Schöffer, F., Garret, B. (2017). *The 3D Printing Handbook* — accessible practitioner reference.
- America Makes / NCDMM "DfAM curriculum" (open-source, 2020–).
