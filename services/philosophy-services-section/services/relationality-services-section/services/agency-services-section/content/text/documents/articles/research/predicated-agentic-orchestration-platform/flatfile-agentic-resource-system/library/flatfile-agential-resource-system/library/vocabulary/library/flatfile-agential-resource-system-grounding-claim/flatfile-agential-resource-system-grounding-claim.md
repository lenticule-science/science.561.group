---
id: flatfile-agential-resource-system-grounding-claim
description: "A FlatfileAgentialResourceSystemGroundingClaim is a proposed grounding relation between two named entities, expressed as a Prop in the locale's RelationalHistoryFiberDoctrineLanguage and evaluated by applying the saturation nucleus. It is either settled (stable fixed point) or open (not yet stable)."
extends: RelationalEntity
uses: Grounding, RelationalHistoryFiberDoctrineLanguage
describes: Relation
component-of: flatfile-agential-resource-system-locale
fiber-of: relational-universe
base: t
element-of: relational-history-fiber-doctrine-language
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  entity-a: relational-universe
  entity-b: relational-universe
  saturation-nucleus: relational-history-saturating-nucleus
output: relational-history-fiber-fixed-layer
ast:
  grounding-evaluation:
    - entity-a
    - entity-b
    - saturation-nucleus:
        - facticity-check
        - non-circularity-check
        - content-backing-check
        - hyperintensionality-check
title: Flatfile Agential Resource System Grounding Claim
---

# Flatfile Agential Resource System Grounding Claim

## What this is

A **FlatfileAgentialResourceSystemGroundingClaim** is a proposed [grounding](../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-simulation-system-services-section/services/astronomy-position-computation-service/research-source/_archive/world/scripts/mediating/content/mediating-nucleus/scripts/grounding/grounding.md) relation expressed as a [RelationalHistoryFiberDoctrineLanguage](../math/relational-history-fiber-doctrine-language.md) proposition and evaluated through the locale's nuclear language.

It is a first-class [RelationalEntity](relational-entity.md): it has an `id`, a `description`, and a `status`.
It records the claim, the evidence for it, the saturation result, and whether it has settled.

A FlatfileAgentialResourceSystemGroundingClaim is NOT the same as a `grounding:` frontmatter entry.
A `grounding:` entry is settled — it has already been evaluated and stabilized.
A FlatfileAgentialResourceSystemGroundingClaim is the in-progress evaluation that either produces a `grounding:` entry or records why it did not settle.

## Lifecycle

1. **Proposed** — the claim "entity_a grounds entity_b" is expressed as a Prop term.
  The Prop is: `σ(entity_a) ≥ entity_b`, i.e. entity_b falls within the saturation closure of entity_a.

2. **Evaluated** — the saturation nucleus σ is applied to the claim.
  Four conditions are checked (see below).
  If all four hold: the claim is at a fixed point — `σ(claim) = claim`.

3. **Settled** — the claim is stable.
  Write `grounding: entity_b` to entity_a's frontmatter.
  The FlatfileAgentialResourceSystemGroundingClaim record may be archived or deleted.

4. **Rejected** — one or more conditions failed.
  Record the FlatfileAgentialResourceSystemGroundingClaim with status `open` and the blocking condition.
  The claim stays open until the blocking condition is resolved.

A FlatfileAgentialResourceSystemGroundingClaim MUST record all four saturation conditions and their pass/fail status.
A FlatfileAgentialResourceSystemGroundingClaim MUST have status `settled` only when all four conditions pass.
A FlatfileAgentialResourceSystemGroundingClaim MUST have a `blocking` field naming the first failing condition when status is `open`.

## Saturation conditions

A FlatfileAgentialResourceSystemGroundingClaim `σ(entity_a grounds entity_b) = (entity_a grounds entity_b)` holds iff all four conditions are satisfied:

1. **Facticity** — both entity_a and entity_b exist and have `defines:` values.
  Neither is a stub or broken reference.

2. **Non-circularity** — entity_b does not have a grounding path back to entity_a.
  Formally: entity_b does not carry `grounding: entity_a` and there is no chain of `grounding:` edges from entity_b back to entity_a.

3. **Content-backing** — entity_a's content genuinely explains entity_b's content.
  Not co-occurrence or topic overlap.
  For math→spec: entity_a's `kind:` is theorem, lemma, or corollary, and entity_a's body contains reasoning about entity_b's defining property.
  For spec→spec: entity_a satisfies a more concrete level and entity_b is the abstract type entity_a implements.

4. **Hyperintensionality** — the grounding is specific.
  The relation must survive substitution of equivalent propositions: replacing entity_b with a necessarily-equivalent alternative must break the grounding (otherwise the grounding is merely logical entailment, not genuine grounding).
  In practice: entity_a's content must reference entity_b by its specific content, not by a property shared with all equivalent propositions.

## Open questions
