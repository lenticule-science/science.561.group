---
title: Consolidate Memory
id: consolidate-memory
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Consolidate Memory

Collapse a live episodic trace into a persistent memory unit.

## Definition
- Inputs: an [Episodic Trace](./episodic-trace.md) and access to
  [Save Context](save-context.md).
- Output: a [Memory Carrier](./memory-carrier.md) packaging the
  episode for persistence.
- Behaviour: apply save-context to the episode’s contexts/recognitions, apply
  baseline/limit operations on the tail, and store the results.

## Invariants
- Fidelity: saved memory reloads to an equivalent episode.
- Completeness: all necessary context/recognition/tail data are captured.

## Proof
- Uses: [Episodic Trace](./episodic-trace.md) and
  [Save Context](save-context.md).
- Produces: [Memory Carrier](./memory-carrier.md).
- Shows that: episodes can be consolidated into persistent memory consistent
  with earned save/load semantics.
