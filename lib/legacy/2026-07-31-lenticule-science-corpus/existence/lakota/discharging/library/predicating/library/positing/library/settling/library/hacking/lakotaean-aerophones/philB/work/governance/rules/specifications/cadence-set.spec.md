# Specification: cadence-set

Normative specification of a correct realization of [cadence-set](../../../code/structures/cadence-set.md).

## Invariants (MUST)

1. **Four entries.** The standard cadence-set MUST contain exactly four named cadences: descending-minor-third, descending-perfect-fourth, descending-perfect-fifth, and held-tonic-with-warble.
2. **Tonic-terminating.** All descending cadences in the set MUST terminate on scale-degree 1 ([fundamental](../../../prose/teaching/explanations/fundamental.md)) of the [pentatonic-minor-scale](../../../code/structures/pentatonic-minor-scale.md).
  A cadence ending on a non-tonic scale-degree is not a member of this set.
3. **Closural weight ordering.** Each cadence MUST be assigned a closural weight; the weights MUST induce a partial order with the descending-perfect-fifth cadence ranked highest among the standalone descending cadences, descending-minor-third ranked second, descending-perfect-fourth ranked third, and held-tonic-with-warble functioning as a modifier (+1 closural weight) when combined with a descending cadence.
4. **Descending motion.** All descending cadences MUST exhibit descending melodic motion from the pre-tonic scale-degree(s) to the tonic.
  An ascending or static cadential figure is not a member of this set.

## Conditions (SHOULD)

1. The cadence-set SHOULD support combination of the held-tonic-with-warble modifier with any of the three descending cadences, producing combined cadences with appropriately summed closural weights.
2. The cadence-set SHOULD allow optional terminal-ornament attachment to each descending cadence (e.g., a slight slide into the terminal tonic), even when not combined with the held-tonic-with-warble modifier.
3. The cadence-set SHOULD admit recognition of additional rare cadential figures (e.g., terminal trills) as marginal members not part of the conventional core, without expanding the conventional core.

## Forbidden (MUST NOT)

1. The cadence-set MUST NOT contain cadences that resolve to a non-tonic scale-degree.
  A "cadence on b3" or "cadence on 5" is not a member of the cedar-flute repertoire's cadence vocabulary.
2. The cadence-set MUST NOT contain cadences whose melodic content includes ornament-decorated scale-degrees that are not on the [pentatonic-minor-scale](../../../code/structures/pentatonic-minor-scale.md).
  Cadences are within the scale; they do not introduce chromatic content.
3. The cadence-set MUST NOT collapse the closural-weight distinctions among the cadences.
  The closural hierarchy is one of the principal music-theoretic devices for marking structural levels in [strophic-form](../../../code/structures/strophic-form.md); a flat closural-weight assignment would defeat this purpose.
