---
title: REPL Program
kind: structure
layer: program
status: someday
derived_from: computer/structure/computer-kernel
uses:
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
produces:
  - computer/structure/computer-wiring-plan
used_by: []
produced_by: []
---
# REPL Program

Interactive read–eval–print loop over the computer kernel carriers/operators.

## Definition
- Inputs: user commands/expressions recognised via computer
  [Recognition](../../../computer/operator/recognition.md), plus an initial
  [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md).
- Loop:
  1. Read: ingest input and recognise it into wiring-plan fragments or commands.
  2. Eval: splice into the [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md)
     as needed and step with [Evaluate Step](../../../computer/operator/evaluate-step.md).
  3. Print: surface results/failures via computer carriers; optionally persist
     with [Storage](../../../computer/operator/storage.md).
- Outputs: updated wiring plan/evaluation state and printed results/failures.

## Invariants
- Safety: all actions go through computer operators; no machine bypass.
- Incrementality: each input produces a deterministic successor state given the
  prior plan/state.
- Failure purity: failures are [Computer Failure](../../../computer/structure/computer-failure.md) outputs; state unchanged on failure.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: exposing a read–eval–print loop via computer carriers/operators
  yields an interactive interface without extending kernel semantics.
