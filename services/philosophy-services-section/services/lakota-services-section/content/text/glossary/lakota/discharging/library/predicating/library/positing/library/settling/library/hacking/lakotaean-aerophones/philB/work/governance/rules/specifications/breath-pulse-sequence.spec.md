---
title: "Specification: breath-pulse-sequence"
description: Normative specification of a correct realization of breath-pulse-sequence.
---
# Specification: breath-pulse-sequence

Normative specification of a correct realization of [breath-pulse-sequence](../../../../code/structures/breath-pulse-sequence.md).

## Invariants (MUST)

1. **Function from N.** A breath-pulse-sequence instance MUST be a function ρ : N → R⁺ × R⁺.
2. **Positive durations and silences.** Each (τ_k, σ_k) MUST satisfy τ_k > 0 and σ_k ≥ 0.
3. **No pitch dimension.** A breath-pulse-sequence MUST NOT carry pitch information — it is a pure temporal structure.

## Conditions (SHOULD)

1. A realization SHOULD support decomposition into a periodic component plus deviations when analyzing for drum-aligned (metric) vs. free-rhythm contexts.
2. A realization SHOULD compose with [pulse-import](../../../../code/transformers/pulse-import.md) when embedded in a metric context.

## Forbidden (MUST NOT)

1. A breath-pulse-sequence MUST NOT include zero-duration pulses (a zero-duration pulse is not a pulse).
2. A breath-pulse-sequence MUST NOT introduce pitch as a structural coordinate.
