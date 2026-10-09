---
title: Terminal Client Program
kind: structure
layer: program
status: someday
uses:
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
produces:
  - computer/structure/computer-wiring-plan
used_by: []
derives-from: computer/structure/computer-kernel
produced-by: []
description: Program-level terminal interface (CLI/TTY) that drives the computer kernel via interactive commands.
---

Program-level terminal interface (CLI/TTY) that drives the computer kernel via
interactive commands.

## Definition
- Inputs: user keystrokes/commands; initial
  [Computer Evaluation State](../computer-evaluation-state.md).
- Behaviour:
  1. Read commands; recognise them via computer
     [Recognition](../../../../glossary/concepts/phenomena-recognition.md).
  2. Update the [Computer Wiring Plan](../computer-wiring-plan.md)
     as needed and step with [Evaluate Step](../evaluate-step.md).
  3. Print results/failures; checkpoint session via
     [Storage](../storage.md) if requested.
- Outputs: updated wiring plan/evaluation state; printed results or
  [Computer Failure](../computer-failure.md).

## Invariants
- Safety: only recognised commands mutate state.
- Determinism: given the same inputs and snapshots, the session evolves
  deterministically.
- Failure purity: failures are surfaced as computer failures; state unchanged on
  failure.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: a terminal loop using computer recognition/evaluation/storage
  yields a CLI/TTY interface without extending kernel semantics.
