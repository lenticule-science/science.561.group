---
title: Episodic Trace
id: episodic-trace
role: structure
status: plan
derived_from: math/acts/complete-trace
proof_refs: []
---



Recognised trace segment with contextualisation marks for persistence.

## Definition
- Components: slice of the earned [Complete Trace](../acts/complete-trace.md)
  annotated by [Contextualize Trace](../acts/contextualize-trace.md) to anchor
  entry/exit points for persistence.
- Marks: save/load anchors indicating where snapshots can capture/replay.

## Invariants
- Contextual consistency: anchors respect trace ordering and context flow.
- Persistence-ready: episodes can be handed to save/load operators without
  losing earned recognitions.

## Proof
- Derived from: [Complete Trace](../acts/complete-trace.md) with
  contextualisation from [Contextualize Trace](../acts/contextualize-trace.md).
- Shows that: trace segments can be isolated as episodes suitable for memory
  persistence.
