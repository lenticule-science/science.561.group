---
title: Recoverability Index
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Measures how much information can be reconstructed from a collapsed recognition.

## Definition
- Data: measure of inverse-nucleus extent—how many distinct preimages map to a
  given collapsed recognition.
- Role: quantify information loss/recoverability.

## Invariants
- Higher index = more recoverable; zero = no recovery beyond the collapsed form.
- Monotone with respect to coarsening: coarser collapses lower recoverability.

## Proof
- Uses: nucleus mapping and preimage analysis.
- Shows that: recoverability can be formalised as an index over recognitions.
