# Specification: timbral-envelope

Normative specification of a correct realization of [timbral-envelope](../../../code/structures/timbral-envelope.md).

## Invariants (MUST)

1. **Function on the pulse duration.** A timbral-envelope instance MUST be a function e : [0, T] → R⁺ for some pulse duration T > 0.
2. **Non-negative loudness.** e(t) MUST be non-negative for all t ∈ [0, T].
3. **Defined per pulse.** Each pulse in a breath-pulse-sequence carries its own envelope.

## Conditions (SHOULD)

1. A realization SHOULD support characterization by (attack-time τ_a, sustain-level, decay-time τ_d).
2. A realization SHOULD be continuous (loudness varies smoothly within a pulse); discontinuities indicate sub-pulse articulation events.

## Forbidden (MUST NOT)

1. A timbral-envelope MUST NOT introduce pitch information (pitch is handled by the surrounding single-tone-object's f*).
