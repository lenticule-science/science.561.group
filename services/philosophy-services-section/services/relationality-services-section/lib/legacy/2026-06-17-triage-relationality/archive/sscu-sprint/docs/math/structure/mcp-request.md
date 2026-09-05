---
title: MCP Request
role: structure
derived_from: computer/type/computer-recognition
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Incoming MCP command invocation as a recognised computer-layer payload.

## Definition
- Carrier: refinement of [Computer Recognition](../../type/computer-recognition.md)
  scoped to MCP requests.
- Fields:
  - `recognition_id` (UUID/string)
  - `command` (string): MCP command name.
  - `arguments` (object): command arguments matching endpoint schema.
  - `token` ([OAuth Token](oauth-token.md), optional): bearer/proof token.
  - `provenance` (object `{actor, origin, trace_ref}`)
  - `signature` (optional string): signature/MAC over command+args.

## Invariants
- Command exists in the targeted [MCP Endpoint](mcp-endpoint.md).
- Arguments conform to the declared schema.
- Token (if present) is valid and matches required scopes.

## Proof
- Derived from: [Computer Recognition](../../type/computer-recognition.md).
- Shows that: treating MCP invocations as recognitions keeps dispatch within
  the computer recognition model while adding concrete command fields.
