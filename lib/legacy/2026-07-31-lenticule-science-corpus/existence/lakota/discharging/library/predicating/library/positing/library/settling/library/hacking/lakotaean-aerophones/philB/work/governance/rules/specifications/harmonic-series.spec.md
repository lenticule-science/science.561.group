# Specification: harmonic-series

Normative specification of a correct realization of [harmonic-series](../../../code/structures/harmonic-series.md).

## Invariants (MUST)

1. **Integer-multiple structure.** Given a fundamental f₀, a harmonic-series instance MUST consist of the set {n·f₀ : n ∈ N⁺}.
2. **All-harmonics availability.** The structure MUST include all positive integer multiples (open-open bore admits the full series).
3. **Indexing by N⁺.** Each partial is indexed by a unique positive integer n; the indexing MUST be order-preserving.

## Conditions (SHOULD)

1. A realization on a cedar duct flute SHOULD mark which partials are **practically accessible** (typically n=1 fully, n=2 partially, n ≥ 3 not).
2. A realization SHOULD support computation of the corresponding pitches under [transposition](../../../code/transformers/transposition.md) and [finger-hole-shortening](../../../code/transformers/finger-hole-shortening.md).

## Forbidden (MUST NOT)

1. A harmonic-series for an open-open cylindrical bore MUST NOT be specified as odd-only (that would be the harmonic series of a stopped cylindrical bore — a different structure).
