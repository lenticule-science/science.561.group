---
title: Foundational Ontology Enrichment
description: Identifies incomplete foundational terms, missing conceptual definitions, and standards for enriching the domain's ontological primitives.
date-created: 2026-04-03
type: note
name: foundational-ontology-enrichment
keywords:
  - foundational-ontology
  - term-enrichment
  - missing-definitions
  - enrichment-standards
  - critical-path
  - domain-primitives
specialization: plan
serves-system: cross-cutting
department: science
cross-cuts: [engineering]
project: library-as-knowledge-base
depends-on: foundational-ontology-research
---


## The problem

The foundational terms at `library/terms/` are what everything else builds on. Thing, object, quality, state, act, vessel, container — these are the primitives that the work domain, the operations loop, the app specs, and eventually the whole relational computer depend on.

14 of 23 terms are solid. 9 are one-sentence stubs. And several critical terms don't exist at all.

The thin stubs include the most load-bearing concepts:
- **act** (1 line: "a manifestation of a thing's energy resulting in change") — every operation, every task execution, every state transition IS an act
- **quality** (1 line: "any component of a thing which can be observed or measured") — every frontmatter field IS a quality of a thing
- **state** (1 line: "the composite of all conditions defining a thing at a moment") — every task status, every execution state IS a state
- **condition** (1 line) — every precondition, completion condition, guard in a procedure IS a condition

You can't build a rigorous operations loop on one-sentence definitions of its primitives.

## Missing terms

These concepts are referenced by existing terms but have no definition:
- **relation** — connections between things. Defined in math (binary-relation.md) but not at the foundational level. Every dependency, every assignment, every membership IS a relation.
- **event** — an act that happened at a specific time. Every status change, every completion, every failure IS an event. The operations loop runs on events.
- **change** — referenced by act.md ("resulting in change") but undefined. The fundamental thing that acts produce.
- **time** / **moment** — referenced by state.md ("at a given moment in time") but undefined. The dimension that makes state meaningful and events possible.
- **property** — related to quality but distinct. A quality you can observe; a property a thing has whether or not you observe it. Frontmatter fields are properties.
- **identity** — what makes a thing THIS thing and not another. Referenced implicitly everywhere (a task's id, a file's path, a person's name). The foundational concept behind `id:` in frontmatter.

The research task may surface others.

## The critical path

```
research-foundational-ontology (inquiry)
  ↓ unblocks all enrichment/addition tasks (derivation — follow writing-terms, meaning from research)
    ↓ unblocks research-ops-ontology-mapping (how the ontology applies to work)
      ↓ unblocks all other operations loop research
        ↓ unblocks ops-vocabulary
          ↓ unblocks all stage-specific plans
```

The research task is the single point of entry. Everything else fans out from it.

## What "solid" means

Each enriched/new term should match the quality of thing.md, object.md, vessel.md, container.md:
- Multiple paragraphs explaining what the concept IS
- Grounded in at least one external source (Aristotle, philosophy of action, temporal logic, etc.)
- Distinguished from adjacent concepts
- Connected to other foundational terms via links and frontmatter
- Written for a smart reader with no background
- Useful as a foundation that domain-specific terms can build on
