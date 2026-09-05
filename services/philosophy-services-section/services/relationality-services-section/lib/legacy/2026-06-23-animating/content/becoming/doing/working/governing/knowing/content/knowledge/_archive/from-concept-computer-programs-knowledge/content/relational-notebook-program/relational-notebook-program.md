---
title: Relational Notebook Program
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-kernel
uses:
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
  - computer/structure/computer-recognition
  - computer/structure/computer-snapshot
produces:
  - computer/structure/computer-wiring-plan
used_by: []
produced_by: []
---

Program that models notes, citations, and queries as earned recognitions,
enabling traceable knowledge organisation and retrieval.

## Definition
- Inputs: notes/links/citations recognised via computer
  [Recognition](../../../computer/operator/recognition.md) into
  [Computer Recognition](../../../computer/structure/computer-recognition.md)
  carriers; initial [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md).
- Plan: organise notes/links as a [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md)
  and execute queries/updates via [Evaluate Step](../../../computer/operator/evaluate-step.md).
- Persistence: save/replay via [Computer Storage](../../../computer/operator/storage.md)
  and [Computer Snapshot](../../../computer/structure/computer-snapshot.md).
- Outputs: updated wiring plan/state; failures as
  [Computer Failure](../../../computer/structure/computer-failure.md).

## Behaviour
- Represent notes, links, citations, summaries as recognitions with provenance.
- Track evolution of concepts across projects/domains as trace-carrier
  sequences.
- Measure relevance, influence, and memory decay via profile reach and entropy
  metrics.

## Invariants
- Traceability: all notes/links carry provenance; queries respect profile
  restrictions.
- Determinism: given same inputs and snapshots, retrieval/upserts are stable.
- Failure purity: invalid links/queries emit computer failures; state unchanged.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: note-taking and retrieval emerge from recognition and trace
  operations via computer carriers/operators without extending machine
  semantics.
