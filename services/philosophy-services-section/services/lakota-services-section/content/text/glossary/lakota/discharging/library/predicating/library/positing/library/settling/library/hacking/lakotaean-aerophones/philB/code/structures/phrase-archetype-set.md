# phrase-archetype-set

The named set of [phrase](../prose/teaching/explanations/phrase.md) shapes that appear in the [cedar-flute](../prose/teaching/explanations/cedar-flute.md) [courting-song](../prose/teaching/explanations/courting-song.md) repertoire, with their specific pitch-contours, characteristic ornament placements, and cadential conventions.

## Definition

A **phrase-archetype-set** is a named set of phrase-shape templates

Φ = { (name, contour, ornament-positions, cadence-position) | name ∈ Names }

where each archetype is identified by a name, has a definite pitch-contour template (a sequence of scale-degrees from the [pentatonic-minor-scale](./pentatonic-minor-scale.md) defining the phrase's melodic shape), a set of positions where [ornaments](../prose/teaching/explanations/ornament.md) are characteristically applied (drawn from the [ornament-glossary](./ornament-glossary.md)), and a cadence-position specification (typically the final position, with a [cadence](../prose/teaching/explanations/cadence.md) drawn from the [cadence-set](./cadence-set.md)).

The standard cedar-flute phrase-archetype-set Φ_std:

| Name | Contour template | Ornament positions | Cadence position | Example concrete contour |
|---|---|---|---|---|
| descending-cadence | ⟨peak, …, b3, 1⟩ | mid-phrase optional | final (descending-minor-third or descending-perfect-fourth) | ⟨b7, 5, 4, b3, 1⟩ |
| peak-and-return | ⟨1, …, peak, …, 1⟩ | peak optional | final (held-tonic) | ⟨1, b3, 4, 5, 4, b3, 1⟩ |
| repeat-and-vary | ⟨motif, motif'⟩ | motif-end optional | final (descending or held-tonic) | ⟨5, 4, b3, 5, 4, b3, 1⟩ |
| stepped-descent | ⟨peak1, …, peak2, …, 1⟩ | each peak optional | final (descending) | ⟨b7, 5, b3, 5, 4, b3, 1⟩ |

The four archetypes are *templates* — they specify the structural shape of the phrase, not its specific note-by-note content.
A given concrete phrase in the repertoire instantiates a template by filling in the specific scale-degrees, durations, and ornament choices.

## Properties

- **Finite**: The conventional phrase-archetype-set has four entries; further archetypes may emerge from continued survey work.
- **Template, not concrete melody**: Each archetype specifies a shape, not a fixed melody; many concrete phrases instantiate each template.
- **Descending bias**: All four archetypes terminate at the [fundamental](../prose/teaching/explanations/fundamental.md) and exhibit descending motion in their final segment.
- **Cadence-attached**: Each archetype has a designated cadence-position (typically the final position) at which a [cadence](../prose/teaching/explanations/cadence.md) from the [cadence-set](./cadence-set.md) attaches.
- **Compositionality**: A [strophe](../prose/teaching/explanations/strophe.md) is composed of a sequence of phrases each of which instantiates an archetype; archetype choices across the strophe contribute to the strophe's overall musical character.

## Source claim

[phrase-bounded-by-single-breath](../prose/learning/claims/phrase-bounded-by-single-breath.md).

## Specification

[phrase-archetype-set.spec](../work/governance/rules/specifications/phrase-archetype-set.spec.md).
