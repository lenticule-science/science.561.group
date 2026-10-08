---
type: concept
class: parameterized-discipline
parameters: [compression-target, preserved-structure, manipulation-rules]
realizes: [transport, medium-specific-rigor]
see-also: [panel, register]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/icon-discipline.md"
- "../../math/theories/mathematical-communication/objects/notation-icon.md"
- "../../math/theories/mathematical-communication/objects/commutative-diagram-icon.md"
date-created: 2026-05-02
title: Icon
description: An icon is a compressive sign that removes detail in order to preserve manipulable structure.
---

# Icon

An *icon* is a compressive sign that removes detail in order to preserve manipulable structure. Its value is not that it looks technical. Its value is that it compresses the *right* structure, so recognition, manipulation, and transport become easier.

Bad abstraction removes the wrong details. It produces *prestige compression*: marks that look the part but do not improve traversal. Good abstraction performs amplification through simplification: it strips contingency so the operative structure can move.

## Pattern

A practice names its icons explicitly, states which features of each icon are constitutive (carry meaning) and which are incidental (do not), and specifies which manipulations preserve the icon's intended structure. The reader is licensed to manipulate the icon under the stated rules and is *not* licensed to draw inferences from incidental features.

## Parameters

- **`compression-target`** — the contingent material the icon removes (drawing style, units, scale, decorative variation, syntactic accident).
- **`preserved-structure`** — what the icon's constitutive features encode (the relation, the operation, the dependency, the type, the equivalence class).
- **`manipulation-rules`** — the operations under which the icon's preserved structure is invariant (composition rules for commutative diagrams, Reidemeister moves for knot diagrams, alpha-conversion for variable names, equational rewrites for algebraic notation).

## Conformance shape

For each icon used in the artifact: state what is constitutive and what is incidental; state the manipulation rules that preserve constitutive structure; verify no inference in the artifact depends on an incidental feature. A diagram whose visual accident (exact angle, line thickness, color) carries argumentative weight without the practice having declared it constitutive is a defect.

## Lineage

McCloud on icons (the simplified drawing that gains recognizability and affect by removing detail) supplies the core insight. The transfer to mathematical and engineering practice is supported by the philosophy-of-diagrams literature: Manders on the discipline of Euclidean diagrams, De Toffoli on mathematical diagrams as systematic notational items, the SEP entry on diagrams and diagrammatic reasoning (Shin, Lemon, Mumma 2025), Schoenherr & Schukajlow's scoping review of external visualization (*ZDM* 56, 2024).

## Instances in the corpus

- The [mathematical-communication icon-discipline](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/communication/math/theories/mathematical-communication/concepts/icon-discipline.md) instantiates icon with `compression-target = {contingent layout, drawing accident, foundational implementation detail, indexing variable name}`, `preserved-structure = {relation, composition, dependency, type, crossing data, equivalence class}`, `manipulation-rules = {2-cell composition, Reidemeister moves, alpha-equivalence, equational rewriting under stated axioms}`.
- The [visual-engineering closed-palette](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/closed-palette.md) and [verb-assignment](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/verb-assignment.md) concepts use color-marks and type-marks as icons in the same sense; they bind `compression-target`, `preserved-structure`, and `manipulation-rules` for the visual register.
