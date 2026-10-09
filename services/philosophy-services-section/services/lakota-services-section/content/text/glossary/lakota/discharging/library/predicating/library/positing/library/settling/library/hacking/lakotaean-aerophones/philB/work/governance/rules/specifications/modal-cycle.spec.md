---
title: "Specification: modal-cycle"
description: Normative specification of a correct realization of modal-cycle.
---
# Specification: modal-cycle

Normative specification of a correct realization of [modal-cycle](../../../../code/structures/modal-cycle.md).

## Invariants (MUST)

1. **Group identity.** A modal-cycle instance MUST realize the cyclic group C₅ = Z/5Z.
2. **Action on the scale.** The C₅ action ρ : C₅ × S → S MUST send (k, s_j) to s_{j+k mod 5}.
3. **Five distinct mode-orbits.** All five elements of C₅ MUST produce structurally distinct modal rotations (i.e., the pentatonic-minor cyclic interval signature must have no non-trivial rotation symmetry — see [pentatonic-minor-scale.spec](./pentatonic-minor-scale.spec.md)).

## Conditions (SHOULD)

1. A realization SHOULD permit identification of the **active mode** of a given musical passage by local-tonic analysis (which scale-degree functions as tonic in the passage).
2. A realization SHOULD permit transitions between modes within a piece (the C₅ action is realized both globally and locally).

## Forbidden (MUST NOT)

1. A modal-cycle MUST NOT be conflated with the related dihedral group D₅ (no reflection symmetry is asserted; reflection across a tonic is not a music-theoretic operation on the pentatonic-minor scale in this idiom).
