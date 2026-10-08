---
id: flatfile-agential-resource-system-closure-kind
description: "The relation on a YAML composition that declares which nuclear quartet position it occupies. Its value is a commitment: the composition's wiring structure must satisfy the declared position."
component-of: FlatfileAgentialResourceSystem
date-modified: 2026-03-19
params:
  composition: relational-universe
  quartet-position: relational-universe
output: relational-universe-morphism
ast:
  nuclear-quartet-classification:
    - composition
    - quartet-position:
        - process
        - procedure
        - derivation
        - inquiry
title: Flatfile Agential Resource System Closure Kind
---

# Flatfile Agential Resource System Closure Kind

## What this is

`closure-kind` is a [Relation](relation.md) carried by YAML composition files — [skills](skills.md) and [runbooks](../flatfile-agential-resource-system-runbook/flatfile-agential-resource-system-runbook.md).
It declares which nuclear quartet position the composition occupies: [Process](process.md), [Procedure](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md), [Derivation](derivation.md), or [Inquiry](inquiry.md).

The value is a commitment, not a label.
The composition's actual wiring structure MUST satisfy the declared position — a composition that branches on conditions is not a Process regardless of what it declares.

`closure-kind` lives on YAML files (compositions), not Python files (generators).
A single step $s \in \Sigma$ is a generator — it has no closure kind.
The quartet position emerges from how generators compose.
See [flatfile-agential-resource-system-runbook](../flatfile-agential-resource-system-runbook/flatfile-agential-resource-system-runbook.md) for the Foata normal form grounding.

A composition MUST carry exactly one `closure-kind`.
A composition CANNOT occupy two positions simultaneously.

## Valid objects

The value of `closure-kind:` must be the id of one of these four named entities:

- [`process`](process.md) — Fix(σ)∩Fix(Δ): deterministic wiring, no branching
- [`procedure`](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) — Fix(σ)∖H*: conditional routing between steps
- [`derivation`](derivation.md) — Fix(Δ)∖H*: inference step produces value at runtime
- [`inquiry`](inquiry.md) — raw A: structure discovered during execution

## Relationship to other concepts

- [Process](process.md), [Procedure](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md), [Derivation](derivation.md), [Inquiry](inquiry.md) — the four positions this relation classifies.
- [FlatfileAgentialResourceSystemSkillfulWork](../flatfile-agential-resource-system-skillful-work/flatfile-agential-resource-system-skillful-work.md) — all four positions together exhaust all FlatfileAgentialResourceSystemSkillfulWork.
- [flatfile-agential-resource-system-runbook](../flatfile-agential-resource-system-runbook/flatfile-agential-resource-system-runbook.md) — the YAML composition that carries this relation.
