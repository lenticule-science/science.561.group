---
title: MCP Handle Request
id: mcp-handle-request
role: operator
status: someday
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: computer/function/evaluate-step
description: Dispatches a single MCP request against an endpoint wiring plan, returning a typed response or a computer failure.
---



Dispatches a single MCP request against an endpoint wiring plan, returning a
typed response or a computer failure.

## Definition
- Inputs:
  - [MCP Endpoint](./mcp-endpoint.md) describing available commands
    and handlers.
  - [MCP Request](./mcp-request.md) carrying the command and args.
  - [OAuth Token](./oauth-token.md) for authorisation (may be nil for open commands).
  - [Computer Evaluation State](./computer-evaluation-state.md)
    to execute the bound handler.
- Outputs: [MCP Response](./mcp-response.md) or
  [Computer Failure](./computer-failure.md).
- Behaviour:
  1. Validate the request against the endpoint (command exists, schema matches).
  2. Validate the token (scopes, expiry) if the command requires auth.
  3. Bind command arguments into the evaluation state ports declared by the endpoint.
  4. Step the handler via [Evaluate Step](./evaluate-step.md).
  5. Marshal outputs into MCP response; on any error, emit computer failure with origin/diagnostics.
- Serialization: request/response use the fields declared in the respective
  structures; failures follow [Computer Failure](./computer-failure.md).

## Invariants
- Command dispatch follows endpoint wiring; no unregistered command executes.
- Auth/policy enforced before dispatch; failures do not mutate state.
- Responses are typed per endpoint schema and trace back to the request/endpoint version.

## Proof
- Derived from: [Computer Evaluate Step](./evaluate-step.md).
- Shows that: MCP dispatch/refusal can be expressed as a single computer
  evaluation step respecting wiring, typing, and failure semantics.
