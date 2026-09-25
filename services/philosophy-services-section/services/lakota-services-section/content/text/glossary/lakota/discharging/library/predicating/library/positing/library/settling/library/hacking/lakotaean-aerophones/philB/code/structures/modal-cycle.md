---
title: modal-cycle
description: The cyclic group C₅ acting on the pentatonic-minor pitch-set by index rotation.
---
# modal-cycle

The cyclic group C₅ acting on the pentatonic-minor pitch-set by index rotation.

## Definition

The **modal cycle** is the cyclic group C₅ = Z/5Z together with its action on the pentatonic-minor pitch-set:

ρ : C₅ × S → S, ρ(k, s_j) = s_{j+k mod 5}

The generator ρ₁ shifts each scale-degree index by 1.

A **mode** is an orbit-representative under the C₅ action, equivalently a choice of tonic from the five scale degrees.

## Properties

- **Five distinct modes**: because ⟨3, 2, 2, 3, 2⟩ has no non-trivial rotational symmetry, all five C₅-orbit-representatives yield distinct interval signatures from their own tonic.
- **Mode I dominates practice**: empirically, the default mode of the cedar flute is mode I (minor pentatonic with lowest fingering as tonic).
  Other modes appear as transient local-tonic shifts.
- **C₅ is abelian**: rotations compose commutatively.

## Source claim

[pentatonic-admits-five-modal-rotations](../../prose/learning/claims/pentatonic-admits-five-modal-rotations.md).

## Specification

[modal-cycle.spec](../../work/governance/rules/specifications/modal-cycle.spec.md).
