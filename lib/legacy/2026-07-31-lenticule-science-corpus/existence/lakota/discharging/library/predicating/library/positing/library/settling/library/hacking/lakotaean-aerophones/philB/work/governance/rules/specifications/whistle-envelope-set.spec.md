# Specification: whistle-envelope-set

Normative specification of a correct realization of [whistle-envelope-set](../../../code/structures/whistle-envelope-set.md).

## Invariants (MUST)

1. **Four entries.** The standard whistle-envelope-set MUST contain exactly four named envelope archetypes: sharp-attack-short-sustain, sharp-attack-long-sustain-warble-decay, rolled-attack-long-sustain, and pulsed-sustain.
2. **Attack-sustain-decay decomposition.** Each envelope archetype MUST be specified as the composition of an attack segment, a sustain segment, and a decay segment, with each segment having a definite shape parameter.
3. **Applied to fixed fundamental.** Each envelope archetype MUST be applicable to the whistle's fixed [fundamental](../../../prose/teaching/explanations/fundamental.md).
  Envelopes that would require pitch variation are not part of this set (the whistle is single-pitch).
4. **Mutual distinguishability.** The four archetypes MUST be perceptually distinguishable — a knowledgeable listener can identify which archetype a given whistle event instantiates.
  Archetypes whose distinguishing features collapse perceptually MUST be merged into a single archetype.

## Conditions (SHOULD)

1. The envelope-set SHOULD specify typical duration ranges for each archetype (e.g., sharp-attack-short-sustain typically 0.2–0.5 seconds; long-sustain archetypes typically 1.5–4 seconds).
2. The envelope-set SHOULD compose with the [whistle-rhythm-figure-set](../../../code/structures/whistle-rhythm-figure-set.md) to form whistle "tunes" — sequences of envelope-instantiations arranged in rhythmic figures.
3. The envelope-set SHOULD specify the principal use-context for each archetype (alert, signal, ceremonial entry, rhythmic-textural).

## Forbidden (MUST NOT)

1. The whistle-envelope-set MUST NOT contain envelopes that imply pitch variation across the envelope's duration.
  The whistle is single-pitch; pitch variation within an envelope would constitute a different kind of articulation.
2. The whistle-envelope-set MUST NOT collapse the four archetypes into a smaller number by treating them as variants of a common shape.
  Each archetype has a distinct attack-sustain-decay profile and a distinct musical function.
3. The whistle-envelope-set MUST NOT specify envelope parameters that are physically unrealizable (e.g., a sustain longer than achievable on a single breath).
