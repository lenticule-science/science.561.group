---
id: flatfile-agent-resource-system-related
description: "The pre-nucleus form of any relation between two entities. Every specific relation (grounding, uses, extends, etc.) is what related normalizes to under nucleus evaluation. Proposing any relation is proposing related; the nucleus determines the specific predicate."
extends: Relation
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  entity-a: relational-universe
  entity-b: relational-universe
output: relational-universe-morphism
ast:
  pre-nucleus-relation:
    - entity-a
    - entity-b:
        - relation-lattice-position
---

# Related

## What this is

**`related`** is the pre-nucleus form of any relation between two entities.

Every specific relation in the system — `grounding:`, `uses:`, `extends:`, `component-of:`, `refines:`, `satisfies:`, `supports:` — is what `related(A, B)` normalizes to when the nucleus evaluates the proposal.

`related:` is not a placeholder for an unknown relation.
It is a specific morphism: the raw Proposition "A and B stand in some relation" submitted to the fiber $H_t$ before the nucleus has acted.
The nucleus $\sigma_t$ evaluates the proposal and either settles it to a specific predicate or leaves it open as `related:`.

This means:
- Every specific relation is a fixed point of the nucleus acting on `related:`
- Proposing any relation between A and B IS stating `related(A, B)` and submitting it for normalization
- A `related:` entry that remains after nucleus evaluation is a legitimately unsettled relation — one the nucleus cannot yet refine further given current evidence

## The normalization claim

Any relation between any two entities in R can be proposed, and there is a normalization procedure for that proposal.

The procedure is the nucleus $\sigma_t$: the same saturation operation that normalizes Propositions in the RelationalHistoryFiberDoctrineLanguage normalizes relation proposals.
A proposed relation `related(A, B)` enters $H_t$ as an element; $\sigma_t$ acts on it; the result is the most specific stable relation the fiber supports given current content.

The propose-grounding skill is one instance of this procedure — specifically, the four-condition evaluation path that normalizes `related(A, B)` toward `grounding(A, B)`.
The general procedure applies to any specific relation.

`related:` MUST be recognized as a first-class morphism in R, not an informal hedge.
`related:` MUST be distinguished from "unknown relation" — a `related:` entry that remains after nucleus evaluation is a legitimate settled result, not a gap.
`related:` MUST be refined to a specific predicate whenever the nucleus can determine one.

## The relation lattice

All specific predicates are sub-relations of `related:` — they are more specific normalizations of the same raw morphism:

```
related:
  ├─ supports:      weak evidential backing
  ├─ grounding:       nucleus-stable, hyperintensional
  ├─ uses:          dependency (Parnas: necessary for correct functioning)
  ├─ extends:       inclusion morphism (algebraic/logical extension)
  ├─ component-of:  structural part (W3C OWL: non-transitive hasPart)
  ├─ refines:       adds constraints, preserves prior obligations
  └─ satisfies:     crosses abstraction boundary (Tarski: Model × Formula)
```

Every specific predicate implies `related:`.
`related:` implies none of them — it carries no structure beyond connection.

## The two taxonomies are orthogonal

The operational taxonomy (Resource / Skill / Runbook / Script) classifies entities by what kind of content they carry.
The logical taxonomy (Entity / Relation / Proposition / Observation) classifies the ontological type of that content.

These are orthogonal axes, not competing ones:
- A Skill is an Entity whose content is Propositions (instructions)
- A Resource is an Entity whose content is Propositions + Observations (claims + evidence)
- A Relation is an Entity that names a specific normalized form of `related:`
- A GroundingClaim is a Proposition about two Entities under nucleus evaluation

There is no tension.

## In the the corpus

In a [FlatfileAgentResourceSystem](./flatfile-agent-resource-system.md):

- `related:` in frontmatter asserts a connection without specifying the specific predicate
- `related:` in the multi-entity file pattern (see [frontmatter](../../../../services/markdown-services-section/content/text/glossary/terms/frontmatter.md)) is the default relation between a section entity and the file-level entity
- Any `related:` entry is a candidate for future normalization via the appropriate propose-relation skill

## Open questions
