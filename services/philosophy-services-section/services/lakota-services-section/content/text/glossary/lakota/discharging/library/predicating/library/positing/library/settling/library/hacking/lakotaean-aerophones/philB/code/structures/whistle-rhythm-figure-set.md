---
title: whistle-rhythm-figure-set
description: The named set of rhythmic figures used by the eagle-wing-bone-whistle and related single-pitch Lakotaean aerophones to organize whistle events in time.
---
# whistle-rhythm-figure-set

The named set of rhythmic figures used by the [eagle-wing-bone-whistle](../../../b4/eagle-wing-bone-whistle/eagle-wing-bone-whistle.md) and related single-pitch Lakotaean aerophones to organize whistle events in time.

## Definition

A **whistle-rhythm-figure-set** is a named indexed set

RF = { (name, event-count, temporal-spacing, sub-articulation) | name ∈ Names }

where each rhythmic figure is identified by a name, specifies the number of whistle events it comprises, specifies their temporal spacing pattern, and (for sustained figures) specifies any internal sub-articulation by [breath-pulses](../../../b4/breath-pulse/breath-pulse.md).

The standard whistle-rhythm-figure-set RF_std:

| Name | Event count | Temporal spacing | Internal articulation | Typical use |
|---|---|---|---|---|
| single-tone | 1 | n/a | n/a | marker, accent, [phrase](../../prose/teaching/explanations/phrase.md)-end |
| paired-tones | 2 | 0.25–0.5 s between events | n/a | emphatic grouping, doubled alert |
| triplet | 3 | even spacing, total span 0.5–1 s | n/a | elaborate articulation, climax |
| sustained-with-pulse | 1 (with internal pulses) | n/a (single event with internal structure) | regular or patterned [breath-pulse](../../../b4/breath-pulse/breath-pulse.md) sequence | rhythmic-textural, [heterophonic](../../prose/teaching/explanations/heterophony.md) interaction with [drum](../../../b4/drum/drum.md) |

A whistle articulation event is the combination of a rhythmic figure (from RF_std) with an envelope archetype (from [whistle-envelope-set](./whistle-envelope-set.md)) applied to each constituent event of the figure.
The product space of rhythmic-figure-set × whistle-envelope-set has 16 elements; in practice, certain combinations are idiomatic and others are not (e.g., triplet with sharp-attack-long-sustain-with-warble would produce overlapping long-sustains and is not idiomatic).

## Properties

- **Finite**: The conventional whistle-rhythm-figure-set has exactly four entries.
- **Event-count-typed**: The figures are organized by event count (one, two, three, or sustained-with-internal-structure).
- **Compositional with envelope-set**: Rhythmic figures combine with [whistle-envelope-set](./whistle-envelope-set.md) entries to form the whistle's complete articulation vocabulary.
- **Non-metric except in ensemble**: For solo whistle calls, the rhythmic figures are organized by relative spacing rather than against an external metric grid.
  In [drum](../../../b4/drum/drum.md)-anchored ensemble contexts, the figures align to the drum's metric pulse.
- **Combinable into tunes**: A *whistle tune* is a sequence of (rhythmic-figure, envelope-archetype) pairs deployed across the structural moments of a song.

## Source claim

[whistle-rhythm-vocabulary](../../prose/learning/claims/whistle-rhythm-vocabulary.md).

## Specification

[whistle-rhythm-figure-set.spec](../../work/governance/rules/specifications/whistle-rhythm-figure-set.spec.md).
