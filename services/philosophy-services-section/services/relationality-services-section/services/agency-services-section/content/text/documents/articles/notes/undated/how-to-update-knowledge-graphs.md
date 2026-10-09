---
type: question
status: open
references:
  - references/hogan-knowledgegraphs2021.md
title: How to update knowledge graphs?
description: "KGs at production scale change continuously: new entities, new facts, retracted facts, schema evolution."
---

# How to update knowledge graphs?

## The question

KGs at production scale *change continuously*: new
entities, new facts, retracted facts, schema
evolution. *How* to handle update is genuinely hard
and has multiple unresolved aspects.

## The dimensions

Update has multiple aspects:

- **Adding new triples.** Often easy (insert).
- **Removing triples.** What about derived
  inferences?
- **Modifying triples.** Update vs retract+insert.
- **Adding new entities/relations.** Schema
  consequences.
- **Schema changes.** Effects on existing data.
- **Conflict resolution.** Multiple sources
  disagree.
- **Provenance.** Tracking what was added when, by
  whom.
- **Temporal validity.** Facts true at time T;
  represent timing.
- **Versioning.** Tracking historical states.

Each has its own difficulty.

## Why it's hard

### Inference propagation

When a triple is removed:

- Inferences derived from it may also be retracted.
- But which inferences? Tracking provenance through
  inference is complex.
- Belief revision algorithms exist but are
  computationally intensive.

### Conflict and disagreement

Multiple sources:

- Wikidata vs DBpedia vs your enterprise KG.
- Each has different (sometimes contradictory)
  facts.
- Resolution requires policy: which source wins?
  When?

### Temporal complexity

Many facts have temporal validity:

- Barack Obama was president (2009-2017).
- This is different from being president *now* or
  *always*.
- Standard RDF doesn't natively handle time.
- Reification, named graphs, RDF-star are partial
  solutions.

### Schema evolution

When schema changes:

- Existing data may not conform.
- Migration may require transformation.
- Old queries may break.
- Versioning helps but adds complexity.

### Quality

Updates can introduce errors:

- New facts may be wrong.
- Deletions may remove correct facts.
- Quality assurance for updates is itself a
  research area.

## Current approaches

### Append-only patterns

- Don't delete; mark superseded.
- Preserves history.
- Cost: storage and query complexity grow.

### Provenance and named graphs

- Each fact carries provenance.
- Updates produce new named graph.
- Querying can scope to recent / authoritative
  graph.

### Temporal RDF

- Triples annotated with valid-time intervals.
- Queries specify time of interest.
- Cost: schema and query complexity.

### Belief revision

- Formal algorithms for retracting beliefs while
  preserving consistency.
- AGM postulates and beyond.
- Computationally expensive at scale.

### Stream processing

- Treat updates as a stream.
- Continuous-query engines process in real time.
- Many practical KG systems use this pattern.

### Crowdsourcing

- Wikidata model: many editors propose updates;
  community curates.
- Scales human attention.
- Requires governance and quality controls.

## What's missing

- **Sound, scalable belief revision.** Existing
  algorithms don't scale.
- **Standardized temporal RDF.** Multiple
  proposals; no clear winner.
- **Cross-source reconciliation methods.**
  Algorithms for merging conflicting KGs at scale.
- **Quality controls for automated updates.**
  When can we trust automated additions?

## Why it matters

- **Production KGs need it.** Real KGs are dynamic.
- **LLM-KG integration.** LLM-generated facts
  proposed for KG addition need quality controls.
- **Decision systems.** Decisions based on KGs need
  current data.
- **Compliance.** Some domains require audit
  trails for changes.

## What might resolve it

- **Better algorithms.** Belief revision and
  reconciliation at scale.
- **Standards.** Temporal RDF, provenance, schema
  evolution.
- **Tooling.** Production-grade KG management
  systems.
- **Hybrid LLM-KG approaches.** LLMs propose
  updates; pipelines verify.
- **Empirical study.** What actually works in
  production at scale?

## Status

Genuinely open and mostly engineering-driven.
Production systems use ad hoc approaches. Standards
and theory lag practice.
