---
title: Parse Command
id: parse-command
role: operator
status: someday
inputs:
- computer/library/type/mud-session
outputs:
- computer/library/type/mud-command
- computer/type/computer-failure
transformation:
- return
- value
proof_refs: []
derives-from: computer/function/recognition
description: Parses line-oriented client input into a validated MUD Command.
---



Parses line-oriented client input into a validated [MUD Command](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/computer-systems-science-services-section/services/computer-mud-system-engineering-services-section/content/text/documents/mud-server/structure/mud-command.md).

## Definition
- Inputs: raw text from a [MUD Session](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/computer-systems-science-services-section/services/computer-mud-system-engineering-services-section/content/text/documents/mud-server/structure/mud-session.md) connection
  and session context (player/entity bindings).
- Outputs: a [MUD Command](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/computer-systems-science-services-section/services/computer-mud-system-engineering-services-section/content/text/documents/mud-server/structure/mud-command.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour: tokenises input, checks grammar (verb/arguments), resolves targets
  against session/world recognitions, and emits a validated command; on syntax
  or resolution errors, emits a failure without mutating session state.

## Invariants
- Grammar correctness: only well-formed commands are emitted.
- Referential integrity: command targets must be reachable from session
  context; else fail.
- Purity: parsing failures do not mutate session/world state.

## Proof
- Derived from: [Computer Recognition](./recognition.md).
- Uses: [MUD Session](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/computer-systems-science-services-section/services/computer-mud-system-engineering-services-section/content/text/documents/mud-server/structure/mud-session.md) as context.
- Shows that: refining recognition to the MUD grammar yields executable
  commands while preserving kernel semantics and failure handling.
