---
title: "Decision: Directory structure encodes the structuration-interface dual"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
type: decision
status: accepted
keywords:
  - DirectoryOrganization
  - StructurationInterfaceDual
  - AgentialSemioverse
---

## Context

The repository used `specifications/` as a directory type grouping
Things whose primary identity was "being a specification." This treated
specification as a content type — a Thing unto itself. But specifications
are a facet of any Thing, not a separate category: any Thing may mature
enough to need normative requirements. The semiotic-endeavor's
structuration-interface dual (method/practice, theory/specification,
repository/interaction-surface) provides the framework for resolving
this.

Separately, `texts/` contained two subtypes (research/ and civil/) that
represent fundamentally different activities: knowledge intake vs
knowledge output. These deserve structural distinction, not subtype
nesting.

Additionally, standards created within the endeavor (semiotic-markdown,
semiotic-versioning, etc.) were grouped by their type rather than by
the Thing that enables their creation. This contradicts the placement
principle (files go with the most specific Thing they relate to).

## Decision

### 1. Specifications are practice-face documents, not Things

A specification lives at `thing/practices/specification.md` — inside
the practices/ directory of the Thing it specifies. Specifications are
the practice face (interface side) of a Thing; the Thing's index.md is
the structuration face. There is no separate specification Thing and no
`specifications/` directory type.

When a specification is complex enough to need multiple files, it may
use `thing/practices/specification/` as a directory.

### 2. Standard cross-cutting subdirectories encode the dual

The following cross-cutting subdirectories are standard:

| Directory | Realm | Purpose |
|-----------|-------|---------|
| `methods/` | structuration | How practitioners produce knowledge here |
| `practices/` | interface | Concrete practice, including specification.md |
| `standards/` | structuration | Conventions a Thing uses or creates |
| `research/` | intake | External source engagement, citations, analysis |
| `learning/` | output | Accessible exposition, practical guidance, curricula |

`learning/` replaces `curricula/`. `research/` replaces
`texts/research/`. `texts/` remains as a default for content that
is neither research nor learning.

### 3. standards/ replaces specifications/ for grouping conventions

Conventions that a Thing creates or uses are grouped under `standards/`.
Each standard is a Thing with its own index.md, terms/, and
practices/specification.md. Example:

```
agential-semioverse/
  standards/
    semiotic-markdown/
      index.md                  ← what the convention IS
      terms/
      practices/
        specification.md        ← what implementations MUST DO
```

### 4. Created-here principle

Standards and concepts derived from a Thing go under that Thing, not
under the discipline they would conventionally belong to. Semiotic-
markdown goes under agential-semioverse (which enables its creation),
not under technology/.../markdown/. Neuroreflexivity goes under
relationality, not under psychology.

Standards adopted from outside go under their conventional discipline.

### 5. Decision 0005 amendment

The three-level naming convention (term → semiotic-term →
semiotic-term-specification) simplifies. The third level
(semiotic-term-specification as a separate Thing) collapses into
practices/specification.md within the semiotic-term directory. The
first two levels remain.

## Consequences

- All current `specifications/` directories become `standards/`
- Each standard gains a `practices/specification.md` internally
- The semiotic-directory-layout spec needs updating to reflect these
  directory types
- The directory-organization spec needs updating for methods/,
  practices/, standards/, research/, learning/
- `curricula/` directories rename to `learning/`
- `texts/research/` content moves to `research/`
- `texts/civil/` content moves to `learning/`
- Phase 2 and Phase 3 of plan 0057 need to account for these
  structural changes
- The specification-specification becomes the convention definition
  for practices/specification.md files, located at something like
  technology/concepts/specification/practices/specification.md

## Alternatives considered

- **SPECIFICATION.md at root level** (like AGENTS.md): simpler, more
  discoverable by convention. Rejected — `practices/specification.md`
  is more consistent with the directory structure and discoverability
  will be handled by tooling.
- **Keep specifications/ as directory type**: rejected — treats
  specification as a Thing category rather than a facet. Contradicts
  the structuration-interface dual.
- **Keep curricula/ name**: rejected — `learning/` better captures
  the full scope (not just structured curricula but all accessible
  exposition and practical guidance).
- **Civil texts stay as texts/**: considered keeping civil content in
  texts/ since "accessible text" is just a text. Rejected — these
  texts serve a learning function and grouping them under learning/
  makes that function visible.

## Knowing semioverse

The four-group structure (governing/engaging/situating/defining) has
been codified as a standard at:
`information/disciplines/knowledge-systems/standards/knowing-semioverse/`

The grounding research text is at:
`information/disciplines/knowledge-systems/texts/research/directory-organization-for-knowledge-systems.md`

The situating trinity is resolved as: **disciplines, schools, lineages**.
- disciplines = institutional/subject subdivisions
- schools = epistemic/methodological traditions
- lineages = derivational/transmissive subdivisions

## Open questions

- What remains in `texts/` after researching/ and learning/ absorb its
  main subtypes? The knowing-semioverse spec says texts/ may remain
  for content that is genuinely neither intake nor output.
- How does the specification-specification locate itself? It governs
  the practices/specification.md convention — where does the Thing
  "specification" live?
- Does this decision affect plan 0057 phases currently being executed
  by other agents (Phase 2, Phase 3)?
- Domain-specific directory types (proofs/, formalization/) need their
  own standards — the knowing-semioverse spec explicitly defers these.
