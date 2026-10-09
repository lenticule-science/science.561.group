---
title: "Specification: ornament-glossary"
description: Normative specification of a correct realization of ornament-glossary.
---
# Specification: ornament-glossary

Normative specification of a correct realization of [ornament-glossary](../../../../code/structures/ornament-glossary.md).

## Invariants (MUST)

1. **Seven entries.** The standard ornament-glossary MUST contain exactly seven named ornaments: warble, finger-pop, finger-slide, cut, tap, trill, and breath-pulse.
2. **Mechanism specification.** Each ornament in the glossary MUST be assigned a definite articulatory mechanism, drawn from the three categories: finger-controlled, breath-controlled, or jet-instability-controlled.
  The mechanism MUST match the ornament's documented physical realization.
3. **Placement specification.** Each ornament MUST be assigned a definite set of admissible positions within a [phrase](../../../../prose/teaching/explanations/phrase.md).
  Admissible positions include cadential, mid-phrase, phrase-beginning, inter-note, and within-tone.
4. **Combination predicate.** Each ornament MUST be assigned a combination predicate specifying which other ornaments it can combine with (sequentially or simultaneously) on the same host tone.

## Conditions (SHOULD)

1. The ornament-glossary SHOULD distinguish between ornaments that occupy the entire host tone (warble, trill) and ornaments that are brief events at a specific time-position within the host tone (finger-pop, cut, tap).
2. The ornament-glossary SHOULD support player-tradition variation in the placement and combination rules, allowing for documented stylistic differences across lineages without requiring a single canonical specification.
3. The ornament-glossary SHOULD distinguish *core* ornaments (the seven conventional members) from *marginal* ornaments (rare or novel articulatory devices) that may appear in contemporary or experimental playing but are not part of the inherited vocabulary.

## Forbidden (MUST NOT)

1. The ornament-glossary MUST NOT admit ornaments that fundamentally alter the scale-degree of the host tone.
  An "ornament" that replaces the host scale-degree with a different scale-degree is a melodic substitution, not an ornament.
2. The ornament-glossary MUST NOT specify ornament combinations that are physically impossible — e.g., a simultaneous [warble](../../../../../b4/warble/warble.md) and [trill](../../../../prose/teaching/explanations/trill.md), where both occupy the entire host tone via incompatible mechanisms.
3. The ornament-glossary MUST NOT collapse the seven distinct ornaments into a smaller number by treating them as variants of a common type.
  Each named ornament has a distinct articulatory mechanism and a distinct musical function; merging them loses the music-theoretic content.
