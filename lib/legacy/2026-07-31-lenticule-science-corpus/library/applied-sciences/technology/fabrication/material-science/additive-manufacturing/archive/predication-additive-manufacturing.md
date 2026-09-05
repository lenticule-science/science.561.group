---
title: "Additive Manufacturing"
description: "The engineering of building parts up from a digital model by depositing, fusing, or curing material in controlled increments. Covers the seven ASTM/ISO process families, the slicing pipeline that bridges CAD to toolpath, and the design rules that govern when a part is buildable, dimensionally accurate, and mechanically sound."
component-of: fabrication
---


Additive manufacturing (AM) builds parts by adding material — layer by layer, voxel by voxel, drop by drop — rather than by removing it from stock or forming it in a die. The defining structural fact is **the layer**: every AM process discretizes a continuous geometry into a stack of two-dimensional cross-sections, each laid down by a process step that is small compared to the part. From that single fact follow most of AM's strengths (geometric freedom, small-batch economics, internal features impossible to machine) and most of its limits (anisotropy along the build axis, surface stair-stepping, layer-adhesion as a failure mode independent of bulk material strength).

This theory is organized around the AM process pipeline — **CAD model → tessellated mesh → sliced toolpath → deposited part → finished part** — and the design rules that govern each handoff. Sub-process families (FFF, SLA, SLS, MJF, DMLS, …) inherit this skeleton and refine it.

## Sub-theories

- [fused-filament-fabrication](theories/fused-filament-fabrication/) — material extrusion of thermoplastic filament through a heated nozzle. The most-developed sub-theory and the one most makers encounter first.

In scope, not yet seeded:
- vat-photopolymerization — SLA, DLP, MSLA. UV-cured liquid resin.
- powder-bed-fusion — SLS, MJF, DMLS, EBM. Selectively fusing a powder bed.
- material-jetting — PolyJet, MJP. Inkjet-style droplet deposition.
- binder-jetting — Binder selectively bonds powder; sintered or infiltrated post-process.
- directed-energy-deposition — DED, LENS, WAAM. Wire or powder fused on contact at a moving deposition head.
- sheet-lamination — LOM, UAM. Stacked-and-bonded sheets.

## Convention

Same as [predication-categories](../../../humanities/theories/math/theories/categories/theories/predication-categories/). Every note is a Markdown file with YAML frontmatter; one entity per file; lower-kebab-case slugs.

```yaml
---
type: concept | object | morphism | theorem | question | example | narrative | remark | reference
class: process | machine | material-state | toolpath | design-rule | empirical-law | heuristic | ...
status: established | empirical | rule-of-thumb | draft | open       # theorems & questions
symbol: ...                                                          # canonical symbol if any
depends-on: [...]                                                    # strict logical dependency
realizes: [...]                                                      # objects/morphisms — concepts realized
see-also: [...]                                                      # non-ordering cross-reference
instantiates: [...]                                                  # examples — placed after named items
introduces: / recaps: / discusses: [...]                             # narratives — positioning
---
```

## Layout

- `concepts/` — semantic anchors that recur across AM processes (the layer, anisotropy, overhang, infill, adhesion, build orientation). Not specific machines or materials; processes and machines *realize* them.
- `objects/` — concrete artifacts and machines: the build volume, the slicer, the G-code program, the print profile, the STL mesh.
- `morphisms/` — process transformations: slicing (CAD → toolpath), deposition (toolpath → green part), solidification (green → solid), post-processing (solid → finished).
- `theorems/` — empirical laws and design rules with `class: empirical-law` or `class: design-rule`. One claim per file, with scope, known counterexamples, and the underlying mechanism.
- `examples/` — worked print profiles, failure analyses, design-for-AM case studies.
- `questions/` — open engineering questions: predictive models for warping, optimal toolpath planning, in-situ defect detection.
- `references/` — cited works (Gibson/Rosen/Stucker, ISO/ASTM 52900, manufacturer documentation, peer-reviewed literature).
- `prose/teaching/explanations/` — through-line documents that walk a path through the material (e.g., "the slicer pipeline as a chain of morphisms"; "why the first layer determines everything").
- `prose/remarks/` — short essays attached to a single atom.

Existing curriculum-style `texts/` material lives under each sub-theory (e.g. `theories/fused-filament-fabrication/texts/`) and is being progressively atomized into the typed structure above.

## Orienting reading

For a researcher entering AM:

- [literature-review-am-research-frontiers](prose/teaching/explanations/literature-review-am-research-frontiers.md) — surveys the seven potential research frontiers (PSP chain, in-situ monitoring, residual stress, lattices/topology, multi-material, sustainability, qualification) with reading-list pointers.
- [literature-review-fff-process-physics](theories/fused-filament-fabrication/prose/teaching/explanations/literature-review-fff-process-physics.md) — chronological narrative of FFF process-physics research from Stratasys-only (pre-2008) through the Klipper / Bambu / production-grade era (2020–2026).
- [literature-review-polymer-feedstock-frontier](theories/material-science/prose/teaching/explanations/literature-review-polymer-feedstock-frontier.md) — feedstock development arc (PLA → PETG → fiber-reinforced → PEEK → recyclate / bio-based).

The [references _index](references/_index.md) lists the foundational works; per-reference annotated files (e.g. [debroy-et-al-2018](references/debroy-et-al-2018.md), [seifi-et-al-2017](references/seifi-et-al-2017.md), [iso-astm-52900-2021](references/iso-astm-52900-2021.md)) give the reading-rationale per work.

## Active open questions (frontiers)

- [qualification-and-certification](questions/qualification-and-certification.md) — the institutional choke-point.
- [in-situ-defect-detection](questions/in-situ-defect-detection.md) — generalizable ML defect classifiers across machines / materials / geometries.
- [predictive-warping-model](questions/predictive-warping-model.md) — the polymer-AM analog of metal-AM inherent-strain modeling.
- [generative-design-for-am](questions/generative-design-for-am.md) — when do ML-generated designs reach engineering acceptability?
- [economic-crossover](questions/economic-crossover.md) — where is AM cheaper than conventional, in 2026's productivity regime?
- [recycling-at-scale](questions/recycling-at-scale.md) — closed-loop feedstock circularity, polymer and metal.

## Why this shape

Three pressures shape it.

First, AM's failure modes cut across machine, material, geometry, and slicer settings. Atomizing by *kind of thing* — concept vs. object vs. process vs. design rule — lets a failure analysis cite the four contributing causes without forcing them into one document.

Second, AM is a young engineering discipline whose folklore ("dry your filament", "don't print PLA in a hot car", "support angle 45°") is mostly correct but rarely stated with scope conditions. Treating each rule as a `theorem` with explicit hypotheses is how the corpus distinguishes load-bearing engineering knowledge from received wisdom.

Third, the slicer pipeline is *literally* a chain of morphisms in the categorical sense. CAD → mesh → sliced layers → toolpath → G-code → motion → deposited part is a sequence of structure-preserving (or structure-breaking, when failure analysis applies) transformations. The morphism-typed organization mirrors the actual process flow.
