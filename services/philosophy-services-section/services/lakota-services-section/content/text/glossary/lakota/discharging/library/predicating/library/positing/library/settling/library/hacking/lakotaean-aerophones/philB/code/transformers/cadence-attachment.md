# cadence-attachment

The operation selecting a [cadence](../prose/teaching/explanations/cadence.md) from the [cadence-set](../structures/cadence-set.md) and attaching it to a [phrase](../prose/teaching/explanations/phrase.md) as the phrase's terminal gesture.

## Definition

The **cadence-attachment** transformer is the map

κ : PhraseBody × Cadence → Phrase

where a *phrase body* is the non-terminal portion of a phrase (a sequence of flute-note triples up to but not including the cadential terminus), a *cadence* is an entry from the [cadence-set](../structures/cadence-set.md), and a *phrase* is the complete phrase (phrase body + cadential terminus).

The map κ(body, cad) appends to the phrase body a sequence of flute-note triples realizing the cadence's melodic content:

- For a *descending cadence* (descending-minor-third, descending-perfect-fourth, descending-perfect-fifth), append the cadence's pre-tonic scale-degrees in order, then the terminal tonic (with optional terminal ornament from the cadence's specification).
- For the *held-tonic-with-warble cadence* as a standalone, append a single extended-duration tonic note with a [warble](../prose/teaching/explanations/warble.md) ornament.
  As a *modifier* combined with a descending cadence, the held-tonic-with-warble is realized by replacing the terminal tonic note of the descending cadence with an extended-duration tonic-with-warble.

The cadence selection is subject to *compatibility constraints* with the phrase body — the phrase body must end on a scale-degree that allows for a smooth approach to the cadence's first scale-degree.
For the descending-minor-third cadence (b3 → 1), the phrase body's terminal scale-degree must be at or above b3 (typically 4, 5, or b7); for the descending-perfect-fifth cadence (5 → 4 → b3 → 1), the body's terminal scale-degree must be at or above 5; and so on.

## Properties

- **Phrase-completing**: The output of κ is a complete phrase, suitable for use as a constituent of a [strophe](../prose/teaching/explanations/strophe.md).
- **Compatibility-constrained**: κ is *partial* — only certain (body, cadence) pairs are compatible; selecting an incompatible cadence produces an unidiomatic phrase.
- **Cadence-weight bearing**: The selection of cadence determines the phrase's closural weight, which is part of how [strophic-form](../structures/strophic-form.md) marks structural levels (internal phrases use lower-weight cadences, strophe-final phrases use higher-weight cadences).
- **Reversible identification**: Given a complete phrase, the cadence portion can be identified by examining the phrase's terminal scale-degrees and ornaments — so κ has a partial inverse (decomposition of a phrase into body + cadence).
- **Composes into phrase-archetype instantiation**: A complete instantiation of a [phrase-archetype](../structures/phrase-archetype-set.md) is the application of κ to a body-instantiation of the archetype's pre-cadential template with a cadence-selection for the archetype's cadence-position.

## Source claim

[cadence-vocabulary](../prose/learning/claims/cadence-vocabulary.md).
