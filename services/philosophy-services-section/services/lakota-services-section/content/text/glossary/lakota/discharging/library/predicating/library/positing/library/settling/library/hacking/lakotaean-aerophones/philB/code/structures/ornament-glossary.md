---
title: ornament-glossary
description: The named set of ornaments used in the cedar-flute repertoire, with their articulation mechanisms, characteristic placements, and combination rules.
---
# ornament-glossary

The named set of [ornaments](../../prose/teaching/explanations/ornament.md) used in the [cedar-flute](../../../b4/cedar-flute/cedar-flute.md) repertoire, with their articulation mechanisms, characteristic placements, and combination rules.

## Definition

An **ornament-glossary** is a structured set

Orn = { (name, mechanism, placement, combine) | name ∈ Names }

where each ornament is identified by a name, has a definite articulation mechanism (finger-controlled, breath-controlled, or jet-instability-controlled), has a set of admissible placements within a [phrase](../../prose/teaching/explanations/phrase.md) (cadential, mid-phrase, inter-note, etc.), and has a combination predicate specifying which other ornaments it can combine with simultaneously on the same host tone.

The standard cedar-flute ornament-glossary Orn_std:

| Name | Mechanism | Placement | Combine with |
|---|---|---|---|
| [warble](../../../b4/warble/warble.md) | jet-instability | cadential (principal), mid-phrase (occasional, sustained tones) | [finger-slide](../../../b4/finger-slide/finger-slide.md) (sequentially) |
| [finger-pop](../../../b4/finger-pop/finger-pop.md) | finger-controlled | mid-phrase (principal), cadential approach (occasional) | none (single-event) |
| [finger-slide](../../../b4/finger-slide/finger-slide.md) | finger-controlled | phrase-beginning, mid-phrase, cadential approach | [warble](../../../b4/warble/warble.md) (sequentially, slide → warble on terminal) |
| [cut](../../../b4/cut/cut.md) | finger-controlled | mid-phrase (principal) | none (single-event) |
| [tap](../../../b4/tap/tap.md) | finger-controlled (percussive) | mid-phrase (on sustained tones) | [breath-pulse](../../../b4/breath-pulse/breath-pulse.md) (sequentially or simultaneously) |
| [trill](../../prose/teaching/explanations/trill.md) | finger-controlled (alternation) | mid-phrase (on sustained tones), cadential preparation | none (occupies entire host tone) |
| [breath-pulse](../../../b4/breath-pulse/breath-pulse.md) | breath-controlled | inter-note (principal), within-tone (rhythmic articulation) | [tap](../../../b4/tap/tap.md), [finger-slide](../../../b4/finger-slide/finger-slide.md) |

The combination column indicates which other ornaments the given ornament can co-occur with on the same host tone.
"None" indicates that the ornament occupies the host tone exclusively.
"Sequentially" indicates that the two ornaments can occur on the same host tone but at different time-positions within it.
"Simultaneously" indicates that the two ornaments can be applied at the same time-position.

## Properties

- **Seven items**: The conventional ornament-glossary has exactly seven entries.
- **Mechanism-grouped**: The ornaments fall into three mechanism groups (finger-controlled, breath-controlled, jet-instability-controlled), which partly determine combination rules (mechanisms of different groups can usually combine; same-group mechanisms often cannot).
- **Placement-typed**: Each ornament has a definite set of admissible placements; ornament-substitution operations must respect the placement constraints.
- **Combination-rule-bound**: The space of admissible ornament combinations is smaller than the Cartesian product space of the individual ornaments; the combination predicates specify the admissible combinations.
- **Idiomatic completeness**: The seven ornaments cover the documented core idiom; novel ornaments may appear in contemporary playing but are not part of the inherited glossary.

## Source claim

[ornament-vocabulary](../../prose/learning/claims/ornament-vocabulary.md).

## Specification

[ornament-glossary.spec](../../work/governance/rules/specifications/ornament-glossary.spec.md).
