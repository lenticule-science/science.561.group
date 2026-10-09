---
title: Relational MUD Toy Program
kind: structure
layer: program
status: someday
uses:
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-recognition
  - computer/structure/computer-snapshot
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
produces:
  - computer/structure/computer-wiring-plan
derives-from:
  - computer/structure/computer-kernel
description: "Design sketch for a toy MUD built as a slice of the relational computer: all state is recognitions; all change is via earned rewrites; gameplay aligns with measurement, topology, and traceability."
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
- Ingestion: load MUD schemas via the computer [Recognition](../../../../glossary/concepts/phenomena-recognition.md)
  operator over [Computer Recognition](../computer-recognition.md) carriers.
- Simulation: apply player/NPC actions as computer [Evaluate Step](../evaluate-step.md)
  over an earned [Computer Evaluation State](../computer-evaluation-state.md)
  with a MUD-specific [Computer Wiring Plan](../computer-wiring-plan.md).
- Persistence: use computer [Storage](../storage.md) with
  [Computer Snapshot](../computer-snapshot.md) to save/restore worlds.
- Lifecycle: manage resource/backups via storage/replication runbooks and snapshots.

## Goals
- Relational-first, explainable, composable, lightweight toy implementation.
- Implementable via SDK: the above operators/carriers are sufficient to stand up
  a working MUD slice without extending the kernel.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the
  described behaviour without extending machine semantics; all state/flow is
  expressed via computer carriers and operators.
