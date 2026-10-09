---
title: "Conceptual dependency map"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
  - claude
type: index
keywords:
  - conceptual-stack
  - agential-semioverse
  - emsemioverse
  - predicate-graph
description: "Machine-readable map of conceptual dependencies across the emsemioverse stack, with typed edges encoding the inspires/grounds/extends/instantiates/specifies/practices relationships."
part-of: mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository
date-updated: 2026-03-09T00:00:00
---

This document encodes the conceptual dependencies across the
emsemioverse's layered architecture. It serves as the reference map
for plan 0057 (systematic relocation and specification) and as a prototype for how
conceptual dependency edges will eventually be encoded in individual
file frontmatter.

See [conceptual dependency](../../../glossary/terms/conceptual-dependency.md) and
[conceptual layer](../../../glossary/terms/conceptual-layer.md) for term definitions.

## Node inventory

### Main stack

| ID | Name | Layer | Discipline | Path | Status |
|----|------|-------|-----------|------|--------|
| N0 | Relationality | 0 | philosophy | `relationality/index.md` | stub |
| N1 | Semiotic universe | 1 | mathematics | `mathematics/objects/universes/semiotic-universe/index.md` | draft |
| N2 | Interactive semioverse | 2 | mathematics | `mathematics/objects/universes/interactive-semioverse/index.md` | draft |
| N3 | Agential semioverse | 3 | mathematics | `mathematics/objects/universes/agential-semioverse/index.md` | draft |
| N4 | ASR specification | 4 | technology | `mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository/index.md` | draft |
| N5a | Semiotic-endeavor | 5 | technology | `mathematics/objects/universes/agential-semioverse/concepts/semiotic-endeavor/index.md` | draft (v0.8.0) |
| N5b | Semiotic-markdown | 5 | technology | `mathematics/objects/universes/agential-semioverse/specifications/semiotic-markdown/index.md` | draft |
| N5c | Semiotic-specification | 5 | technology | `mathematics/objects/universes/agential-semioverse/specifications/semiotic-specification/index.md` | draft |
| N5d | Semiotic-PM | 5 | technology | `mathematics/objects/universes/agential-semioverse/specifications/semiotic-project-management/index.md` | draft |
| N5e | Semiotic-versioning | 5 | technology | `mathematics/objects/universes/agential-semioverse/specifications/semiotic-versioning/index.md` | draft |
| N5f | Semiotic-changelog | 5 | technology | `mathematics/objects/universes/agential-semioverse/specifications/semiotic-changelog/index.md` | draft |
| N5g | Semiotic-policy | 5 | technology | `mathematics/objects/universes/agential-semioverse/specifications/semiotic-policy/index.md` | draft |
| N5h | Semiotic-triage | 5 | technology | `mathematics/objects/universes/agential-semioverse/specifications/semiotic-triage/index.md` | draft |
| N6 | Emsemioverse endeavor | 6 | personal | `personal/projects/emsdeavor/emsemioverse/index.md` | active |

### Cross-cutting sources

| ID | Name | Discipline | Path | Relationship to stack |
|----|------|-----------|------|-----------------------|
| X1 | MUD heritage | computing (practice) | `mathematics/objects/universes/agential-semioverse/concepts/semiotic-endeavor/texts/mud-heritage-as-practice-derivation.md` | Practice derivation for N4, N5a |
| X2 | Starfleet patterns | fiction (design) | `mathematics/objects/universes/agential-semioverse/concepts/semiotic-endeavor/texts/starfleet-as-procedural-derivation.md` | Procedural derivation for N5a |
| X3 | Domain derivation chain | multiple (decision 0007) | `mathematics/objects/universes/agential-semioverse/concepts/semiotic-endeavor/texts/cross-domain-derivation-of-endeavor-theory.md` | Method substance for N5a |
| X4 | Semiotics | linguistics | `linguistics/disciplines/semiotics/` | Vocabulary source for N1 |
| X5 | Category theory | mathematics | `mathematics/objects/categories/` | Formal tools for N1, N2 |
| X6 | Heyting algebras | mathematics | `mathematics/concepts/heyting-algebra/` | Truth-value structure for N1 |
| X7 | GAZ directives | personal (practice) | `mathematics/objects/universes/agential-semioverse/concepts/semiotic-endeavor/texts/gaz-directives-as-practice-derivation.md` | Directive architecture for N4, N6 |

## Edge inventory

### Main stack edges

