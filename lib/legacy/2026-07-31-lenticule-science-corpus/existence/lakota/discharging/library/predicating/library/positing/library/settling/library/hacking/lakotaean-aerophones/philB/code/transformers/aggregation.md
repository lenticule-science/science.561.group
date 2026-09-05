# aggregation

The morphism (single-tone-object)ⁿ → stochastic-cluster sending n simultaneous single-tone events to their aggregate cluster.

## Definition

Given n single-tone objects (fᵢ*, ρᵢ, eᵢ) sharing a common breath-pulse sequence ρ (i.e., ρᵢ = ρ for all i), the **aggregation** is

α : (single-tone-object)ⁿ → stochastic-cluster

α((f₁*, ρ, e₁), ..., (fₙ*, ρ, eₙ)) = (μ, ρ)

where μ = ∑_i δ_{fᵢ*} is the discrete measure on R⁺ with support {f₁*, ..., fₙ*}.

The shared envelope information eᵢ is summarized as an aggregate envelope (typically the mean or max across players) but is not the principal music-theoretic content of the cluster.

## Properties

- **Requires shared pulse**: the breath-pulse sequences must match (typically because all players are following a drum-imported meter — see [pulse-import](./pulse-import.md)).
- **Discrete output**: the result is a discrete measure with finite support, not a continuous distribution.
- **Concentration at central pitch**: in practice the support {f₁*, ..., fₙ*} is concentrated within tens of cents of a central frequency f* (open question — see [what-is-the-statistical-distribution-of-stochastic-cluster-spread](../questions/what-is-the-statistical-distribution-of-stochastic-cluster-spread.md)).

## Source claim

[single-tone-aggregates-form-stochastic-clusters](../prose/learning/claims/single-tone-aggregates-form-stochastic-clusters.md).
