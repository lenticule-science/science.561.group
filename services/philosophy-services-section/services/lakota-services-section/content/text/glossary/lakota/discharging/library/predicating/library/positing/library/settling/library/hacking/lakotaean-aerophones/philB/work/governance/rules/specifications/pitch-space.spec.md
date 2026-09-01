# Specification: pitch-space

Normative specification of a correct realization of [pitch-space](../../../code/structures/pitch-space.md).

## Invariants (MUST)

1. **Product structure.** A pitch-space instance MUST be a Cartesian product P = S × R⁺ where S is a [pentatonic-minor-scale](../../../code/structures/pentatonic-minor-scale.md).
2. **Two canonical projections.** Both π_S : P → S and π_F : P → R⁺ MUST be defined and total.
3. **Transposition action.** The multiplicative action of R⁺ on P given by (k, (d, f₀)) ↦ (d, k·f₀) MUST be a group action (associative, identity-preserving).
4. **Scale invariance under transposition.** For all k ∈ R⁺ and all p ∈ P, π_S(τ_k(p)) MUST equal π_S(p).

## Conditions (SHOULD)

1. A realization SHOULD support pitch-event sampling at arbitrary fundamentals — there is no canonical "preferred" fundamental.
2. A realization SHOULD treat the scale as the intrinsic invariant; the fundamental is a free parameter of a particular instrument.

## Forbidden (MUST NOT)

1. A pitch-space MUST NOT introduce a third independent pitch coordinate at the structural level (block position, breath pressure, and ornament are not pitch-space coordinates — they are pitch-space morphisms or perturbations).
2. A pitch-space MUST NOT commit to a global pitch reference (no A=440 anchor).
