---
type: concept
class: parameterized-discipline
parameters: [medium, available-panels, native-rigor]
realizes: [medium-specific-rigor]
see-also: [panel, transport, icon]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/medium-specific-rigor.md"
date-created: 2026-05-02
title: Register
description: A register is a medium with its own native panels, native rigor, and native foreclosures.
---

# Register

A *register* is a medium with its own native [panels](panel.md), native rigor, and native foreclosures. Different registers expose different structure and demand different closures. The standard is not "does this register imitate another?" but "does this register make the closures proper to it accountable?"

## Pattern

A practice names the registers it works in and, for each, declares the panels native to that register, the rigor criterion the register is held to, and the closures the register can support that another register cannot (and vice versa). A register's discipline is internal to the register; cross-register comparison happens only through declared [transport](transport.md).

## Parameters

- **`medium`** — the material substrate (prose, formal notation, diagram, executable code, machine-checked proof script, lecture, software documentation, signage).
- **`available-panels`** — the inventory of panel-classes native to this register (a diagram register's panels: figure, sub-figure, callout, label-key; a code register's panels: function, test, comment, type-declaration; a proof-script register's panels: tactic, term, definition, instance).
- **`native-rigor`** — the criterion of legitimacy proper to this register, stated in the register's own terms rather than borrowed from another.

## Conformance shape

The artifact declares which register each region belongs to. For each region, verify (a) the region uses panels native to its register; (b) the region is held to the register's native rigor, not some other register's; (c) cross-register claims pass through declared [transport](transport.md).

## Lineage

The notion of medium-specific or register-specific rigor is developed in the [good-mathematical-communication](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/communication/math/texts/good-mathematical-communication.md) essay (sections 7–10), drawing on the philosophy-of-diagrams literature (SEP entry on diagrams and diagrammatic reasoning), Avigad on the design of mathematical language (Springer Handbook 2024), and the multimodality literature in semiotics (Kress, *Multimodality*, Routledge 2010).

## Instances in the corpus

- The [mathematical-communication medium-specific-rigor concept](medium-specific-rigor.md) instantiates register with `medium ∈ {informal-proof, formal-proof-script, diagram, code, lecture, definition-prose, benchmark}`, each with its native panels and rigor criterion explicit.
