---
title: "Specification: non-metric-temporal-substrate"
description: Normative specification of a correct realization of non-metric-temporal-substrate.
---
# Specification: non-metric-temporal-substrate

Normative specification of a correct realization of [non-metric-temporal-substrate](../../../../code/structures/non-metric-temporal-substrate.md).

## Invariants (MUST)

1. **No regular pulse.** A non-metric-temporal-substrate instance MUST NOT impose a regular underlying pulse against which note-durations are measured.
2. **Phrase-bounded organization.** The lowest organizational unit MUST be the phrase, bounded by breath rests.
3. **Strophic at the song level.** The highest organizational unit MUST be the strophic song.

## Conditions (SHOULD)

1. A realization SHOULD permit rubato — continuous variation in note-duration within a phrase.
2. A realization SHOULD admit phrase-shape tags from [phrase-shape](../../../../code/structures/phrase-shape.md).

## Forbidden (MUST NOT)

1. A non-metric-temporal-substrate MUST NOT be combined with a drum-imported meter at the structural level (that combination produces a [whistle-drum-heterophony](../../../code/structures/whistle-drum-heterophony.md), a distinct ensemble structure).
