---
title: finger-hole-shortening
description: The effective-acoustic-length reduction produced by opening a finger hole on a bore.
---
# finger-hole-shortening

The effective-acoustic-length reduction produced by opening a finger hole on a [bore](../structures/bore.md).

## Definition

Given a bore (L, D, H) with finger holes at positions H = {h₁, ..., h_n} ⊂ (0, L), the **finger-hole shortening** transformer maps the open/closed hole configuration to the effective acoustic length:

Σ : 2^H → R⁺, Σ(O) = min { h_i : h_i ∈ O } + end-correction

where O ⊂ H is the set of open holes.
(When O = ∅, Σ(O) = L + end-correction.)

The fundamental frequency is then f₀(O) = c / (2 · Σ(O)).

## Properties

- **Monotone in opening**: opening additional holes farther from the labium does not change Σ; opening a hole closer to the labium reduces Σ.
- **Discrete pitch-selection on continuous bore**: Σ maps a finite set 2^H of finger-hole configurations to a finite set of effective lengths, hence to a finite set of pitches realized at the pentatonic-minor intervals.

## Source claim

[cylindrical-bore-admits-full-harmonic-series](../../prose/learning/claims/cylindrical-bore-admits-full-harmonic-series.md).
