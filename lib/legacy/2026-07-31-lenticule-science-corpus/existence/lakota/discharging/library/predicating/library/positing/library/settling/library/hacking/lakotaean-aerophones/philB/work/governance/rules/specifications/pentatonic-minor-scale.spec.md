# Specification: pentatonic-minor-scale

Normative specification of a correct realization of [pentatonic-minor-scale](../../../code/structures/pentatonic-minor-scale.md).

## Invariants (MUST)

1. **Cardinality.** A pentatonic-minor-scale instance MUST contain exactly five distinct pitch classes.
2. **Cyclic interval signature.** Adjacent intervals, taken cyclically, MUST be ⟨3, 2, 2, 3, 2⟩ semitones.
3. **Octave closure.** The cyclic interval sum MUST equal 12 semitones.
4. **No internal rotation symmetry.** No non-trivial cyclic shift of the interval signature MUST fix it (otherwise the modal cycle collapses to a proper subgroup).

## Conditions (SHOULD)

1. A realization SHOULD specify the tonic as one of the five degrees, even though the abstract scale is rotation-symmetric only in the trivial sense.
2. A realization SHOULD admit instantiation at any fundamental f₀ ∈ R⁺ (transposition is closed under this specification).

## Forbidden (MUST NOT)

1. Any realization with more or fewer than 5 distinct pitch classes is NOT a pentatonic-minor-scale.
2. Any realization with a different cyclic interval signature (e.g., ⟨2, 2, 3, 2, 3⟩) is a different scale (a modal rotation of this one, but a distinct structure).
