---
title: "Fused Filament Fabrication"
description: "Material-extrusion additive manufacturing using thermoplastic filament fed through a heated nozzle: the process physics, the slicer parameters that control it, the failure modes it generates, and the design rules that work around its limits."
component-of: additive-manufacturing
---

# Fused Filament Fabrication

Fused filament fabrication (FFF) — also called fused deposition modeling (FDM, a Stratasys trademark) — extrudes thermoplastic filament through a heated nozzle moving in a controlled toolpath above a build plate, depositing molten polymer that fuses with the previous bead and the previous layer as it cools. It is the dominant desktop AM process and the workhorse of small-batch functional prototyping.

The defining structural fact specific to FFF is the **bead**: every feature is composed of one or more extruded round-cornered rectangles whose width is set by extrusion rate and travel speed, and whose height is the layer height. Bead geometry, bead-to-bead bonding, and bead-to-layer bonding determine essentially every FFF outcome — surface finish, dimensional accuracy, mechanical strength, and the characteristic Z-axis weakness.

## Convention and layout

Inherits from [additive-manufacturing](../../). See that `_index.md` for the frontmatter convention.

- `concepts/` — FFF-specific recurring anchors: the bead, retraction, stringing, layer adhesion, extrusion multiplier, pressure advance, the first-layer regime.
- `objects/` — machine components and feedstock: hotend, nozzle, extruder (Bowden vs. direct-drive), filament, build plate, part-cooling fan, motion system.
- `morphisms/` — FFF process steps: extrusion, retraction, travel, layer change, ironing.
- `theorems/` — FFF-specific empirical laws: nozzle-temperature-vs-layer-adhesion tradeoff, print-speed-vs-quality tradeoff, retraction-vs-stringing tradeoff, overhang-angle rule, bridging-distance limit.
- `examples/` — print profiles, failure-mode case studies.
- `questions/` — open FFF engineering questions.
- `references/` — Marlin, Klipper, PrusaSlicer, OrcaSlicer, SuperSlicer documentation; Stratasys patents (now expired); peer-reviewed literature on FFF mechanics.
- `prose/teaching/explanations/` — through-line documents.
- `texts/` — legacy curriculum-style material being progressively atomized: [3d-printing-quickstart](texts/3d-printing-quickstart.md), [what-is-3d-printing](texts/what-is-3d-printing.md), [material-behavior-fdm](texts/material-behavior-fdm.md), [apply-3d-printing-safety-checks](texts/apply-3d-printing-safety-checks.md).

## What FFF is good for and where it fails

Good for: functional prototypes, jigs and fixtures, small-batch end-use parts in commodity polymers (PLA, PETG, ABS, ASA, PA, PC, TPU), large parts cheaply (compared to SLA/SLS), iteration speed (minutes-to-hours).

Fails at: small fine features below ~2× nozzle diameter, fully isotropic mechanical performance, smooth as-printed surfaces, parts requiring fluid-tightness without post-processing, parts loaded primarily along the build axis.

The theorems in this sub-theory enumerate the failure modes one by one: warping, layer delamination, under-extrusion, over-extrusion, stringing, blobbing, elephant's foot, ringing/ghosting, salmon-skin, layer-shift, first-layer adhesion failure. Each has a named mechanism, scope conditions, and a documented mitigation.
