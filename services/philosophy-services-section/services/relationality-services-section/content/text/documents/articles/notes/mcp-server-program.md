---
title: MCP Server Program
id: mcp-server-program
role: structure
status: someday
proof_refs: []
derives-from: computer/type/documentation-interpreter
description: Program-layer assembly that exposes the computer through an MCP server, protecting commands with OAuth authentication.
---



Program-layer assembly that exposes the computer through an MCP server,
protecting commands with OAuth authentication.

## Definition
- Inputs: endpoint specification as [MCP Endpoint](./mcp-endpoint.md);
  incoming [MCP Request](./mcp-request.md) plus optional
  [OAuth Credential](../../../glossary/terms/oauth-credential.md).
- Operators:
  - [OAuth Validate](./oauth-validate.md) to issue/validate tokens.
  - [MCP Handle Request](./mcp-handle-request.md) to dispatch commands.
- Carriers: evaluation state/wiring from the documentation interpreter to execute handler
  steps.
- Outputs: [MCP Response](./mcp-response.md) or
  [Computer Failure](./computer-failure.md).

## Behaviour
1. Validate/issue tokens for incoming credentials using OAuth Validate.
2. Validate MCP request against endpoint schema and policy.
3. Bind arguments into the computer evaluation state and dispatch the handler
   via MCP Handle Request.
4. Return responses or failures to the client; log traceability and provenance.

## Invariants
- Only registered commands execute; auth scopes enforced per command.
- Failures surface as [Computer Failure](./computer-failure.md)
  without mutating prior state.
- Responses trace to endpoint version, request id, and evaluation trace.

## Proof
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: exposing the computer via MCP + OAuth can be expressed as a
  computer-layer program using earned carriers/operators without extending
  machine semantics.
