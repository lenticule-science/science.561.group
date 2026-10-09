---
title: stochastic-cluster
description: A discrete measure on pitch space with small finite support concentrated near a central frequency, plus a shared temporal articulation.
---
# stochastic-cluster

A discrete measure on pitch space with small finite support concentrated near a central frequency, plus a shared temporal articulation.

## Definition

A **stochastic cluster** is a pair (μ, ρ) where:

- μ = ∑_{i=1}^{n} δ_{fᵢ} is a discrete measure on R⁺ with finite support {f₁, ..., fₙ}.
- ρ is a shared [breath-pulse-sequence](./breath-pulse-sequence.md) applied across all support points.

The support points are concentrated near a **central frequency** f* with **spread** σ:

|fᵢ - f*| ≤ σ for all i, with σ typically ~10–50 cents in the Lakotaean ceremonial corpus (open question — see [what-is-the-statistical-distribution-of-stochastic-cluster-spread](../../questions/what-is-the-statistical-distribution-of-stochastic-cluster-spread.md)).

## Properties

- **Not a chord**: no harmonic intent; no consonance/dissonance grammar over the support.
- **Not noise**: discrete support; definite central pitch.
- **Micropolyphonic analogue**: structurally analogous to Ligeti's late micropolyphony, achieved by acoustic identity-with-variation rather than by compositional voice-design.
- **Shared pulse**: all support points articulate the same rhythmic sequence ρ.

## Source claim

[single-tone-aggregates-form-stochastic-clusters](../../prose/learning/claims/single-tone-aggregates-form-stochastic-clusters.md).

## Specification

[stochastic-cluster.spec](../../work/governance/rules/specifications/stochastic-cluster.spec.md).
