---

name: mud-toy-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-recognition
  - computer/structure/computer-snapshot
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
produces:
  - computer/structure/computer-wiring-plan
---

Design sketch for a toy MUD built as a slice of the relational computer: all
state is recognitions; all change is via earned rewrites; gameplay aligns with
measurement, topology, and traceability. This doc now spells out concrete
computer-layer carriers and operators the MUD uses, so it can be implemented as
an SDK-driven runbook.

## Core recognitions
- World geometry: rooms/exits with topology metadata.
- Entities: characters/NPCs, items with usage/effects.
- Bodies/conditions: body graph, injuries, treatments, derived conditions.
- Events/arcs: actions and quests linking recognitions over time.

## Topology/measurement/traceability
- Spatial, anatomical, and social graphs compiled by topology integration.
- Measurement tracks vitals/environment/social stats; measurement fabric enforces
  schemas and invariants.
- Traceability records causal chains (who/what/where) for injuries/events, used
  for explainability.

## Runbooks/flows
- Ingestion: load MUD schemas via the computer [Recognition](../../../computer/operator/recognition.md)
  operator over [Computer Recognition](../../../computer/structure/computer-recognition.md) carriers.
- Simulation: apply player/NPC actions as computer [Evaluate Step](../../../computer/operator/evaluate-step.md)
  over an earned [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md)
  with a MUD-specific [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md).
- Persistence: use computer [Storage](../../../computer/operator/storage.md) with
  [Computer Snapshot](../../../computer/structure/computer-snapshot.md) to save/restore worlds.
- Lifecycle: manage resource/backups via storage/replication runbooks and snapshots.

## Goals
- Relational-first, explainable, composable, lightweight toy implementation.
- Implementable via SDK: the above operators/carriers are sufficient to stand up
  a working MUD slice without extending the kernel.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the
  described behaviour without extending machine semantics; all state/flow is
  expressed via computer carriers and operators.
