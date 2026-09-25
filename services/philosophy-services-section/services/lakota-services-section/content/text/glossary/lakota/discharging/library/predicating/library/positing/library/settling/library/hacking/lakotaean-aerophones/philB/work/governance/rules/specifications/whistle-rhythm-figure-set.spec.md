---
title: "Specification: whistle-rhythm-figure-set"
description: Normative specification of a correct realization of whistle-rhythm-figure-set.
---
# Specification: whistle-rhythm-figure-set

Normative specification of a correct realization of [whistle-rhythm-figure-set](../../../../code/structures/whistle-rhythm-figure-set.md).

## Invariants (MUST)

1. **Four entries.** The standard whistle-rhythm-figure-set MUST contain exactly four named figures: single-tone, paired-tones, triplet, and sustained-with-pulse.
2. **Event-count specification.** Each figure MUST be specified by its event count (1 for single-tone, 2 for paired-tones, 3 for triplet, 1-with-internal-articulation for sustained-with-pulse).
3. **Temporal-spacing specification.** Multi-event figures (paired-tones, triplet) MUST specify the temporal spacing between events.
  Sustained-with-pulse MUST specify the internal [breath-pulse](../../../../../b4/breath-pulse/breath-pulse.md) sequence pattern.
4. **Composable with envelope-set.** Each figure MUST be combinable with entries from the [whistle-envelope-set](../../../../code/structures/whistle-envelope-set.md), producing whistle articulation events suitable for use in whistle "tunes."

## Conditions (SHOULD)

1. The rhythm-figure-set SHOULD specify, for each figure, the principal use-context (single-tone for markers and accents; paired-tones for emphatic groupings; triplet for climactic articulations; sustained-with-pulse for rhythmic-textural [heterophony](../../../../prose/teaching/explanations/heterophony.md) with [drum](../../../../../b4/drum/drum.md)).
2. The rhythm-figure-set SHOULD support both non-metric (solo whistle, organized by relative spacing) and metric ([drum](../../../../../b4/drum/drum.md)-anchored ensemble, aligned to the drum's pulse) deployments of each figure.
3. The rhythm-figure-set SHOULD identify idiomatic and unidiomatic combinations with the [whistle-envelope-set](../../../../code/structures/whistle-envelope-set.md) — e.g., triplet × sharp-attack-long-sustain-warble-decay is unidiomatic (long sustains would overlap), but single-tone × sharp-attack-long-sustain-warble-decay is canonical (the classic signal call).

## Forbidden (MUST NOT)

1. The rhythm-figure-set MUST NOT contain figures that imply pitch variation across the figure.
  All events of a figure sound the whistle's fixed [fundamental](../../../../prose/teaching/explanations/fundamental.md); pitch variation is not a rhythmic property.
2. The rhythm-figure-set MUST NOT collapse the four figures into a smaller number.
  Each figure has a distinct event-count and temporal-organization, and corresponds to a distinct musical-functional category.
3. The rhythm-figure-set MUST NOT specify temporal spacings that are physically unrealizable on the whistle (e.g., spacings shorter than the minimum sustainable attack-and-release time of a whistle articulation, which is roughly 50 milliseconds).
