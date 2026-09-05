---

description: Create a term or concept file at the correct abstraction layer, with primary/secondary intension structure and typed relationships
name: write-term-or-concept
version: [0, 1]
kind: operational
runtime: inference
triggers:
  - "write term"
  - "write concept"
  - "define term"
  - "create term file"
  - "create concept file"
inputs:
  name: string
  definition: string?
  layer: integer?
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - find-thing
scopes: []
part-of: technology/specifications/agential-semioverse-repository
follows-policies: [1, 2, 4, 7]
---
Write term or concept: $ARGUMENTS

## Instructions

### 1. Determine the abstraction layer

The emsemioverse has a conceptual stack (see
`technology/specifications/agential-semioverse-repository/conceptual-dependency-map.md`).
Each term or concept belongs at the layer of its highest dependency.

Ask: **What vocabulary does this concept require to define?**

| If it requires... | It belongs at layer... | Directory root |
|---|---|---|
| Only philosophical vocabulary | 0 (relationality) | `philosophy/` or `relationality/` |
| Semiotic universe formal structures | 1 (foundations) | `mathematics/objects/universes/semiotic-universe/` |
| Interactive semioverse structures (handles, footprints) | 2 (structures) | `mathematics/objects/universes/interactive-semioverse/` |
| Agential semioverse structures (agents, skills, tools) | 3 (extensions) | `mathematics/objects/universes/agential-semioverse/` |
| ASR implementation specifics | 4 (specifications) | `technology/specifications/agential-semioverse-repository/` |
| Endeavor method vocabulary | 5 (method aspects) | `technology/specifications/semiotic-endeavor/` or other `semiotic-*/` |
| Emsemioverse-specific practice | 6 (practice) | `personal/projects/emsemioverse/` |

If unsure, err toward the lower (more abstract) layer. Content can
always be referenced from higher layers; placing it too high creates
a dependency violation.

### 2. Choose term vs. concept

- **Term**: defines a single word or phrase. Has primary and
  secondary intension. Goes in `terms/` directory.
- **Concept**: defines a composite idea built from terms. May have
  components, relationships, and implications. Goes in `concepts/`
  directory.

### 3. Write the file

Place at `{layer-directory}/terms/{slug}.md` or
`{layer-directory}/concepts/{slug}.md`.

Frontmatter:
```yaml
---
title: "{Name}"
date-created: {today ISO 8601}
authors:
  - {who introduced the term}
  - claude
introduces: {term|concept}
tags:
  - {LayerTag}
  - {DomainTag}
  - {CategoryTag}
defines:
  - "{name}"
  - "{aliases}"
description: "{One sentence definition.}"
---
```

Body structure for **terms**:
1. **Opening sentence**: one-sentence definition.
2. **Primary intension**: the core meaning — what the term picks out.
3. **Secondary intension**: what makes this term this term and not
   another. Properties, constraints, invariants.
4. **Distinguished from**: related terms with explicit contrasts.
   Format: `- **{other term}**: {how it differs}`

Body structure for **concepts**:
1. **Opening paragraph**: what the concept is and why it exists.
2. **Components or structure**: what the concept is made of.
3. **Relationship to {layer}**: how it fits into the layer's
   architecture.
4. **Implications**: what follows from this concept existing.
5. **Related concepts**: with explicit relationship types.

### 4. Cross-reference

- Search for existing content that uses this term informally. Add
  links to the new term file.
- Check whether the term should appear in any index file at its
  layer.
- If the term defines something that the conceptual dependency map
  tracks, add it as a node.

### 5. Report

State the path created, the layer decision rationale, and any
cross-references added.

## Anti-slop checklist

- The term is written in its own discipline's vocabulary, not
  oriented around how it connects to the emsemioverse (content
  neutrality)
- Primary intension is one clear statement, not a paragraph
- "Distinguished from" section exists and contrasts are substantive
- Layer placement is justified by dependencies, not by where the
  term was first mentioned
- If the term was relocated from a previous location, all references
  are updated
