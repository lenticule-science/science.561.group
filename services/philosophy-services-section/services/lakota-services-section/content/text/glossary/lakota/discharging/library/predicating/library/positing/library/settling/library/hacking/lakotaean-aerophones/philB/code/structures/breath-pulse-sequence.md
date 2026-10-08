---
title: breath-pulse-sequence
description: A temporal structure consisting of a sequence of (pulse-duration, post-silence) pairs.
---
# breath-pulse-sequence

A temporal structure consisting of a sequence of (pulse-duration, post-silence) pairs.

## Definition

A **breath-pulse sequence** is a function

ρ : N → R⁺ × R⁺, ρ(k) = (τ_k, σ_k)

where τ_k is the duration of the k-th breath pulse and σ_k is the silence following it.

The cumulative time at the end of pulse k is t_k = ∑_{j ≤ k} (τ_j + σ_j).

A sequence is **periodic** if (τ_k, σ_k) is constant in k.
It is **drum-aligned** if there exists a meter μ such that pulse-onsets t_k - σ_{k-1} fall on μ's grid (see [pulse-import](../transformers/pulse-import.md)).

## Properties

- **No pitch dimension**: pure temporal structure.
- **Periodic / aperiodic decomposition**: any sequence can be analyzed as a periodic component plus deviations.
- **Composable**: sequences from multiple instruments can be aggregated (see [aggregation](../transformers/aggregation.md)).

## Source claim

[single-tone-content-is-rhythm-and-envelope](../../prose/learning/claims/single-tone-content-is-rhythm-and-envelope.md).

## Specification

[breath-pulse-sequence.spec](../../work/governance/rules/specifications/breath-pulse-sequence.spec.md).
