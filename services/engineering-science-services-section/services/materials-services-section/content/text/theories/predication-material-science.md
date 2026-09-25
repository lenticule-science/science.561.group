---
title: "Material Science"
description: "Cross-cutting study of how engineering materials behave under load, heat, time, and process. Sister theory to fabrication processes; supplies the physical-property data and constitutive models that fabrication theorems depend on."
component-of: fabrication
---


Material science as a fabrication-theory sub-theory is *not* the academic discipline in full — it is the working subset that fabrication processes need: the polymer thermal transitions that set process windows, the moisture absorption that ruins prints, the polymer crystallinity that controls strength and warping, the mechanical anisotropy that distinguishes a printed part from an injection-molded one.

This theory is organized so that every fabrication process can cite material-science objects (polymers, composites, thermosets) and concepts (glass transition, crystallinity, hygroscopicity) directly in `depends-on:`, without having to redefine basic material physics in each process theory.

## Convention and layout

Inherits from fabrication. See [predication-additive-manufacturing](../../../services/additive-manufacturing-services-section/content/text/theories/predication-additive-manufacturing.md) for the frontmatter convention.

- `concepts/` — recurring material anchors: glass transition, melting transition, crystallinity, hygroscopicity, thermal expansion, viscoelasticity, anisotropy.
- `objects/` — materials and material classes: PLA, PETG, ABS, ASA, PA (nylon), PC, TPU, PEEK, photopolymer resins, composite filaments.
- `morphisms/` — material processing transformations: drying, annealing, conditioning.
- `theorems/` — material-science laws relevant to fabrication: $T_g$ determines service temperature, hygroscopic polymers must be dried, semi-crystalline polymers warp.
- `examples/` — material-property datasheets formatted as worked examples.
- `references/` — manufacturer datasheets, ASTM/ISO test standards, polymer-physics textbooks.
- `prose/teaching/explanations/` — orientation pieces (e.g. "what every maker should know about $T_g$").
- `texts/` — legacy curriculum material: [materials-basics](../documents/articles/notes/materials-basics.md).

## Scope

This theory does *not* aim to subsume polymer science, metallurgy, or ceramic science. It carries enough material physics for fabrication processes to cite and no more. When a fabrication theorem needs deeper material physics than this theory carries, the right move is to add the missing concept here, then cite it — not to inline the physics in the fabrication theorem.

## Earlier material

Inherits from [fabrication](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication). See [additive-manufacturing/_index.md](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/_index.md) for the frontmatter convention.
