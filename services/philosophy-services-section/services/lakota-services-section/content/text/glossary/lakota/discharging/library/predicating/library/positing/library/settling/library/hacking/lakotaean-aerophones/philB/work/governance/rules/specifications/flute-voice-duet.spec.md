# Specification: flute-voice-duet

Normative specification of a correct realization of [flute-voice-duet](../../../code/structures/flute-voice-duet.md).

## Invariants (MUST)

1. **Two streams.** A flute-voice-duet instance MUST contain two music streams: V (voice) and F (cedar flute).
2. **Shared pitch space.** V and F MUST operate in the same [pitch-space](../../../code/structures/pitch-space.md) Z₅ × R⁺ (modulo voice's continuous-pitch flexibility quantized on F).
3. **Shared phrase grammar.** V and F MUST share the same set of phrase shapes and the same rubato pacing.
4. **Temporal synchronization.** The two streams MUST be temporally related: either substitution (one carries the line at any moment) or antiphony (alternating phrases or phrase-halves).

## Conditions (SHOULD)

1. A realization SHOULD support both substitution and antiphony configurations.
2. A realization SHOULD admit the [instrumentalization](../../../code/transformers/instrumentalization.md) morphism mapping V to F.

## Forbidden (MUST NOT)

1. A flute-voice-duet MUST NOT use pitch spaces that differ between V and F (e.g., voice on a heptatonic scale while flute is on pentatonic — that would not be the duet structure documented in the Lakotaean source).
2. A flute-voice-duet MUST NOT impose external meter (it inherits the non-metric temporal substrate of both streams).
