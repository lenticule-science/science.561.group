---
title: pentatonic-minor-scale
description: The five-element cyclic pitch-set with interval signature ⟨3, 2, 2, 3, 2⟩ (semitones) summing to the octave 12.
---
# pentatonic-minor-scale

The five-element cyclic pitch-set with interval signature ⟨3, 2, 2, 3, 2⟩ (semitones) summing to the octave 12.

## Definition

A **pentatonic minor scale** is a 5-element cyclic set S = {s₀, s₁, s₂, s₃, s₄} with a cyclic interval function

i : S × S → Z/12Z

satisfying i(s_k, s_{k+1}) = ⟨3, 2, 2, 3, 2⟩[k] for k = 0, ..., 4 (indices mod 5), and ∑ i(s_k, s_{k+1}) = 12.

Equivalently, S is the orbit of a chosen tonic s₀ under the additive action of {0, 3, 5, 7, 10} ⊂ Z/12Z.

## Properties

- **Cardinality**: 5.
- **Octave-closure**: the cyclic interval sequence sums to 12 (one octave).
- **No internal rotation symmetry**: the cyclic interval pattern ⟨3, 2, 2, 3, 2⟩ is fixed only by the identity rotation; therefore the five modal rotations (see [modal-cycle](./modal-cycle.md)) are all distinct.

## Source claim

[pitch-space-factors-as-scale-times-fundamental](../../prose/learning/claims/pitch-space-factors-as-scale-times-fundamental.md).

## Specification

[pentatonic-minor-scale.spec](../../work/governance/rules/specifications/pentatonic-minor-scale.spec.md).
