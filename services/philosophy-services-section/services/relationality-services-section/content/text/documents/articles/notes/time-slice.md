---
title: Time Slice
id: time-slice
role: structure
status: plan
proof_refs: []
description: Sheaf section paired with its saved memory carrier, representing a “moment” in relational time.
---



Sheaf section paired with its saved memory carrier, representing a “moment” in
relational time.

## Definition
- Components: [Hypertensor Section](./hypertensor-section.md) and associated
  [Memory Carrier](./memory-carrier.md).
- Role: checkpoint for rollback or branching execution.

## Invariants
- Restoration: rolling back to this slice restores section up to nucleus
  equivalence and reinstates the memory carrier.
- Isolation: morphisms crossing the slice must factor through its context or be
  discarded on rollback.

## Proof
- Uses: sheaf section and memory carrier to package a recoverable state.
- Shows that: time slices can serve as rollback points preserving earned state
  and memory.
