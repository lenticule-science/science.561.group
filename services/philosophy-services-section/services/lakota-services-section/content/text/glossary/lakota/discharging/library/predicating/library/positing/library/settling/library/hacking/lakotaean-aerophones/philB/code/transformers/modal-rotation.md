---
title: modal-rotation
description: The generator of the modal-cycle C₅, sending each scale-degree to its successor under cyclic index shift.
---
# modal-rotation

The generator of the [modal-cycle](../structures/modal-cycle.md) C₅, sending each scale-degree to its successor under cyclic index shift.

## Definition

The **modal rotation** is the map

ρ : S → S, ρ(s_k) = s_{k+1 mod 5}

where S is a [pentatonic-minor-scale](../structures/pentatonic-minor-scale.md).

Iterating: ρ^j sends s_k to s_{k+j mod 5}.
The set {ρ^j : j ∈ Z/5Z} is the cyclic group C₅.

## Properties

- **Order 5**: ρ⁵ = id.
- **Generates the modal cycle**: every modal rotation is a power of ρ.
- **Realized as choice-of-tonic**: applying ρ^j corresponds to selecting scale-degree j as the new tonic.

## Source claim

[pentatonic-admits-five-modal-rotations](../../prose/learning/claims/pentatonic-admits-five-modal-rotations.md).
