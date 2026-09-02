---
title: Tower Interaction
tags:
  - tower
  - modality
  - profile
depends_on:
  - build-profile-tower
  - build-nested-profile-tower
  - build-composite-profile-tower
  - flow-profile
  - modality-tower
  - box-modality
  - diamond-modality
  - reach
---
# Theorem (Tower Interaction)

The profile towers and modality towers interact coherently: iterating one while
climbing the other preserves the earned invariants.

1. **Profile towers.**  
   `BuildProfileTower`, `BuildNestedProfileTower`, and
   `BuildCompositeProfileTower` stack recognitions into higher cells.

2. **Modal towers.**  
   `ModalityTower` (plus the `Modal Stack` theorem) describes repeated
   application of modalities such as `□`, `◇`, and their variants.

3. **Flow compatibility.**  
   `ProfileFlow` and `Reach` ensure that as we climb the profile tower, reach and
   flow propagate correctly.

Combining these pieces yields towered structures where modalities can be applied
at each level without breaking coherence, which is essential for multi-layer
simulations (e.g., temporal reasoning over profile towers).
