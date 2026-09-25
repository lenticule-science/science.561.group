---
title: Modal Structure
tags:
  - modal
  - box
  - diamond
depends-on:
  - modal-logic
  - box-modality
  - diamond-modality
  - modal-truncation
  - irrational-modality
  - quadratic-modality
  - modality-tower
  - orbit-step
  - reach
description: The modal acts provide box/diamond operators, truncations, irrational lifts, and iterated towers.
---

# Modal Structure

The modal acts provide box/diamond operators, truncations, irrational lifts,
and iterated towers. Together they induce a modal structure whose operators
and towers witness the internal side of modal correspondences.

Formally, there exists a structure

```text
Modal = (States, Box, Diamond, Truncate, Irrational, Quadratic, Tower)
```

such that:

- `States` is the underlying state space (stabilised recognitions),
- `Box` and `Diamond` are unary operators induced by `BoxModality` and
  `DiamondModality`,
- `Truncate` is induced by `ModalTruncation`,
- `Irrational` and `Quadratic` describe the lifted modalities from the
  irrational and quadratic acts,
- `Tower` is induced by `ModalityTower` and `OrbitStep`, building iterated
  applications of the modalities.

This modal structure is the internal witness for modal correspondences such as
those in the relational modal-logic theorems: external modal logics correspond
to this structure via the appropriate external theorems.
