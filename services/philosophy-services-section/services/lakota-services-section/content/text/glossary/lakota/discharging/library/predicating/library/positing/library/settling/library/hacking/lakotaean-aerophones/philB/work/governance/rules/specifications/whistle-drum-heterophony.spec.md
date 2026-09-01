# Specification: whistle-drum-heterophony

Normative specification of a correct realization of [whistle-drum-heterophony](../../../code/structures/whistle-drum-heterophony.md).

## Invariants (MUST)

1. **Three components.** A whistle-drum-heterophony instance MUST contain: W (a single-tone-object or stochastic-cluster), D (a drum stream), and μ (a metric pulse supplied by D).
2. **Whistle pulse aligned to meter.** The whistle's breath-pulse-sequence MUST be aligned to μ via [pulse-import](../../../code/transformers/pulse-import.md), with alignment tolerance δ ~ tens of milliseconds.
3. **Timbral distinctness.** W and D MUST occupy timbrally distinct spectral regions (high-frequency narrow-band whistle vs. low-frequency broad-spectrum drum).

## Conditions (SHOULD)

1. A realization SHOULD allow W to be a multi-whistle stochastic-cluster, in which case the cluster shares the imported meter across all support points.
2. A realization SHOULD permit small temporal offsets (the whistle attack typically follows the drum attack by δ) — this is heterophony, not unison.

## Forbidden (MUST NOT)

1. A whistle-drum-heterophony MUST NOT collapse the two streams into unison (exact temporal alignment with no offset would be unison, not heterophony).
2. The whistle MUST NOT generate the meter — it adopts the drum's meter.
  A whistle generating its own regular pulse is a different (and not idiomatic) structure.
