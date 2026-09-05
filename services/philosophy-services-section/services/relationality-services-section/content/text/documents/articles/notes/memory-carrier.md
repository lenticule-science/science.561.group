---
title: Memory Carrier
id: memory-carrier
role: structure
status: plan
proof_refs: []
---



Carrier of persistable episodes: contexts, recognitions, and trace tails that
can be saved and reloaded.

## Definition
- Components: [Persistent Context Carrier](./persistent-context-carrier.md),
  [Persistent Recognition Carrier](persistent-recognition.md), and
  [Episodic Trace](./episodic-trace.md).
- Structure: packages the data needed to restore a saved episode faithfully.

## Invariants
- Reload fidelity: loading the memory yields nucleus-equivalent behaviour to the
  saved episode.
- Baseline stability: preserved tails and baselines remain intact across
  save/load.

## Proof
- Uses: persistent carriers and episodic traces to assemble a reloadable
  snapshot.
- Shows that: episodes can be persisted and restored without violating earned
  recognitions/contexts.
