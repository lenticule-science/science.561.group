---
title: Divergent History
id: divergent-history
role: structure
status: plan
proof_refs: []
---


# Divergent History

Detects two traces that share a past (nucleus-equivalent) but diverge under
flow.

## Definition
- Components: pair of traces in a [Trace Shuffle Class](trace-shuffle-class.md)
  that agree up to a [Time Slice](time-slice.md) and diverge thereafter.
- Witness: recognition of divergence with provenance of the split point.

## Invariants
- Shared prefix: histories coincide up to the split.
- Divergence: subsequent flow yields non-equivalent recognitions.

## Proof
- Uses: trace equivalence and time slices to identify common past and divergence.
- Shows that: branching histories can be recognised and tracked.
