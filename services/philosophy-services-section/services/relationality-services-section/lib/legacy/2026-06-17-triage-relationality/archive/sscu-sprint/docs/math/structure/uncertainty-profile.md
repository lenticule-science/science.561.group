---
title: Uncertainty Profile
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Measures spread/instability of recognitions under flow via entropy/variance.

## Definition
- Components: an [Epistemic Profile](epistemic-profile.md) with attached entropy
  or variance scores from the [Entropy Functional](entropy-functional.md).
- Tracks how recognitions disperse under flow iterations.

## Invariants
- Monotonicity: uncertainty decreases when informative observations applied.
- Flow sensitivity: evolves according to flow-induced dispersion.

## Proof
- Uses: epistemic profile and entropy to quantify uncertainty.
- Shows that: uncertainty can be treated as a first-class structure for flow
  analysis.
