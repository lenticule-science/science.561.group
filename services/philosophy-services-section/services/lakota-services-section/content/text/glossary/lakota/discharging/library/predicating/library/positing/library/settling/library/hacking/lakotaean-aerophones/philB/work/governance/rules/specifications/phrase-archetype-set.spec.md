# Specification: phrase-archetype-set

Normative specification of a correct realization of [phrase-archetype-set](../../../code/structures/phrase-archetype-set.md).

## Invariants (MUST)

1. **Finite set.** The phrase-archetype-set MUST be finite.
  The conventional set contains four entries (descending-cadence, peak-and-return, repeat-and-vary, stepped-descent); extensions are permitted but the set MUST remain finite and enumerable.
2. **Template, not concrete melody.** Each archetype MUST be specified as a *template* — a pitch-contour shape, ornament-position set, and cadence-position — rather than as a specific concrete melody.
  Many concrete phrases instantiate each template.
3. **Tonic-terminating.** Each archetype's cadence-position MUST be the final position of the phrase, and the cadence MUST resolve to the [fundamental](../../../prose/teaching/explanations/fundamental.md) (scale-degree 1).
4. **Pentatonic-scale content.** Each archetype's contour template MUST use only scale-degrees from the [pentatonic-minor-scale](../../../code/structures/pentatonic-minor-scale.md).

## Conditions (SHOULD)

1. The phrase-archetype-set SHOULD include the descending-cadence archetype as the predominant template, reflecting its documented majority presence in the repertoire.
2. The phrase-archetype-set SHOULD support extension to additional archetypes if further survey work documents archetypes not yet captured.
3. Each archetype SHOULD specify the typical cadence type that attaches at the cadence-position (e.g., descending-cadence with descending-minor-third; peak-and-return with held-tonic).

## Forbidden (MUST NOT)

1. A phrase-archetype MUST NOT specify a contour that does not terminate at the tonic.
  Phrases in the cedar-flute repertoire resolve to the tonic at the cadence; an archetype that does not resolve is not part of the cedar-flute idiom.
2. A phrase-archetype MUST NOT specify a contour exceeding the [cedar-flute](../../../prose/teaching/explanations/cedar-flute.md)'s playing range.
  The principal first-octave range covers scale-degrees 1 through 8; an archetype requiring pitches above this range without [overblowing](../../../prose/teaching/explanations/overblowing.md) is unrealistic.
3. A phrase-archetype MUST NOT require non-pentatonic-scale content.
  Phrases stay within the scale; chromatic notes outside the scale are not part of the idiom.
