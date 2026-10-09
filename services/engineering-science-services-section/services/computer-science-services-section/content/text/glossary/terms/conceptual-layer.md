---
name: "Conceptual layer"
date-created: 2026-03-08
authors:
  - emsenn
  - claude
keywords:
  - AgentialSemioverse
  - ConceptualStack
  - Emsemioverse
description: "A level of abstraction in the emsemioverse's conceptual stack, where each layer depends on those below it and provides vocabulary for those above it."
---

A conceptual layer is a level of abstraction in the emsemioverse's
architecture where content at one layer depends on content at lower
layers and provides vocabulary for content at higher layers.

## Primary intension

A layer is a set of formal structures that share a common level of
abstraction and a common discipline. All structures in a layer can
be defined using only the vocabulary available at that layer and
below.

## The emsemioverse stack

| Layer | Name | Discipline | Content root |
|-------|------|-----------|--------------|
| 0 | Relationality | Philosophy | `philosophy/` |
| 1 | Semiotic universe | Mathematics (foundations) | `mathematics/objects/universes/semiotic-universe/` |
| 2 | Interactive semioverse | Mathematics (structures) | `mathematics/objects/universes/interactive-semioverse/` |
| 3 | Agential semioverse | Mathematics (extensions) | `mathematics/objects/universes/agential-semioverse/` |
| 4 | ASR specification | Technology (specifications) | `technology/specifications/agential-semioverse-repository/` |
| 5 | Semiotic-* specifications | Technology (method aspects) | `technology/specifications/semiotic-*/` |
| 6 | Emsemioverse endeavor | Personal (practice) | `personal/projects/emsemioverse/` |

## Secondary intension

### Layer determines content placement

A concept, term, or structure should live at the layer of its
highest dependency. If it can be defined using only Layer 2
vocabulary, it belongs at Layer 2 even if it was first written at
Layer 4. This principle drives the relocation sweep (plan 0044).

### Layers compose upward

Each layer extends the one below it. Extension preserves properties:
everything true at Layer N remains true at Layer N+1. New vocabulary
is added but old vocabulary is not redefined.

### Cross-cutting dependencies

Not all dependencies follow the main stack. Some structures draw
from sources outside the stack:

- MUD heritage (computing practice) → Layer 4 (ASR implementation)
- Starfleet procedural patterns → Layer 5 (semiotic-endeavor method)
- Semiotics (linguistics) → Layer 1 (semiotic universe vocabulary)
- Domain derivation chain (decision 0007) → Layer 5 (method substance)

These are recorded as `derives-from` edges in the dependency map.

## Distinguished from

- **Governance layers** (policy → decision → agent instruction):
  these are layers of authority within a single conceptual layer,
  not layers of the conceptual stack
- **Maturity stages** (inference → structured → delegable →
  procedural → tool): these are stages of formalization for a skill,
  perpendicular to the conceptual stack
- **Directory depth**: directories nest for organizational reasons
  that may not align with conceptual layers
