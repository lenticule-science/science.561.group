---
title: Interleaving Reduction
id: interleaving-reduction
role: structure
status: plan
proof_refs: []
---


# Interleaving Reduction

Reduction system for interleaved flows, turning shuffle classes into small-step
reductions.

## Definition
- State: a [Trace Shuffle Class](./trace-shuffle-class.md) of interleavings and a
  current reduction position.
- Rules: small-step reductions corresponding to [Interleaving Flow](./interleaving-flow.md) choices.

## Invariants
- Confluence up to shuffle equivalence.
- Progress: either a reduction applies or the interleaving is in normal form.

## Proof
- Uses: interleaving flow semantics to define reduction rules.
- Shows that: concurrency can be modelled as a reduction system aligned with shuffle classes.
