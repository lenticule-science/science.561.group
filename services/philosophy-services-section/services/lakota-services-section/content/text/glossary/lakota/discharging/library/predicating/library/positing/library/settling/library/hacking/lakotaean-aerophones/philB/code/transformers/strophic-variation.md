---
title: strophic-variation
description: The operation taking a strophe-template and a variation specification, and producing a realized strophe by applying ornament-substitutions and small rhythmic shifts at selected positions.
---
# strophic-variation

The operation taking a [strophe](../../prose/teaching/explanations/strophe.md)-template and a variation specification, and producing a realized strophe by applying [ornament-substitutions](./ornament-substitution.md) and small rhythmic shifts at selected positions.

## Definition

The **strophic-variation** transformer is the map

V : StropheTemplate × VariationSpec → RealizedStrophe

where a *strophe-template* is a sequence of phrase-templates (each instantiating an entry from the [phrase-archetype-set](../structures/phrase-archetype-set.md)) with cadence selections from the [cadence-set](../structures/cadence-set.md), a *variation specification* is a mapping from positions-within-the-strophe to substitution-instructions (ornament-substitutions to apply at each named position, and rhythmic-shift parameters for designated phrase positions), and a *realized strophe* is a concrete sequence of phrases each consisting of concrete flute-note triples ready for performance.

The map V(Σ, ν) proceeds as follows:

1. **Materialize the template**: Realize the strophe-template Σ as a sequence of plain phrases (each phrase a sequence of (scale-degree, duration, plain) triples instantiating its phrase-archetype, with the cadence-position phrase ending on the cadence-selection's terminal scale-degree).
2. **Apply ornament substitutions**: For each (position, orn-spec) entry in ν, apply [ornament-substitution](./ornament-substitution.md) at the named position with the named ornament(s).
3. **Apply rhythmic shifts**: For each (phrase-position, shift-spec) entry in ν, adjust the durations of notes within the phrase per the shift specification (typically: elongation of melodic peaks, compression of stepwise passages, syncopation of selected interior beats).
4. **Apply cadential reinforcement**: For the strophe-final phrase, ensure that the cadence carries its conventional terminal [warble](../../../b4/warble/warble.md) (this is done by default; ν may specify alternative cadential ornaments).

The resulting realized strophe is one of many possible variants of the underlying strophe-template Σ; different variation specifications ν produce different realized strophes from the same template.

## Properties

- **Template-preserving**: V(Σ, ν) preserves the melodic identity of Σ — the underlying scale-degree sequence is unchanged, only ornaments and small rhythmic detail vary.
- **Variation-space dependent**: The space of possible realized strophes from a given template is determined by the cardinality of the variation-specification space, which in turn is determined by the [ornament-glossary](../structures/ornament-glossary.md)'s placement and combination rules at each position of the template.
- **Composes into strophic-form**: Repeated application of V with different variation specifications across n strophes produces a [strophic-form](../structures/strophic-form.md) realization R_1, R_2, …, R_n with each R_k = V(Σ, ν_k).
- **Player-style-bearing**: The pattern of variation specifications a player characteristically chooses constitutes part of their stylistic identity; different players produce different ν-sequences for the same Σ, and the resulting strophic-form realizations differ recognizably.
- **Convention-respecting**: Across the n strophes of a typical performance, the variation specifications conventionally produce increasingly conclusive cadences (V(Σ, ν_n) ends on a higher-weight cadence than V(Σ, ν_1)), audibly marking the song's progression toward its end.

## Source claim

[ornament-vocabulary](../../prose/learning/claims/ornament-vocabulary.md) (the source of [ornament-substitution](./ornament-substitution.md), the principal mechanism of strophic-variation).