| Source | Target | Type | What | Strength |
|--------|--------|------|------|----------|
| N0 | N1 | `inspires` | Constructive, relational approach to truth values; relations prior to entities | inspirational |
| N1 | N2 | `grounds` | Closure operators, handles, footprints, Heyting algebra of truth values | formal |
| N2 | N3 | `extends` | Agents, skills, tools, norms added to interactive structures | formal |
| N3 | N4 | `instantiates` | Agential semioverse instantiated as a concrete repository format | formal |
| N4 | N5a | `specifies-aspect-of` | ASR's method defined by semiotic-endeavor (what an endeavor is) | structural |
| N4 | N5b | `specifies-aspect-of` | ASR's file format defined by semiotic-markdown | structural |
| N4 | N5c | `specifies-aspect-of` | ASR's specification practices defined by semiotic-specification | structural |
| N4 | N5d | `specifies-aspect-of` | ASR's work planning defined by semiotic-PM | structural |
| N4 | N5e | `specifies-aspect-of` | ASR's version tracking defined by semiotic-versioning | structural |
| N4 | N5f | `specifies-aspect-of` | ASR's change recording defined by semiotic-changelog | structural |
| N4 | N5g | `specifies-aspect-of` | ASR's governance defined by semiotic-policy | structural |
| N4 | N5h | `specifies-aspect-of` | ASR's content intake defined by semiotic-triage | structural |
| N5a | N6 | `practices` | Emsemioverse endeavor practices the semiotic-endeavor specification | structural |
| N5b | N6 | `practices` | Emsemioverse uses semiotic-markdown for file format | structural |
| N5d | N6 | `practices` | Emsemioverse uses semiotic-PM for planning | structural |

### Cross-cutting edges

| Source | Target | Type | What | Strength |
|--------|--------|------|------|----------|
| X1 | N4 | `derives-from` | Driver/mudlib separation, world-building as programming, object inheritance, permission models | structural |
| X1 | N5a | `derives-from` | MUD as longest-running networked semioverse; practice substrate for endeavor method | structural |
| X2 | N5a | `derives-from` | Override protocols, backup systems, redundancy, first-contact procedures | inspirational |
| X3 | N5a | `derives-from` | Method substance from TCCC, insurgent, disaster, military, medicine, FOSS, business domains | structural |
| X4 | N1 | `derives-from` | Sign theory, semiosis, Peircean categories | structural |
| X5 | N1 | `derives-from` | Categorical tools for formalizing closure, functors, natural transformations | formal |
| X5 | N2 | `derives-from` | Categorical tools for interaction structures | formal |
| X6 | N1 | `derives-from` | Constructive truth values, intuitionistic logic | formal |
| X7 | N4 | `derives-from` | Hierarchical directive architecture, contradiction detection, override-with-comprehension | structural |
| X7 | N6 | `derives-from` | Policy system design, composable directive templates | structural |

### Intra-layer edges

| Source | Target | Type | What | Strength |
|--------|--------|------|------|----------|
| N5a | N5b | `requires` | Endeavor method requires a file format specification | structural |
| N5a | N5c | `requires` | Endeavor method requires a specification-writing methodology | structural |
| N5a | N5d | `requires` | Endeavor method requires work planning | structural |
| N5a | N5e | `requires` | Endeavor method requires version tracking | structural |
| N5a | N5f | `requires` | Endeavor method requires change recording | structural |
| N5a | N5g | `requires` | Endeavor method requires governance (policies) | structural |
| N5a | N5h | `requires` | Endeavor method requires content intake | structural |

## Validation

### No cycles

The main stack is strictly layered: dependencies flow from lower
layers (more abstract) to higher layers (more concrete). No edge
points from a higher layer to a lower one within the main stack.
Cross-cutting edges flow inward to the stack, not between layers.

### Every `extends` has a base

N3 extends N2; N2 grounds N1. The chain is complete.

### Every `instantiates` has a formal structure

N4 instantiates N3. N3 is formally defined (though still draft).

### Known gaps

- **N0 (Relationality)**: stub. The philosophical foundation is the
  least formalized node. Content exists in triage and personal
  writing but is not yet organized at this layer.
- **N1-N3 (Mathematics)**: draft. The formal structures exist but
  are not yet stable or complete.
- **Layer 3 content deficit**: the agential semioverse directory
  has only 3 files; much of what should be Layer 3 content currently
  lives at Layer 4 (see plan 0044).

## Usage

### For relocation sweep (plan 0044)

To determine where a file belongs:

1. Read the file and identify what concepts it uses
2. Find those concepts in this map
3. The file belongs at the layer of its highest dependency
4. If it uses only Layer N vocabulary, it should live in the Layer N
   directory, regardless of where it was first written

### For predicate graph enrichment

The edge types in this map can be encoded as frontmatter predicates:

```yaml
# Example: agential semioverse index.md
conceptually-extends:
  - mathematics/objects/universes/interactive-semioverse/index.md
conceptual-layer: 3
```

The predicate graph tool will automatically extract these as typed
edges. Registration of axioms (target_exists, reciprocal) should
be added to the ASR domain specification.

### For progressive formalization

Formalization should proceed from lower layers to higher layers:
stabilize N1 before N2, N2 before N3, etc. Within a layer, formalize
terms before concepts, concepts before specifications.
