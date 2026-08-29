---
title: Parse Command
id: parse-command
role: operator
status: someday
derived_from: computer/function/recognition
inputs:
- computer/library/type/mud-session
outputs:
- computer/library/type/mud-command
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
---


# Parse Command

Parses line-oriented client input into a validated [MUD Command](../type/mud-command.md).

## Definition
- Inputs: raw text from a [MUD Session](../type/mud-session.md) connection
  and session context (player/entity bindings).
- Outputs: a [MUD Command](../type/mud-command.md) or
  [Computer Failure](../../../computer/type/computer-failure.md).
- Behaviour: tokenises input, checks grammar (verb/arguments), resolves targets
  against session/world recognitions, and emits a validated command; on syntax
  or resolution errors, emits a failure without mutating session state.

## Invariants
- Grammar correctness: only well-formed commands are emitted.
- Referential integrity: command targets must be reachable from session
  context; else fail.
- Purity: parsing failures do not mutate session/world state.

## Proof
- Derived from: [Computer Recognition](../../../computer/function/recognition.md).
- Uses: [MUD Session](../type/mud-session.md) as context.
- Shows that: refining recognition to the MUD grammar yields executable
  commands while preserving kernel semantics and failure handling.
