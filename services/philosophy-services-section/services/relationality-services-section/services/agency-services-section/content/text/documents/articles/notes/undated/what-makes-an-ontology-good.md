---
type: question
status: open
references:
  - references/sowa-knowledge2000.md
  - references/ehrlinger-ontologies2016.md
title: What makes an ontology good?
description: "Ontology quality matters: a bad ontology breaks inference, confuses users, and propagates errors."
---

# What makes an ontology good?

## The question

Ontology quality matters: a bad ontology breaks
inference, confuses users, and propagates errors. But
*what makes an ontology good*? The criteria are
contested and partly subjective.

## Candidate criteria

### Logical / formal

- **Consistency.** No contradictions; every class is
  satisfiable.
- **Coherence.** Classes inferred to be equivalent
  match expectation.
- **Decidability.** Reasoning terminates.
- **Performance.** Reasoning is feasible at intended
  scale.

### Structural

- **Modularity.** Subdivides into coherent modules.
- **Reuse.** Reuses existing ontologies where
  appropriate.
- **Granularity.** Appropriate level of detail.
- **Hierarchy.** Well-formed class hierarchy.
- **OntoClean compliance.** Guarino-Welty's formal
  criteria for class hierarchy correctness.

### Semantic

- **Faithfulness.** Captures domain accurately.
- **Completeness.** Covers domain breadth.
- **Distinctions matter.** Categories carve real
  joints.
- **Defaults / exceptions handled appropriately.**

### Pragmatic

- **Documentation.** Clear, comprehensive.
- **Maintainability.** Updatable as domain evolves.
- **Tooling support.** Works with standard
  reasoners.
- **Community adoption.** Widely used.
- **Stability.** Doesn't break clients on update.

These are sometimes in tension: more expressive
ontologies harder to maintain; more granular harder
to reuse.

## OntoClean

Guarino-Welty's OntoClean methodology offers formal
criteria for class hierarchy correctness:

- **Rigidity.** Properties classes assign to
  instances are essential or accidental.
- **Identity.** Whether a class supplies identity
  conditions.
- **Unity.** Whether instances form unified wholes.
- **Dependence.** Whether instances depend on other
  entities.

Hierarchies violating OntoClean constraints
(e.g., rigid class subclasses anti-rigid one) are
flagged.

This is one of the few *formal* approaches to
ontology quality.

## Empirical metrics

Some quantitative measures:

- **Class/property counts.**
- **Hierarchy depth.**
- **Reasoning time.**
- **Reuse rates.**
- **Inferred subsumption count.**

Not direct quality metrics but useful indicators.

## Why it's contested

Ontology quality is partly *use-dependent*:

- Same ontology good for one use, bad for another.
- "Granularity appropriate" depends on application.
- "Faithfulness" depends on whose perspective.
- "Modularity" depends on what gets reused.

There's no single right answer because there's no
single use.

## The expert factor

Ontology quality depends substantially on:

- **Domain expertise.** Are the categories accurate?
- **Ontology engineering expertise.** Is the
  formalization correct?
- **Methodology.** Did the team follow good
  practice?
- **Iteration.** Has it been refined through use?

Good ontologies typically result from sustained
expert effort.

## What might resolve it

- **Empirical studies.** What ontologies actually
  succeed in practice?
- **ML-based assessment.** Can ML models predict
  ontology quality from structure?
- **Use-case-specific frameworks.** Quality
  criteria that explicitly account for use case.
- **Cross-ontology comparisons.** Side-by-side
  evaluation across multiple ontologies for the
  same domain.

## Why it matters

- **Investment decisions.** Is this ontology worth
  using?
- **Construction priorities.** What to focus on
  during construction.
- **Evaluation.** How to assess proposed
  ontologies.
- **Learning.** What to teach in ontology
  engineering.

## Status

Genuinely open and probably plural. Different
criteria for different uses. OntoClean-style formal
criteria provide partial coverage; pragmatic criteria
remain contested.
