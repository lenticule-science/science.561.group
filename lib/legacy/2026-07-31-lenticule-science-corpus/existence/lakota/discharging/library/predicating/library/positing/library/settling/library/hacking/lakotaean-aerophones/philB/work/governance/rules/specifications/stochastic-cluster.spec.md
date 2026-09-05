# Specification: stochastic-cluster

Normative specification of a correct realization of [stochastic-cluster](../../../code/structures/stochastic-cluster.md).

## Invariants (MUST)

1. **Discrete measure structure.** A stochastic-cluster instance MUST consist of a discrete measure μ on R⁺ with small finite support {f₁, ..., fₙ}, n ≥ 2, paired with a shared breath-pulse sequence ρ.
2. **Concentration near central frequency.** There MUST exist a central frequency f* ∈ R⁺ and a spread σ such that |fᵢ - f*| ≤ σ for all i.
3. **Shared pulse.** All support points MUST share the same temporal articulation ρ.

## Conditions (SHOULD)

1. A realization SHOULD measure the spread σ in cents (a perceptually meaningful unit).
2. A realization SHOULD distinguish itself from a chord (no harmonic intent) and from noise (no continuous spectral support).

## Forbidden (MUST NOT)

1. A stochastic-cluster with n = 1 is NOT a cluster (it is a single-tone-object).
2. A stochastic-cluster MUST NOT have continuous support (that would be noise).
3. A stochastic-cluster MUST NOT have support points spread across more than ~100 cents (beyond that range, the cluster decomposes into perceived distinct pitches rather than a unified cluster — though this is an empirical boundary and not a sharp structural one; see [what-is-the-statistical-distribution-of-stochastic-cluster-spread](../../../questions/what-is-the-statistical-distribution-of-stochastic-cluster-spread.md)).
