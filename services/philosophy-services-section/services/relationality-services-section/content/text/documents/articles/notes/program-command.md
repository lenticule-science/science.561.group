---
title: Program Command
id: program-command
role: structure
status: someday
proof_refs: []
derives-from: computer/type/computer-recognition
description: Generic command carrier for program-layer actions over the documentation interpreter.
---



Generic command carrier for program-layer actions over the documentation interpreter.

## Definition
- Carrier: refinement of [Computer Recognition](./computer-recognition.md)
  scoped to program actions (e.g., measure, plan, mutate, snapshot).
- Fields (concrete at computer layer):
  - `command_id` (string/UUID)
  - `verb` (string enum: measure/plan/mutate/snapshot/other domain verbs)
  - `targets` (list of identifiers for docs/tasks/ports)
  - `parameters` (object of verb-specific arguments)
  - `provenance` (actor/origin/trace_ref)
  - `policy` (policy binding/ref)

## Invariants
- Validated: references resolve to existing program artefacts or declared new
  ones with correct metadata.
- Layer-safe: commands do not introduce upward deps; respect policy/trace
  constraints.
- Traceable: carries provenance for audit/replay.

## Proof
- Derived from: [Computer Recognition](./computer-recognition.md).
- Shows that: normalising program actions as recognitions yields a reusable
  command carrier for program-layer operators.

## Earlier material

## Proof
- Derived from: [Computer Recognition](computer-recognition.md).
- Shows that: normalising program actions as recognitions yields a reusable
  command carrier for program-layer operators.
