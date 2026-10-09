---
title: timbral-envelope
description: The within-pulse instantaneous-loudness function of a breath pulse on a single-tone aerophone.
---
# timbral-envelope

The within-pulse instantaneous-loudness function of a breath pulse on a single-tone aerophone.

## Definition

A **timbral envelope** is a function

e : [0, T] → R⁺

assigning to each time t in the pulse's duration [0, T] an instantaneous loudness e(t).
T is the pulse duration τ.

A timbral envelope is **characterized** by:

- Attack time τ_a: time from t=0 to peak loudness.
- Sustain level: loudness held during the bulk of the pulse.
- Decay time τ_d: time from sustain end to t=T.

## Properties

- **Per-pulse**: each pulse in a breath-pulse-sequence carries its own envelope.
- **Continuous**: e is typically continuous (no instantaneous loudness jumps); discontinuities indicate articulation events.
- **Controlled by breath dynamics**: the player shapes e through breath-pressure variation.

## Source claim

[single-tone-content-is-rhythm-and-envelope](../../prose/learning/claims/single-tone-content-is-rhythm-and-envelope.md).

## Specification

[timbral-envelope.spec](../../work/governance/rules/specifications/timbral-envelope.spec.md).
