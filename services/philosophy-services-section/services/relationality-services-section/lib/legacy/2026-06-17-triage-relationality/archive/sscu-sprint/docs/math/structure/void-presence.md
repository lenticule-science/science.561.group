---
title: Void and Presence Witnesses
role: structure
derived_from:
- acts/relationlessness
- acts/nothing
- acts/something
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Structure capturing the initial empty trace (`Relationlessness`) and its
complementary witnesses (`Nothing`, `Something`).

## Components

- Empty trace witness (`Relationlessness`).
- Absence witness (`Nothing`).
- Presence witness (`Something`).

## Proof

Sketch: from `Relationlessness`, forcing self-observation yields `Something`;
forcing absence yields `Nothing`. These are the minimal witnesses for
absence/presence.
