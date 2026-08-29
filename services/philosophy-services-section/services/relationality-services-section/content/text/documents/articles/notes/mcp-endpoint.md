---
title: MCP Endpoint
id: mcp-endpoint
role: structure
status: someday
derived_from: computer/type/computer-wiring-plan
proof_refs: []
---


# MCP Endpoint

Concrete wiring/metadata for an MCP (Model Context Protocol) endpoint exposed
by the computer. Captures available commands, schemas, and auth requirements.

## Definition
- Carrier: refinement of [Computer Wiring Plan](./computer-wiring-plan.md)
  restricted to MCP command dispatch.
- Fields:
  - `endpoint_id` (string/UUID): identifier for this MCP endpoint.
  - `commands` (map command_name → schema ref + handler step id).
  - `inputs`/`outputs`: port typing for each command.
  - `auth_policy` (object): scopes/roles required per command.
  - `integrity_hash` (SHA-256 hex): covers endpoint spec.
- Purpose: declarative description of the MCP command surface bound to the
  computer wiring plan.

## Invariants
- Every command maps to a step/port in the wiring plan and declares types.
- Auth policy present for each command; defaults are explicit.
- Integrity hash verifies against the canonical endpoint spec.

## Proof
- Derived from: [Computer Wiring Plan](./computer-wiring-plan.md).
- Shows that: expressing MCP surface as a wiring-plan projection preserves
  plan invariants while exposing concrete command metadata.
