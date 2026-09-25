---
title: MCP Response
id: mcp-response
role: structure
status: someday
proof_refs: []
derives-from: computer/type/computer-recognition
description: Outgoing MCP command response as a recognised computer-layer payload.
---



Outgoing MCP command response as a recognised computer-layer payload.

## Definition
- Carrier: refinement of [Computer Recognition](./computer-recognition.md)
  scoped to MCP responses.
- Fields:
  - `recognition_id` (UUID/string)
  - `command` (string): command name responded to.
  - `result` (object): command output payload.
  - `observations` (array, optional): streamed/logged observations.
  - `trace_ref` (string): traceability reference for the execution.
  - `provenance` (object `{actor, origin, trace_ref}`)
  - `signature` (string, optional): signature/MAC over result.

## Invariants
- Result matches the command’s declared output schema.
- Trace and provenance link back to the request and endpoint version.
- If signature is present, it covers result and trace_ref.

## Proof
- Derived from: [Computer Recognition](./computer-recognition.md).
- Shows that: MCP outputs can be expressed as recognitions with concrete fields
  while remaining within computer-layer semantics.

## Earlier material

## Proof
- Derived from: [Computer Recognition](computer-recognition.md).
- Shows that: MCP outputs can be expressed as recognitions with concrete fields
  while remaining within computer-layer semantics.
