---
title: bore
description: The acoustic structure of a cylindrical air column open at both ends, with finger-hole-driven effective-length modification.
---
# bore

The acoustic structure of a cylindrical air column open at both ends, with finger-hole-driven effective-length modification.

## Definition

A **bore** is a triple (L, D, H) where:

- L ∈ R⁺ is the geometric length of the air column (meters).
- D ∈ R⁺ is the bore diameter, assumed approximately constant along L (cylindrical).
- H = {h₁, ..., h_n} is a finite set of finger-hole positions h_i ∈ (0, L), each with an open/closed state.

The bore is acoustically **open at both ends**: the labium at position 0 and the distal opening at position L.

The **effective acoustic length** L_eff depends on the open/closed state of the holes:

L_eff = min { h_i : h_i is open } + end-correction

(with L_eff = L + end-correction when all holes are closed).

The supported standing-wave frequencies are then fₙ = n · (c / 2L_eff) for n = 1, 2, 3, ... where c is the speed of sound (~343 m/s at 20°C).

## Properties

- **Open-at-both-ends supports all harmonics**: in contrast to a stopped-at-one-end cylinder (only odd harmonics).
- **Finger-hole shortening**: opening a hole at position h reduces L_eff to approximately h.
- **End corrections**: real-world end-correction factors add ~0.6·(D/2) at each open end.

## Source claim

[cylindrical-bore-admits-full-harmonic-series](../../prose/learning/claims/cylindrical-bore-admits-full-harmonic-series.md).

## Specification

[bore.spec](../../work/governance/rules/specifications/bore.spec.md).
