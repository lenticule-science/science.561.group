# pitch-space

The product space of relative scale and free fundamental.

## Definition

The **pitch space** of the cedar courting flute is the product

  P ≅ S × R⁺

where S is a [pentatonic-minor-scale](./pentatonic-minor-scale.md) (a 5-element cyclic set) and R⁺ is the multiplicative group of positive real numbers.

A pitch event is a pair (d, f₀) ∈ P. The first projection π_S : P → S extracts the scale-degree; the second projection π_F : P → R⁺ extracts the absolute fundamental.

## Properties

- **Factorization is canonical**: there is no third independent coordinate at the pitch-space level.
- **Action of R⁺**: the multiplicative group R⁺ acts on P by (k, (d, f₀)) ↦ (d, k·f₀). This action is [transposition](../transformers/transposition.md) and fixes the scale.
- **Scale-rigid, fundamental-free**: the relative scale is intrinsic; the absolute fundamental varies freely across instruments.

## Source claim

[pitch-space-factors-as-scale-times-fundamental](../prose/learning/claims/pitch-space-factors-as-scale-times-fundamental.md).

## Specification

[pitch-space.spec](../work/governance/rules/specifications/pitch-space.spec.md).
