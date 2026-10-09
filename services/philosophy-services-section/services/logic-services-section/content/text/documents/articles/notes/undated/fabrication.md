---
title: "Fabrication"
description: "The engineering of physically constructing objects: methods, machines, materials, and the design rules that govern when they succeed."
component-of: engineering
---


Fabrication is the engineering layer that turns design intent into physical objects. It encompasses the *processes* that transform material (cutting, joining, forming, depositing, curing), the *machines* that drive those processes, the *materials* whose behavior under those processes determines what is buildable, and the *design rules* that translate between part requirements and process capability.

The sub-theories under fabrication are organized by the kind of process used:

- [additive-manufacturing](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/fabrication/theories/additive-manufacturing) — building parts up from a digital model by adding material in controlled increments. Includes [fused-filament-fabrication](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/fabrication/theories/additive-manufacturing/theories/fused-filament-fabrication) and (in scope, not yet seeded) vat photopolymerization, powder-bed fusion, material jetting, binder jetting, directed energy deposition, sheet lamination.
- [material-science](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/fabrication/theories/material-science) — the cross-cutting study of how materials behave under load, heat, time, and process. Sister theory to all fabrication processes; every process theory cites material-science for the physical properties of its feedstock.

Subtractive (machining), formative (molding, forging), and joining (welding, adhesives) sub-theories are in scope and not yet seeded.

## Convention

Fabrication theories follow the same convention as the [predication-categories](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/humanities/theories/math/theories/categories/theories/predication-categories) library: every note is a Markdown file with YAML frontmatter, one entity per file, lower-kebab-case slugs, with relations declared in frontmatter (`depends-on:`, `realizes:`, `see-also:`, `instantiates:`, `introduces:`, `recaps:`, `discusses:`). See each sub-theory's `_index.md` for its layout.

The cross-theory load-bearing relations:

- A fabrication process **realizes** material behavior (the polymer's $T_g$ realizes the FFF process window).
- A design rule **depends-on** the process limits and material properties it derives from.
- A heuristic ("first layer determines success") is a [theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/fabrication/theories/additive-manufacturing/theorems) with `class: empirical-law` or `class: design-rule`, not folklore — it has scope conditions, known counterexamples, and a derivation from underlying physics.

Fabrication is engineering, not mathematics: theorems carry `status: established`, `status: empirical`, or `status: rule-of-thumb` rather than `proved`, and may cite experiments and standards rather than Lean proofs.
