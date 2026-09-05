# Specification: single-tone-object

Normative specification of a correct realization of [single-tone-object](../../../code/structures/single-tone-object.md).

## Invariants (MUST)

1. **Pitch coordinate degenerate.** A single-tone-object instance MUST fix a single f* ∈ R⁺ as its pitch; no other pitch is produced under normal play.
2. **Breath-pulse sequence well-formed.** The temporal coordinate ρ MUST be a function N → R⁺ × R⁺ (pulse-duration, post-silence).
3. **Per-pulse envelope.** Each pulse k MUST carry a timbral-envelope eₖ : [0, τₖ] → R⁺ where τₖ is the k-th pulse's duration.

## Conditions (SHOULD)

1. A realization SHOULD acknowledge that the music-theoretic content is concentrated in the temporal and envelope coordinates, not the (degenerate) pitch coordinate.
2. A realization SHOULD compose with [aggregation](../../../code/transformers/aggregation.md) when multiple single-tone-objects play simultaneously.

## Forbidden (MUST NOT)

1. Treating a single-tone-object as outside music theory because "it only plays one note" is a category error and is forbidden by this specification.
2. A single-tone-object MUST NOT introduce a non-degenerate pitch coordinate (that would make it a different structure).
