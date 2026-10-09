---
title: Void and Presence Witnesses
id: void-presence
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/relationlessness
  - acts/nothing
  - acts/something
description: Structure capturing the initial empty trace (Relationlessness) and its complementary witnesses (Nothing, Something).
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
