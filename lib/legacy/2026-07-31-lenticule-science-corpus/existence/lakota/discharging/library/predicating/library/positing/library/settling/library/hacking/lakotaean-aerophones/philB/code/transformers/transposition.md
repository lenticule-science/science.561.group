# transposition

The multiplicative action of R⁺ on [pitch-space](../structures/pitch-space.md) shifting the fundamental and fixing the scale.

## Definition

For k ∈ R⁺, the **transposition by factor k** is the map

τ_k : P → P, τ_k(d, f₀) = (d, k·f₀).

It acts trivially on the scale-degree coordinate and multiplicatively on the fundamental.

## Properties

- **Group action**: τ_k ∘ τ_{k'} = τ_{kk'}; τ₁ = id.
- **Preserves all relative intervals**: the ratio f_i / f_j between any two pitch events with the same scale-degree-vs-scale-degree relationship is invariant under τ_k.
- **Preserves scale identity**: π_S ∘ τ_k = π_S.

## Source claim

[pitch-space-factors-as-scale-times-fundamental](../prose/learning/claims/pitch-space-factors-as-scale-times-fundamental.md).
