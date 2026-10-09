---
title: single-tone-object
description: A music-theoretic object whose pitch coordinate is degenerate (a single point) and whose content is rhythm and timbral envelope.
---
# single-tone-object

A music-theoretic object whose pitch coordinate is degenerate (a single point) and whose content is rhythm and timbral envelope.

## Definition

A **single-tone object** is a triple (f*, ρ, e) where:

- f* ∈ R⁺ is the fixed pitch of the instrument.
- ρ : N → R⁺ × R⁺ is a [breath-pulse-sequence](./breath-pulse-sequence.md) — for each pulse index, a (pulse-duration, post-silence) pair.
- e : N → ([0, T] → R⁺) is a per-pulse [timbral-envelope](./timbral-envelope.md) — for each pulse, an instantaneous loudness function over the pulse's duration.

The pitch coordinate is degenerate.
The temporal coordinate (ρ) and the envelope coordinate (e) carry the music-theoretic content.

## Properties

- **Pitch coordinate degenerate**: a single point in R⁺.
- **Temporal coordinate full**: arbitrary sequences of pulse-and-silence pairs.
- **Envelope coordinate full**: arbitrary per-pulse loudness functions.
- **Aggregates to stochastic clusters**: n simultaneous single-tone objects with distinct f*ᵢ aggregate to a [stochastic-cluster](./stochastic-cluster.md) via [aggregation](../transformers/aggregation.md).

## Source claim

[single-tone-content-is-rhythm-and-envelope](../../prose/learning/claims/single-tone-content-is-rhythm-and-envelope.md).

## Specification

[single-tone-object.spec](../../work/governance/rules/specifications/single-tone-object.spec.md).
