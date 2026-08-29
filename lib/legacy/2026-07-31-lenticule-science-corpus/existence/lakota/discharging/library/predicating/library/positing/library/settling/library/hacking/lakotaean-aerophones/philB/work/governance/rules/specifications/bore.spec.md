# Specification: bore

Normative specification of a correct realization of [bore](../../../code/structures/bore.md).

## Invariants (MUST)

1. **Cylindrical geometry.** A bore instance MUST be approximately cylindrical (constant diameter D along its length L, modulo construction tolerances).
2. **Two open ends.** The bore MUST be acoustically open at both ends (labium and distal opening).
3. **Finite finger-hole set.** The finger-hole set H MUST be finite with each h_i ∈ (0, L).
4. **Hole-state mapping defined.** The effective acoustic length L_eff MUST be defined as a function of the open/closed hole configuration.

## Conditions (SHOULD)

1. A realization SHOULD include end-correction factors (typically ~0.6·(D/2) at each open end).
2. A realization SHOULD calibrate finger-hole positions to produce pitches at the pentatonic-minor interval ratios on the fundamental.

## Forbidden (MUST NOT)

1. A bore MUST NOT be stopped at one end (this would change the harmonic series to odd-only and disqualify the structure).
2. A bore MUST NOT introduce conical taper as a structural feature (slight taper is acoustically tolerated; deliberate conical bore is a different acoustic structure).
